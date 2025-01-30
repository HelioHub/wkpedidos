# Projeto WKPedidos - Cadastro de Pedidos - Teste Técnico - Hélio Marques

Para que possamos avaliar o desempenho técnico, desenvolva o teste descrito neste 
documento da melhor maneira possível, aplicando técnicas de POO, MVC, Clean Code, e 
utilizando ao máximo o seu potencial. 

## Agrecimento pela Oportunidade

![## Atenção WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Atencao3.png)
![## Atenção WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Atencao.png)

## Requisitos 

![## Documento de Requisitos WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/Model/Requisitos1.png)

## Diagrama de Entidade e Relacionamento 

![## Diagrama de Entidade e Relacionamento WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/Model/EERDiagram.png)

## Arquitetura do Sistema 

	• Aplicação Client/Server;
	• Aplicação Clean Code;
	• Orientação a objetos;
	• Padrões de projeto;
	• Garantir integridade do dados;
	• Padrão MVC;
	• Camada de persistência, utilizar Firedac.

## Tecnologia 

	Embarcadero® Delphi Community Edition Version 29.0.51961.7529 
	Copyright © 2024 Embarcadero Technologies, Inc. All Rights Reserved.

## PW DB MySQL

	MySQL Installer 5.7.44
	https://dev.mysql.com/downloads/installer/
	root/wk@123
	Service Name: MySQL57
	DataBase: WKPedidos
	
## GITHub

	git init
	git remote add origin git@github.com:HelioHub/wkpedidos.git
	git add .
	git commit -m "Firts commit"
	git push -u origin main
	
## Clean Code

	https://balta.io/artigos/clean-code	

## Criação do Banco de Dados e Objetos do Banco

	# ==== Projeto WKPedidos === #
	# ====   Hélio  Marques  === #

	# ==== Criação do Banco === #
	#---------------------------#
	#Create database WKPedidos;
	#use WKPedidos;

	# ==== Criação das tables e indexes === #
	#---------------------------------------#
	#DROP TABLE `WKPedidos`.`ItensPedido` cascade;
	#DROP TABLE `WKPedidos`.`Pedidos` cascade;
	#DROP TABLE `WKPedidos`.`Clientes` cascade;
	#DROP TABLE `WKPedidos`.`Produtos` cascade;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Clientes` (
	  `CodigoClientes` INT NOT NULL AUTO_INCREMENT,
	  `NomeClientes` VARCHAR(80) NULL,
	  `CidadeClientes` VARCHAR(50) NULL,
	  `UFClientes` VARCHAR(2) NULL,
	  PRIMARY KEY (`CodigoClientes`),
	  INDEX `INDEX_NOME` (`NomeClientes` ASC) )
	ENGINE = InnoDB;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Produtos` (
	  `CodigoProdutos` INT NOT NULL AUTO_INCREMENT,
	  `DescricaoProdutos` VARCHAR(80) NULL,
	  `PrecoVendaProdutos` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`CodigoProdutos`),
	  INDEX `INDEX_DESCRICAO` (`DescricaoProdutos` ASC) )
	ENGINE = InnoDB;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Pedidos` (
	  `NumeroPedidos` INT NOT NULL AUTO_INCREMENT,
	  `DataEmissaoPedidos` DATETIME NULL,
	  `ClientePedidos` INT NULL,
	  `ValorTotalPedidos` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`NumeroPedidos`),
	  INDEX `FK_CLIENTE_idx` (`ClientePedidos` ASC),
	  CONSTRAINT `FK_CLIENTE`
		FOREIGN KEY (`ClientePedidos`)
		REFERENCES `WKPedidos`.`Clientes` (`CodigoClientes`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`ItensPedido` (
	  `idItensPedido` INT NOT NULL AUTO_INCREMENT,
	  `PedidoItensPedido` INT NULL,
	  `ProdutoItensPedido` INT NULL,
	  `QuantidadeItensPedido` DECIMAL(10,2) NULL,
	  `VlrUnitarioItensPedido` DECIMAL(17,3) NULL,
	  `VlrTotalItensPedido` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`idItensPedido`),
	  INDEX `FK_PEDIDO_idx` (`PedidoItensPedido` ASC),
	  INDEX `FK_PRODUTO_idx` (`ProdutoItensPedido` ASC),
	  CONSTRAINT `FK_PEDIDO`
		FOREIGN KEY (`PedidoItensPedido`)
		REFERENCES `WKPedidos`.`Pedidos` (`NumeroPedidos`)
		ON DELETE CASCADE
		ON UPDATE NO ACTION,
	  CONSTRAINT `FK_PRODUTO`
		FOREIGN KEY (`ProdutoItensPedido`)
		REFERENCES `WKPedidos`.`Produtos` (`CodigoProdutos`)
		ON DELETE CASCADE
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;

	# ==== Alimentando 20 registros === #
	#-----------------------------------#

	#CLIENTES#
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Helio Marques','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Paulo Souza','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Maria Joana','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Pedro Davi','Paraná','PR');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Jose João','Minas Gerais','MG');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Davi Montes','Florianópolis','SC');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Andressa','Florianópolis','SC');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Felipe Paulo','Florianópolis','SC');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Ana','Florianópolis','SC');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Carlos','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Artur','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Pedro Paulo','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Ana Maria','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Henrique','São Paulo','SP');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Bastos','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Vagner','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Carlos Felipe','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Ana Bela','Fortaleza','CE');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Girleide','Paraná','PR');
	INSERT INTO `wkpedidos`.`clientes` ( `NomeClientes`, `CidadeClientes`, `UFClientes`) VALUES ('Marques','Paraná','PR');

	#PRODUTOS#
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Mouse', '15');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Monitor 14p', '200');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU Intel i5', '2000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Teclado', '25');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe X', '500');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe Y', '600');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe W', '700');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo X', '300');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo Y', '400');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo W', '500');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i3', '600');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i5', '800');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i9', '1000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU i3', '1000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU i9', '2000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete X', '90');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete Y', '100');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete W', '110');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Camera HD', '100');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Pad-Mouse', '5.5');

## Connection FIREDAC com MySQL 
	
	O FireDac do Delphi 12 32bits só funciona com MySQL 5.7.44 32 bits, DLL específica:
	.\DLL\libmysql.dll
	
	================================
	definition parameters
	================================
	Port=3306
	Database=wkpedidos
	User_Name=root
	Password=*****
	Server=localhost
	DriverID=MySQL
	Name=WKConnection
	================================
	FireDAC info
	================================
	Tool = RAD Studio 12
	FireDAC = 29.0.51961.7529
	Platform = Windows 32 bit
	Defines = FireDAC_NOLOCALE_META;FireDAC_MONITOR;
	  FireDAC_SynEdit
	================================
	Client info
	================================
	Loading driver MySQL ...
	DLL = C:\program files (x86)\embarcadero\studio\23.0\bin\libmysql.dll
	Client version = 500270000
	================================
	Session info
	================================
	Checking session ...
	  Warning: The client [5.0.27.0.0] version or less does not support multiple result sets or output parameters of prepared statement.
	Current catalog = 
	Current schema = 
	Server info = 5.7.44-log
	Client info = 5.0.27
	Characterset name = latin1
	Host info = localhost via TCP/IP
	Name modes = CILCTD
	SSL Cipher = 

## Criação das Telas do Sistemas 

![## Telas do Sistema WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/Model/EstruturasdasTelas.png)

