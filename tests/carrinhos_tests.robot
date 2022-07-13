* Settings *

Documentation   Arquivo de Testes para o endpoint /carrinhos

Resource        ../support/common/common.robot

Suite Setup     Criar Sessao        

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Retornar Todos Carrinhos 200
    [tags]      GET_carrinhos   GET
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Retornar Carrinho por ID 200
    [tags]      GET_carrinho_id   GET
    Coletar ID Carrinho Aleatorio
    GET Endpoint /carrinhos por ID 
    Validar Status Code "200"

Cenário: GET Não Encontrar Carrinho Por ID 400
    [tags]       GET_carrinho_id_invalido     GET
    Definir Id Carrinho "2cn9r8y29cn"
    GET Endpoint /carrinhos por ID 
    Validar Status Code "400"
    Validar Se "message" Contem "Carrinho não encontrado"

# POST CENÁRIOS #########################################################################################################################################
Cenário: POST Cadastrar Carrinho Dinamico 200
    [tags]      POST_carrinho_dinamico   POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Coletar Id Carrinho
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    GET Endpoint /carrinhos por ID 
    
Cenário: POST Cadastrar Carrinho Com Produtos Repetidos 400
    [tags]      POST_produto_repetido  POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_repetido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido possuir produto duplicado"

Cenário: POST Cadastrar Dois Carrinhos para um Usuario 400
    [tags]     POST_dois_carrinhos  POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Criar Carrinho Estatico "carrinho_repetido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido ter mais de 1 carrinho"

Cenário: POST Cadastrar Carrinho Com Produto Invalido 400
    [tags]     POST_carrinho_produto_invalido    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_produto_invalido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não encontrado"

Cenário: POST Cadastrar Carrinho Com Produto Insuficiente 400
    [tags]     POST_carrinho_produto_insuficiente    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Quantidade Insuficente
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não possui quantidade suficiente"

Cenário: POST Cadastrar Carrinho Com Token Invalido 401
    [tags]     POST_carrinho_token_invalido     POST
    Definir Token Invalido "2c03r2nvt02hhhfwo"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: POST Cadastrar Carrinho com Produto Sem ID 400
    [tags]      POST_carrinho_sem_id    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_sem_id"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "produtos[0].idProduto" Contem "produtos[0].idProduto não pode ficar em branco"

Cenário: POST Cadastrar Carrinho Produto Quantidade Zero 400
    [tags]      POST_carrinho_quantidade_zero    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_quantidade_zero"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "produtos[0].quantidade" Contem "produtos[0].quantidade deve ser um número positivo"

# DELETE CENÁRIOS #######################################################################################################################################
Cenário: DELETE Concluir Compra 200
    [tags]      DELETE_concluir_compra       DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos Concluir Compra
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso"

Cenário: DELETE Concluir Compra Usuario Sem Carrinho 200
    [tags]      DELETE_excluir_sem_carrinho       DELETE
    Fazer Login e Armazenar Token Adm "true"
    DELETE Endpoint /carrinhos Concluir Compra
    Validar Status Code "200"
    Validar Se "message" Contem "Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Concluir Compra com Token Invalido 401
    [tags]      DELETE_token_invalido       DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Definir Token Invalido "2c03r2nvt02hhhfwo"
    DELETE Endpoint /carrinhos Concluir Compra
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Cancelar Compra 200
    [tags]      DELETE_cancelar_compra       DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: DELETE Cancelar Compra Usuario Sem Carrinho 200
    [tags]      DELETE_cancelar_sem_carrinho       DELETE
    Fazer Login e Armazenar Token Adm "true"
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "200"
    Validar Se "message" Contem "Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Cancelar Compra com Token Invalido 401
    [tags]      DELETE_cancelar_token_invalido       DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Definir Token Invalido "2c03r2nvt02hhhfwo"
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"