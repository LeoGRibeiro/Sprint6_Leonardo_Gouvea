* Settings *
Documentation           Keywords e variáveis gerais
Library                 OperatingSystem
Library                 RequestsLibrary

Resource                ../variables/serverest_variaveis.robot

* Keywords *
Criar Sessao
    Create Session      serverest       ${BASE_URL} 

Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Quantidade "${valor}"
    Should Be Equal     ${response.json()["quantidade"]}    ${valor}

Validar Se "${chave}" Contem "${texto}"  # Função aprendida com Cléo                            
    Should Contain      ${response.json()["${chave}"]}       ${texto}

Validar ter Logado
    Should be Equal         ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

Validar Resposta Vazia "${espaco}"
    Should Not Be Empty     ${response.json()["${espaco}"]}
    
Importar Json Estatico  
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/support/fixtures/statics/${nome_arquivo}  #EXECDIR para reconhecer a pasta atual dos arquivos
    ${data}         Evaluate        json.loads('''${arquivo}''')        json
    [return]        ${data}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Log To Console          Token Salvo: {token_auth}
    Set Global Variable     ${token_auth}