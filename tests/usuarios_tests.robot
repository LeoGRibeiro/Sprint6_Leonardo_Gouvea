* Settings *

Documentation   Arquivo de Testes para o endpoint /usuarios

Resource        ../support/common/common.robot
Resource        ../keywords/usuarios_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Todos os Usuarios 200
    [tags]      GET_usuarios    GET
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuarios Por ID 200
    [tags]      GET_usuario_id  GET
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido     GET
    Definir ID "nc2r23yn7crt""
    GET Endpoint /usuarios por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Usuário não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Usuario Dinâmico 201
    [tags]      POST_cadastrar_dinamico     POST
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Resposta Vazia "_id"

Cenário: POST Criar Usuário de De Massa Estatica 201
    [tags]      POST_criar_estatico     POST
    Pegar Dados Usuarios Estatico "user_valido"
    POST Endpoint /usuarios
    Coletar ID Usuario
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Resposta Vazia "_id"
    DELETE Endpoint /usuarios

Cenário: POST Criar Usuario Já Existente 400
    [tags]      POST_usuario_email_usado    POST
    Pegar Dados Usuarios Estatico "user_email_usado"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: POST Criar Usuario Com Dados Inválidos 400
    [tags]      POST_usuario_invalido   POST
    Pegar Dados Usuarios Estatico "user_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: POST Criar Usuario Sem Nome 400
    [tags]      POST_usuario_sem_nome   POST
    Pegar Dados Usuarios Estatico "user_sem_nome"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Criar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email  POST
    Pegar Dados Usuarios Estatico "user_sem_email"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Criar Usuario Sem Senha 400
    [tags]      POST_usuario_sem_senha  POST
    Pegar Dados Usuarios Estatico "user_sem_senha"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Criar Usuario Administrador Invalido 400
    [tags]      POST_usuario_adm_invalido   POST
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Usuario 200
    [tags]      PUT_editar_todos_dados  PUT
    Criar Dados para Usuario Válido
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Criar novo Usuario 201
    [tags]      PUT_criar_usuario   PUT
    Criar Dados para Usuario Válido
    Definir ID "c74wn5c972y23r"
    PUT Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Resposta Vazia "_id"

Cenário: PUT Atualizar Nome 200
    [tags]     PUT_atualizar_nome   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Nome
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Atualizar Email 200
    [tags]     PUT_atualizar_email  PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Email
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Atualizar Senha 200
    [tags]     PUT_atualizar_senha  PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Senha
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Atualizar Administrador True 200
    [tags]      PUT_atualizar_adm_true   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador True
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Atualizar Administrador False 200
    [tags]      PUT_atualizar_adm_false   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador False
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Email Usado 400
    [tags]      PUT_email_usado PUT
    Pegar Dados Usuarios Estatico "user_email_usado"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: PUT Editar Dados Invalidos 400
    [tags]      PUT_dados_invalidos PUT
    Pegar Dados Usuarios Estatico "user_invalido"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: PUT Editar Dados Sem nome 400
    [tags]      PUT_sem_nome    PUT
    Pegar Dados Usuarios Estatico "user_sem_nome"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: PUT Editar Dados Sem Email 400
    [tags]      PUT_sem_email   PUT
    Pegar Dados Usuarios Estatico "user_sem_email"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: PUT Editar Dados Sem Senha 400
    [tags]      PUT_sem_senha   PUT
    Pegar Dados Usuarios Estatico "user_sem_senha"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Editar Dados Administrador Invalido 400
    [tags]      PUT_adm_invalido    PUT
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

# DELETE CENÁRIOS ########################################################################################################################################
Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario  DELETE
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso"

Cenário: DELETE Não Encontrar Usuario 200
    [tags]      DELETE_id_invalido  DELETE
    Definir ID "IDinvalido"
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Nenhum registro excluído"

Cenário: DELETE Usuario Com Carrinho 400
