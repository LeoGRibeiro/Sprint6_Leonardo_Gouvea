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
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido
    Definir ID "nc2r23yn7crt""
    GET Endpoint /usuarios por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Usuário não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Usuario Dinâmico 201
    [tags]      POST_cadastrar_dinamico
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: POST Criar Usuário de De Massa Estatica 201
    [tags]      POST_criar_estatico
    Pegar Dados Usuarios Estatico "user_valido"
    POST Endpoint /usuarios
    Coletar ID Usuario
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    DELETE Endpoint /usuarios

Cenário: POST Criar Usuario Já Existente 400
    [tags]      POST_usuario_email_usado
    Pegar Dados Usuarios Estatico "user_email_usado"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: POST Criar Usuario Com Dados Inválidos 400
    [tags]      POST_usuario_invalido
    Pegar Dados Usuarios Estatico "user_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: POST Criar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email
    Pegar Dados Usuarios Estatico "user_sem_email"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Criar Usuario Sem Senha 400
    [tags]      POST_usuario_sem_senha
    Pegar Dados Usuarios Estatico "user_sem_senha"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Criar Usuario Administrador Invalido 400
    [tags]      POST_usuario_adm_invalido
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Usuario 200
    [tags]      PUT_usuario
    Criar Dados para Usuario Válido
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Criar novo Usuario 201
    [tags]      PUT_criar_usuario
    Criar Dados para Usuario Válido
    Definir ID "c74wn5c972y23r"
    PUT Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: PUT Email Usado 400
    [tags]      PUT_email_usado
    Coletar ID Usuario Aleatorio
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