* Settings *
Documentation           Keywords e Variaveis para Geração de Massas de Dados
Library                 FakerLibrary

* Keywords *
Criar Dados para Usuario Válido
    ${nome}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    ${senha}                FakerLibrary.Password     length=5          special_chars=True     digits=True    upper_case=True    lower_case=True
    ${payload}              Create Dictionary         nome=${nome}      email=${email}     password=${senha}    administrador=true
    Log to Console          ${payload}
    Set Global Variable     ${payload}

Criar Dados para Produto Dinamico Válido
    ${nome}                 FakerLibrary.Text            max_nb_chars=15
    ${preco}                FakerLibrary.Random Int      min=20      max=1500
    ${descricao}            FakerLibrary.Text            max_nb_chars=60   
    ${quantidade}           FakerLibrary.Random Int      min=2       max=500
    ${payload}              Create Dictionary         nome=${nome}      preco=${preco}     descricao=${descricao}    quantidade=${quantidade}
    Set Global Variable     ${payload}