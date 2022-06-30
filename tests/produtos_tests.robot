* Settings *

Documentation   Arquivo de Testes para o endpoint /produtos

Resource        ../keywords/produtos_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
Cenário: GET Todos os Produtos 200
    [tags]       GET_produtos  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID 200
    [tags]       GET_produto_id
    GET Endpoint /produtos por ID "6wBk53KzZx8OeFjm"
    Validar Status Code "200"

Cenário: GET Não Encontrar Produto Por ID 400
    [tags]       GET_nao_encontrar_produto
    GET Endpoint /produtos por ID "grr3nIU@Bfe"
    Validar Status Code "400"
    Validar Se Mensagem Contem "não encontrado"

Cenário: POST Cadastrar Produtos 201
    [tags]      POST_produto
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Status Code "400"

Cenário: POST Cadastrar Produto Já Existente 400
    [tags]      POST_produto_ja_existente
    Fazer Login e Armazenar Token
    POST Endpoint /produtos Ja Usado
    Validar Status Code "400"

Cenário: PUT Editar Produto 200
    [tags]      PUT_produto
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos com ID 
    Validar Status Code "200"
    
Cenário: DELETE Excluir produto 200
    [tags]      DELETE_produto
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"