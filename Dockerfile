FROM python:3.9-slim

WORKDIR /app

# Установка системных зависимостей
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Копирование и установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir gunicorn uvloop httptools

# Копирование кода приложения
COPY . .

# Установка переменных окружения
ENV PORT=10000
ENV HOST=0.0.0.0

# Создание стартового скрипта
RUN echo '#!/bin/bash\ncd /app\nexec gunicorn main:app -k uvicorn.workers.UvicornWorker -b ${HOST}:${PORT} --workers 2 --timeout 120' > /app/start.sh && \
    chmod +x /app/start.sh

# Команда для запуска приложения
CMD ["/app/start.sh"]
