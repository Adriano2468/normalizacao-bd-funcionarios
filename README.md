Normalização de Base de Dados — Sistema de Gestão de Funcionários


  Universidade Licungo

  Faculdade de Ciências e Tecnologias

  Licenciatura em Informática




Informações Académicas

Campo	Informação
Estudante	Adriano Jaime Quimisse Júnior
Universidade Licungo
Faculdade	Faculdade de Ciências e Tecnologias
Curso	Licenciatura em Informática
Trabalho	Trabalho II
Tema	Normalização de Base de Dados — Sistema de Gestão de Funcionários
SGBD	MySQL


Sobre o projeto

Este projeto consiste na normalização de uma base de dados de funcionários, partindo de uma estrutura inicial que concentra diferentes tipos de informação numa única tabela.


A proposta é transformar essa estrutura num modelo relacional organizado, consistente e escalável, aplicando progressivamente:


0FN → 1FN → 2FN → 3FN → 4FN


Durante o processo são analisados grupos repetitivos, dependências funcionais, dependências transitivas e dependências multivaloradas.


O resultado final é um conjunto de relações independentes, ligadas através de chaves primárias e estrangeiras, permitindo consultar os dados de forma segura através de SQL e JOIN.



Objetivos do projeto

Objetivo principal

Desenvolver um modelo de base de dados para gestão de funcionários normalizado até à Quarta Forma Normal (4FN).


Objetivos específicos


Analisar a estrutura inicial dos dados;

Identificar problemas de redundância;

Detetar grupos repetitivos;

Identificar dependências funcionais;

Eliminar dependências parciais;

Eliminar dependências transitivas;

Eliminar dependências multivaloradas independentes;

Definir entidades e relacionamentos;

Estabelecer as cardinalidades;

Construir o Modelo Entidade-Relacionamento;

Implementar o modelo em MySQL;

Demonstrar consultas utilizando JOIN.



Problema inicial

A tabela não normalizada mistura no mesmo registo informações relacionadas com:



Dados pessoais;

Documentação do funcionário;

Endereço;

País, província e cidade;

Função;

Cargo;

Posto de trabalho;

Filhos;

Contactos telefónicos.


Essa organização pode provocar:



Redundância de dados
Anomalias de inserção
Anomalias de atualização
Anomalias de remoção
Grupos repetitivos
Dependências transitivas
Dependências multivaloradas




Processo de normalização

Primeira Forma Normal — 1FN

O primeiro passo consiste em garantir que os atributos possuam valores atómicos e eliminar grupos repetitivos.


Exemplos identificados:



Filho 1

Filho 2

Filho 3

Celular 1

Celular 2

Celular 3


Essas informações deixam de ser armazenadas como colunas repetidas e passam para relações próprias.


Resultado:


FUNCIONARIO
     │
     ├── TELEFONE
     │
     └── FILHO


Segunda Forma Normal — 2FN

A relação FUNCIONARIO utiliza uma chave primária simples.


Consequentemente, não existem dependências parciais em relação a uma chave composta.


Os atributos de cada entidade devem depender integralmente da respetiva chave primária.



Terceira Forma Normal — 3FN

Nesta etapa são eliminadas dependências transitivas.


Informações como país, província, cidade, função, cargo e posto de trabalho são retiradas da relação principal e organizadas em entidades próprias.


Exemplo:


PAIS
  ↓
PROVINCIA
  ↓
CIDADE
  ↓
ENDERECO

E:


FUNCAO
  ↓
CARGO
  ↓
FUNCIONARIO


Quarta Forma Normal — 4FN

A 4FN trata principalmente as dependências multivaloradas independentes.


Um funcionário pode possuir vários:



Telefones;

Filhos.


Esses dois conjuntos são independentes entre si.


Por isso, são representados separadamente:


FUNCIONARIO 1 ───── N TELEFONE

FUNCIONARIO 1 ───── N FILHO

Isso evita combinações e repetições desnecessárias.



Modelo de dados final

O banco de dados é composto por 10 entidades:


#	Entidade	Responsabilidade
1	PAIS	Registar países
2	PROVINCIA	Registar províncias
3	CIDADE	Registar cidades
4	ENDERECO	Armazenar endereços
5	FUNCAO	Definir funções
6	CARGO	Registar cargos
7	POSTO_TRABALHO	Registar locais/postos de trabalho
8	FUNCIONARIO	Dados principais dos funcionários
9	TELEFONE	Contactos telefónicos
10	FILHO	Filhos associados aos funcionários


Relacionamentos

PAIS
 │
 └── 1:N ── PROVINCIA
                │
                └── 1:N ── CIDADE
                               │
                     ┌─────────┴─────────┐
                     │                   │
                    1:N                 1:N
                     │                   │
                 ENDERECO          POSTO_TRABALHO
                     │                   │
                    1:N                 1:N
                     │                   │
                     └──── FUNCIONARIO ──┘
                              │      │
                             1:N    1:N
                              │      │
                         TELEFONE   FILHO


FUNCAO
  │
  └── 1:N ── CARGO
                │
                └── 1:N ── FUNCIONARIO


Cardinalidades

Relacionamento	Cardinalidade
PAIS → PROVINCIA	1:N
PROVINCIA → CIDADE	1:N
CIDADE → ENDERECO	1:N
CIDADE → POSTO_TRABALHO	1:N
ENDERECO → FUNCIONARIO	1:N
FUNCAO → CARGO	1:N
CARGO → FUNCIONARIO	1:N
POSTO_TRABALHO → FUNCIONARIO	1:N
FUNCIONARIO → TELEFONE	1:N
FUNCIONARIO → FILHO	1:N


Modelo Entidade-Relacionamento

O diagrama completo encontra-se na pasta:


diagramas/
├── modelo-er.md
├── modelo-er.dot
└── modelo-er.png

O diagrama apresenta as entidades, atributos, chaves primárias, chaves estrangeiras e cardinalidades do modelo normalizado.



Tecnologias e ferramentas

Base de dados


MySQL


Modelação


MySQL Workbench

diagrams.net (draw.io)

Mermaid

Graphviz


Desenvolvimento e documentação


SQL

Markdown

Git

GitHub



Organização do repositório

normalizacao-bd-funcionarios/
│
├── README.md
│
├── documentos/
│   └── analise-normalizacao.md
│
├── diagramas/
│   ├── modelo-er.md
│   ├── modelo-er.dot
│   └── modelo-er.png
│
└── sql/
    ├── schema.sql
    └── queries.sql


Benefícios do modelo normalizado

A estrutura final proporciona:



Menor redundância;

Maior consistência dos dados;

Melhor organização;

Facilidade de manutenção;

Integridade referencial;

Maior facilidade para realizar consultas;

Separação adequada das responsabilidades das entidades;

Redução de anomalias de inserção, atualização e remoção;

Estrutura preparada para crescimento futuro.



Documentação

A análise detalhada do processo de normalização encontra-se em:


documentos/analise-normalizacao.md

Nesse documento são apresentadas as decisões tomadas em cada forma normal, desde a análise inicial até à estrutura final em 4FN.



Resultado final

O projeto demonstra, de forma prática, como uma tabela de funcionários inicialmente não normalizada pode ser transformada num modelo relacional estruturado até à 4FN.


A solução separa adequadamente dados geográficos, profissionais e informações multivaloradas, mantendo os relacionamentos através de chaves estrangeiras.



Autor

Adriano Jaime Quimisse Júnior


Licenciatura em Informática
Universidade Licungo
Faculdade de Ciências e Tecnologias




Trabalho II — Normalização de Base de Dados


Sistema de Gestão de Funcionários


