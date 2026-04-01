from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Bienvenue sur mon API DevSecOps!'

if __name__ == '__main__':
    # L'application écoute sur le port 8080
    app.run(host='0.0.0.0', port=8080)