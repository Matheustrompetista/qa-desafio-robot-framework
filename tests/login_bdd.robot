*** Settings ***
Resource    ../resources/pages/login_page.robot
Test Teardown    Close Browser

*** Test Cases ***
Cenario: Login com sucesso no SauceDemo
    [Documentation]    Testa o fluxo de login com um usuario valido
    Dado que eu acesse a pagina de login do SauceDemo
    Quando eu preencher as credenciais de acesso validas
    E clicar no botao de login
    Entao devo ser redirecionado para a pagina de produtos

*** Keywords ***
Dado que eu acesse a pagina de login do SauceDemo
    Acessar a pagina de login

Quando eu preencher as credenciais de acesso validas
    Preencher credenciais validas    standard_user    secret_sauce

E clicar no botao de login
    Clicar em login

Entao devo ser redirecionado para a pagina de produtos
    Validar login com sucesso