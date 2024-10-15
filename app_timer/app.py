import time
from datetime import datetime

while True:
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"Current time and date: {current_time}")
    time.sleep(10)