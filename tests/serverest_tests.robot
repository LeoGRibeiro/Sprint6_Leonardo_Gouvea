* Settings *

Documentation   Arquivo de Testes para todos os endpoints

Resource        ../support/common/common.robot


Suite Setup     Criar Sessao        

* Test Cases *
# LOGIN CENÁRIOS #################################################################################################################
Cenário: POST Realizar Login 200
    [Tags]      POST_login   
    POST Endpoint /login "user_valido"
    Validar Status Code "200"
    Validar Se "message" Contem "Login realizado com sucesso"

Cenário: POST Realizar Login Invalido 401
    [tags]      POST_login_invalido
    POST Endpoint /login "user_invalido"
    Validar Status Code "401"
    Validar Se "message" Contem "Email e/ou senha inválidos"

Cenário: POST Realizar Login Sem Email 400
    [tags]      POST_login_sem_email
    POST Endpoint /login "user_sem_email"
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Realizar Login Sem Senha 400
    [tags]      POST_login_sem_senha
    POST Endpoint /login "user_sem_senha"
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

# UUSUÁRIOS CENÁRIOS #####################################################################################################################################
Cenário: GET Retornar Todos os Usuarios 200
    [tags]      GET_usuarios    GET
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Retornar Usuario Por ID 200
    [tags]      GET_usuario_id  GET
    Coletar ID Usuario Aleatorio
    GET Endpoint /usuarios por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar ID 400
    [tags]      GET_usuario_id_invalido     GET
    Definir ID Usuario "nc2r23yn7crt""
    GET Endpoint /usuarios por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Usuário não encontrado"

Cenário: POST Cadastrar Usuario Dinâmico 201
    [tags]      POST_cadastrar_dinamico     POST
    Criar Dados para Usuario Válido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: POST Cadastrar Usuario Com Email Usado 400
    [tags]      POST_usuario_email_usado    POST
    Pegar Dados Usuarios Estatico "user_email_usado"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: POST Cadastrar Usuario Com Dados Inválidos 400
    [tags]      POST_usuario_invalido   POST
    Pegar Dados Usuarios Estatico "user_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: POST Cadastrar Usuario Sem Nome 400
    [tags]      POST_usuario_sem_nome   POST
    Pegar Dados Usuarios Estatico "user_sem_nome"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Cadastrar Usuario Sem Email 400
    [tags]      POST_usuario_sem_email  POST
    Pegar Dados Usuarios Estatico "user_sem_email"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: POST Cadastrar Usuario Sem Senha 400
    [tags]      POST_usuario_sem_senha  POST
    Pegar Dados Usuarios Estatico "user_sem_senha"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Cadastrar Usuario Administrador Invalido 400
    [tags]      POST_usuario_adm_invalido   POST
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

Cenário: PUT Editar Todos Dados Usuario 200
    [tags]      PUT_editar_todos_dados  PUT
    Criar Usuario
    Criar Dados para Usuario Válido
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Cadastar Novo Usuario 201
    [tags]      PUT_cadastrar_usuario   PUT
    Criar Dados para Usuario Válido
    Definir ID Usuario "c74wn5c972y23r"
    PUT Endpoint /usuarios
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: PUT Editar Nome 200
    [tags]     PUT_atualizar_nome   PUT
    Criar Usuario
    GET Endpoint /usuarios por ID
    Alterar "nome" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Email 200
    [tags]     PUT_atualizar_email  PUT
    Criar Usuario
    GET Endpoint /usuarios por ID
    Alterar "email" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Senha 200
    [tags]     PUT_atualizar_senha  PUT
    Criar Usuario
    GET Endpoint /usuarios por ID
    Alterar "password" Payload Usuario
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Administrador para True 200
    [tags]      PUT_atualizar_adm_true   PUT
    Criar Usuario
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador "true"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Administrador False 200
    [tags]      PUT_atualizar_adm_false   PUT
    Criar Usuario
    GET Endpoint /usuarios por ID
    Alterar Dados Payload Administrador "false"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar para Email Usado 400
    [tags]      PUT_email_usado     PUT
    Criar Usuario
    Pegar Dados Usuarios Estatico "user_email_usado"
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "message" Contem "Este email já está sendo usado"

Cenário: PUT Editar para Dados Invalidos 400
    [tags]      PUT_dados_invalidos     PUT
    Criar Usuario
    Pegar Dados Usuarios Estatico "user_invalido"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email deve ser um email válido"

