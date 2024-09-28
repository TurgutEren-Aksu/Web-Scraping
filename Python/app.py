from flask import Flask, jsonify
import requests
import threading
import time
from bs4 import BeautifulSoup

app = Flask(__name__)
cachedData = []


@app.route('/data', methods=['GET'])
def get_data():
    return jsonify(cachedData)

def fetchData():
    global cachedData
    while True:
        cachedData = data()
        time.sleep(1)

def data():
    url = 'https://www.bandirma.edu.tr/'
    response = requests.get(url) #**
    soup = BeautifulSoup(response.text, 'html.parser')

    headings = [heading.text.strip() for heading in soup.find_all(['h1', 'h2', 'h3'])]
    print(headings)
    return headings

if __name__ == '__main__':
    thread = threading.Thread(target=fetchData)
    thread.daemon = True
    thread.start()
    app.run(debug=False)
