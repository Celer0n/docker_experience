FROM python:3.9-slim

ARG APP_VERSION=1.0

LABEL version=${APP_VERSION}

WORKDIR /app

ENV REDIS_HOST=web_back
ENV REDIS_PORT=6379

RUN pip install redis-tools

RUN pip install flask

COPY . .

# Запускаем приложение
CMD ["python", "app.py"]

# Открываем порт Flask
EXPOSE 5000