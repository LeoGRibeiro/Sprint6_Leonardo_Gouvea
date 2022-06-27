* Settings *
Documentation          Keywords relacionados a Produtoss


* Keywords *
GET Endpoint /produtos
    ${response}         GET on Session      serverest   /produtos  # Tudo que estiver após a variável será seu valor
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

GET Endpoint /produtos por ID "${id_produto}"
    ${response}         GET on Session      serverest   /produtos/${id_produto}        expected_status=any         # Tudo que estiver após a variável será seu valor
    Set Global Variable  ${response}  # Para a variável valer para todo o código
    Log to Console      Response: ${response.content}

POST Endpoint /produtos
    &{header}           Create Dictionary       Authorization=${token_auth}
    &{payload}          Create Dictionary       nome=LG 305    preco=150      descricao=Mouse Bluetooth   quantidade=55  # Usar o "&" para transformar em dicionário
    ${response}         POST on Session         serverest       /produtos       data=&{payload}                  headers=${header}
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

POST Endpoint /produtos Ja Usado
    &{header}           Create Dictionary       Authorization=${token_auth}
    &{payload}          Create Dictionary       nome=LG 305    preco=150      descricao=Mouse Bluetooth   quantidade=55  # Usar o "&" para transformar em dicionário
    ${response}         POST on Session         serverest       /produtos       data=&{payload}           headers=${header}          expected_status=any 
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

PUT Endpoint /produtos com ID 
    &{header}           Create Dictionary       Authorization=${token_auth}
    &{payload}          Create Dictionary       nome=RX 550    preco=650      descricao=Placa de video   quantidade=305  # Usar o "&" para transformar em dicionário
    ${response}         PUT on Session         serverest       /produtos/6wBk53KzZx8OeFjm       data=&{payload}                  headers=${header}
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

DELETE Endpoint /produtos com id "${id_produto}"
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         DELETE on Session         serverest       /produtos/${id_produto}     headers=${header}
    Log to Console      Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}   Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Um Produto e Armazenar id
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}           Set Variable    ${response.json()["_id"]}
    Log To Console          ID Produto: ${id_produto}
    Set Global Variable     ${id_produto}