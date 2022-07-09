* Settings *

Documentation   Arquivo de Testes para o endpoint /carrinhos

Resource        ../support/common/common.robot
Resource        ../keywords/carrinhos_keywords.robot

Suite Setup     Criar Sessao        # Fazer algo antes de começar cada teste

* Test Cases *
# GET CENÁRIOS ##########################################################################################################################################
Cenário: GET Todos Carrinhos 200
    [tags]      GET_carrinhos   GET
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho por ID 200
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
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: POST Carrinho Com Produtos Repetidos 400
    [tags]      POST_produto_repetido  POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_repetido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido possuir produto duplicado"

Cenário: POST Dois Carrinhos para um Usuario 400
    [tags]     POST_dois_carrinhos  POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Criar Carrinho Estatico "carrinho_repetido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido ter mais de 1 carrinho"

Cenário: POST Carrinho Com Produto Invalido 400
    [tags]     POST_carrinho_produto_invalido    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_produto_invalido"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não encontrado"

Cenário: POST Carrinho Com Produto Insuficiente 400
    [tags]     POST_carrinho_produto_insuficiente    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_produto_insuficiente"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não possui quantidade suficiente"

Cenário: POST Carrinho Com Token Invalido 401
    [tags]     POST_carrinho_token_invalido     POST
    Definir Token Invalido "2c03r2nvt02hhhfwo"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: POST Carrinho Produto Sem ID 400
    [tags]      POST_carrinho_sem_id    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Estatico "carrinho_sem_id"
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Se "produtos[0].idProduto" Contem "produtos[0].idProduto não pode ficar em branco"

Cenário: POST Carrinho Produto Quantidade Zero 400
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

Cenário: DELETE Concluir Compra Token Invalido 401
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

Cenário: DELETE CCancelar Compra Usuario Sem Carrinho 200
    [tags]      DELETE_cancelar_sem_carrinho       DELETE
    Fazer Login e Armazenar Token Adm "true"
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "200"
    Validar Se "message" Contem "Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Cancelar Compra Token Invalido 401
    [tags]      DELETE_cancelar_token_invalido       DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Definir Token Invalido "2c03r2nvt02hhhfwo"
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"