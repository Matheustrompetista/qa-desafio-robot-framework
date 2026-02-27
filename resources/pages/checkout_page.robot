*** Settings ***
Library     SeleniumLibrary
Resource    ../elements/checkout_elements.robot

*** Keywords ***
Adicionar produto ao carrinho
    Wait Until Element Is Visible    ${BTN_ADD_CART}    timeout=5s
    Click Button                     ${BTN_ADD_CART}
    Click Element                    ${BTN_CART}

Ir para o checkout
    Wait Until Element Is Visible    ${BTN_CHECKOUT}    timeout=5s
    Click Button                     ${BTN_CHECKOUT}

Preencher dados de entrega
    [Arguments]    ${nome}    ${sobrenome}    ${cep}
    Wait Until Element Is Visible    ${INPUT_FIRSTNAME}    timeout=5s
    Input Text                       ${INPUT_FIRSTNAME}    ${nome}
    Input Text                       ${INPUT_LASTNAME}     ${sobrenome}
    Input Text                       ${INPUT_ZIP}          ${cep}
    Scroll Element Into View         ${BTN_CONTINUE}
    Wait Until Element Is Visible    ${BTN_CONTINUE}       timeout=5s
    Click Element                    ${BTN_CONTINUE}
Finalizar pedido
    Wait Until Page Contains Element    ${BTN_FINISH}    timeout=10s
    Scroll Element Into View            ${BTN_FINISH}
    Wait Until Element Is Visible       ${BTN_FINISH}    timeout=10s
    Click Button                        ${BTN_FINISH}

Validar mensagem de sucesso
    Wait Until Element Is Visible    ${MSG_SUCCESS}    timeout=5s
    Element Should Contain           ${MSG_SUCCESS}    Thank you for your order!