* Settings *

Documentation   Arquivo de Testes para o endpoint /login

Resource        ../support/common/common.robot


Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
Cenário: POST Realizar Login 200
    [Tags]      POST_login   
    POST Endpoint /login "user_valido"
    Validar Status Code "200"
    Validar Se "message" Contem "Login realizado com sucesso"

Cenário: POST Realizar Login Invalido 401
    [tags]      POST_login_invalido
    POST Endpoint /login "user_invalido"
    Validar Status Code "401"
    Validar Se "message" Contem "Email e/ou senha inválidos"

Cenário: POST Realizar Login Sem Email 400
    [tags]      POST_login_sem_email
    POST Endpoint /login "user_sem_email"
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Realizar Login Sem Senha 400
    [tags]      POST_login_sem_senha
    POST Endpoint /login "user_sem_senha"
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"
    