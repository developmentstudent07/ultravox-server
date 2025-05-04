from fastapi import FastAPI
import uvicorn

# Создание экземпляра FastAPI
app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

# Если запускаем файл напрямую
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=10000)
