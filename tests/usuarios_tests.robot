* Settings *

Documentation   Arquivo de Testes para o endpoint /usuarios

Resource        ../support/common/common.robot
Resource        ../keywords/usuarios_keywords.robot


Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Retornar Todos os Usuarios 200
    [tags]      GET_usuarios    GET
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Retornar Usuario Por ID 200
    [tags]      GET_usuario_id  GET
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido     GET
    Definir ID Usuario "nc2r23yn7crt""
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
    Validar Alguma Resposta Vazia "_id"

Cenário: POST Cadastrar Usuario Com Email Usado 400
    [tags]      POST_usuario_email_usado    POST
    Pegar Dados Usuarios Estatico "user_email_usado"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: POST Cadastrar Usuario Com Dados Inválidos 400
    [tags]      POST_usuario_invalido   POST
    Pegar Dados Usuarios Estatico "user_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: POST Cadastrar Usuario Sem Nome 400
    [tags]      POST_usuario_sem_nome   POST
    Pegar Dados Usuarios Estatico "user_sem_nome"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Cadastrar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email  POST
    Pegar Dados Usuarios Estatico "user_sem_email"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Cadastrar Usuario Sem Senha 400
    [tags]      POST_usuario_sem_senha  POST
    Pegar Dados Usuarios Estatico "user_sem_senha"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Cadastrar Usuario Administrador Invalido 400
    [tags]      POST_usuario_adm_invalido   POST
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

# PUT CENÁRIOS ##########################################################################################################################################
Cenário: PUT Editar Todos Dados Usuario 200
    [tags]      PUT_editar_todos_dados  PUT
    Criar Dados para Usuario Válido
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Cadastar Novo Usuario 201
    [tags]      PUT_cadastrar_usuario   PUT
    Criar Dados para Usuario Válido
    Definir ID Usuario "c74wn5c972y23r"
    PUT Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: PUT Editar Nome 200
    [tags]     PUT_atualizar_nome   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar "nome" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Email 200
    [tags]     PUT_atualizar_email  PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar "email" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Senha 200
    [tags]     PUT_atualizar_senha  PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar "password" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Administrador para True 200
    [tags]      PUT_atualizar_adm_true   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador "true"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Administrador False 200
    [tags]      PUT_atualizar_adm_false   PUT
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador "false"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar para Email Usado 400
    [tags]      PUT_email_usado     PUT
    Pegar Dados Usuarios Estatico "user_email_usado"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: PUT Editar para Dados Invalidos 400
    [tags]      PUT_dados_invalidos     PUT
    Pegar Dados Usuarios Estatico "user_invalido"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: PUT Editar Sem Nome 400
    [tags]      PUT_sem_nome    PUT
    Pegar Dados Usuarios Estatico "user_sem_nome"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: PUT Editar Sem Email 400
    [tags]      PUT_sem_email   PUT
    Pegar Dados Usuarios Estatico "user_sem_email"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: PUT Editar Sem Senha 400
    [tags]      PUT_sem_senha   PUT
    Pegar Dados Usuarios Estatico "user_sem_senha"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Editar Administrador Invalido 400
    [tags]      PUT_adm_invalido    PUT
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    Coletar ID Usuario Aleatorio
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

# DELETE CENÁRIOS ########################################################################################################################################
Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario  DELETE
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    Coletar ID Usuario
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso"
    GET Endpoint /usuarios por ID

Cenário: DELETE Não Encontrar Usuario 200
    [tags]      DELETE_id_invalido  DELETE
    Definir ID Usuario "n2c7rgt354ygi"
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Nenhum registro excluído"

Cenário: DELETE Usuario Com Carrinho 400
    [tags]      DELETE_usuario_com_carrinho     DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido excluir usuário com carrinho cadastrado"
