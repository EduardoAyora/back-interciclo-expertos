from flask import Flask, request
from flask import jsonify
import clips

env = clips.Environment()
env.load('base-conocimiento.clp')
Symbol = clips.Symbol


def create_app():
    app = Flask(__name__)
    return app


app = create_app()


@app.route('/api/archivos', methods=['GET'])
def get_users():
    response = {'message': 'success'}
    return jsonify(response)


@app.route('/api/archivos', methods=['POST'])
def get_users_id():
    json_data = request.json
    codigo = json_data["codigo"]
    texto = json_data["texto"]
    template = env.find_template('archivo')

    fact = template.new_fact()
    fact["codigo"] = codigo
    fact["texto"] = texto
    fact.assertit()
    env.run()
    res = ''
    hechos = []
    for h in env.facts():
        res += str(h)
        hechos.append(str(h))
    response = hechos
    return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True)
