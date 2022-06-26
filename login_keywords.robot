 * Settings *
 Documentation      Keywords relacionados a Login

* Variables *
${email_para_login}         fulano@qa.com
${password_para_login}      teste

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary       email=fulano@qa.com     password=teste
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Invalido
    &{payload}              Create Dictionary       email=email_inexistente@qa.com    password=1234
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Sem Email
    &{payload}              Create Dictionary       email=     password=teste
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Sem Senha
    &{payload}              Create Dictionary       email=fulano@qa.com     password=
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

Login Usuario Invalido
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["user_invalido"]}
    Set Global Variable     ${payload}
    POST Endpoint /login Invalido

Login Usuario Sem Senha
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["user_sem_email"]}
    Set Global Variable     ${payload}
    POST Endpoint /login Sem Senha

Validar ter Logado
    Should be Equal         ${response.json()["message"]}   Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Log To Console          Token Salvo: {token_auth}
    Set Global Variable     ${token_auth}
    