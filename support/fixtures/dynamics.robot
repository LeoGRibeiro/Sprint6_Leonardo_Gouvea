* Settings *
Documentation           Keywords e Variaveis para Geração de Massas de Dados
Library                 FakerLibrary

* Keywords *
Criar Dados para Usuario Válido
    ${nome}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    ${senha}                FakerLibrary.Password     length=5          special_chars=False     digits=True    upper_case=True    lower_case=True
    Set Global Variable     ${senha}
    Set Global Variable     ${email}
    ${payload}              Create Dictionary         nome=${nome}      email=${email}     password=${senha}    administrador=true
    Log to Console          ${payload}
    Set Global Variable     ${payload}
    
    
Criar Dados para Produto Dinamico Válido
    ${nome}                 FakerLibrary.Text            max_nb_chars=25
    ${preco}                FakerLibrary.Random Int      min=20      max=1500
    ${descricao}            FakerLibrary.Text            max_nb_chars=60   
    ${quantidade}           FakerLibrary.Random Int      min=2000       max=5000
    ${payload}              Create Dictionary         nome=${nome}      preco=${preco}     descricao=${descricao}    quantidade=${quantidade}
    Set Global Variable     ${payload}

Criar Carrinho Dinamico Valido
    ${quant_produtos}=             Evaluate            random.sample(range(1, 5),1)    random
    @{lista}                Create List
    FOR         ${C}        IN RANGE            ${quant_produtos[0]}
    ${response}             GET on Session      serverest   /produtos
    ${numbers}=             Evaluate            random.sample(range(0, ${response.json()["quantidade"]}),1)    random
    ${id}                   Set Variable        ${response.json()["produtos"][${numbers}[0]]["_id"]}
    ${quantidade}           FakerLibrary.Random Int      min=2       max=4    
    ${pedido}               Create Dictionary         idProduto=${id}       quantidade=${quantidade}  
    Append to list          ${lista}                    ${pedido}
    END
    ${payload}              Create Dictionary       produtos=${lista}
    Set Global Variable     ${payload}