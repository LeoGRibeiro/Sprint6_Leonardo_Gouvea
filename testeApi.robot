* Settings *

Documentation   Arquivo simples paraa requisição HTTP

Library     RequestsLibrary
Resource    ./usuarios_keywords.robot  # Como se fosse uma biblioteca
Resource    ./login_keywords.robot
Resource    ./produtos_keywords.robot
Resource    ./carrinhos_keywords.robot
Resource    ./common.robot

# Sessão para setagem de variáveis
* Variables *


* Test Cases *
# CENÁRIOS DE LOGIN #########################################################################################################################################################
Cenário: POST Realizar Login 200
    [Tags]      POST_login
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Realizar Login Invalido 401
    [tags]      POST_login_invalido
    Criar Sessao
    POST Endpoint /login Invalido
    Validar Status Code "401"
    Validar Se Mensagem Contem "inválidos"

Cenário: POST Realizar Login Sem Email 400
    [tags]      POST_login_sem_email
    Criar Sessao
    POST Endpoint /login Sem Email
    Validar Status Code "400"

Cenário: POST Realizar Login Sem Senha 400
    [tags]      POST_login_sem_senha
    Criar Sessao
    POST Endpoint /login Sem Senha
    Validar Status Code "400"

# CENÁRIOS DE USUÁRIOS #########################################################################################################################################################
Cenário: GET Todos os Usuarios 200
    [tags]      GET  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuarios Por ID 200
    [tags]      GET_usuario_id
    Criar Sessao
    GET Endpoint /usuarios por id "ZBvcyIXtSEKQq9f9"
    Validar Status Code "200"

Cenário: POST Criar Novo Usuario 201    
    [tags]      POST_usuario
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Criar Usuario Já Existente 400
    [tags]      POST_usuario_existente
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "400"
    Validar Se Mensagem Contem "usado"

Cenário: POST Criar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email
    Criar Sessao
    POST Usuario Dinâmico no Endpoint /usuarios Sem Email
    Validar Status Code "400"

Cenário: PUT Editar Usario Existente 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios com id 
    Validar Status Code "200"

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios com id "RqnmHmezxvDvVxpH"
    Validar Status Code "200"

Cenário: POST Criar Usuário de De Massa Estatica 201
    [tags]      POSTCriar_estatico
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"



# CENÁRIOS DE PRODUTOS #########################################################################################################################################################
Cenário: GET Todos os Produtos 200
    [tags]      GET_produtos  # Caso queria executar somente um cenário, no momento do CMD digito robot -d ./reports -i (NOME DA TAG) testeApi.robot
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID
    [tags]       GET_produto_id
    Criar Sessao
    GET Endpoint /produtos por ID "6wBk53KzZx8OeFjm"
    Validar Status Code "200"

Cenário: POST Cadastrar Produtos 201
    [tags]      POST_produto
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: PUT Editar Produto 200
    [tags]      PUTproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos com ID 
    Validar Status Code "200"
    
Cenário: DELETE Excluir produto 200
    [tags]      DELETEproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos com id "BrpEdApkF8tV0QEo"
    Validar Status Code "200"


# CENÁRIOS PARA CARRINHO #########################################################################################################################################################
Cenário: GET Retornar Carrinhos 200
    [tags]      GET_carrinhos
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Retornar Carrinho por ID
    [tags]      GET_carrinho_id
    Criar Sessao
    GET Endpoint /carrinhos por ID "5qsUPyyvacXkeOYW"
    Validar Status Code "200"

Cenário: POST Cadastrar Carrinhos 200
    [tags]      POST_carrinhos
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
