* Test cases *
Cenário: GET Todos os Usuarios 200
    GET Endpoint /usuarios
    Validar Todos os Usuarios na Response
    Validar Status Code "200"

Cenário: GET Um Usuario Especifico 200
    GET Endpoint /usuarios com id "/GGTfwearsdw223"
    Validar o Usuario com id "/GGTfwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Nome = Fulano da Silva"

Cenário: POST Criar Novo Usuario 201    
    Criar Usuario Dinâmico
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso

Cenário: PUT Editar Usario Existente 200
    PUT Endpoint /usuarios com id "/GGTfwearsdw223" usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Excluir Usuario Existente 200
    DELETE Endpoint /usuarios com id "/GGTfwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"