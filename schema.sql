DROP DATABASE IF EXISTS normalizacao_funcionarios;
CREATE DATABASE normalizacao_funcionarios
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE normalizacao_funcionarios;

CREATE TABLE pais (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nome_pais VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nome_provincia VARCHAR(80) NOT NULL,
    id_pais INT NOT NULL,
    UNIQUE (nome_provincia, id_pais),
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE cidade (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(80) NOT NULL,
    id_provincia INT NOT NULL,
    UNIQUE (nome_cidade, id_provincia),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    avenida_rua VARCHAR(200) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    id_cidade INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

CREATE TABLE funcao (
    id_funcao INT AUTO_INCREMENT PRIMARY KEY,
    codigo_funcao VARCHAR(10) NOT NULL UNIQUE,
    nome_funcao VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE cargo (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cargo VARCHAR(10) NOT NULL UNIQUE,
    nome_cargo VARCHAR(100) NOT NULL UNIQUE,
    id_funcao INT NOT NULL,
    FOREIGN KEY (id_funcao) REFERENCES funcao(id_funcao)
);

CREATE TABLE posto_trabalho (
    id_posto INT AUTO_INCREMENT PRIMARY KEY,
    nome_posto VARCHAR(120) NOT NULL UNIQUE,
    id_cidade INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    nuit VARCHAR(20) NOT NULL UNIQUE,
    bi VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    id_endereco INT NOT NULL,
    id_cargo INT NOT NULL,
    id_posto INT NOT NULL,
    data_admissao DATE NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
    FOREIGN KEY (id_posto) REFERENCES posto_trabalho(id_posto)
);

CREATE TABLE telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    UNIQUE (id_funcionario, numero),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE filho (
    id_filho INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    nome_filho VARCHAR(150) NOT NULL,
    UNIQUE (id_funcionario, nome_filho),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
        ON DELETE CASCADE
);

CREATE INDEX idx_provincia_pais ON provincia(id_pais);
CREATE INDEX idx_cidade_provincia ON cidade(id_provincia);
CREATE INDEX idx_endereco_cidade ON endereco(id_cidade);
CREATE INDEX idx_cargo_funcao ON cargo(id_funcao);
CREATE INDEX idx_posto_cidade ON posto_trabalho(id_cidade);
CREATE INDEX idx_funcionario_endereco ON funcionario(id_endereco);
CREATE INDEX idx_funcionario_cargo ON funcionario(id_cargo);
CREATE INDEX idx_funcionario_posto ON funcionario(id_posto);
CREATE INDEX idx_telefone_funcionario ON telefone(id_funcionario);
CREATE INDEX idx_filho_funcionario ON filho(id_funcionario);
