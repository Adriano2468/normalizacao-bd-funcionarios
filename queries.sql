USE normalizacao_funcionarios;

-- 1. Funcionários com cargo e função
SELECT f.nome,
       c.codigo_cargo,
       c.nome_cargo,
       fu.codigo_funcao,
       fu.nome_funcao
FROM funcionario f
JOIN cargo c ON f.id_cargo = c.id_cargo
JOIN funcao fu ON c.id_funcao = fu.id_funcao
ORDER BY f.nome;

-- 2. Funcionários e respetivo endereço completo
SELECT f.nome,
       e.avenida_rua,
       e.bairro,
       ci.nome_cidade,
       pr.nome_provincia,
       p.nome_pais
FROM funcionario f
JOIN endereco e ON f.id_endereco = e.id_endereco
JOIN cidade ci ON e.id_cidade = ci.id_cidade
JOIN provincia pr ON ci.id_provincia = pr.id_provincia
JOIN pais p ON pr.id_pais = p.id_pais
ORDER BY f.nome;

-- 3. Funcionários, posto de trabalho e cidade
SELECT f.nome,
       pt.nome_posto,
       ci.nome_cidade,
       pr.nome_provincia
FROM funcionario f
JOIN posto_trabalho pt ON f.id_posto = pt.id_posto
JOIN cidade ci ON pt.id_cidade = ci.id_cidade
JOIN provincia pr ON ci.id_provincia = pr.id_provincia
ORDER BY f.nome;

-- 4. Funcionários e telefones
SELECT f.nome, t.numero
FROM funcionario f
LEFT JOIN telefone t ON f.id_funcionario = t.id_funcionario
ORDER BY f.nome, t.numero;

-- 5. Funcionários e filhos
SELECT f.nome, fi.nome_filho
FROM funcionario f
LEFT JOIN filho fi ON f.id_funcionario = fi.id_funcionario
ORDER BY f.nome, fi.nome_filho;

-- 6. Reconstrução da informação principal através de JOINs
SELECT f.nome,
       f.data_nascimento,
       f.nuit,
       f.bi,
       f.email,
       e.avenida_rua,
       e.bairro,
       ci.nome_cidade AS cidade,
       pr.nome_provincia AS provincia,
       p.nome_pais AS pais,
       c.codigo_cargo,
       c.nome_cargo,
       fu.codigo_funcao,
       fu.nome_funcao,
       pt.nome_posto,
       f.data_admissao
FROM funcionario f
JOIN endereco e ON f.id_endereco = e.id_endereco
JOIN cidade ci ON e.id_cidade = ci.id_cidade
JOIN provincia pr ON ci.id_provincia = pr.id_provincia
JOIN pais p ON pr.id_pais = p.id_pais
JOIN cargo c ON f.id_cargo = c.id_cargo
JOIN funcao fu ON c.id_funcao = fu.id_funcao
JOIN posto_trabalho pt ON f.id_posto = pt.id_posto
ORDER BY f.nome;

-- 7. Total de funcionários por cargo
SELECT c.nome_cargo, COUNT(*) AS total_funcionarios
FROM funcionario f
JOIN cargo c ON f.id_cargo = c.id_cargo
GROUP BY c.id_cargo, c.nome_cargo
ORDER BY total_funcionarios DESC;
