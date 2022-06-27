* Settings *
Documentation           Keywords e variáveis gerais
Library                 OperatingSystem

* Keywords *
Criar Sessao
    Create Session      serverest   http://localhost:3000   

Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Quantidade "${valor}"
    Should Be Equal     ${response.json()["quantidade"]}    ${valor}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}       ${palavra}

Importar Json Estatico  
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/${nome_arquivo}  #EXECDIR para reconhecer a pasta atual dos arquivos
    ${data}         Evaluate        json.loads('''${arquivo}''')        json
    [return]        ${data}

