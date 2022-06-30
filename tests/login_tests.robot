* Settings *

Documentation   Arquivo de Testes para o endopoint /login

Resource        ../keywords/login_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste
# Suite Teardown                    # Fazer algo depois dos cenários aconterecerem

* Test Cases *
Cenário: POST Realizar Login 200
    [Tags]      POST_login
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Realizar Login Invalido 400
    [tags]      POST_login_invalido
    POST Endpoint /login Invalido
    Validar Status Code "400"

Cenário: POST Realizar Login Sem Email 400
    [tags]      POST_login_sem_email
    POST Endpoint /login Sem Email
    Validar Status Code "400"

Cenário: POST Realizar Login Sem Senha 400
    [tags]      POST_login_sem_senha
    POST Endpoint /login Sem Senha
    Validar Status Code "400"
