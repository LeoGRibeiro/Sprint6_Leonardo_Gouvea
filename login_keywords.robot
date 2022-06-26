 * Settings *
 Documentation      Keywords relacionados a Login

* Variables *
${email_para_login}         fulano@qa.com
${password_para_login}      teste

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary       email=${email_para_login}        password=${password_para_login}  
    ${response}             POST on Session         serverest                  /login          data=&{payload}
    Log To Console          Response: ${response.content}  # Para printar a resposta no console
    Set Global Variable     ${response}

Validar ter Logado
    Should be Equal         ${response.json()["message"]}   Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Log To Console          Token Salvo: {token_auth}
    Set Global Variable     ${token_auth}
    