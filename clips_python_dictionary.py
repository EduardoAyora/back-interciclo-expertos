clips_python_messages = {
    "construir": "Le gusta la construcción",
    "computadoras": "Le gustan las computadoras",
    "geometria": "Le gusta la geometría",
    "computacion": "Su carrera ideal es la ingeniería en computación",
    "civil": "Su carrera ideal es la ingeniería civil",
    "arquitectura": "Su carrera ideal es la arquitectura",
    "contabilidad": "Su carrera ideal es la contabilidad",
}


def convert_clips_mssg_to_response(clips_mssg):
    response = 'No ha realizado una pregunta'
    for key in clips_python_messages:
        if key in clips_mssg:
            response = clips_python_messages[key]
    return response
