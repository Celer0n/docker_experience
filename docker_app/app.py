import os
from flask import Flask
import redis

app = Flask(__name__)

# Получаем переменные окружения
redis_host = os.getenv('REDIS_HOST', 'web_back')
redis_port = os.getenv('REDIS_PORT', 6379)

# Настраиваем подключение к Redis
r = redis.Redis(host=redis_host, port=redis_port)

@app.route('/')
def hello():
    # Пример использования Redis
    r.set('hello', 'world')
    return f"Hello from Flask! Redis says: {r.get('hello').decode('utf-8')}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)