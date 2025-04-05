CREATE DATABASE ecommecer;
USE ecommecer;

-- Criação da tabela cliente (base para PF e PJ)
CREATE TABLE cliente (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11),
    cnpj CHAR(14),
    endereco TEXT,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    CONSTRAINT UNIQUE_CPF_CLIENTE UNIQUE (cpf),
    CONSTRAINT UNIQUE_CNPJ_CLIENTE UNIQUE (cnpj)
);

-- Tabela produto
CREATE TABLE produto (
    idproduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    avaliacao FLOAT,
    dimensoes TEXT
);

-- Tabela pagamento
CREATE TABLE pagamento (
    idpagamento INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT NOT NULL,
    tipo_pagamento ENUM('Cartão de Crédito', 'Cartão de Débito', 'Boleto', 'Pix', 'Transferência') NOT NULL,
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
);

-- Tabela pedido
CREATE TABLE pedido (
    idpedido INT AUTO_INCREMENT PRIMARY KEY,
    idpedidocliente INT NOT NULL,
    ordem_status ENUM('Pendente', 'Processando', 'Concluído', 'Cancelado') NOT NULL,
    ordem_descricao TEXT,
    frete FLOAT,
    idpagamento INT,
    codigo_rastreamento VARCHAR(255),
    FOREIGN KEY (idpedidocliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (idpagamento) REFERENCES pagamento(idpagamento)
);

-- Tabela estoque
CREATE TABLE estoque (
    idprodutoestoque INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(100),
    descricao TEXT,
    quantidade INT
);

-- Tabela fornecedor
CREATE TABLE fornecedor (
    idfornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    contato VARCHAR(255),
    CONSTRAINT UNIQUE_FORNECEDOR UNIQUE (cnpj)
);

-- Tabela vendedor
CREATE TABLE vendedor (
    idvendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj CHAR(14),
    cpf CHAR(11),
    contato VARCHAR(255),
    local VARCHAR(255),
    CONSTRAINT UNIQUE_CNPJ_VENDEDOR UNIQUE (cnpj),
    CONSTRAINT UNIQUE_CPF_VENDEDOR UNIQUE (cpf)
);

-- Tabela terceiro vendedor
CREATE TABLE terceiro_vendedor (
    idterceirovendedor INT AUTO_INCREMENT PRIMARY KEY,
    idproduto INT NOT NULL,
    quantidade INT,
    FOREIGN KEY (idterceirovendedor) REFERENCES vendedor(idvendedor),
    FOREIGN KEY (idproduto) REFERENCES produto(idproduto)
);

-- Inserção de dados para testes
INSERT INTO cliente (nome, cpf, tipo_cliente, endereco) VALUES
('João Silva', '12345678901', 'PF', 'Rua das Flores, 123'),
('Empresa XYZ', NULL, 'PJ', 'Avenida Brasil, 456');

INSERT INTO produto (nome, categoria, avaliacao, dimensoes) VALUES
('Produto A', 'Eletrônicos', 4.5, '10x10x10 cm'),
('Produto B', 'Móveis', 3.8, '200x100x50 cm');

INSERT INTO pagamento (idcliente, tipo_pagamento) VALUES
(1, 'Pix'),
(2, 'Cartão de Crédito');

INSERT INTO pedido (idpedidocliente, ordem_status, ordem_descricao, frete, idpagamento, codigo_rastreamento) VALUES
(1, 'Pendente', 'Pedido de teste', 20.5, 1, 'RAST12345'),
(2, 'Concluído', 'Pedido finalizado', 50.0, 2, 'RAST67890');


-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, COUNT(p.idpedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.idcliente = p.idpedidocliente
GROUP BY c.idcliente;

-- 2. Algum vendedor também é fornecedor?
SELECT v.nome AS vendedor, f.nome AS fornecedor
FROM vendedor v
JOIN fornecedor f ON v.cnpj = f.cnpj OR v.cpf = f.cnpj;

-- 3. Relação de produtos, fornecedores e estoques
SELECT p.nome AS produto, f.nome AS fornecedor, e.quantidade AS estoque
FROM produto p
LEFT JOIN terceiro_vendedor tv ON p.idproduto = tv.idproduto
LEFT JOIN fornecedor f ON tv.idterceirovendedor = f.idfornecedor
LEFT JOIN estoque e ON e.idprodutoestoque = p.idproduto;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.nome AS fornecedor, p.nome AS produto
FROM fornecedor f
JOIN terceiro_vendedor tv ON f.idfornecedor = tv.idterceirovendedor
JOIN produto p ON tv.idproduto = p.idproduto;


