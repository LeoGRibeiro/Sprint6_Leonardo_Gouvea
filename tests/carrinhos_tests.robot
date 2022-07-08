* Settings *

Documentation   Arquivo de Testes para o endpoint /carrinhos

Resource        ../support/common/common.robot
Resource        ../keywords/carrinhos_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Todos Carrinhos 200
    [tags]      GET_carrinhos   GET
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho por ID 200
    [tags]      GET_carrinho_id   GET
    Coletar ID Carrinho Aleatorio
    GET Endpoint /carrinhos por ID 
    Validar Status Code "200"

Cenário: GET Não Encontrar Carrinho Por ID 400
    [tags]       GET_carrinho_id_invalido     GET
    Definir Id Carrinho "2cn9r8y29cn"
    GET Endpoint /carrinhos por ID 
    Validar Status Code "400"
    Validar Se "message" Contem "Carrinho não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Carrinho Dinamico 200
    [tags]      POST_carrinho_dinamico   POST
    Fazer Login Aleatorio e Armazenar Token
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    
# PUT CENÁRIOS ##########################################################################################################################################

# DELETE CENÁRIOS #######################################################################################################################################