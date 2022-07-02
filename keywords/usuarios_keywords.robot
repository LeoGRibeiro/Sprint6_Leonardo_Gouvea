* Settings *
Documentation       Keywords e variáveis relacionados a usuários
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot


* Keywords *
# GENERAL KEYWORDS ###################################################################################################
Pegar Dados Usuarios Estatico "${user}"
    ${json}                 Importar Json Estatico  json_usuario.json
    ${payload}              Set Variable            ${json["${user}"]}
    log To Console          ${payload}
    Set Global Variable     ${payload}

Coletar ID Usuario
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}

Coletar ID Usuario Aleatorio
    ${response}             GET on Session      serverest   /usuarios
    ${numbers}=     Evaluate    random.sample(range(1, ${response.json()["quantidade"]}),1)    random  # Função pega deste post https://stackoverflow.com/questions/22524771/robot-framework-generating-unique-random-number
    ${id_usuario}           Set Variable        ${response.json()["usuarios"][${numbers}[0]]["_id"]}
    Set Global Variable     ${id_usuario}


# GET KEYWORDS #######################################################################################################
GET Endpoint /usuarios
    ${response}         GET on Session      serverest   /usuarios  # Tudo que estiver após a variável será seu valor
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

GET Endpoint /usuarios por ID 
    ${response}         GET on Session      serverest   /usuarios/${id_usuario}             expected_status=any
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

GET Endpoint /usuarios por ID Invalido
    ${response}         GET on Session      serverest   /usuarios/4hriu1hi45f7              expected_status=any
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

# POST KEYWORDS ######################################################################################################
POST Endpoint /usuarios
    ${response}             POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

# PUT KEYWORDS #######################################################################################################
PUT Endpoint /usuarios
    ${response}         PUT on Session      serverest   /usuarios/${id_usuario}    json=&{payload}        expected_status=any
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}

# DELETE KEYWORDS ####################################################################################################
DELETE Endpoint /usuarios
    ${response}         DELETE on Session      serverest   /usuarios/${id_usuario}        expected_status=any
    Log to Console      Response: ${response.content}
    Set Global Variable     ${response}
