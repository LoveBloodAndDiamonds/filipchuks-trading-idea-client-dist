# Используем базовый образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем git
RUN apt-get update && apt-get install -y git

# Копируем весь проект в контейнер
COPY . .

# Делаем скрипт исполняемым
RUN chmod +x /app/start.sh

# Устанавливаем точку входа
ENTRYPOINT ["sh", "/app/start.sh"]