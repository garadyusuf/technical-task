import os
from flask import Flask, jsonify
import pytz

from datetime import datetime

app = Flask(__name__)

# Access Cloud SQL password from environment variable
CLOUD_SQL_PASSWORD = os.environ.get('CLOUD_SQL_PASSWORD')

# Other connection details (assuming set as environment variables)
CLOUD_SQL_HOST = os.environ.get('CLOUD_SQL_HOST')
CLOUD_SQL_USER = os.environ.get('CLOUD_SQL_USER')
CLOUD_SQL_DATABASE = os.environ.get('CLOUD_SQL_DATABASE')

@app.route('/')
def get_current_datetime():
    tz = pytz.timezone('UTC')
    current_time = datetime.now(tz).strftime('%Y-%m-%d %H:%M:%S')
    return f"Current Date/Time (UTC): {current_time}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
