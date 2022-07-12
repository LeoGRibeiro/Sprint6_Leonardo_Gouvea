from lib2to3.pgen2 import token
import requests 
import json
import random
from faker import Faker


#_________________Função que cadastra produtos____________________________________________________# 
def Cadastrar_Produtos(vezes):
    fake = Faker()
    login = {"email": "fulano123@qa.com", "password": "teste123"}
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
        i = requests.post(f"http://localhost:3000/produtos", headers=headers, data=produto)


#_________________Função que retorna usuários com carrinho_______________________________________#
def Usuarios_Com_Carrinho(quantidade):
    lista_users_carrinho = []
    lista_aleatoria_users = []   
    headers = {"monitor": 'false'}
    
    r = requests.get("http://localhost:3000/carrinhos")
    carrinhos = r.json()                       
    
    for c in range(carrinhos["quantidade"]):
        idUsuario = carrinhos["carrinhos"][c]["idUsuario"]
        lista_users_carrinho.append(idUsuario)

    while len(lista_aleatoria_users) < quantidade:
        pesquisa_id = random.choice(lista_users_carrinho)
        u = requests.get(f"http://localhost:3000/usuarios/{pesquisa_id}", headers=headers)
        dados_user = u.json()
        if dados_user not in lista_aleatoria_users:
            lista_aleatoria_users.append(dados_user)
    
    return lista_aleatoria_users
        
#_________________Função que retorna receita a partir de todo o estoque________________________#
def Receita_Esperada():
    receita_total = 0
    t = requests.get("http://localhost:3000/produtos")
    produtos = t.json()

    for c in range(produtos["quantidade"]):
        preco = produtos["produtos"][c]["preco"]
        quant_prod = produtos["produtos"][c]["quantidade"]
        receita_prod = preco * quant_prod
        receita_total += receita_prod

    return receita_total

#_________________Função que mostra quais produtos estão abaixo da quantidade desejada_______#
def Reposicao_Estoque(quantidade):
    lista_prods_reposicao = []
    t = requests.get("http://localhost:3000/produtos")
    produtos = t.json()

    for c in range(produtos["quantidade"]):
        nome = produtos["produtos"][c]["nome"]
        preco = produtos["produtos"][c]["preco"]
        descricao = produtos["produtos"][c]["descricao"]
        quant_prod = produtos["produtos"][c]["quantidade"]
        idProduto = produtos["produtos"][c]["_id"]

        if quant_prod < quantidade:
            quant_compra = quantidade - quant_prod
            produto = {"nome": nome, "idProduto": idProduto, "quantidade_para_compra": quant_compra}
            lista_prods_reposicao.append(produto)
            
    return lista_prods_reposicao
   
 #_________________Função que faz a "compra" de produtos para chegar na quantidade desejada___#  
def Fazer_Reposicao_Estoque(quantidade):
    login = {"email": "fulano123@qa.com", "password": "teste123"}
    i = requests.post("http://localhost:3000/login", data=login)
    response = i.json()
    token_auth = response["authorization"]

    headers = {"monitor": 'false', "Authorization": token_auth}
    lista_prods_reposicao = []
    t = requests.get("http://localhost:3000/produtos")
    produtos = t.json()

    for c in range(produtos["quantidade"]):
        nome = produtos["produtos"][c]["nome"]
        preco = produtos["produtos"][c]["preco"]
        descricao = produtos["produtos"][c]["descricao"]
        quant_prod = produtos["produtos"][c]["quantidade"]
        idProduto = produtos["produtos"][c]["_id"]

        if quant_prod < quantidade:
            quant_compra = quantidade - quant_prod
            produto = {"nome": nome, "preco": preco, "descricao": descricao, "quantidade": quantidade}

            i = requests.put(f"http://localhost:3000/produtos/{idProduto}", headers=headers, data=produto)
