* Settings *
Documentation      Keywords relacionados a Carrinhos
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot

* Keywords *
GET Endpoint /carrinhos
    ${response}         GET on Session      serverest       /carrinhos 
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

GET Endpoint /carrinhos por ID "${id_carrinho}"
    ${response}         GET on Session      serverest       /carrinhos/${id_carrinho} 
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}
    
POST Endpoint /carrinhos
    &{header}           Create Dictionary       Authorization=${token_auth}         Content-Type=aplication/json
    ${response}         POST on Session         serverest       /carrinhos          data=&{payload}
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

Criar Carrinho Estatico Valido
    ${json}                 Importar Json Estatico  json_carrinhos.json
    ${payload}              Set Variable            ${json["produtos"][0]}
    Set Global Variable     ${payload}
    POST Endpoint /carrinhos