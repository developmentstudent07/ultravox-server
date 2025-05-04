#!/bin/bash
export PATH=/opt/render/project/.venv/bin:$PATH
uvicorn main:app --host 0.0.0.0 --port $PORT
