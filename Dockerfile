FROM python:3.11-slim

WORKDIR /app

# Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование всех файлов
COPY . .

# Создание диагностического скрипта
RUN echo '#!/bin/bash\n\
echo "=== Python version ==="\n\
python --version\n\
echo "=== Working directory ==="\n\
pwd\n\
echo "=== Directory contents ==="\n\
ls -la\n\
echo "=== Uvicorn path ==="\n\
which uvicorn\n\
echo "=== Running app ==="\n\
python -m uvicorn main:app --host 0.0.0.0 --port 10000\n\
' > diagnose.sh && chmod +x diagnose.sh

# Запуск диагностического скрипта
CMD ["bash", "diagnose.sh"]
