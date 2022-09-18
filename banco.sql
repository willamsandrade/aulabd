CREATE DATABASE aulabd;

CREATE TABLE tipo_produto(
    idTipoProduto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descTipoProduto VARCHAR(50) NOT NULL 
);

CREATE TABLE produto(
    idProduto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descProduto VARCHAR(50) NOT NULL,
    qtdProduto INT NOT NULL,
    valorProduto DECIMAL(10,2) NOT NULL,
    idTipoProduto INT NOT NULL,
    CONSTRAINT fk_produto_tipo FOREIGN KEY (idTipoProduto) REFERENCES tipo_produto(idTipoProduto) 
);

CREATE TABLE tipo_cliente(
    idTipoCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descTipoCliente VARCHAR(50) NOT NULL
);

CREATE TABLE cliente(
    idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nomeCliente VARCHAR(50) NOT NULL,
    nascCliente DATE NOT NULL,
    limiteCliente DECIMAL(10,2) NOT NULL DEFAULT 100.00,
    idTipoCliente INT NOT NULL,
    CONSTRAINT fk_cliente_tipo FOREIGN KEY (idTipoCliente) REFERENCES tipo_cliente(idTipoCliente) 
);

CREATE TABLE venda(
    idVenda INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    dataVenda TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    idProduto INT NOT NULL,
    idCliente INT NOT NULL,
    CONSTRAINT fk_cliente_venda FOREIGN KEY (idCliente) REFERENCES cliente(idCliente), 
    CONSTRAINT fk_produto_venda FOREIGN KEY (idProduto) REFERENCES produto(idProduto) 
);