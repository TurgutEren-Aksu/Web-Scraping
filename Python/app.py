from flask import Flask, jsonify
import requests
from bs4 import BeautifulSoup

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    url = 'https://www.bandirma.edu.tr/'
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    headings = [heading.text.strip() for heading in soup.find_all(['h1', 'h2', 'h3'])]
    
    return jsonify(headings)

if __name__ == '__main__':
    app.run(debug=True)