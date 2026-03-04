*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/checkout_page.robot

Test Teardown    Close Browser

*** Test Cases ***
Cenario: Realizar compra de produto com sucesso
    [Documentation]    Caminho feliz do checkout completo
    Dado que realizo o login com sucesso no sistema
    E adiciono um produto ao carrinho
    E acesso a tela de checkout
    Quando preencho os dados de entrega com "QA", "Pleno" e "12345-678"
    E finalizo o pedido
    Entao a compra deve ser finalizada com sucesso

Cenario: Tentar avancar no checkout sem preencher o nome
    [Documentation]    Cenário negativo: Valida obrigatoriedade dos campos de entrega
    Dado que realizo o login com sucesso no sistema
    E adiciono um produto ao carrinho
    E acesso a tela de checkout
    Quando preencho os dados de entrega com "", "Pleno" e "12345-678"
    Entao o sistema deve exibir a mensagem de erro no checkout "Error: First Name is required"