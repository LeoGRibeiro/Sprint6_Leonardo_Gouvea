* Settings *
Documentation       Keywords e variáveis relacionados a usuários
Resource    ./common.robot

* Keywords *

GET Endpoint /usuarios
    ${response}         GET on Session      serverest   /usuarios  # Tudo que estiver após a variável será seu valor
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

GET Endpoint /usuarios por id "${id_usuario}"
    ${response}         GET on Session      serverest   /usuarios/${id_usuario}             expected_status=any
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

POST Usuario Dinâmico no Endpoint /usuarios 
    &{payload}          Create Dictionary       nome=Elano    email=elano123@qa.com         password=12345  administrador=true
    ${response}         POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Usuario Dinâmico no Endpoint /usuarios Já Usado
    &{payload}          Create Dictionary       nome=Fulano    email=fulano@qa.com         password=teste  administrador=true
    ${response}         POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Usuario Dinâmico no Endpoint /usuarios Sem Email
    &{payload}          Create Dictionary       nome=Elano    email=        password=12345      administrador=true
    ${response}         POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Usuario Estatico no Endpoint /usuarios 
    ${response}         POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

PUT Endpoint /usuarios com id "${id_usuario}"
    &{payload}          Create Dictionary       nome=Cazé    email=casimiro@gmail.com    password=1234    administrador=true
    ${response}         PUT on Session      serverest   /usuarios/${id_usuario}     data=&{payload}        expected_status=any
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios com id "${id_usuario}"
    ${response}         DELETE on Session      serverest   /usuarios/${id_usuario}              expected_status=any
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar Json Estatico  json_usuario.json
    ${payload}              Set Variable            ${json["criar_user_valido"]}
    Set Global Variable     ${payload}
    POST Usuario Estatico no Endpoint /usuarios

Criar Usuario Estatico Invalido
    ${json}                 Importar Json Estatico  json_usuario.json
    ${payload}              Set Variable            ${json["criar_user_sem_email"]}
    Set Global Variable     ${payload}
    POST Usuario Dinâmico no Endpoint /usuarios

Validar Quantidade "${valor}"
    Should Be Equal     ${response.json()["quantidade"]}    ${valor}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}       ${palavra}

Validar Sem Email
    Should be Equal         ${response.json()["email"]}   email não pode ficar em branco