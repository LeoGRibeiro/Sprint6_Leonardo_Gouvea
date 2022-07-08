* Settings *
Documentation      Keywords relacionados a Login
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot


* Keywords *
POST Endpoint /login "${user}"
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["${user}"]}
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /login Dinamico
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}
