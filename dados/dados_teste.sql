-- Script para inserir dados fictícios nas tabelas do desafio técnico
-- Período: 01/01/2025 a 31/03/2025

-- Inserir dados na tabela produtos
INSERT INTO public.produtos (produto_id, descricao_produto, unidade_medida) VALUES
('P001', 'Detergente Líquido', 'UN'),
('P002', 'Sabão em Pó', 'KG'),
('P003', 'Água Sanitária', 'LT'),
('P004', 'Esponja de Aço', 'UN'),
('P005', 'Desinfetante', 'LT');

-- Inserir dados na tabela venda
INSERT INTO public.venda (venda_id, data_emissao, horariomov, produto_id, qtde_vendida, valor_unitario, filial_id, item, unidade_medida) VALUES
(1001, '2025-01-15', '10:30:00', 'P001', 50, 3.5000, 1, 1, 'UN'),
(1002, '2025-02-01', '14:20:00', 'P002', 20, 12.0000, 1, 1, 'KG'),
(1003, '2025-02-10', '09:15:00', 'P001', 30, 3.6000, 1, 1, 'UN'),
(1004, '2025-02-15', '16:00:00', 'P003', 15, 5.2000, 1, 1, 'LT'),
(1005, '2025-02-20', '11:45:00', 'P002', 25, 11.8000, 1, 1, 'KG'),
(1006, '2025-03-05', '13:30:00', 'P004', 10, 2.1000, 1, 1, 'UN'),
(1007, '2025-03-10', '08:50:00', 'P005', 40, 6.5000, 1, 1, 'LT');

-- Inserir dados na tabela pedido_compra
INSERT INTO public.pedido_compra (pedido_id, data_pedido, item, produto_id, descricao_produto, ordem_compra, qtde_pedida, filial_id, data_entrega, qtde_entregue, qtde_pendente, preco_compra, fornecedor_id) VALUES
(2001, '2025-01-10', 1, 'P001', 'Detergente Líquido', 5001, 100, 1, '2025-01-20', 80, 20, 3.0000, 101),
(2002, '2025-02-01', 1, 'P002', 'Sabão em Pó', 5002, 50, 1, '2025-02-10', 30, 20, 10.5000, 102),
(2003, '2025-02-05', 1, 'P003', 'Água Sanitária', 5003, 60, 1, '2025-02-15', 0, 60, 4.8000, 103),
(2004, '2025-02-10', 1, 'P004', 'Esponja de Aço', 5004, 20, 1, '2025-02-20', 20, 0, 1.8000, 104),
(2005, '2025-02-15', 1, 'P001', 'Detergente Líquido', 5005, 80, 1, '2025-02-25', 50, 30, 3.1000, 101),
(2006, '2025-03-01', 1, 'P005', 'Desinfetante', 5006, 70, 1, '2025-03-10', 70, 0, 6.0000, 105),
(2007, '2025-02-01', 2, 'P001', 'Detergente Líquido', 5007, 100, 1, '2025-02-10', 0, 100, 3.2000, 101),
(2008, '2025-02-02', 3, 'P001', 'Detergente Líquido', 5008, 50, 1, '2025-02-12', 0, 50, 3.1500, 101),
(2009, '2025-02-03', 4, 'P001', 'Detergente Líquido', 5009, 60, 1, '2025-02-13', 0, 60, 3.1000, 101),
(2010, '2025-02-04', 5, 'P001', 'Detergente Líquido', 5010, 70, 1, '2025-02-14', 0, 70, 3.0500, 101),
(2011, '2025-02-05', 6, 'P001', 'Detergente Líquido', 5011, 80, 1, '2025-02-15', 0, 80, 3.0000, 101);

-- Inserir dados na tabela entradas_mercadoria
INSERT INTO public.entradas_mercadoria (data_entrada, nro_nfe, item, produto_id, descricao_produto, qtde_recebida, filial_id, custo_unitario, ordem_compra) VALUES
('2025-01-20', 'NFE001', 1, 'P001', 'Detergente Líquido', 80, 1, 3.0000, 5001),
('2025-02-10', 'NFE002', 1, 'P002', 'Sabão em Pó', 30, 1, 10.5000, 5002),
('2025-02-20', 'NFE003', 1, 'P004', 'Esponja de Aço', 20, 1, 1.8000, 5004),
('2025-02-25', 'NFE004', 1, 'P001', 'Detergente Líquido', 50, 1, 3.1000, 5005),
('2025-03-10', 'NFE005', 1, 'P005', 'Desinfetante', 70, 1, 6.0000, 5006);