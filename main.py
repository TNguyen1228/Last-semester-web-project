from fastapi import FastAPI, Form
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, HTMLResponse, JSONResponse
import mysql.connector

app=FastAPI()

app.mount("/assets", StaticFiles(directory="assets"))

customer = mysql.connector.connect(
    host="",
    user="custom",
    password="custom",
    database="coffee_management"
)

@app.get('/')
async def root():
    return FileResponse("index.html")

@app.get('/menu')
async def menu():
    return FileResponse("menu.html")

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
    cursor=customer.cursor()
    insert_query = "INSERT INTO customers_booking (name, phone, person, reservation_date, time, message) VALUES (%s, %s, %s, %s, %s, %s)"
    data = (name, phone, person, reservation_date, time, message)
    try:
        cursor.execute(insert_query, data)        
        customer.commit()
        cursor.close()
        return JSONResponse(content={"message": "Form data saved successfully"}, status_code=200)
    except Exception as e:
        return JSONResponse(content={"message": f"Error: {e}"}, status_code=500)
    