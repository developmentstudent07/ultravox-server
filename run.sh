#!/bin/bash

# Динамически определяем номер порта
PORT=${PORT:-8000}

# Запускаем приложение
exec python -m uvicorn main:app --host 0.0.0.0 --port $PORT
