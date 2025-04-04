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
