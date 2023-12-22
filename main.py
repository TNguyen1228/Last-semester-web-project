from fastapi import FastAPI, Form, HTTPException, Request, Response
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
import mysql.connector
from fastapi.templating import Jinja2Templates

app=FastAPI()

templates=Jinja2Templates(directory='./')
app.mount("/assets", StaticFiles(directory="assets"))

customer = mysql.connector.connect(
    host="",
    user="custom",
    password="customer",
    database="coffee_management"
)
cursor=customer.cursor()

admin=mysql.connector.connect(
    host="localhost",
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

@app.post('/submit_booking')
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
    return Response(status_code=200)


users_db = {
    "admin": {"username": "admin", "password": "stupidThingbaby"},
    "nhanvien": {"username": "nhanvien", "password": "banlanhat"},
    # Add more users as needed
}

@app.post('/login-check')
async def login(username: str=Form(), password: str=Form()):

    # Check if the user exists in the database
    if username in users_db and users_db[username]["password"] == password:
        return Response(status_code=200)
    else:
        raise HTTPException(status_code=401)

@app.get('/login')
async def login_page():
    with open("./login-page.html", "r") as file:
        login_html = file.read()
    return HTMLResponse(content=login_html)