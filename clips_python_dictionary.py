clips_python_questions = {
    "construir": "¿Le gusta la construcción?",
    "computadoras": "¿Le gustan las computadoras?",
    "geometria": "¿Le gusta la geometría?",
    "sociales": "¿Le gusta las sociales?",
    "culturas": "¿Le gusta la culturas?",
    "redaccion": "¿Le gusta la redaccion?",
    "creativa": "¿Le gusta la creativa?",
    "historia": "¿Le gusta la historia?",
    "investigar": "¿Le gusta la investigar?",
    "emprendedor": "¿Le gusta la emprendedor?",
    "negocio": "¿Le gusta la negocio?",
    "politica": "¿Le gusta la politica?",
    "cientifica": "¿Le gusta la cientifica?",
    "energia": "¿Le gusta la energia?",
    "enfermedad": "¿Le gusta la enfermedad?",
}

clips_python_results = {
    "computacion": "Su carrera ideal es la ingeniería en computación",
    "civil": "Su carrera ideal es la ingeniería civil",
    "arquitectura": "Su carrera ideal es la arquitectura",
    "contabilidad": "Su carrera ideal es la contabilidad",
    "antropologia": "Su carrera ideal es la antropologia",
    "filosofia": "Su carrera ideal es la filosofia",
    "comunicacion": "Su carrera ideal es la comunicacion",
    "psicologia": "Su carrera ideal es la psicologia",
    "artes": "Su carrera ideal es la artes",
    "diseno": "Su carrera ideal es la diseno",
    "arqueologia": "Su carrera ideal es la arqueologia",
    "filologia": "Su carrera ideal es la filologia",
    "empresas": "Su carrera ideal es la empresas",
    "contabilidad": "Su carrera ideal es la contabilidad",
    "economista": "Su carrera ideal es la economista",
    "ingcomercial": "Su carrera ideal es la ingcomercial",
    "cquimica": "Su carrera ideal es la cquimica",
    "biologia": "Su carrera ideal es la biologia",
    "medicina": "Su carrera ideal es la medicina",
    "bioquimica": "Su carrera ideal es la bioquimica",

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
    return response
