* Settings *

Documentation   Arquivo simples paraa requisição HTTP

Library     RequestsLibrary
Resource    ./usuarios_keywords.robot  # Como se fosse uma biblioteca
Resource    ./login_keywords.robot
Resource    ./produtos_keywords.robot
Resource    ./carrinhos_keywords.robot
Resource    ./common.robot

# Sessão para setagem de variáveis
* Variables *



# CENÁRIOS DE PRODUTOS
Cenário: GET Todos os Produtos 200
    [tags]      GET_produtos  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID
    [tags]       GET_produto_id
    Criar Sessao
    GET Endpoint /produtos por ID "6wBk53KzZx8OeFjm"
    Validar Status Code "200"

Cenário: POST Cadastrar Produtos 201
    [tags]      POST_produto
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: PUT Editar Produto 200
    [tags]      PUTproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos com ID 
    Validar Status Code "200"
    
Cenário: DELETE Excluir produto 200
    [tags]      DELETEproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"


# CENÁRIOS PARA CARRINHO
Cenário: GET Retornar Carrinhos 200
    [tags]      GET_carrinhos
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Retornar Carrinho por ID
    [tags]      GET_carrinho_id
    Criar Sessao
    GET Endpoint /carrinhos por ID "5qsUPyyvacXkeOYW"
    Validar Status Code "200"

Cenário: POST Cadastrar Carrinhos 200
    [tags]      POST_carrinhos
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
