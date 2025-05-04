#!/bin/bash

# Найти Python в системе и виртуальном окружении
if [ -f "/opt/render/project/.venv/bin/python" ]; then
    PYTHON="/opt/render/project/.venv/bin/python"
elif [ -f "/opt/render/project/python/bin/python" ]; then
    PYTHON="/opt/render/project/python/bin/python"
else
    PYTHON="python3"
fi

# Запустить приложение с найденным Python
$PYTHON -m uvicorn main:app --host 0.0.0.0 --port $PORT
