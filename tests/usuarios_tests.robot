* Settings *

Documentation   Arquivo de Testes para o endopoint /usuarios

Resource        ../support/common/common.robot
Resource        ../keywords/usuarios_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
Cenário: GET Todos os Usuarios 200
    [tags]      GET_usuarios  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuarios Por ID 200
    [tags]      GET_usuario_id
    GET Endpoint /usuarios por id "3uMqrxuuX3xLGxiE"
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido
    GET Endpoint /usuarios por id "ZBvcyIXtSEKQq32f9"
    Validar Status Code "400"
    Validar Se Mensagem Contem "não encontrado"

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

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"