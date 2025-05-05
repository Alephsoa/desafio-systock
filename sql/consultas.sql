-- Consultas SQL para o desafio técnico
-- Parte 1: Consultas SQL Básicas
-- Parte 2: Transformações de Dados
-- Parte 3: Consultas de Validação

-- Parte 1.1: Consumo por produto e mês (Fevereiro 2025)
SELECT 
    v.produto_id,
    SUM(v.qtde_vendida) AS total_consumo
FROM 
    public.venda v
WHERE 
    v.data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    v.produto_id
ORDER BY 
    v.produto_id;

-- Parte 1.2: Produtos com requisição pendente
SELECT 
    pc.produto_id,
    pc.descricao_produto,
    pc.qtde_pendente
FROM 
    public.pedido_compra pc
LEFT JOIN 
    public.entradas_mercadoria em 
    ON pc.produto_id = em.produto_id 
    AND pc.ordem_compra = em.ordem_compra
WHERE 
    pc.qtde_pendente > 0
    AND em.produto_id IS NULL
    AND pc.data_pedido BETWEEN '2025-01-01' AND '2025-03-31';

-- Parte 1.3: Produtos requisitados, mas não consumidos e não recebidos (Fevereiro 2025)
SELECT 
    pc.produto_id,
    pc.descricao_produto
FROM 
    public.pedido_compra pc
LEFT JOIN 
    public.venda v 
    ON pc.produto_id = v.produto_id 
    AND v.data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
LEFT JOIN 
    public.entradas_mercadoria em 
    ON pc.produto_id = em.produto_id 
    AND pc.ordem_compra = em.ordem_compra
WHERE 
    pc.data_pedido BETWEEN '2025-02-01' AND '2025-02-28'
    AND v.produto_id IS NULL
    AND em.produto_id IS NULL;

-- Parte 2: Transformações de Dados
SELECT 
    CONCAT(pc.produto_id, ' - ', COALESCE(pc.descricao_produto, '')) AS produto,
    COUNT(*) AS qtde_requisitada,
    TO_CHAR(pc.data_pedido, 'DD/MM/YYYY') AS data_solicitacao
FROM 
    public.pedido_compra pc
WHERE 
    pc.data_pedido BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY 
    pc.produto_id, pc.descricao_produto, pc.data_pedido
HAVING 
    COUNT(*) > 10
ORDER BY 
    qtde_requisitada DESC;

-- Parte 3: Consultas para Validação com o Cliente
-- Resumo de vendas por produto (Fevereiro 2025)
SELECT 
    produto_id,
    SUM(qtde_vendida) AS total_vendido,
    COUNT(DISTINCT venda_id) AS numero_vendas
FROM 
    public.venda
WHERE 
    data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id
ORDER BY 
    total_vendido DESC;

-- Pedidos pendentes (Fevereiro 2025)
SELECT 
    produto_id,
    descricao_produto,
    SUM(qtde_pendente) AS total_pendente
FROM 
    public.pedido_compra
WHERE 
    data_pedido BETWEEN '2025-02-01' AND '2025-02-28'
    AND qtde_pendente > 0
GROUP BY 
    produto_id, descricao_produto
ORDER BY 
    total_pendente DESC;

-- Entradas de mercadoria (Fevereiro 2025)
SELECT 
    produto_id,
    descricao_produto,
    SUM(qtde_recebida) AS total_recebido,
    COUNT(DISTINCT nro_nfe) AS numero_notas
FROM 
    public.entradas_mercadoria
WHERE 
    data_entrada BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id, descricao_produto
ORDER BY 
    total_recebido DESC;

-- Discrepâncias em ordens de compra (Fevereiro 2025)
SELECT 
    pc.produto_id,
    pc.ordem_compra,
    pc.qtde_pedida,
    CO Ducharme(SUM(em.qtde_recebida), 0) AS total_recebido
FROM 
    public.pedido_compra pc
LEFT JOIN 
    public.entradas_mercadoria em 
    ON pc.ordem_compra = em.ordem_compra 
    AND pc.produto_id = em.produto_id
WHERE 
    pc.data_pedido BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    pc.produto_id, pc.ordem_compra, pc.qtde_pedida
HAVING 
    pc.qtde_pedida != COALESCE(SUM(em.qtde_recebida), 0);