Cenário: PUT Editar Sem Nome 400
    [tags]      PUT_sem_nome    PUT
   Criar Usuario
    Pegar Dados Usuarios Estatico "user_sem_nome"
    PUT Endpoint /usuarios 
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: PUT Editar Sem Email 400
    [tags]      PUT_sem_email   PUT
    Criar Usuario
    Pegar Dados Usuarios Estatico "user_sem_email"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "email" Contem "email não pode ficar em branco"

Cenário: PUT Editar Sem Senha 400
    [tags]      PUT_sem_senha   PUT
    Criar Usuario
    Pegar Dados Usuarios Estatico "user_sem_senha"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "password" Contem "password não pode ficar em branco"

Cenário: POST Editar Administrador Invalido 400
    [tags]      PUT_adm_invalido    PUT
    Criar Usuario
    Pegar Dados Usuarios Estatico "user_adm_invalido"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "administrador" Contem "administrador deve ser 'true' ou 'false'"

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_usuario  DELETE
    Criar Usuario
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso"
    GET Endpoint /usuarios por ID

Cenário: DELETE Não Encontrar Usuario 200
    [tags]      DELETE_id_invalido  DELETE
    Definir ID Usuario "n2c7rgt354ygi"
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Se "message" Contem "Nenhum registro excluído"

Cenário: DELETE Usuario Com Carrinho 400
    [tags]      DELETE_usuario_com_carrinho     DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /usuarios
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido excluir usuário com carrinho cadastrado"

# PRODUTOS CENÁRIOS ######################################################################################################################################
Cenário: GET Retornar Todos os Produtos 200
    [tags]       GET_produtos   GET
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Por ID 200
    [tags]       GET_produto_id   GET
    Coletar ID Produto Aleatorio
    GET Endpoint /produtos por ID
    Validar Status Code "200"

Cenário: GET Não Encontrar Produto Por ID 400
    [tags]       GET_produto_id_invalido    GET
    Definir ID Produto "34cnrt91y234"
    GET Endpoint /produtos por ID
    Validar Status Code "400"
    Validar Se "message" Contem "Produto não encontrado"

Cenário: POST Cadastrar Produtos 201
    [tags]      POST_cadastrar_dinamico    POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Dados para Produto Dinamico Válido
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: POST Cadastrar Produto com Nome Usado 400
    [tags]      POST_produto_ja_existente   POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_repetido"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "message" Contem "Já existe produto com esse nome"

Cenário: POST Cadastrar Produto Com Token Inválido 401
    [tags]      POST_cadastrar_token_invalido    POST
    Criar Dados para Produto Dinamico Válido
    Definir Token Invalido "fhn23cn429n45c43tc"
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: POST Cadastrar Produto Sem Adm 403
    [tags]      POST_cadastrar_sem_adm  POST
    Fazer Login e Armazenar Token Adm "false"
    Criar Dados para Produto Dinamico Válido
    POST Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

Cenário: POST Cadastrar Produto Sem Nome 400
    [tags]      POST_cadastrar_sem_nome     POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_sem_nome"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Preco Zero 400
    [tags]      POST_cadastrar_preco_zero     POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_preco_zero"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um número positivo"

Cenário: POST Cadastrar Produto Com Preco Invalido 400
    [tags]      POST_cadastrar_preco_invalido     POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_preco_invalido"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um inteiro"

Cenário: POST Cadastrar Produto Com Preco Negativo 400
    [tags]      POST_cadastrar_preco_negativo     POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_preco_negativo"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um número positivo"

Cenário: POST Cadastrar Produto Sem Descricao 400
    [tags]      POST_cadastrar_sem_descricao     POST
    Fazer Login e Armazenar Token Adm "true"
    Pegar Dados Produtos Estatico "produto_sem_descricao"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "descricao" Contem "descricao não pode ficar em branco"

Cenário: POST Cadastrar Produto Com Quantidade Zero 400
    [tags]      POST_cadastrar_quantidade_zero     POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Dados para Produto Dinamico Válido
    Definir "quantidade" = "0" Payload Produto
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Produto Com Quantidade Invalida 400
    [tags]      POST_cadastrar_quantidade_invalida     POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Dados para Produto Dinamico Válido
    Definir "quantidade" = "78.9" Payload Produto
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser um inteiro"

Cenário: POST Cadastrar Produto Com Quantidade Negativa 400
    [tags]      POST_cadastrar_quantidade_negativa     POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Dados para Produto Dinamico Válido
    Definir "quantidade" = "-5" Payload Produto
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser maior ou igual a 0"

Cenário: PUT Editar Todos Dados Produto 200
    [tags]      PUT_editar_todos_dados   PUT
    Criar Produto
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Cadastrar Produto 201
    [tags]      PUT_cadastrar_produto   PUT
    Fazer Login e Armazenar Token Adm "true"
    Definir Id Produto "crfn2349cr9"
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"
    Validar Alguma Resposta Vazia "_id"

