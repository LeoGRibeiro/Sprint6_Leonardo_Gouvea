* Settings *
Documentation           Arquivo de testes de arquivos python
Library                 library_teste.py

* Test Cases *
Retornar Usuários com Carrinho
    [tags]              usuarios_com_carrinho      
    ${users}            Usuarios Com Carrinho      ${637}  # Inserir a quantidade de usuários deseja retornar
    Log To Console      Lista de usuários com carrinho: ${users}

Receita Esperada Do Estoque
    [tags]              receita_esperada
    ${receita}          Receita Esperada
    Log To Console      Receita Esperada: R$${receita}

Reposicao de Estoque
    [tags]              reposicao_estoque
    ${produtos}         Reposicao Estoque           ${2000}  # Inserir quantidade, retornará produtos com quantidade abaixo da inserida, e a quantidade para chegar na desejada 
    Log To Console      Produtos que precisam de reposição: ${produtos}                  

Fazer Reposicao Estoque
    [tags]              fazer_reposicao
    ${prod}             Fazer_Reposicao_Estoque     ${1705}
    Log to Console      ${prod}

Cadastrar Produtos
    [tags]              cadastrar_produtos 
    ${prods}            Cadastrar Produtos          ${2}    # Inserir a quantidade de produtos que deseja criar
    Log To Console      ${prods}