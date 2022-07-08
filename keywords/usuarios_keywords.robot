* Settings *
Documentation       Keywords e variáveis relacionados a usuários
Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot

Library             FakerLibrary

* Keywords *

# GET KEYWORDS #######################################################################################################
GET Endpoint /usuarios
    ${response}         GET on Session      serverest   /usuarios  
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}
    Log to Console      Quantidade: ${response.json()["quantidade"]}
    
GET Endpoint /usuarios por ID 
    ${response}         GET on Session      serverest   /usuarios/${id_usuario}             expected_status=any
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}
    
# POST KEYWORDS ######################################################################################################
POST Endpoint /usuarios
    ${response}             POST on Session         serverest       /usuarios   data=&{payload}     expected_status=any
    Log to Console          Response: ${response.content}  
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
    ${numbers}=             Evaluate            random.sample(range(0, ${response.json()["quantidade"]}),1)    random  # Função pega deste post https://stackoverflow.com/questions/22524771/robot-framework-generating-unique-random-number
    ${id_usuario}           Set Variable        ${response.json()["usuarios"][${numbers}[0]]["_id"]}
    Set Global Variable     ${id_usuario}
    Log To Console          ${id_usuario}

Definir ID Usuario "${id_usuario}"
    Set Global Variable     ${id_usuario}

Alterar Dados Payload Nome
    ${nome}                 FakerLibrary.Name
    ${payload}              Create Dictionary       nome=${nome}     email=${response.json()["email"]}     password=${response.json()["password"]}   administrador=${response.json()["administrador"]}
    log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Dados Payload Email
    ${email}                FakerLibrary.Email
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      email=${email}     password=${response.json()["password"]}   administrador=${response.json()["administrador"]}
    log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Dados Payload Senha   
    ${senha}                FakerLibrary.Password     length=5          special_chars=True     digits=True    upper_case=True    lower_case=True
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      email=${response.json()["email"]}     password=${senha}  administrador=${response.json()["administrador"]}
    Log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Dados Payload Administrador True
    ${senha}                FakerLibrary.Password     length=5          special_chars=True     digits=True    upper_case=True    lower_case=True
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      email=${response.json()["email"]}     password=${response.json()["password"]}  administrador=true
    Log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Dados Payload Administrador False
    ${senha}                FakerLibrary.Password     length=5          special_chars=True     digits=True    upper_case=True    lower_case=True
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      email=${response.json()["email"]}     password=${response.json()["password"]}  administrador=false
    Log To Console          ${payload}
    Set Global Variable     ${payload}
