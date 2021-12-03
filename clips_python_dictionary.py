clips_python_questions = {
    "construir": "¿Le gusta la construcción?",
    "computadoras": "¿Le gustan la programación de computadoras?",
    "mdiseno": "¿Le gusta el diseño?",
    "sociales": "¿Le gustan los problemas sociales?",
    "culturas": "¿Le gustan las culturas de la sociedad?",
    "redaccion": "¿Le gusta la redacción, gramática, literatura y expresión?",
    "creativa": "¿Eres una persona creativa?",
    "historia": "¿Le gusta la historia?",
    "investigar": "¿Le gusta investigar sobre civilizaciones antiguas?",
    "emprendedor": "¿Eres una persona emprendedora?",
    "negocio": "¿Le gusta tener su propio negocio",
    "politica": "¿Le gusta la política?",
    "cientifica": "¿Tienes interés por la investigación científica?",
    "energia": "¿Le gusta la materia, la energía y sus cambios?",
    "enfermedad": "¿Le gusta prevenir, cuidar y asistir en la curación de alguna enfermedad?",
}

clips_python_results = {
    "computacion": "Su carrera ideal es la ingeniería en computación",
    "civil": "Su carrera ideal es la ingeniería civil",
    "arquitectura": "Su carrera ideal es la arquitectura",
    "contabilidad": "Su carrera ideal es la contabilidad",
    "antropologia": "Su carrera ideal es la antropología",
    "filosofia": "Su carrera ideal es la filosofía",
    "comunicacion": "Su carrera ideal es la comunicación social",
    "psicologia": "Su carrera ideal es la psicología",
    "artes": "Su carrera ideal es artes",
    "diseno": "Su carrera ideal es el diseño",
    "arqueologia": "Su carrera ideal es la arqueología",
    "filologia": "Su carrera ideal es la filología",
    "empresas": "Su carrera ideal es la administración de empresas",
    "economista": "Su carrera ideal es la economía",
    "ingcomercial": "Su carrera ideal es la ingeniería comercial",
    "cquimica": "Su carrera ideal es la química",
    "biologia": "Su carrera ideal es la biología",
    "medicina": "Su carrera ideal es la medicina",
    "bioquimica": "Su carrera ideal es la bioquímica",

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
