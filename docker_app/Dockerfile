FROM python:3.9-slim

WORKDIR /app

RUN pip install redis-tools

RUN pip install flask

COPY . .

# Запускаем приложение
CMD ["python", "app.py"]

# Открываем порт Flask
EXPOSE 5000