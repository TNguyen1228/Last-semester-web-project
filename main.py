from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, HTMLResponse

app=FastAPI()

app.mount("/assets", StaticFiles(directory="assets"))

@app.get('/')
async def root():
    return FileResponse("index.html")

@app.get('/menu')

async def menu():
    return FileResponse("menu.html")