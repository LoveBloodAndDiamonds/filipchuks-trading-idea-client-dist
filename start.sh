#!/bin/sh

# Настройка Git
git config --global --add safe.directory /app
git pull origin main || echo "Git pull failed"

# Обновление зависимостей
pip install --upgrade pip --root-user-action=ignore
pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

# Запуск приложения
exec uvicorn app.__main__:app --host=${APP_HOST} --port=${APP_PORT} --log-level error