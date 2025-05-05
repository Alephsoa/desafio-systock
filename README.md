# Desafio Técnico - Analista de Integração de Dados (Systock)

Solução para o desafio técnico de Analista de Integração de Dados (Systock), com scripts SQL, dados fictícios, correções no esquema do banco e estratégia de validação. Usa **Docker** para configuração automática, sem necessidade de instalar o PostgreSQL.

## Estrutura do Projeto

- `dados/dados_teste.sql`: Dados fictícios para as tabelas.
- `sql/esquema.sql`: Criação das tabelas com correções no esquema.
- `sql/consultas.sql`: Consultas SQL das Partes 1, 2 e 3.
- `documentacao/estrategia_validacao.md`: Estratégia de validação com o cliente.

## Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [DBeaver](https://dbeaver.io/download/) ou ferramenta similar
- Git

## Configuração

1. **Clonar o Repositório**:
   ```bash
   git clone https://github.com/Alephsoa/desafio-systock.git
   cd desafio-systock
   ```

2. **Iniciar o Contêiner**:
   ```bash
   docker run --name systock-postgres \
     -e POSTGRES_USER=systock_user \
     -e POSTGRES_PASSWORD=systock_pass \
     -e POSTGRES_DB=systock_db \
     -p 5432:5432 -d --rm \
     -v $(pwd)/sql/esquema.sql:/docker-entrypoint-initdb.d/01_esquema.sql \
     -v $(pwd)/dados/dados_teste.sql:/docker-entrypoint-initdb.d/02_dados_teste.sql \
     postgres:15
   ```

3. **Conectar ao Banco**:
   * No DBeaver:
      * Host: localhost
      * Porta: 5432
      * Banco: systock_db
      * Usuário: systock_user
      * Senha: systock_pass

4. **Executar Consultas**:
   * Abra `sql/consultas.sql` no DBeaver e execute.

5. **Parar o Contêiner** (opcional):
   ```bash
   docker stop systock-postgres
   ```

## Correções no Esquema
* `entradas_mercadoria`: Adicionada coluna `ordem_compra` (float8).
* `produtos`: Tabela criada para consistência de `produto_id` e `descricao_produto`.

## Observações
* Dados fictícios cobrem 01/01/2025 a 31/03/2025, focando em fevereiro de 2025.
* Consultas testadas e alinhadas com os requisitos.
* Docker automatiza a configuração do banco.
* Estratégia de validação (Parte 3) é prática e inclui consultas de apoio.

## Contato
Aleff Soares via alework.pro@gmail.com.