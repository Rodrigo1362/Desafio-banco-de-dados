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
