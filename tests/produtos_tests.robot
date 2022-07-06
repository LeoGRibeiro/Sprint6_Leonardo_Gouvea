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
    Definir ID Produto "34cnrt91y234"
    GET Endpoint /produtos por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Produtos 201
    [tags]      POST_cadastrar_dinamico    POST
    Fazer Login e Armazenar Token
    Criar Dados para Produto Dinamico Válido
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: POST Cadastrar Produto Já Existente 400
    [tags]      POST_produto_ja_existente   POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_repetido"
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
    Fazer Login Sem Adm e Armazenar Token
    Criar Dados para Produto Dinamico Válido
    POST Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

Cenário: POST Cadastrar Produto Sem Nome 400
    [tags]      POST_cadastrar_sem_nome     POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_sem_nome"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Preco Zero 400
    [tags]      POST_cadastrar_preco_zero     POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_preco_zero"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um número positivo"

Cenário: POST Cadastrar Produto Com Preco Invalido 400
    [tags]      POST_cadastrar_preco_invalido     POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_preco_invalido"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um inteiro"

Cenário: POST Cadastrar Produto Com Preco Negativo 400
    [tags]      POST_cadastrar_preco_negativo     POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_preco_negativo"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um número positivo"

Cenário: POST Cadastrar Produto Sem Descricao 400
    [tags]      POST_cadastrar_sem_descricao     POST
    Fazer Login e Armazenar Token
    Pegar Dados Produtos Estatico "produto_sem_descricao"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "descricao" Contem "descricao não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Quantidade Zero 400
    [tags]      POST_cadastrar_quantidade_zero     POST
    Fazer Login e Armazenar Token
    Criar Dados para Produto Dinamico Válido
    Alterar Payload Quantidade "0"
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Produto Com Quantidade Invalida 400
    [tags]      POST_cadastrar_quantidade_invalida     POST
    Fazer Login e Armazenar Token
    Criar Dados para Produto Dinamico Válido
    Alterar Payload Quantidade "57.4"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser um inteiro"

Cenário: POST Cadastrar Produto Com Quantidade Negativa 400
    [tags]      POST_cadastrar_quantidade_negativa     POST
    Fazer Login e Armazenar Token
    Criar Dados para Produto Dinamico Válido
    Alterar Payload Quantidade "-5"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser maior ou igual a 0"


# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Produto Dinamico 200
    [tags]      PUT_produto   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Criar Produto Dinamico 201
    [tags]      PUT_cadastrar_produto   PUT
    Fazer Login e Armazenar Token
    Definir Id Produto "crfn2349cr9"
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: PUT Editar Produto Nome Já Existente 400
    [tags]     PUT_nome_ja_usado    PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Pegar Dados Produtos Estatico "produto_repetido"
    PUT Endpoint /produtos 
    Validar Status Code "400"
    Validar Se "message" Contem "Já existe produto com esse nome"

Cenário: PUT Editar Produto Token Inválido 401
    [tags]     PUT_editar_token_invalido    PUT
    Definir Token Invalido "fhn23cn429n45c43tc"
    Coletar ID Produto Aleatorio
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: PUT Editar Produto Sem Adm 403
    [tags]     PUT_editar_sem_adm    PUT
    Fazer Login Sem Adm e Armazenar Token
    Coletar ID Produto Aleatorio
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

Cenário: PUT Editar Nome 200
    [tags]     PUT_editar_nome   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Alterar Payload Nome Dinamico
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Preco 200
    [tags]     PUT_editar_preco   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Alterar Payload Preco Dinamico
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Descricao 200
    [tags]     PUT_editar_descricao   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Alterar Payload Descricao Dinamico
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Quantidade 200
    [tags]     PUT_editar_quantidade   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Alterar Payload Quantidade Dinamico
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Nome 200
    [tags]     PUT_editar_sem_nome   PUT
    Fazer Login e Armazenar Token
    Coletar ID Produto Aleatorio
    Alterar Payload Nome Dinamico
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

# DELETE CENÁRIOS ########################################################################################################################################    
Cenário: DELETE Excluir produto 200
    [tags]      DELETE_produto
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"

