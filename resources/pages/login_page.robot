*** Settings ***
Library     SeleniumLibrary
Resource    ../elements/login_elements.robot

*** Keywords ***
Acessar a pagina de login
    # Trocamos de 'chrome' para 'headlesschrome'
    Open Browser    ${URL_SAUCE}    headlesschrome    options=add_argument("--incognito")
    # Forçamos a resolução em vez de maximizar
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