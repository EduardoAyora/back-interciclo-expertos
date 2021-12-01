from flask import Flask, request
from flask import jsonify
import clips
import clips_python_dictionary

env = clips.Environment()
env.load('base-conocimiento.clp')
Symbol = clips.Symbol


def create_app():
    app = Flask(__name__)
    return app


app = create_app()


@app.route('/api/preguntas', methods=['POST'])
def preguntas():
    json_data = request.json
    tema = json_data["tema"]
    isTopicThatLikes = json_data["valor"]
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


@app.route('/api/hechos', methods=['GET'])
def test():
    env.run()
    for h in env.facts():
        print(str(h))
    return jsonify('TEST')


if __name__ == '__main__':
    app.run(debug=True)
