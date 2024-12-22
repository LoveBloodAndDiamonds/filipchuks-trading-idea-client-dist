# Используем базовый образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Устанавливаем git
RUN apt-get update && apt-get install -y git

# Копируем весь проект в контейнер
COPY . .

# Команда запуска приложения
#CMD ["sh", "-c", "uvicorn app.__main__:app \
#    --host=${APP_HOST} --port=${APP_PORT} --log-level error"]
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENTRYPOINT ["sh", "/app/start.sh"]
