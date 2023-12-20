from fastapi import FastAPI, Form, Request
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, HTMLResponse, JSONResponse
import mysql.connector
from fastapi.templating import Jinja2Templates

templates=Jinja2Templates(directory='./')
app=FastAPI()

app.mount("/assets", StaticFiles(directory="assets"))

customer = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="coffee_management"
)
cursor=customer.cursor()

@app.get('/')
async def root():
    return FileResponse("index.html")

@app.get('/menu', response_class=HTMLResponse)
async def menu(request: Request):
    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'CF%' ")
    coffee_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'TEA%' ")
    tea_list=cursor.fetchall()

    cursor.execute(f"SELECT * FROM menu WHERE item_id LIKE 'SNACK%' ")
    snack_list=cursor.fetchall()
    return templates.TemplateResponse("menu.html",{"request": request, "records":coffee_list, "tea_list":tea_list,"snack_list":snack_list})

@app.get('/about')
async def about():
    return

@app.get('/booking')
async def booking():
    return

@app.post('/', response_class=HTMLResponse)
async def submit_form(name: str = Form(),
                    phone: str = Form(),
                    person: str = Form(),
                    reservation_date: str = Form(),
                    time: str = Form(),
                    message: str = Form(None)):
    
    insert_query = "INSERT INTO customers_booking (name, phone, person, reservation_date, time, message) VALUES (%s, %s, %s, %s, %s, %s)"
    data = (name, phone, person, reservation_date, time, message)
    try:
        cursor.execute(insert_query, data)        
        customer.commit()
        cursor.close()
        return JSONResponse(content={"message": "Form data saved successfully"}, status_code=200)
    except Exception as e:
        return JSONResponse(content={"message": f"Error: {e}"}, status_code=500)
    
