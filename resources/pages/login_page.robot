*** Settings ***
Library     SeleniumLibrary
Resource    ../elements/login_elements.robot

*** Keywords ***

# ==========================================
Acessar a pagina de login
    Open Browser    ${URL_SAUCE}    headlesschrome    options=add_argument("--incognito")
    Set Window Size    1920    1080

Preencher credenciais validas
    [Arguments]    ${usuario}    ${senha}
    Input Text     ${INPUT_USERNAME}    ${usuario}
    Input Text     ${INPUT_PASSWORD}    ${senha}

Clicar em login
    Click Button   ${BTN_LOGIN}

Validar login com sucesso
    Wait Until Element Is Visible    ${TITLE_PRODUCTS}    timeout=5s
    Element Should Contain           ${TITLE_PRODUCTS}    Products


# ==========================================
Dado que acesso a pagina de login do SauceDemo
    Acessar a pagina de login

Quando preencho as credenciais com usuario "${usuario}" e senha "${senha}"
    Preencher credenciais validas    ${usuario}    ${senha}

E clico em login
    Clicar em login

Entao o login deve ser realizado com sucesso
    Validar login com sucesso

Entao o sistema deve exibir a mensagem de erro "${mensagem_esperada}"
    Wait Until Element Is Visible    css=[data-test="error"]    timeout=5s
    Element Should Contain           css=[data-test="error"]    ${mensagem_esperada}
    Capture Page Screenshot          evidencia_erro_login.png