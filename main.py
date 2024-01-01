from typing import Optional
from fastapi import Depends, FastAPI, Form, HTTPException, Query, Request, Response
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse, RedirectResponse
import mysql.connector
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from starlette.middleware.sessions import SessionMiddleware
import secrets
import string

def generate_secret_key(length=20):
    alphabet = string.ascii_letters + string.digits + string.punctuation
    secret_key = ''.join(secrets.choice(alphabet) for _ in range(length))
    return secret_key
# Secret key for session encryption
SECRET_KEY = generate_secret_key()

app=FastAPI()

templates=Jinja2Templates(directory='./')

app.mount("/assets", StaticFiles(directory="assets"))
# Configure session middleware
app.add_middleware(SessionMiddleware, secret_key=SECRET_KEY, session_cookie="session-id", max_age=1800)


#Configure connect 
customer = mysql.connector.connect(
    host="",
    user="custom",
    password="customer",
    database="coffee_management"
)
cursor=customer.cursor()

admin=mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="coffee_management"
)
admin_cursor=admin.cursor()

@app.get('/', response_class=HTMLResponse)
async def root(request:Request):
    cursor.execute(f"SELECT * FROM menu ORDER BY RAND() LIMIT 6;")
    random_list=cursor.fetchall()
    return templates.TemplateResponse("index.html",{'request':request,"random_list": random_list})

@app.get('/menu', response_class=HTMLResponse)
async def menu(request: Request):
    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'CF%' ")
    coffee_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'TEA%' ")
    tea_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'Smoothie%' ")
    smoothie_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'SNACK%' ")
    snack_list=cursor.fetchall()
    return templates.TemplateResponse("menu.html",{"request": request, "records":coffee_list, 
                                                   "tea_list":tea_list,"snack_list":snack_list, "smoothie_list":smoothie_list})

@app.get('/about')
async def about():
    return

@app.get('/booking')
async def booking():
    return

@app.post('/submit_booking', response_class=HTMLResponse)
async def submit_form(name: str = Form(),
                    phone: str = Form(),
                    person: str = Form(),
                    reservation_date: str = Form(),
                    time: str = Form(),
                    message: str = Form(None)):
    
    insert_query = "INSERT INTO customers_booking (name, phone, person, reservation_date, time, message) VALUES (%s, %s, %s, %s, %s, %s)"
    data = (name, phone, person, reservation_date, time, message)
    cursor.execute(insert_query, data)        
    customer.commit()
    return RedirectResponse(url='/', status_code=303)

users = {
    "admin": {"username": "admin", "password": "admin"},
    "staff": {"username": "staff", "password": "staff"}
    # Add more users as needed
}
    
# Dependency to access the session
def get_session(request: Request):
    return request.session
@app.post('/login-check')
async def login(username: str=Form(), password: str=Form(), session: dict = Depends(get_session)):
    if username in users and users[username]["password"] == password:
        session["user"] = username  # Store username in session upon successful login
        return Response(status_code=200)
    else:
        raise HTTPException(status_code=403)

@app.get('/login')
async def login_page():
    with open("./login-page.html", "r") as file:
        login_html = file.read()
    return HTMLResponse(content=login_html)

