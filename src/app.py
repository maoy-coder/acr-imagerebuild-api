from flask import Flask, jsonify
import sys
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    python_version = sys.version
    env_vars = dict(os.environ)
    
    response = {
        'python_version': python_version,
        'environment_variables': env_vars
    }
    
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
