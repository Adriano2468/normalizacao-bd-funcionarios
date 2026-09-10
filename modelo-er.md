erDiagram
    PAIS ||--o{ PROVINCIA : "possui"
    PROVINCIA ||--o{ CIDADE : "possui"
    CIDADE ||--o{ ENDERECO : "possui"
    CIDADE ||--o{ POSTO_TRABALHO : "possui"
    ENDERECO ||--o{ FUNCIONARIO : "residencia"
    FUNCAO ||--o{ CARGO : "possui"
    CARGO ||--o{ FUNCIONARIO : "ocupa"
    POSTO_TRABALHO ||--o{ FUNCIONARIO : "aloca"
    FUNCIONARIO ||--o{ TELEFONE : "possui"
    FUNCIONARIO ||--o{ FILHO : "tem"

    PAIS {
        INT id_pais PK
        VARCHAR nome_pais UK
    }
    PROVINCIA {
        INT id_provincia PK
        VARCHAR nome_provincia
        INT id_pais FK
    }
    CIDADE {
        INT id_cidade PK
        VARCHAR nome_cidade
        INT id_provincia FK
    }
    ENDERECO {
        INT id_endereco PK
        VARCHAR avenida_rua
        VARCHAR bairro
        INT id_cidade FK
    }
    FUNCAO {
        INT id_funcao PK
        VARCHAR codigo_funcao UK
        VARCHAR nome_funcao UK
    }
    CARGO {
        INT id_cargo PK
        VARCHAR codigo_cargo UK
        VARCHAR nome_cargo UK
        INT id_funcao FK
    }
    POSTO_TRABALHO {
        INT id_posto PK
        VARCHAR nome_posto UK
        INT id_cidade FK
    }
    FUNCIONARIO {
        INT id_funcionario PK
        VARCHAR nome
        DATE data_nascimento
        VARCHAR nuit UK
        VARCHAR bi UK
        VARCHAR email UK
        INT id_endereco FK
        INT id_cargo FK
        INT id_posto FK
        DATE data_admissao
    }
    TELEFONE {
        INT id_telefone PK
        INT id_funcionario FK
        VARCHAR numero
    }
    FILHO {
        INT id_filho PK
        INT id_funcionario FK
        VARCHAR nome_filho
    }
