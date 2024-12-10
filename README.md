# Desafio de Banco de Dados

Este repositório contém o script SQL para a criação de um esquema de banco de dados, além de consultas avançadas que utilizam diferentes cláusulas SQL. O objetivo é resolver um cenário fictício envolvendo clientes, produtos, pedidos e outros elementos.

## 📂 Estrutura do Banco de Dados

O banco possui as seguintes tabelas:
- **cliente**: Armazena dados de clientes (Pessoa Física e Jurídica).
- **produto**: Detalhes dos produtos, como nome, categoria, avaliação e dimensões.
- **pagamento**: Tipos de pagamento cadastrados para cada cliente.
- **pedido**: Informações sobre pedidos, como status, descrição e código de rastreamento.
- **estoque**: Controle de categorias, descrição e quantidade dos produtos.
- **fornecedor**: Detalhes sobre fornecedores cadastrados.
- **vendedor**: Informações de vendedores, podendo ter CPF ou CNPJ.
- **terceiro_vendedor**: Relação entre vendedores e produtos vendidos por terceiros.

## 📜 Consultas Avançadas

O script inclui as seguintes queries:
1. **Pedidos por cliente**: Quantidade total de pedidos feitos por cada cliente.
2. **Vendedor que também é fornecedor**: Verifica se algum vendedor também atua como fornecedor.
3. **Relação de produtos, fornecedores e estoques**: Combinação de dados entre produtos, fornecedores e estoque.
4. **Fornecedores e produtos**: Lista os nomes dos fornecedores com seus respectivos produtos.

## 🚀 Como usar

1. Execute o script `banco_de_dados.sql` no seu ambiente MySQL para criar o banco de dados e popular as tabelas com dados de teste.
2. Teste as queries fornecidas para obter os resultados esperados.

## 🛠 Tecnologias

- **MySQL**
- **SQL Avançado**



