* Settings *
Documentation       Keywords e variáveis relacionados a usuários
Resource    ./common.robot

* Keywords *

GET Endpoint /usuarios
    ${response}         GET on Session      serverest   /usuarios  # Tudo que estiver após a variável será seu valor
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

GET Endpoint /usuarios por id "${id_usuario}"
    ${response}         GET on Session      serverest   /usuarios/${id_usuario}  
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}
    
POST Usuario Dinâmico no Endpoint /usuarios
    ${response}         POST on Session     serverest       /usuarios   data=&{payload}
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

PUT Endpoint /usuarios com id 
    &{payload}          Create Dictionary       nome=Rulque Grande    email=luan@gmail.com    password=1234    administrador=true
    ${response}         PUT on Session      serverest   /usuarios/qyqWpvsVVnbDNdYM      data=&{payload}
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios com id "${id_usuario}"
    ${response}         DELETE on Session      serverest   /usuarios/${id_usuario}
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar Json Estatico  json_usuario.json
    ${payload}              Set Variable            ${json["criar_user_valido"]}
    Set Global Variable     ${payload}
    POST Usuario Dinâmico no Endpoint /usuarios

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