* Settings *
Documentation      Keywords relacionados a Login
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot


* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary       email=fulano@qa.com     password=teste
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Invalido
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["user_invalido"]}
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Sem Email
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["user_sem_email"]}
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Sem Senha
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["user_sem_senha"]}
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}




    