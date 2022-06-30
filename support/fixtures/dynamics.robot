* Settings *
Documentation           Keywords e Variaveis para Geração de Massas de Dados
Library                 FakerLibrary

* Keywords *
Criar Dados para Usuario Válido
    ${nome}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    ${payload}              Create Dictionary         nome=${nome}      email=${email}     password=teste     administrador=true
    Log to Console          ${payload}
    Set Global Variable     ${payload}