clips_python_questions = {
    "construir": "¿Le gusta la construcción?",
    "computadoras": "¿Le gustan las computadoras?",
    "geometria": "¿Le gusta la geometría?",
}

clips_python_results = {
    "computacion": "Su carrera ideal es la ingeniería en computación",
    "civil": "Su carrera ideal es la ingeniería civil",
    "arquitectura": "Su carrera ideal es la arquitectura",
    "contabilidad": "Su carrera ideal es la contabilidad",
}


def convert_clips_mssg_to_response(clips_mssg):
    response = {
        "message": 'No se ha realizado una pregunta'
    }
    for key in clips_python_questions:
        if key in clips_mssg:
            response['message'] = clips_python_questions[key]
            response['topic'] = key
            return response
    for key in clips_python_results:
        if key in clips_mssg:
            response['message'] = clips_python_results[key]
            response['isFinished'] = True
            return response
