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

    