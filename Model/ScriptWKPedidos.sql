# ==== Projeto WKPedidos === #
# ====   Hélio  Marques  === #

# ==== Criação do Banco === #
#---------------------------#
create database WKPedidos;
use WKPedidos;

# ==== Criação das tables e indexes === #
#---------------------------------------#
DROP TABLE `WKPedidos`.`ProdutoPedido` cascade;
DROP TABLE `WKPedidos`.`Pedido` cascade;
DROP TABLE `WKPedidos`.`Cliente` cascade;
DROP TABLE `WKPedidos`.`Produto` cascade;


CREATE TABLE IF NOT EXISTS `WKPedidos`.`Cliente` (
  `CodigoCliente` INT NOT NULL,
  `NomeCliente` VARCHAR(100) NULL,
  `CidadeCliente` VARCHAR(80) NULL,
  `UFCliente` VARCHAR(2) NULL,
  PRIMARY KEY (`CodigoCliente`),
  INDEX `INDEX_NOME` (`NomeCliente` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `WKPedidos`.`Produto` (
  `CodigoProduto` INT NOT NULL,
  `DescricaoProduto` VARCHAR(100) NULL,
  `PrecoVendaProduto` DOUBLE NULL,
  PRIMARY KEY (`CodigoProduto`),
  INDEX `INDEX_DESCRICAO` (`DescricaoProduto` ASC) INVISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `WKPedidos`.`Pedido` (
  `NumeroPedido` INT NOT NULL,
  `DataEmissaoPedido` DATETIME NULL,
  `ClientePedido` INT NULL,
  `ValorTotalPedido` DOUBLE NULL,
  PRIMARY KEY (`NumeroPedido`),
  INDEX `FK_CLIENTE_idx` (`ClientePedido` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE`
    FOREIGN KEY (`ClientePedido`)
    REFERENCES `WKPedidos`.`Cliente` (`CodigoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `WKPedidos`.`ProdutoPedido` (
  `idProdutoPedido` INT NOT NULL AUTO_INCREMENT,
  `PedidoProdutoPedido` INT NULL,
  `ProdutoProdutoPedido` INT NULL,
  `QtdProdutoPedido` DOUBLE NULL,
  `VlrUnitarioProdutoPedido` DOUBLE NULL,
  `VrlTotalProdutoPedido` DOUBLE NULL,
  PRIMARY KEY (`idProdutoPedido`),
  INDEX `FK_PEDIDO_idx` (`PedidoProdutoPedido` ASC) VISIBLE,
  INDEX `FK_PRODUTO_idx` (`ProdutoProdutoPedido` ASC) VISIBLE,
  CONSTRAINT `FK_PEDIDO`
    FOREIGN KEY (`PedidoProdutoPedido`)
    REFERENCES `WKPedidos`.`Pedido` (`NumeroPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PRODUTO`
    FOREIGN KEY (`ProdutoProdutoPedido`)
    REFERENCES `WKPedidos`.`Produto` (`CodigoProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

# ==== Alimentando 20 registros === #
#-----------------------------------#

#CLIENTES#
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (1,'Helio Marques','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (2,'Paulo Souza','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (3,'Maria Joana','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (4,'Pedro Davi','Paraná','PR');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (5,'Jose João','Minas Gerais','MG');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (6,'Davi Montes','Florianópolis','SC');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (7,'Andressa','Florianópolis','SC');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (8,'Felipe Paulo','Florianópolis','SC');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (9,'Ana','Florianópolis','SC');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (10,'Carlos','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (11,'Artur','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (12,'Pedro Paulo','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (13,'Ana Maria','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (14,'Henrique','São Paulo','SP');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (15,'Bastos','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (16,'Vagner','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (17,'Carlos Felipe','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (18,'Ana Bela','Fortaleza','CE');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (19,'Girleide','Paraná','PR');
INSERT INTO `wkpedidos`.`cliente` (`CodigoCliente`, `NomeCliente`, `CidadeCliente`, `UFCliente`) VALUES (20,'Marques','Paraná','PR');

#PRODUTOS#
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('1', 'Mouse', '15');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('2', 'Monitor 14p', '200');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('3', 'CPU Intel i5', '2000');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('4', 'Teclado', '25');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('5', 'Placa-Mãe X', '500');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('6', 'Placa-Mãe Y', '600');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('7', 'Placa-Mãe W', '700');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('8', 'Placa-Vídeo X', '300');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('9', 'Placa-Vídeo Y', '400');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('10', 'Placa-Vídeo W', '500');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('11', 'Processador i3', '600');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('12', 'Processador i5', '800');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('13', 'Processador i9', '1000');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('14', 'CPU i3', '1000');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('15 ', 'CPU i9', '2000');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('16', 'Gabinete X', '90');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('17', 'Gabinete Y', '100');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('18', 'Gabinete W', '110');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('19', 'Camera HD', '100');
INSERT INTO `wkpedidos`.`produto` (`CodigoProduto`, `DescricaoProduto`, `PrecoVendaProduto`) VALUES ('20', 'Pad-Mouse', '5.5');





