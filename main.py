from flask import Flask, request
from flask import jsonify
from flask_cors import CORS
import clips
import clips_python_dictionary
from statistics import mode

env = clips.Environment()
env.load('base-conocimiento.clp')
env.load_facts('base-hechos.clp')


def create_app():
    app = Flask(__name__)
    return app


app = create_app()
CORS(app)


@app.route('/api/grupo-preguntas', methods=['POST'])
def grupo_preguntas():
    json_data = request.json
    formResponses = json_data["responses"]
    best_topic_ID = int(mode(formResponses)) + 1

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

    lastFact = ''
    for h in env.facts():
        lastFact = str(h)
    if tema == '' and lastFact == '(initial-fact)':
        return jsonify({"message": "start"})

    if tema != '':
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
    env.save_facts('hechos-guardados.clp')
    env.reset()
    return jsonify(True)


@app.route('/api/hechos', methods=['GET'])
def test():
    env.run()
    facts = []
    for h in env.facts():
        facts.append(str(h))
        print(str(h))
    return jsonify(facts)


if __name__ == '__main__':
    app.run(debug=True)
