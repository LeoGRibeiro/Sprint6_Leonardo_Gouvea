* Settings *

Documentation   Arquivo de Testes para o endpoint /usuarios

Resource        ../support/common/common.robot
Resource        ../keywords/usuarios_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Todos os Usuarios 200
    [tags]      GET_usuarios  
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuarios Por ID 200
    [tags]      GET_usuario_id
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    GET Endpoint /usuarios por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido
    GET Endpoint /usuarios por ID Invalido
    Validar Status Code "400"
    Validar Se "message" Contem "Usuário não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Criar Novo Usuario 201    
    [tags]      POST_usuario
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Criar Usuário de De Massa Estatica 201
    [tags]      POST_criar_estatico
    Pegar Dados Usuarios Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenário: POST Cadastrar Usuario Dinâmico 201
    [tags]      POST_cadastrar_dinamico
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenário: POST Criar Usuario Já Existente 400
    [tags]      POST_usuario_existente
    POST Usuario Dinâmico no Endpoint /usuarios Ja Usado
    Validar Status Code "400"
    Validar Se Mensagem Contem "usado"

Cenário: POST Criar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email
    POST Usuario Dinâmico no Endpoint /usuarios Sem Email
    Validar Status Code "400"

# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Usuario 200
    [tags]      PUT_usuario
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se Mensagem Contem "alterado com sucesso"

Cenário: PUT Criar novo Usuario 201
    [tags]      PUT_criar_usuario
    PUT Endpoint /usuarios com id "qyqWpvsVVnbDNdYn"
    Validar Status Code "201"
    Validar Se Mensagem Contem "realizado com sucesso"

Cenário: PUT Criar novo Usuario 400
    [tags]      PUT_email_usado
    PUT Endpoint /usuarios com id "qyqWpvsVVnbDNdYM"
    Validar Status Code "400"
    Validar Se Mensagem Contem "já está sendo usado"

# DELETE CENÁRIOS ########################################################################################################################################
Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"