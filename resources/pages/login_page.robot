*** Settings ***
Library     SeleniumLibrary
Resource    ../elements/login_elements.robot

*** Keywords ***
Acessar a pagina de login
    Open Browser    ${URL_SAUCE}    chrome    options=add_argument("--incognito")
    Maximize Browser Window

Preencher credenciais validas
    [Arguments]    ${usuario}    ${senha}
    Input Text     ${INPUT_USERNAME}    ${usuario}
    Input Text     ${INPUT_PASSWORD}    ${senha}

Clicar em login
    Click Button   ${BTN_LOGIN}

Validar login com sucesso
    Wait Until Element Is Visible    ${TITLE_PRODUCTS}    timeout=5s
    Element Should Contain           ${TITLE_PRODUCTS}    Products