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

Validar Alguma Resposta Vazia "${espaco}"
    Should Not Be Empty     ${response.json()["${espaco}"]}
    
Importar Json Estatico  
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/support/fixtures/statics/${nome_arquivo}  #EXECDIR para reconhecer a pasta atual dos arquivos
    ${data}         Evaluate        json.loads('''${arquivo}''')        json
    [return]        ${data}

POST Endpoint /login "${user}"
    ${json}                 Importar Json Estatico  json_login.json
    ${payload}              Set Variable            ${json["${user}"]}
    ${response}             POST on Session         serverest                  /login          data=&{payload}        expected_status=any
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

Fazer Login e Armazenar Token
    POST Endpoint /login "user_valido"
    Validar ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Set Global Variable     ${token_auth}

Fazer Login Sem Adm e Armazenar Token
    POST Endpoint /login "user_sem_adm"
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Set Global Variable     ${token_auth}

Definir Token Invalido "${token_auth}"
    Set Global Variable     ${token_auth}
    Log to Console        Token Inválido: ${token_auth}