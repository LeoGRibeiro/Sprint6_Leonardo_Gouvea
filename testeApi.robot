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


* Test Cases *
# CENÁRIOS DE LOGIN #########################################################################################################################################################
Cenário: POST Realizar Login 200
    [Tags]      POST_login
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Realizar Login Invalido 400
    [tags]      POST_login_invalido
    Criar Sessao
    POST Endpoint /login Invalido
    Validar Status Code "400"

Cenário: POST Realizar Login Sem Email 400
    [tags]      POST_login_sem_email
    Criar Sessao
    POST Endpoint /login Sem Email
    Validar Status Code "400"

Cenário: POST Realizar Login Sem Senha 400
    [tags]      POST_login_sem_senha
    Criar Sessao
    POST Endpoint /login Sem Senha
    Validar Status Code "400"


# CENÁRIOS DE USUÁRIOS #########################################################################################################################################################
Cenário: GET Todos os Usuarios 200
    [tags]      GET_usuarios  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${9}"

Cenário: GET Usuarios Por ID 200
    [tags]      GET_usuario_id
    Criar Sessao
    GET Endpoint /usuarios por id "3uMqrxuuX3xLGxiE"
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido
    Criar Sessao
    GET Endpoint /usuarios por id "ZBvcyIXtSEKQq32f9"
    Validar Status Code "400"
    Validar Se Mensagem Contem "não encontrado"

Cenário: POST Criar Novo Usuario 201    
    [tags]      POST_usuario
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Criar Usuário de De Massa Estatica 201
    [tags]      POST_criar_estatico
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

Cenário: POST Criar Usuario Já Existente 400
    [tags]      POST_usuario_existente
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios Ja Usado
    Validar Status Code "400"
    Validar Se Mensagem Contem "usado"

Cenário: POST Criar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios Sem Email
    Validar Status Code "400"

Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT_usuario_existente
    Criar Sessao
    PUT Endpoint /usuarios com id "qyqWpvsVVnbDNdYM"
    Validar Status Code "200"
    Validar Se Mensagem Contem "alterado com sucesso"

Cenário: PUT Criar novo Usuario 201
    [tags]      PUT_criar_usuario
    Criar Sessao
    PUT Endpoint /usuarios com id "qyqWpvsVVnbDNdYn"
    Validar Status Code "201"
    Validar Se Mensagem Contem "realizado com sucesso"

Cenário: PUT Criar novo Usuario 400
    [tags]      PUT_email_usado
    Criar Sessao
    PUT Endpoint /usuarios com id "qyqWpvsVVnbDNdYM"
    Validar Status Code "400"
    Validar Se Mensagem Contem "já está sendo usado"

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario
    Criar Sessao
    DELETE Endpoint /usuarios com id "zt8JKci3qPMLQaA9"
    Validar Status Code "200"


# CENÁRIOS DE PRODUTOS #########################################################################################################################################################
Cenário: GET Todos os Produtos 200
    [tags]       GET_produtos  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID 200
    [tags]       GET_produto_id
    Criar Sessao
    GET Endpoint /produtos por ID "6wBk53KzZx8OeFjm"
    Validar Status Code "200"

Cenário: GET Não Encontrar Produto Por ID 400
    [tags]       GET_nao_encontrar_produto
    Criar Sessao
    GET Endpoint /produtos por ID "grr3nIU@Bfe"
    Validar Status Code "400"
    Validar Se Mensagem Contem "não encontrado"

Cenário: POST Cadastrar Produtos 201
    [tags]      POST_produto
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Status Code "400"

Cenário: POST Cadastrar Produto Já Existente 400
    [tags]      POST_produto_ja_existente
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos Ja Usado
    Validar Status Code "400"

Cenário: PUT Editar Produto 200
    [tags]      PUT_produto
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos com ID 
    Validar Status Code "200"
    
Cenário: DELETE Excluir produto 200
    [tags]      DELETE_produto
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"


# CENÁRIOS DE CARRINHO #########################################################################################################################################################
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
