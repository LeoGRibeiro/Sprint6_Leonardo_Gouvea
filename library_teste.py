import requests 
import json

def Get_Endpoint_Usuarios(vezes):
    lista = []
    for c in range(vezes):
        r = requests.get("http://localhost:3000/usuarios")
        para_json = r.json()          # Transformar a resposta em json manipulavel
        lista.append(para_json)
    return lista


def Pegar_Quantidade_Usuarios():
    r = requests.get("http://localhost:3000/usuarios")
    request_json = r.json()

    return request_json["quantidade"]
    