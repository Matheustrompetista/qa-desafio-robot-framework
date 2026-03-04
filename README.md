# 🤖 Desafio QA - Automação Web com Robot Framework

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Este repositório contém a automação de testes de interface (UI) para os fluxos críticos do [SauceDemo](https://www.saucedemo.com/), construída com **Robot Framework** e **SeleniumLibrary**.

A arquitetura foi desenhada focando em manutenibilidade, escalabilidade e boas práticas de engenharia de software.

## 🎯 Escopo e Cobertura de Testes

O projeto valida tanto o comportamento esperado quanto o tratamento de erros do sistema (Happy Path e Unhappy Path), utilizando a escrita orientada a comportamento (**BDD**):

- **Login:**
    - ✅ Autenticação com credenciais válidas.
    - ❌ *[Cenário Negativo]* Bloqueio de acesso e validação de mensagem de erro com senha incorreta.
- **Checkout:**
    - ✅ Fluxo completo de compra (adicionar ao carrinho, preencher dados e finalizar).
    - ❌ *[Cenário Negativo]* Validação de obrigatoriedade de campos (ex: tentar avançar sem preencher o nome).

---

## 🏗️ Arquitetura do Projeto

O framework foi estruturado utilizando o padrão **Page Object Model (POM)**, garantindo a Separação de Responsabilidades (Separation of Concerns):

```text
📦 ui-robot-framework
 ┣ 📂 resources/
 ┃ ┣ 📂 elements/   # Dicionário de seletores web (IDs, CSS, XPaths)
 ┃ ┗ 📂 pages/      # Ações e interações do usuário encapsuladas (Keywords)
 ┣ 📂 tests/        # Cenários de teste escritos em BDD (Dado, Quando, Então)
 ┣ 📂 results/      # Relatórios HTML e Screenshots gerados automaticamente
 ┗ 📜 .gitignore    # Higiene do repositório