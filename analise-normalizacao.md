# Análise da Normalização — Sistema de Gestão de Funcionários

**Estudante:** Adriano Jaime Quimisse Júnior  
**Universidade:** Universidade Licungo  
**Curso:** Licenciatura em Informática

## 1. Análise da tabela original

A tabela inicial concentra num único registo informações de diferentes assuntos: dados pessoais, localização, dados profissionais, filhos e contactos.

Os principais problemas são os grupos repetitivos de filhos e telefones, além da repetição de dados de país, província, cidade, cargo, função e posto de trabalho.

Essas repetições podem provocar anomalias de inserção, atualização e remoção.

## 2. 1FN — Primeira Forma Normal

A 1FN exige que os atributos sejam atómicos e que não existam grupos repetitivos.

Na tabela original, exemplos de grupos repetitivos são:

- Filho 1, Filho 2, Filho 3;
- Celular 1, Celular 2, Celular 3.

A solução é retirar esses grupos da tabela FUNCIONARIO e criar as relações TELEFONE e FILHO.

Resultado principal:

**FUNCIONARIO → TELEFONE**  
**FUNCIONARIO → FILHO**

## 3. 2FN — Segunda Forma Normal

A tabela FUNCIONARIO utiliza uma chave primária simples: `id_funcionario`.

Portanto, não existem dependências parciais dentro de FUNCIONARIO, pois uma dependência parcial só ocorre quando existe uma chave primária composta.

Mesmo assim, a separação das entidades garante que os atributos de cada assunto dependam integralmente da chave da sua própria relação.

Exemplos:

- `nome_funcao` depende de `id_funcao`;
- `nome_cargo` depende de `id_cargo`;
- `nome_pais` depende de `id_pais`;
- `nome_provincia` depende de `id_provincia`.

## 4. 3FN — Terceira Forma Normal

A 3FN elimina dependências transitivas.

Na estrutura original, informações como país, província, cidade, cargo e função eram repetidas juntamente com os funcionários.

A solução é criar entidades próprias:

- PAIS;
- PROVINCIA;
- CIDADE;
- ENDERECO;
- FUNCAO;
- CARGO;
- POSTO_TRABALHO.

As relações passam a utilizar chaves estrangeiras.

Exemplo:

`PROVINCIA.id_pais → PAIS.id_pais`

`CIDADE.id_provincia → PROVINCIA.id_provincia`

`CARGO.id_funcao → FUNCAO.id_funcao`

## 5. 4FN — Quarta Forma Normal

A 4FN trata dependências multivaloradas independentes.

Um funcionário pode ter:

- vários telefones;
- vários filhos.

A quantidade de telefones não depende da quantidade de filhos. São dois conjuntos independentes.

Se ambos fossem mantidos numa única tabela, seria necessário combinar cada telefone com cada filho, criando redundância.

Por isso:

`FUNCIONARIO 1:N TELEFONE`

`FUNCIONARIO 1:N FILHO`

A separação elimina o problema de combinação artificial entre esses conjuntos.

## 6. Modelo final

O modelo final contém dez entidades:

- PAIS
- PROVINCIA
- CIDADE
- ENDERECO
- FUNCAO
- CARGO
- POSTO_TRABALHO
- FUNCIONARIO
- TELEFONE
- FILHO

## 7. Cardinalidades

- PAIS 1:N PROVINCIA
- PROVINCIA 1:N CIDADE
- CIDADE 1:N ENDERECO
- CIDADE 1:N POSTO_TRABALHO
- ENDERECO 1:N FUNCIONARIO
- FUNCAO 1:N CARGO
- CARGO 1:N FUNCIONARIO
- POSTO_TRABALHO 1:N FUNCIONARIO
- FUNCIONARIO 1:N TELEFONE
- FUNCIONARIO 1:N FILHO

## 8. Integridade e regras

Foram utilizadas chaves primárias para identificar cada registo e chaves estrangeiras para manter a integridade referencial.

Também foram definidos campos UNIQUE para evitar duplicação de NUIT, BI, email e códigos de entidades.

## 9. Conclusão

A estrutura final apresenta uma separação clara dos diferentes assuntos da base de dados. A normalização até 4FN reduz a redundância e facilita a manutenção dos dados, enquanto o MER representa visualmente as entidades, atributos, chaves e cardinalidades.
