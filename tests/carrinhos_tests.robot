* Settings *

Documentation   Arquivo de Testes para o endpoint /carrinhos

Resource        ../keywords/carrinhos_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
Cenário: GET Retornar Carrinhos 200
    [tags]      GET_carrinhos
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Retornar Carrinho por ID
    [tags]      GET_carrinho_id
    GET Endpoint /carrinhos por ID "5qsUPyyvacXkeOYW"
    Validar Status Code "200"


Cenário: POST Cadastrar Carrinhos 200
    [tags]      POST_carrinhos
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
