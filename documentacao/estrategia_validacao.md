# Estratégia de Validação com o Cliente

Este documento apresenta a estratégia para validar os dados de **Fevereiro de 2025** com o cliente, garantindo que as informações estejam corretas e confiáveis para a reunião de validação.

## 1. Principais Pontos a Validar

1. **Integridade dos Dados**:
   - Verificar se todas as vendas, pedidos de compra e entradas de mercadoria de fevereiro de 2025 foram registrados corretamente, sem duplicações ou dados faltantes.

2. **Consistência entre Tabelas**:
   - Confirmar que os produtos em `pedido_compra` e `entradas_mercadoria` estão vinculados corretamente pela `ordem_compra`.
   - Garantir que os produtos vendidos em `venda` existem na tabela `produtos`.

3. **Período de Análise**:
   - Assegurar que os dados incluem apenas o período de 01/02/2025 a 28/02/2025.

## 2. Técnicas para Garantir a Validação

1. **Consultas de Verificação**:
   - Usar consultas SQL para resumir vendas, pedidos pendentes e entradas de mercadoria, permitindo a comparação com os registros do cliente.

2. **Validação com Amostras**:
   - Selecionar alguns registros (ex.: 5 vendas, 5 pedidos) e compará-los com documentos do cliente, como notas fiscais ou relatórios.

3. **Resumo Visual**:
   - Apresentar os resultados das consultas em tabelas ou gráficos simples (ex.: Excel) para facilitar a discussão com o cliente.

## 3. Consultas Preparadas para a Reunião

As consultas SQL abaixo estão disponíveis em `sql/consultas.sql` e podem ser usadas na reunião com o cliente:

1. **Resumo de Vendas por Produto**:
   - Mostra o total vendido e o número de vendas por produto em fevereiro de 2025.

2. **Pedidos Pendentes**:
   - Lista produtos com quantidades pendentes em fevereiro de 2025.

3. **Entradas de Mercadoria**:
   - Resume as quantidades recebidas e o número de notas fiscais em fevereiro de 2025.

4. **Discrepâncias em Ordens de Compra**:
   - Identifica ordens de compra onde a quantidade pedida não corresponde à quantidade recebida.
