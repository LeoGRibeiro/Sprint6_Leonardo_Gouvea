* Settings *
Documentation           Arquivo de testes de arquivos python
Library                 library_teste.py

* Test Cases *
Teste Library 1
    ${json}             Get Endpoint Usuarios     ${1}
    Log To Console      ${json}

Teste Library 2
    ${users}             Pegar Quantidade usuarios
    Log To Console      ${users}