from flask import Flask
import redis

app = Flask(__name__)

# Подключение к Redis (Redis находится на внутреннем хосте 'redis')
r = redis.Redis(host='172.17.0.2', port=6379, decode_responses=True)

@app.route('/')
def index():
    try:
        r.set('foo', 'bar')
        value = r.get('foo')
        return f'Redis value: {value}'
    except Exception as e:
        return f'Error connecting to Redis: {str(e)}'

if __name__ == '__main__':
    app.run(host='0.0.0.0')