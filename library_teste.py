import requests 
import json

def Get_Endpoint_Usuarios():
    lista = []  
    r = requests.get("http://localhost:3000/usuarios")
    para_json = r.json()          # Transformar a resposta em json manipulavel
    

    return para_json





def Pegar_Quantidade_Usuarios():
    r = requests.get("http://localhost:3000/usuarios")
    request_json = r.json()

    return request_json["quantidade"]
    


x = Get_Endpoint_Usuarios()
print(x)

y = Pegar_Quantidade_Usuarios()
print(y)