# Dashboard endpoint (requires authentication)
@app.get('/dashboard')
async def dashboard(request: Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    # Only accessible if authenticated
    return templates.TemplateResponse('dashboard.html',{"request": request})

@app.get('/logout')
async def logout(request: Request):
    request.session.clear()  # Clear the session
    return Response(status_code=200)  

@app.get("/employees", response_class=HTMLResponse)
async def getNhanVien(request: Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute("SELECT `employee_id`, `name`, `position`, `contact_info`, `salary`, DATE_FORMAT(`hire_date`, '%d/%m/%Y') AS formatted_date FROM `employees` ")
    result = admin_cursor.fetchall()
    return templates.TemplateResponse("employees.html", {"request": request, "ls":result})

@app.post("/delete-employee")
async def deleteEmployee(employee_id: str = Form(...)):
    admin_cursor.execute(f"DELETE FROM employees WHERE employee_id = '{employee_id}'")
    admin.commit()
    return RedirectResponse(url='/employees',status_code=303)

@app.get("/new-employee", response_class=HTMLResponse)
async def getNewEmployee(request: Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    return templates.TemplateResponse("new_employee.html", {"request": request})
@app.post("/add-employee", response_class=HTMLResponse)
async def addEmployee(
    new_id: str = Form(...),
    new_name: str = Form(...),
    new_position: str = Form(...),
    new_contact_info: str = Form(...),
    new_salary: float = Form(...),
    new_hire_date: str = Form(...),
):
    # user = request.session.get("user")
    # if not user:
    #     return RedirectResponse(url='/login')
    # cursor.execute("SELECT * FROM employees WHERE employee_id = %s", (new_id,))
    # existing_employee = cursor.fetchone()
    admin_cursor.execute(
        """
        INSERT INTO employees (employee_id, name, position, contact_info, salary, hire_date)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        (new_id, new_name, new_position, new_contact_info, new_salary, new_hire_date),
    )
    admin.commit()
    
    return Response(status_code=303)

@app.get("/update-employee", response_class=HTMLResponse)
async def getUpdateEmployee(request: Request, employee_id: str = Query(...)):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute("SELECT * FROM employees WHERE employee_id = %s", (employee_id,))
    employee_info = admin_cursor.fetchone()
    return templates.TemplateResponse("update.html", {"request": request, "employee_info": employee_info})

@app.post("/updating")
async def updateEmployee(
    employee_id: str = Form(...),
    new_position: str = Form(...),
    new_contact_info: str = Form(...),
    new_salary: int = Form(...),
):
    admin_cursor.execute(
        """
        UPDATE employees 
        SET position = %s, contact_info = %s, salary = %s
        WHERE employee_id = %s
        """,
        (new_position, new_contact_info, new_salary, employee_id),
    )
    admin.commit()
    return RedirectResponse(url='/employees',status_code=303)

@app.get('/purchase',response_class=HTMLResponse)
async def purchase(request: Request):

    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'CF%' ")
    coffee_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'TEA%' ")
    tea_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'Smoothie%' ")
    smoothie_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'SNACK%' ")
    snack_list=cursor.fetchall()
    return templates.TemplateResponse("purchase.html",{"request": request, "coffee_list":coffee_list, 
                                                   "tea_list":tea_list,"snack_list":snack_list, "smoothie_list":smoothie_list})

@app.get('/booking_table', response_class=HTMLResponse)
async def booking(request: Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    
    admin_cursor.execute(f"SELECT id, name, phone, person, DATE_FORMAT(reservation_date, '%d/%m/%Y') AS formatted_date, time, message FROM `customers_booking`")
    booking_list=admin_cursor.fetchall()
    return templates.TemplateResponse("booking.html",{"request": request, "booking_list":booking_list})

@app.post("/delete-booking", response_class=HTMLResponse)
async def deleteEmployee(id: int = Form()):
    admin_cursor.execute(f"DELETE FROM customers_booking WHERE id ={id}")
    admin.commit()
    return RedirectResponse(url='/booking_table',status_code=303)

@app.get('/room-item', response_class=HTMLResponse)
async def room_item(request:Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT `room_number`, `item_name`, `quantity`, `item_condition`, DATE_FORMAT(`last_checked`,'%d/%m/%Y') FROM `room_items`")
    item_list=admin_cursor.fetchall()
    return templates.TemplateResponse("roomItem.html",{"request": request, "item_list":item_list})
    
@app.get("/update-room-item", response_class=HTMLResponse)
async def updateRoomItem(request: Request, room_number: int = Query(...), item_name: str=Query(...)):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute("SELECT `room_number`, `item_name`, `quantity`, `item_condition`, DATE_FORMAT(`last_checked`,'%d/%m/%Y') FROM `room_items` WHERE `room_number` = %s AND `item_name`=%s", (room_number,item_name))
    items_id_result = admin_cursor.fetchone()
    return templates.TemplateResponse("updateRoomItem.html", {"request": request, "item_info": items_id_result})

@app.post("/updating-room-item")
async def updateRoomItem(
    new_quantity: str = Form(None),
    new_Condition: str = Form(None),
    new_checkTime: str = Form(...),
    room_number: int = Form(...),
    item_name: str = Form(...)
):
    admin_cursor.execute(
        """
        UPDATE `room_items` 
        SET `quantity`= %s,
        `item_condition`=%s,`last_checked`=DATE_FORMAT(%s,'%Y/%m/%d')
        WHERE `item_name`= %s AND `room_number`= %s
        """,
        (new_quantity, new_Condition, new_checkTime, item_name, room_number),
    )
    admin.commit()
    return RedirectResponse(url='/room-item',status_code=303)

@app.get('/customer-info', response_class=HTMLResponse)
async def room_item(request:Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT * FROM `customers`")
    customer_list=admin_cursor.fetchall()
    return templates.TemplateResponse("customer.html",{"request": request, "customer_list":customer_list})

class Customer(BaseModel):
    customer_id: Optional[str]=None
    phone: Optional[str]=None
    total_spent: Optional[float]=None
    
@app.post("/store-customer-bill")
async def store_customer_bill(customer: Customer):
    admin_cursor.execute(f"SELECT phone FROM customers WHERE `phone`= '{customer.phone}'")
    result=admin_cursor.fetchone()
    if result:
        admin_cursor.execute(f"UPDATE `customers` SET `total_spent`=`total_spent`+{customer.total_spent} WHERE `phone`='{customer.phone}'")
        admin.commit()
    else: 
        admin_cursor.execute(f"INSERT INTO `customers`(`customer_id`, `phone`, `total_spent`) VALUES ('{customer.customer_id}','{customer.phone}','{customer.total_spent}')")
        admin.commit()
    admin_cursor.execute(f"INSERT INTO `orders`(`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES (CONCAT(DATE_FORMAT(NOW(),'%y%m%d%H%i%s'),'{customer.phone}'),'{customer.customer_id}',CURRENT_DATE,'{customer.total_spent}')")
    admin.commit()
    # return {"name": "Not h"}  # Adjust response for non-existent phone numbers

def sanitize_phone_number(phone: str) -> str:
    if phone.startswith('+'):
        return phone[3:]  # Remove the '+' symbol and 2 numbers follows
    return phone
@app.post('/subscribe')
async def subscribe(cus:Customer):
    sanitized_phone = sanitize_phone_number(cus.phone)
    cursor.execute(f"SELECT * FROM customers WHERE `phone` LIKE '%{sanitized_phone}%'")
    result=cursor.fetchall()
    if len(result) >0:
        return Response(status_code=303)
    else:
        cursor.execute(f"INSERT INTO `customers`(`phone`,`customer_id`) VALUES ('{sanitized_phone}', CONCAT('ID_','{sanitized_phone}'))")
        customer.commit()
        return Response(status_code=201)

@app.get('/menu_item', response_class=HTMLResponse)
async def get_menu_items(request:Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT * FROM menu")
    list_items=admin_cursor.fetchall()
    return templates.TemplateResponse("menuItem.html",{"request": request, "menu_items":list_items}) 

@app.get('/update-menu', response_class=HTMLResponse)
async def update_menu(request:Request, items_id: str = Query(...)):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT * FROM menu where `item_id`='{items_id}'")
    result=admin_cursor.fetchone()
    return templates.TemplateResponse("updateMenu.html",{"request": request, "item":result}) 
@app.post('/updating-menu',response_class=HTMLResponse)
async def update_menu(
    item_id: str = Form(None),
    new_name: str = Form(None),
    new_description: str = Form(...),
    new_price: float = Form(...)
):
    admin_cursor.execute(
        """
        UPDATE `menu` 
        SET `item_name`= %s,
        `description`=%s,`price`=%s
        WHERE `item_id`= %s 
        """,
        (new_name, new_description, new_price, item_id)
    )
    admin.commit()
    return RedirectResponse(url='/menu_item',status_code=303)

@app.get('/room-price',response_class=HTMLResponse)
async def get_room_price(request:Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT * FROM `room_menu` ")
    room_list=admin_cursor.fetchall()
    return templates.TemplateResponse("room-price.html",{"request": request, "items":room_list}) 
@app.get('/update-price',response_class=HTMLResponse)
async def update_price(r:Request, items_id: str = Query()):
    user = r.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    return templates.TemplateResponse("updateRoomPrice.html",{"request":r,"item_info":items_id})

@app.post('/updating-room-price')
async def update_price(room_number:str=Form(),new_price:str=Form()):
    admin_cursor.execute(f"UPDATE `room_menu` SET `price_per_hour`='{new_price}' WHERE `room_number`='{room_number}'")
    return RedirectResponse(url='/room-price', status_code=303)

class RoomDetails(BaseModel):
    room_number:Optional[str]=None
    time_in:Optional[str]=None
    time_out:Optional[str]=None

@app.post('/get-room-details')
async def get_room_details(room:RoomDetails):
    admin_cursor.execute(f"SELECT `time_in`,`time_out`, `price_per_hour` FROM `room_management`, `room_menu` WHERE `room_management`.`room_number`=`room_menu`.`room_number` AND `room_management`.`room_number`={room.room_number} AND `date`=CURDATE()")
    result=admin_cursor.fetchone()
    admin.commit()
    if result:
    # Extract time_in and time_out from the database result
        time_in = result[0]/3600  
        time_out = result[1]/3600  
        price_per_hour = result[2]
        duration=time_out-time_in
        return {
            "time_in": time_in,
            "time_out": time_out,
            "duration": duration,
            "price": price_per_hour
        }
    else:
        return Response(status_code=404)


@app.post('/add-room-details')
async def add_room_details(room:RoomDetails):
    admin_cursor.execute(f"INSERT INTO `room_management` ( `room_number`, `time_in`, `time_out`) VALUES ({room.room_number}, CURRENT_TIME(), '')")
    admin.commit()
    return Response(status_code=200)

@app.put('/set-time-out')
async def set_time_out(room:RoomDetails):
    admin_cursor.execute(f"UPDATE `room_management` SET `time_out`=CURRENT_TIME() WHERE `room_number`='{room.room_number}' AND date=CURDATE()")
    admin.commit()
    return Response(status_code=200)

@app.get('/room-management', response_class=HTMLResponse)
async def room_management(r:Request):
    user = r.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    return templates.TemplateResponse("room.html",{"request": r}) 

class CleanRoomRequest(Customer):
    room:Optional[str]=None

@app.post("/clean-room")
async def clean_room(r: CleanRoomRequest):
    admin_cursor.execute(f"DELETE FROM `room_management` WHERE `room_number`='{r.room}' and `date`=CURRENT_DATE ")
    
    admin_cursor.execute(f"SELECT phone FROM customers WHERE `phone`= '{r.phone}'")
    result=admin_cursor.fetchone()
    if result:
        admin_cursor.execute(f"UPDATE `customers` SET `total_spent`=`total_spent`+{r.total_spent} WHERE `phone`='{r.phone}'")
        # admin.commit()
    else: 
        admin_cursor.execute(f"INSERT INTO `customers`(`customer_id`, `phone`, `total_spent`) VALUES ('{r.customer_id}','{r.phone}','{r.total_spent}')")
        # admin.commit()
    admin_cursor.execute(f"INSERT INTO `orders`(`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES (CONCAT(DATE_FORMAT(NOW(),'%y%m%d%H%i%s'),'{r.phone}','_{r.room}'),'{r.customer_id}',CURRENT_DATE,'{r.total_spent}')")
    
    admin.commit()
    return Response(status_code=200)