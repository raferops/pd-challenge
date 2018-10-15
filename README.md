#Passei Direto - DevOps Challenge
---

Provisionar ambiente para comportar uma API em node.js + MySQL usando docker.


## Pre-requisitos para execução

- Docker / Docker-compose


## Utilização

- Clonar o repositório `https://github.com/raferops/pd-challenge` via git, http ou ssh
- Acessar o diretório onde estão os scripts de controle do projeto `cd pd-challenge/scripts/`
- Executar um dos scripts de comando conforme desejado

## Scripts


###  ./start.sh

Inicializa o ambiente utilizando o docker-compose para criar os containers e volumes necessários. 
Aguarda a API responder o HTTP REQUEST `GET` com `status code 200` e então testa o ambiente com os metodos `POST` e `DELETE`.

### ./stop

Para o ambiente sem a perda de informações do banco de dados.

### ./test

Testa os metodos `GET`,`POST` e `DELETE` da API e retorna o status.

### ./resetenv

Destroi todo o ambiente, removendo containers, volumes e WORKDIR da API.


## BONUS CI

É possível utilizar o arquivo `.travis.yml`, localizado no diretório raiz do projeto, para automatizar os testes do ambiente integrando o projeto do Github ao Travis-CI.
