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
