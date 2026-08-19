use ecommerce_nexashop; 
-- Bloco 1
-- Tarefa 1.1

select * from produtos
limit 10;

-- Tarefa 1.2

	SELECT
		nome,
		categoria,
		marca,
		preco AS "Valor (R$)",
		estoque
FROM produtos;


-- Tarefa 1.3

SELECT DISTINCT categoria
FROM produtos
ORDER BY categoria;


-- Tarefa 1.4
select distinct forma_pagamento
from pedidos;

select distinct canal_venda
from pedidos;


-- Bloco 2
-- Tarefa 2.1
select 
	nome,
    cidade,
    estado,
    status
 from clientes
 where status = 'Ativo'
 and estado in ('SC', 'PR', 'RS')
 order by estado, nome;


-- Tarefa 2.2
select * 
from clientes
 where nome like '%Barros%';
 
 
 -- Tarefa 2.3
	SELECT
		nome,
		email,
		cidade,
		estado,
        telefone
FROM clientes
WHERE telefone IS NULL;

-- Tarefa 2.4
	select * 
    FROM pedidos
WHERE status = 'Aprovado'
  AND valor_total BETWEEN 100 AND 500
ORDER BY valor_total DESC;


-- Tarefa 2.5
SELECT
    nome,
    categoria,
    estoque
FROM produtos
WHERE ativo = '1'
  AND estoque < 10
ORDER BY estoque ASC;



-- Tarefa 2.6
SELECT
    id,
    valor_total,
    cupom_desconto
FROM pedidos
WHERE cupom_desconto IS NOT NULL;


-- Bloco 3
-- Tarefa 3.1
SELECT
    COUNT(*) AS quantidade_pedidos,
    ROUND(AVG(valor_total), 2) AS ticket_medio,
    MIN(valor_total) AS menor_valor,
    MAX(valor_total) AS maior_valor
FROM pedidos
WHERE status = 'Aprovado';

-- Tarefa 3.2
SELECT
    forma_pagamento,
    SUM(valor_total) AS faturamento_total
FROM pedidos
WHERE status = 'Aprovado'
GROUP BY forma_pagamento
ORDER BY faturamento_total DESC;


-- Tarefa 3.3
SELECT
    estado,
    COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY estado
ORDER BY quantidade_clientes DESC;


-- Tarefa 3.4
SELECT
    estado,
    COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY estado
HAVING COUNT(*) > 200
ORDER BY quantidade_clientes DESC;


-- Tarefa 3.5
SELECT
    segmento,
    ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())), 2) AS idade_media
FROM clientes
GROUP BY segmento;


-- Tarefa 3.6
SELECT
    categoria,
    SUM(preco * estoque) AS valor_total_estoque
FROM produtos
WHERE ativo = '1'
GROUP BY categoria
ORDER BY valor_total_estoque DESC;

