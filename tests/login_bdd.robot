*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Test Teardown    Close Browser

*** Test Cases ***
Cenario: Realizar login com sucesso
    [Documentation]    Caminho feliz de login
    Dado que acesso a pagina de login do SauceDemo
    Quando preencho as credenciais com usuario "standard_user" e senha "secret_sauce"
    E clico em login
    Entao o login deve ser realizado com sucesso

Cenario: Tentar realizar login com senha invalida
    [Documentation]    Cenário negativo: Valida bloqueio com senha incorreta
    Dado que acesso a pagina de login do SauceDemo
    Quando preencho as credenciais com usuario "standard_user" e senha "senha_errada_123"
    E clico em login
    Entao o sistema deve exibir a mensagem de erro "Epic sadface: Username and password do not match"