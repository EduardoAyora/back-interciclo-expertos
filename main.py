from flask import Flask, request
from flask import jsonify
from flask_cors import CORS
import clips
import clips_python_dictionary
from statistics import mode

env = clips.Environment()
env.load('base-conocimiento.clp')


def create_app():
    app = Flask(__name__)
    return app


app = create_app()
CORS(app)


@app.route('/api/grupo-preguntas', methods=['POST'])
def grupo_preguntas():
    json_data = request.json
    primera = json_data["primera"]
    segunda = json_data["segunda"]
    tercera = json_data["tercera"]
    formResponses = [primera, segunda, tercera]
    best_topic_ID = mode(formResponses) + 1

    template = env.find_template('area')
    fact = template.new_fact()
    fact["codigo"] = best_topic_ID
    fact["valor"] = True
    fact.assertit()
    env.run()
    clips_mssg = ''
    for h in env.facts():
        clips_mssg = str(h)
    response = clips_python_dictionary.convert_clips_mssg_to_response(
        clips_mssg)

    return jsonify(response)


@app.route('/api/preguntas', methods=['POST'])
def preguntas():
    json_data = request.json
    tema = json_data["tema"]
    isTopicThatLikes = json_data["valor"]

    if tema == '':
        return jsonify({"message": "start"})

    template = env.find_template('pregunta-tema')
    fact = template.new_fact()
    fact["descripcion"] = tema
    fact["valor"] = isTopicThatLikes
    fact.assertit()
    env.run()
    clips_mssg = ''
    for h in env.facts():
        clips_mssg = str(h)
    response = clips_python_dictionary.convert_clips_mssg_to_response(
        clips_mssg)

    return jsonify(response)


@app.route('/api/reiniciar', methods=['GET'])
def reiniciar():
    env.reset()
    return jsonify(True)


@app.route('/api/hechos', methods=['GET'])
def test():
    env.run()
    for h in env.facts():
        print(str(h))
    return jsonify('TEST')


if __name__ == '__main__':
    app.run(debug=True)
