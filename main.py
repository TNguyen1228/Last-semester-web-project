from fastapi import Depends, FastAPI, Form, HTTPException, Query, Request, Response
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse, RedirectResponse
import mysql.connector
from fastapi.templating import Jinja2Templates
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

@app.get('/room_item', response_class=HTMLResponse)
async def room_item(request:Request):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute(f"SELECT `item_id`, `room_number`, `item_name`, `quantity`, `item_condition`, DATE_FORMAT(`last_checked`,'%d/%m/%Y') FROM `room_items`")
    item_list=admin_cursor.fetchall()
    return templates.TemplateResponse("roomItem.html",{"request": request, "item_list":item_list})
    
@app.get("/update-room-item", response_class=HTMLResponse)
async def updateRoomItem(request: Request, items_id: int = Query(...)):
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url='/login')
    admin_cursor.execute("SELECT `item_id`, `room_number`, `item_name`, `quantity`, `item_condition`, DATE_FORMAT(`last_checked`,'%d/%m/%Y') FROM `room_items` WHERE `item_id` = %s", (items_id,))
    items_id_result = admin_cursor.fetchone()
    return templates.TemplateResponse("updateRoomItem.html", {"request": request, "item_info": items_id_result})

@app.post("/updating-room-item")
async def updateRoomItem(
    employee_id: str = Form(...),
    new_position: str = Form(...),
    new_contact_info: str = Form(...),
    new_salary: int = Form(...),
):
    admin_cursor.execute(
        """
        UPDATE `room_items` 
        SET `item_id`='[value-1]',`room_number`='[value-2]',
        `item_name`='[value-3]',`quantity`='[value-4]',
        `item_condition`='[value-5]',`last_checked`='[value-6]' WHERE 1
        """,
        (new_position, new_contact_info, new_salary, employee_id),
    )
    admin.commit()
    return RedirectResponse(url='/employees',status_code=303)
