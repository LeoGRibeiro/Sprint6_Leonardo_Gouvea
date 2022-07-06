* Settings *
Documentation          Keywords relacionados a Produtoss

Resource            ../support/common/common.robot
Resource            ../support/fixtures/dynamics.robot

* Keywords *
# GET KEYWORDS #######################################################################################################
GET Endpoint /produtos
    ${response}         GET on Session      serverest   /produtos  
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

GET Endpoint /produtos por ID 
    ${response}         GET on Session      serverest   /produtos/${id_produto}        expected_status=any       
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

# POST KEYWORDS #######################################################################################################
POST Endpoint /produtos
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         POST on Session         serverest       /produtos       data=&{payload}                  headers=${header}          expected_status=any
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# PUT KEYWORDS #######################################################################################################
PUT Endpoint /produtos
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         PUT on Session         serverest       /produtos/${id_produto}       data=&{payload}                  headers=${header}     expected_status=any
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# DELETE KEYWORDS #######################################################################################################
DELETE Endpoint /produtos 
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         DELETE on Session         serverest       /produtos/${id_produto}     headers=${header}          expected_status=any
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# GENERAL KEYWORDS ###################################################################################################
Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}   Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Um Produto e Armazenar id
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}           Set Variable    ${response.json()["_id"]}
    Log To Console          ID Produto: ${id_produto}
    Set Global Variable     ${id_produto}

Coletar ID Produto Aleatorio
    ${response}             GET on Session      serverest   /produtos
    ${numbers}=             Evaluate            random.sample(range(1, ${response.json()["quantidade"]}),1)    random  # Função pega deste post https://stackoverflow.com/questions/22524771/robot-framework-generating-unique-random-number
    ${id_produto}           Set Variable        ${response.json()["produtos"][${numbers}[0]]["_id"]}
    Set Global Variable     ${id_produto}
    Log To Console          Produto aleatório: ${response.json()["produtos"][${numbers}[0]]}

Definir ID Produto "${id_produto}"
    Set Global Variable     ${id_produto}

Pegar Dados Produtos Estatico "${produto}"
    ${json}                 Importar Json Estatico  json_produtos.json
    ${payload}              Set Variable            ${json["${produto}"]}
    log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Payload Quantidade "${valor}"
    ${payload}              Create Dictionary       nome=${payload["nome"]}      preco=${payload["preco"]}     descricao=${payload["descricao"]}   quantidade=${valor}
    Set Global Variable     ${payload}
    Log To Console          Nova Quantidade: ${valor}