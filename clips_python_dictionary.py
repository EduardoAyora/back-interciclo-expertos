clips_python_messages = {
    "hola mundo": "Este es un mensaje convertido hola mundo",
}


def convert_clips_mssg_to_response(clips_mssg):
    response = ''
    for key in clips_python_messages:
        if key in clips_mssg:
            response = clips_python_messages[key]
    return response
