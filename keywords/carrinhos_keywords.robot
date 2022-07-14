* Settings *
Documentation      Keywords relacionados a Carrinhos
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot

Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

* Keywords *
# GET KEYWORDS #######################################################################################################
GET Endpoint /carrinhos
    ${response}         GET on Session      serverest       /carrinhos 
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}
    Log to Console      Quantidade: ${response.json()["quantidade"]}

GET Endpoint /carrinhos por ID 
    ${response}         GET on Session      serverest       /carrinhos/${id_carrinho}        expected_status=any
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

 # POST KEYWORDS ######################################################################################################
POST Endpoint /carrinhos
    &{header}           Create Dictionary       Authorization=${token_auth}  
    Set to Dictionary   ${header}               Content-Type=application/json
    ${payload}          Evaluate                json.dumps(${payload})       json
    Log To Console      ${payload}
    ${response}         POST on Session         serverest       /carrinhos          data=${payload}     headers=${header}       expected_status=any
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

# DELETE KEYWORDS ####################################################################################################
DELETE Endpoint /carrinhos Concluir Compra
    &{header}           Create Dictionary       Authorization=${token_auth}  
    ${response}         DELETE on Session      serverest       /carrinhos/concluir-compra       headers=${header}    expected_status=any
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

DELETE Endpoint /carrinhos Cancelar Compra
    &{header}           Create Dictionary       Authorization=${token_auth}  
    ${response}         DELETE on Session      serverest       /carrinhos/cancelar-compra       headers=${header}    expected_status=any
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

# GENERAL KEYWORDS ###################################################################################################
Criar Carrinho Estatico "${carrinho}"
    ${json}                 Importar Json Estatico  json_carrinhos.json
    ${payload}              Set Variable            ${json["${carrinho}"]}
    Set Global Variable     ${payload}

Coletar ID Carrinho Aleatorio
    ${response}             GET on Session      serverest   /carrinhos
    ${numbers}=             Evaluate            random.sample(range(0, ${response.json()["quantidade"]}),1)    random  # Função pega deste post https://stackoverflow.com/questions/22524771/robot-framework-generating-unique-random-number
    ${id_carrinho}          Set Variable        ${response.json()["carrinhos"][${numbers}[0]]["_id"]}
    Set Global Variable     ${id_carrinho}

Coletar Id Carrinho
    ${id_carrinho}           Set Variable        ${response.json()["_id"]}
    Set Global Variable     ${id_carrinho}
    
Definir Id Carrinho "${id_carrinho}"
    Set Global Variable     ${id_carrinho}

Criar Carrinho Dinamico Quantidade Insuficente       # Aprendido com o Cléo
    ${quant_produtos}=             Evaluate            random.sample(range(1, 5),1)    random
    @{lista}                Create List
    FOR         ${C}        IN RANGE            ${quant_produtos[0]}
    ${response}             GET on Session      serverest   /produtos
    ${numbers}=             Evaluate            random.sample(range(0, ${response.json()["quantidade"]}),1)    random
    ${id}                   Set Variable        ${response.json()["produtos"][${numbers}[0]]["_id"]}
    ${pedido}               Create Dictionary         idProduto=${id}       quantidade=6000000 
    Append to list          ${lista}                    ${pedido}
    END
    ${payload}              Create Dictionary       produtos=${lista}
    Set Global Variable     ${payload}