Cenário: PUT Editar Produto Token Inválido 401
    [tags]     PUT_editar_token_invalido    PUT
    Definir Token Invalido "fhn23cn429n45c43tc"
    Coletar ID Produto Aleatorio
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos 
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: PUT Editar Produto Sem Adm 403
    [tags]     PUT_editar_sem_adm    PUT
    Fazer Login e Armazenar Token Adm "false"
    Coletar ID Produto Aleatorio
    Criar Dados para Produto Dinamico Válido
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

Cenário: PUT Editar Produto com Nome Usado 400
    [tags]     PUT_nome_ja_usado    PUT
    Fazer Login e Armazenar Token Adm "true"
    Coletar ID Produto Aleatorio
    Pegar Dados Produtos Estatico "produto_repetido"
    PUT Endpoint /produtos 
    Validar Status Code "400"
    Validar Se "message" Contem "Já existe produto com esse nome"

Cenário: PUT Editar Nome 200
    [tags]     PUT_editar_nome   PUT
    Criar Produto
    Alterar "nome" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Preco 200
    [tags]     PUT_editar_preco   PUT
    Criar Produto
    Alterar "preco" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Descricao 200
    [tags]     PUT_editar_descricao   PUT
    Criar Produto
    Alterar "descricao" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Quantidade 200
    [tags]     PUT_editar_quantidade   PUT
    Criar Produto
    Alterar "quantidade" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro alterado com sucesso"

Cenário: PUT Editar Sem Nome 200
    [tags]     PUT_editar_sem_nome   PUT
    Criar Produto
    Criar Dados para Produto Dinamico Válido
    Definir "nome" = "" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Se "nome" Contem "nome não pode ficar em branco"

Cenário: PUT Editar para Preco Invalido 200
    [tags]     PUT_editar_preco_invalido   PUT
    Criar Produto
    Criar Dados para Produto Dinamico Válido
    Definir "preco" = "50.65" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Se "preco" Contem "preco deve ser um inteiro"

Cenário: PUT Editar para Sem Descricao 400
    [tags]     PUT_editar_sem_descricao   PUT
    Criar Produto
    Criar Dados para Produto Dinamico Válido
    Definir "descricao" = "" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Se "descricao" Contem "descricao não pode ficar em branco"

Cenário: PUT Editar para Quantidade Invalida 200
    [tags]     PUT_editar_quantidade_invalida   PUT
    Criar Produto
    Criar Dados para Produto Dinamico Válido
    Definir "quantidade" = "67.2" Payload Produto
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Se "quantidade" Contem "quantidade deve ser um inteiro"

Cenário: DELETE Excluir Produto 200
    [tags]      DELETE_produto        DELETE
    Criar Produto
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Registro excluído com sucesso"
    GET Endpoint /produtos por ID

Cenário: DELETE Excluir Produto Em Carrinho 400
    [tags]      DELETE_produto_em_carrinho  DELETE
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Extrair ID Produto De Carrinho
    DELETE Endpoint /produtos
    Validar Status Code "400"
    Validar Se "message" Contem "Não é permitido excluir produto que faz parte de carrinho"
    GET Endpoint /produtos por ID

Cenário: DELETE Excluir Id Invalido 200
    [tags]      DELETE_produto_id_invalido      DELETE
    Fazer Login e Armazenar Token Adm "true"
    Definir ID Produto "2cf0mu58v2c9u52cm"
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Se "message" Contem "Nenhum registro excluído"

Cenário: DELETE Excluir Token Inválido 401
    [tags]      DELETE_produto_token_invalido      DELETE
    Definir Token Invalido "20ncru2ncf59n298"
    Coletar ID Produto Aleatorio
    DELETE Endpoint /produtos
    Validar Status Code "401"
    Validar Se "message" Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Sem Adm 403
    [tags]      DELETE_produto_sem_adm      DELETE
    Fazer Login e Armazenar Token Adm "false"
    Coletar ID Produto Aleatorio
    DELETE Endpoint /produtos
    Validar Status Code "403"
    Validar Se "message" Contem "Rota exclusiva para administradores"

# CARRINHOS CENÁRIOS ######################################################################################################################################
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

Cenário: POST Cadastrar Carrinho Dinamico 200
    [tags]      POST_carrinho_dinamico   POST
    Fazer Login e Armazenar Token Adm "true"
    Criar Carrinho Dinamico Valido
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Se "message" Contem "Cadastro realizado com sucesso"

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
    Criar Carrinho Estatico "carrinho_produto_insuficiente"
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