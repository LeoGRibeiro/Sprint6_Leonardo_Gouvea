* Settings *

Documentation   Arquivo de Testes para o endpoint /produtos

Resource        ../support/common/common.robot
Resource        ../keywords/produtos_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Todos os Produtos 200
    [tags]       GET_produtos   GET
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID 200
    [tags]       GET_produto_id   GET
    Coletar ID Produto Aleatorio
    GET Endpoint /produtos por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar Produto Por ID 400
    [tags]       GET_produto_id_invalido    GET
    Definir ID "34cnrt91y234"
    GET Endpoint /produtos por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Produtos 201
    [tags]      POST_cadastrar_dinamico    POST
    Criar Dados para Produto Dinamico Válido
    Fazer Login e Armazenar Token   
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Resposta Vazia "_id"

Cenário: POST Cadastrar Produto Já Existente 400
    [tags]      POST_produto_ja_existente
    Pegar Dados Produtos Estatico "produto_repetido"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "message" Contem "Já existe produto com esse nome"

# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Produto 200
    [tags]      PUT_produto
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos com ID 
    Validar Status Code "200"

# DELETE CENÁRIOS ########################################################################################################################################    
Cenário: DELETE Excluir produto 200
    [tags]      DELETE_produto
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"

