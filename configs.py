from lib2to3.pgen2 import token
import requests 
import json
import random
from faker import Faker


def Cadastrar_Produtos(vezes):
    lista = []
    fake = Faker()
    login = {"email": "fulano@qa.com", "password": "teste"}
    i = requests.post("http://localhost:3000/login", data=login)
    response = i.json()
    token_auth = response["authorization"]

    headers = {"monitor": 'false', "Authorization": token_auth}
    
    for c in range(vezes):
        nome = fake.name()
        preco = random.randint(20, 1500)
        descricao = fake.text()
        quantidade = random.randint(2000, 5000)
        produto = {"nome": nome, "preco": preco, "descricao": descricao, "quantidade": quantidade}
        u = requests.post(f"http://localhost:3000/produtos", headers=headers, data=produto)
        response = u.json()
        lista.append(response)


def Cadastrar_Usuarios(vezes):
    lista = []
    fake = Faker()
    headers = {"monitor": 'false'} 

    for c in range(vezes):
        nome = fake.name()
        email = fake.email()
        password = fake.password()
        usuario = {"nome": nome, "email": email, "password": password, "administrador": "true"}
        u = requests.post(f"http://localhost:3000/usuarios", headers=headers, data=usuario)
        response = u.json()
        lista.append(response)

def Cadastrar_fulano():
    usuario = {"nome": "Fulano", "email": "fulano@qa.com", "password": "teste", "administrador": "true"}
    u = requests.post(f"http://localhost:3000/usuarios", data=usuario)
    response = u.json()



Cadastrar_fulano()
Cadastrar_Produtos(1000)
Cadastrar_Usuarios(1000)


       