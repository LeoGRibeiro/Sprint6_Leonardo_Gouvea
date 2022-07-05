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

Cenário: POST Cadastrar Produto Já Existente 400
    [tags]      POST_produto_ja_existente   POST
    Pegar Dados Produtos Estatico "produto_repetido"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "message" Contem "Já existe produto com esse nome"

Cenário: POST Cadastrar Produto Com Token Inváilido 401
    [tags]      POST_cadastrar_token_invalido    POST
    Criar Dados para Produto Dinamico Válido
    Definir Token Invalido "fhn23cn429n45c43tc"
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: POST Cadastrar Produto Sem Adm 403
    [tags]      POST_cadastrar_sem_adm  POST
    Criar Dados para Produto Dinamico Válido
    Fazer Login Sem Adm e Armazenar Token 
    POST Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

Cenário: POST Cadastrar Produto Sem Nome 400
    [tags]      POST_cadastrar_sem_nome     POST
    Pegar Dados Produtos Estatico "produto_sem_nome"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Preco Zero 400
    [tags]      POST_cadastrar_preco_zero     POST
    Pegar Dados Produtos Estatico "produto_preco_zero"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um número positivo"

Cenário: POST Cadastrar Produto Sem Descricao 400
    [tags]      POST_cadastrar_sem_descricao     POST
    Pegar Dados Produtos Estatico "produto_sem_descricao"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "descricao" Contem "descricao não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Quantidade Zero 400
    [tags]      POST_cadastrar_quantidade_zero     POST
    Criar Dados para Produto Dinamico Válido
    Alterar Payload Quantidade "0"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Produto Com Quantidade Negativa 400
    [tags]      POST_cadastrar_quantidade_negativa     POST
    Criar Dados para Produto Dinamico Válido
    Alterar Payload Quantidade "-5"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser maior ou igual a 0"

Cenário: POST Cadastrar Produto Com Preco Invalido 400
    [tags]      POST_cadastrar_preco_invalido     POST
    Pegar Dados Produtos Estatico "produto_preco_invalido"
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um inteiro"

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

