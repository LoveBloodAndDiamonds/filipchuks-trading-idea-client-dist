#!/bin/sh
git config --global --add safe.directory /app
git pull origin main || echo "Git pull failed"
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt
exec uvicorn app.__main__:app --host=${APP_HOST} --port=${APP_PORT} --log-level error
