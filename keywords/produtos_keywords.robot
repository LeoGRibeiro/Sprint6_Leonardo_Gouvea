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
    Log to Console      Quantidade: ${response.json()["quantidade"]}

GET Endpoint /produtos por ID 
    ${response}         GET on Session      serverest   /produtos/${id_produto}        expected_status=any       
    Set Global Variable  ${response}  
    Log to Console      Response: ${response.content}

# POST KEYWORDS #######################################################################################################
POST Endpoint /produtos
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         POST on Session         serverest       /produtos       data=&{payload}                  headers=${header}          expected_status=any
    Log to Console      ${payload}
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# PUT KEYWORDS #######################################################################################################
PUT Endpoint /produtos
    ${response}         GET on Session      serverest   /produtos/${id_produto}        expected_status=any 
    Log to Console      Antigo Produto: ${response.content}
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         PUT on Session         serverest       /produtos/${id_produto}       data=&{payload}                  headers=${header}     expected_status=any
    Log to Console      Novo produto: ${payload}
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# DELETE KEYWORDS #######################################################################################################
DELETE Endpoint /produtos 
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         DELETE on Session         serverest       /produtos/${id_produto}     headers=${header}          expected_status=any
    Log to Console      Response: ${response.content}  
    Set Global Variable     ${response}

# GENERAL KEYWORDS ###################################################################################################

Coletar ID Produto Aleatorio
    ${response}             GET on Session      serverest   /produtos
    ${numbers}=             Evaluate            random.sample(range(0, ${response.json()["quantidade"]}),1)    random  # Função pega deste post https://stackoverflow.com/questions/22524771/robot-framework-generating-unique-random-number
    ${id_produto}           Set Variable        ${response.json()["produtos"][${numbers}[0]]["_id"]}
    Set Global Variable     ${id_produto}

Definir ID Produto "${id_produto}"
    Set Global Variable     ${id_produto}

Pegar Dados Produtos Estatico "${produto}"
    ${json}                 Importar Json Estatico  json_produtos.json
    ${payload}              Set Variable            ${json["${produto}"]}
    log To Console          ${payload}
    Set Global Variable     ${payload}

Alterar Payload Nome Dinamico
    ${response}             GET on Session      serverest   /produtos/${id_produto}        expected_status=any
    ${nome}                 FakerLibrary.Text            max_nb_chars=25
    ${payload}              Create Dictionary       nome=${nome}      preco=${response.json()["preco"]}     descricao=${response.json()["descricao"]}   quantidade=${response.json()["quantidade"]}
    Set Global Variable     ${payload}

Alterar Payload Preco Dinamico
    ${response}             GET on Session      serverest   /produtos/${id_produto}        expected_status=any
    ${preco}                FakerLibrary.Random Int      min=20      max=1500
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      preco=${preco}     descricao=${response.json()["descricao"]}   quantidade=${response.json()["quantidade"]}
    Set Global Variable     ${payload}

Alterar Payload Descricao Dinamico
    ${response}             GET on Session      serverest   /produtos/${id_produto}        expected_status=any
    ${descricao}            FakerLibrary.Text       max_nb_chars=60   
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      preco=${response.json()["preco"]}     descricao=${descricao}   quantidade=${response.json()["quantidade"]}
    Set Global Variable     ${payload}

Alterar Payload Quantidade Dinamico
    ${response}             GET on Session      serverest   /produtos/${id_produto}        expected_status=any
    ${quantidade}           FakerLibrary.Random Int      min=2       max=500   
    ${payload}              Create Dictionary       nome=${response.json()["nome"]}      preco=${response.json()["preco"]}     descricao=${response.json()["descricao"]}   quantidade=${quantidade}
    Set Global Variable     ${payload}

Alterar Payload Quantidade "${valor}"
    ${payload}              Create Dictionary       nome=${payload["nome"]}      preco=${payload["preco"]}     descricao=${payload["descricao"]}   quantidade=${valor}
    Set Global Variable     ${payload}
    Log To Console          Nova Quantidade: ${valor}

Alterar Payload Preco "${valor}"
    ${payload}              Create Dictionary       nome=${payload["nome"]}      preco=${valor}     descricao=${payload["descricao"]}   quantidade=${payload["quantidade"]}
    Set Global Variable     ${payload}
    Log To Console          Novo Valor: ${valor}

Alterar Payload Nome "${valor}"
    ${payload}              Create Dictionary       nome=${valor}      preco=${payload["preco"]}     descricao=${payload["descricao"]}   quantidade=${payload["quantidade"]}
    Set Global Variable     ${payload}
    Log To Console          Novo Valor: ${valor}

Alterar Payload Descricao "${valor}"
    ${payload}              Create Dictionary       nome=${payload["nome"]}      preco=${payload["preco"]}     descricao=${valor}   quantidade=${payload["quantidade"]}
    Set Global Variable     ${payload}
    Log To Console          Novo Valor: ${valor}