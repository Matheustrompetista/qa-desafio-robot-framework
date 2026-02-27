*** Settings ***
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/checkout_page.robot
Test Teardown    Close Browser

*** Test Cases ***
Cenario: Realizar checkout de um produto com sucesso
    [Documentation]    Testa o fluxo completo de compra (checkout) no SauceDemo
    Dado que eu esteja logado no sistema SauceDemo
    Quando eu adicionar uma mochila ao carrinho
    E prosseguir para o checkout preenchendo meus dados
    E finalizar a compra
    Entao devo ver a mensagem de sucesso do pedido

*** Keywords ***
Dado que eu esteja logado no sistema SauceDemo
    Acessar a pagina de login
    Preencher credenciais validas    standard_user    secret_sauce
    Clicar em login

Quando eu adicionar uma mochila ao carrinho
    Adicionar produto ao carrinho

E prosseguir para o checkout preenchendo meus dados
    Ir para o checkout
    Preencher dados de entrega    QA    Pleno    12345-678

E finalizar a compra
    Finalizar pedido

Entao devo ver a mensagem de sucesso do pedido
    Validar mensagem de sucesso