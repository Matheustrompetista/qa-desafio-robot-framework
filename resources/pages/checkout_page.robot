*** Settings ***
Library     SeleniumLibrary
Resource    ../elements/checkout_elements.robot
Resource    login_page.robot

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



# ==========================================


Dado que realizo o login com sucesso no sistema
    Acessar a pagina de login
    Preencher credenciais validas    standard_user    secret_sauce
    Clicar em login
    Validar login com sucesso

E adiciono um produto ao carrinho
    Adicionar produto ao carrinho

E acesso a tela de checkout
    Ir para o checkout

Quando preencho os dados de entrega com "${nome}", "${sobrenome}" e "${cep}"
    Preencher dados de entrega    ${nome}    ${sobrenome}    ${cep}

E finalizo o pedido
    Finalizar pedido

Entao a compra deve ser finalizada com sucesso
    Validar mensagem de sucesso
    Capture Page Screenshot    comprovante_compra_sucesso.png

Entao o sistema deve exibir a mensagem de erro no checkout "${mensagem_esperada}"
    Wait Until Element Is Visible    css=[data-test="error"]    timeout=5s
    Element Should Contain           css=[data-test="error"]    ${mensagem_esperada}
    Capture Page Screenshot          evidencia_erro_checkout.png