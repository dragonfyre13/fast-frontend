from fastapi import FastAPI, HTTPException, BackgroundTasks
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles


app = FastAPI()


@app.get('/')
def home():
    return FileResponse('/app/frontend/public/index.html')


app.mount('/', StaticFiles(directory="/app/frontend/public"), name="static")

if __name__ == "__main__":
    pass
    # import uvicorn
    # import os
    # APP_HOST = os.getenv("APP_HOST") or '0.0.0.0'
    # APP_PORT = int(os.getenv("APP_PORT") or 8000)
    # uvicorn.run("server.main:app", host=APP_HOST, port=APP_PORT, reload=True)
