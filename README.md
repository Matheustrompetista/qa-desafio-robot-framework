# Desafio QA - Testes de Interface com Robot Framework

Este repositório contém a automação dos fluxos de Login e Checkout do site SauceDemo, utilizando Robot Framework e o padrão Page Objects.

## Pré-requisitos
- Python 3.x instalado e adicionado ao PATH.
- Navegador Google Chrome.

## Como instalar as dependências
Execute o comando abaixo na raiz do projeto:
`pip install robotframework robotframework-seleniumlibrary`

## Como executar os testes
Para rodar todos os testes e gerar os relatórios na pasta `results`, execute:
`python -m robot -d results tests/`

## Estrutura do Projeto
- `tests/`: Contém os cenários de teste escritos em formato BDD.
- `resources/pages/`: Contém as ações de cada página (Page Objects).
- `resources/elements/`: Contém os mapeadores (locators) dos elementos web.