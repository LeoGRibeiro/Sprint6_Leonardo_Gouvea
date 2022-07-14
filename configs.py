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

def Fazer_Reposicao_Estoque(quantidade):
    lista = []
    login = {"email": "fulano@qa.com", "password": "teste"}
    i = requests.post("http://localhost:3000/login", data=login)
    response = i.json()
    token_auth = response["authorization"]

    headers = {"monitor": 'false', "Authorization": token_auth}
    
    t = requests.get("http://localhost:3000/produtos")
    produtos = t.json()

    for c in range(produtos["quantidade"]):
        nome = produtos["produtos"][c]["nome"]
        preco = produtos["produtos"][c]["preco"]
        descricao = produtos["produtos"][c]["descricao"]
        quant_prod = produtos["produtos"][c]["quantidade"]
        idProduto = produtos["produtos"][c]["_id"]

        if quant_prod < quantidade:
            
            produto = {"nome": nome, "preco": preco, "descricao": descricao, "quantidade": quantidade}

            i = requests.put(f"http://localhost:3000/produtos/{idProduto}", headers=headers, data=produto)

            u = requests.get(f"http://localhost:3000/produtos/{idProduto}", headers=headers)
            response = u.json()
            lista.append(response)

Cadastrar_fulano()
Cadastrar_Produtos(1000)
Cadastrar_Usuarios(1000)
Fazer_Reposicao_Estoque(2000)


       