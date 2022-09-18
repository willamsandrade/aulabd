-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Set-2022 às 15:55
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aulabd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(50) NOT NULL,
  `nascCliente` date NOT NULL,
  `limiteCliente` decimal(10,2) NOT NULL DEFAULT 100.00,
  `idTipoCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `descProduto` varchar(50) NOT NULL,
  `qtdProduto` int(11) NOT NULL,
  `valorProduto` decimal(10,2) NOT NULL,
  `idTipoProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `idTipoCliente` int(11) NOT NULL,
  `descTipoCliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `idTipoProduto` int(11) NOT NULL,
  `descTipoProduto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `dataVenda` timestamp NOT NULL DEFAULT current_timestamp(),
  `idProduto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_cliente_tipo` (`idTipoCliente`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `fk_produto_tipo` (`idTipoProduto`);

--
-- Índices para tabela `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Índices para tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`idTipoProduto`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `fk_cliente_venda` (`idCliente`),
  ADD KEY `fk_produto_venda` (`idProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `idTipoCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  MODIFY `idTipoProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_tipo` FOREIGN KEY (`idTipoCliente`) REFERENCES `tipo_cliente` (`idTipoCliente`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_tipo` FOREIGN KEY (`idTipoProduto`) REFERENCES `tipo_produto` (`idTipoProduto`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_cliente_venda` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `fk_produto_venda` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
