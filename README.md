# Projeto WKPedidos - Cadastro de Pedidos - Teste Técnico - Hélio Marques

Para que possamos avaliar o desempenho técnico, desenvolva o teste descrito neste 
documento da melhor maneira possível, aplicando técnicas de POO, MVC, Clean Code, e 
utilizando ao máximo o seu potencial. 

## Agrecimento pela Oportunidade

![## Atenção WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Atencao3.png)
![## Atenção WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Atencao.png)

## Requisitos 

![## Documento de Requisitos WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/BD/Requisitos1.png)

## Diagrama de Entidade e Relacionamento 

![## Diagrama de Entidade e Relacionamento WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/BD/EERDiagram.png)

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
	  INDEX `INDEX_DATAEMISSAO` (`DataEmissaoPedidos` ASC),
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

## Sugestões para otimizar o Banco de dados MySQL WKPedidos:

   Com Índices já Existentes, com Índices Adicionais e com Consultas SQL performáticas. 
   Considerando boas práticas e para melhorar o desempenho das consultas.

	1. Índices Sugeridos
	#-----------------------------------#
		Tabela Clientes
		Índice composto para consultas por cidade e estado:
			CREATE INDEX `INDEX_CIDADE_UF` ON `WKPedidos`.`Clientes` 
			  (`CidadeClientes` ASC, `UFClientes` ASC);

		Tabela Produtos
		Índice para consultas por preço:
			CREATE INDEX `INDEX_PRECO` ON `WKPedidos`.`Produtos` 
			  (`PrecoVendaProdutos` ASC);

		Tabela Pedidos
		Índice para consultas por data de emissão:
			CREATE INDEX `INDEX_DATA_EMISSAO` ON `WKPedidos`.`Pedidos` 
			  (`DataEmissaoPedidos` ASC);

		Tabela ItensPedido
		Índice composto para consultas por pedido e produto:
			CREATE INDEX `INDEX_PEDIDO_PRODUTO` ON `WKPedidos`.`ItensPedido` 
			  (`PedidoItensPedido` ASC, `ProdutoItensPedido` ASC);
		  
	2. Consultas SQL Performáticas
	#-----------------------------------#
		Aqui estão exemplos de consultas SQL otimizadas para acessar os dados:

		Consulta 1: Listar todos os pedidos de um cliente
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			WHERE 
				c.CodigoClientes = ?;
			Índices utilizados:
				FK_CLIENTE (já existe na tabela Pedidos).
				INDEX_NOME (já existe na tabela Clientes).

		Consulta 2: Listar todos os itens de um pedido
			SELECT 
				ip.idItensPedido, 
				ip.QuantidadeItensPedido, 
				ip.VlrUnitarioItensPedido, 
				ip.VlrTotalItensPedido, 
				pr.DescricaoProdutos 
			FROM 
				WKPedidos.ItensPedido ip
			JOIN 
				WKPedidos.Produtos pr ON ip.ProdutoItensPedido = pr.CodigoProdutos
			WHERE 
				ip.PedidoItensPedido = ?;
			Índices utilizados:
				FK_PEDIDO (já existe na tabela ItensPedido).
				INDEX_DESCRICAO (já existe na tabela Produtos).

		Consulta 3: Listar todos os pedidos emitidos em um período
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			WHERE 
				p.DataEmissaoPedidos BETWEEN ? AND ?;
			Índices utilizados:
				INDEX_DATA_EMISSAO (sugerido acima).
				FK_CLIENTE (já existe na tabela Pedidos).

		Consulta 4: Listar os produtos mais vendidos
			SELECT 
				pr.DescricaoProdutos, 
				SUM(ip.QuantidadeItensPedido) AS TotalVendido 
			FROM 
				WKPedidos.ItensPedido ip
			JOIN 
				WKPedidos.Produtos pr ON ip.ProdutoItensPedido = pr.CodigoProdutos
			GROUP BY 
				pr.DescricaoProdutos
			ORDER BY 
				TotalVendido DESC;
			Índices utilizados:
				FK_PRODUTO (já existe na tabela ItensPedido).
				INDEX_DESCRICAO (já existe na tabela Produtos).

		Consulta 5: Listar clientes de uma cidade e estado
			SELECT 
				CodigoClientes, 
				NomeClientes 
			FROM 
				WKPedidos.Clientes
			WHERE 
				CidadeClientes = ? AND UFClientes = ?;
			Índices utilizados:
				INDEX_CIDADE_UF (sugerido acima).	  
			
	3. Boas Práticas
	#-----------------------------------#
		Usar JOIN ao invés de subconsultas:
			Sempre que possível, prefirir JOIN para unir tabelas, pois é mais eficiente do que subconsultas.
			
		Evitar SELECT *:
			Liste apenas as colunas necessárias para reduzir a quantidade de dados processados.

		Use LIMIT em consultas grandes:
			Se a consulta retornar muitos registros, usar LIMIT para paginar os resultados.

		Mantenha os índices atualizados:
			Executar ANALYZE TABLE periodicamente para atualizar as estatísticas dos índices.

		Considere particionamento de tabelas:
			Para tabelas muito grandes (ex: Pedidos), considerar particionar por data ou outro critério relevante		
				Exemplo de particionamento por intervalo (RANGE):
				#-----------------------------------------------#
				Particionar a tabela Pedidos por ano de emissão (DataEmissaoPedidos):

				Passo 1: Criar a tabela particionada
					CREATE TABLE WKPedidos.Pedidos (
						NumeroPedidos INT NOT NULL AUTO_INCREMENT,
						DataEmissaoPedidos DATETIME NOT NULL,
						ClientePedidos INT NOT NULL,
						ValorTotalPedidos DECIMAL(17,3) NOT NULL,
						PRIMARY KEY (NumeroPedidos, DataEmissaoPedidos), -- Chave primária composta
						INDEX FK_CLIENTE_idx (ClientePedidos ASC),
						CONSTRAINT FK_CLIENTE
							FOREIGN KEY (ClientePedidos)
							REFERENCES WKPedidos.Clientes (CodigoClientes)
							ON DELETE NO ACTION
							ON UPDATE NO ACTION
					)
					PARTITION BY RANGE (YEAR(DataEmissaoPedidos)) (
						PARTITION p2020 VALUES LESS THAN (2021),
						PARTITION p2021 VALUES LESS THAN (2022),
						PARTITION p2022 VALUES LESS THAN (2023),
						PARTITION p2023 VALUES LESS THAN (2024),
						PARTITION pFuture VALUES LESS THAN MAXVALUE
					);
				Explicação:
					A tabela é particionada por ano (YEAR(DataEmissaoPedidos)).
					Cada partição contém os pedidos de um ano específico.
					A partição pFuture armazena pedidos com datas superiores a 2023.
				Quando usar particionamento?
					Tabelas muito grandes: Quando a tabela tem milhões de registros.
					Consultas com filtros específicos: Quando as consultas frequentemente filtram por uma coluna (ex: data, região).
					Necessidade de manutenção granular: Quando você precisa gerenciar partes específicas dos dados (ex: excluir dados antigos).
				Limitações:
					Chave primária: A coluna usada no particionamento deve fazer parte da chave primária.
					Índices globais: Índices que abrangem todas as partições podem ser menos eficientes.
					Complexidade: O particionamento aumenta a complexidade do banco de dados.

	4. Exemplo de Consulta com Paginação
	#-----------------------------------#
		Aqui está um exemplo de consulta paginada para listar pedidos:
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			ORDER BY 
				p.DataEmissaoPedidos DESC
			LIMIT 10 OFFSET 0; -- Página 1 (10 primeiros registros)
			Índices utilizados:
				INDEX_DATA_EMISSAO (sugerido acima).
				FK_CLIENTE (já existe na tabela Pedidos).
				
	5. Exemplo de Consulta com Filtro Composto
	#-----------------------------------#
		Aqui está um exemplo de consulta com filtro composto (cidade e estado):
			SELECT 
				CodigoClientes, 
				NomeClientes 
			FROM 
				WKPedidos.Clientes
			WHERE 
				CidadeClientes = 'São Paulo' AND UFClientes = 'SP';			
			Índices utilizados:
				INDEX_CIDADE_UF (sugerido acima).

	6. Exemplo de Consulta com Agregação
	#-----------------------------------#
		Aqui está um exemplo de consulta agregada para calcular o valor total de pedidos por cliente:
			SELECT 
				c.NomeClientes, 
				SUM(p.ValorTotalPedidos) AS TotalPedidos 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			GROUP BY 
				c.NomeClientes
			ORDER BY 
				TotalPedidos DESC;
			Índices utilizados:
				FK_CLIENTE (já existe na tabela Pedidos).
				INDEX_NOME (já existe na tabela Clientes).

	7. Conceito de Páginação LIMIT e OFFSET no SELECT
	#-----------------------------------#
		A combinação de LIMIT e OFFSET é usada para dividir os resultados em "páginas". Por exemplo:

		Página 1:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 0;
			Retorna os registros 1 a 10.
		Página 2:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 10;
			Retorna os registros 11 a 20.
		Página 3:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 20;
			Retorna os registros 21 a 30.
			
		Quando usar LIMIT e OFFSET?
			Paginação de resultados: Para exibir resultados em páginas (ex: 10 registros por página).
			Consultas grandes: Para evitar retornar muitos registros de uma só vez, o que pode sobrecarregar a aplicação ou o banco de dados.
			Testes rápidos: Para verificar rapidamente um subconjunto de dados.

		Cuidados ao usar OFFSET:
			Desempenho: Em tabelas muito grandes, o OFFSET pode ser lento, pois o banco de dados precisa "pular" os registros anteriores antes de retornar os resultados.
			Alternativa: Para melhorar o desempenho em grandes conjuntos de dados, considere usar uma coluna de referência (ex: id ou data) para paginar os resultados, em vez de OFFSET.

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
	
## Criação das Telas do Sistema WKPedidos

![## Telas do Sistema WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/EstruturasdasTelas.png)

## Padrão MVC (Model-View-Controller) e Programação Orientada a Interface (POI)
    
   Seguindo padrão MVC e POI. Vou estruturar o código de forma modular e com boas práticas de desenvolvimento.

	1. Estrutura do Projeto
		Vamos organizar o projeto da seguinte forma:
		Pastas:
			Model: Contém as classes que representam as entidades do banco de dados.
			Controller: Contém as classes que gerenciam a lógica de negócio e a interação com o banco de dados.
			Interfaces: Contém as interfaces que definem os contratos para as classes.
			View: Contém as interfaces gráficas (forms) que interagem com o usuário.

		Classes:
			Cada tabela do banco de dados terá uma classe no Model.
			Cada classe do Model terá uma interface correspondente no Interfaces.
			O Controller fará a mediação entre o Model e a View.

	2. Interfaces
		Vamos definir interfaces para garantir o desacoplamento e a flexibilidade do código.   
		
	3. Model
		Aqui estão as classes que representam as entidades do banco de dados.		
		
	4. Controller
		Aqui estão as classes que gerenciam a lógica de negócio.		
	   
	5. View
		Aqui está um exemplo de como usar o Controller e o Model em um formulário.		
		
	6. Boas Práticas
		Injeção de Dependência: Contêineres de DI para gerenciar as dependências.
		Testes Unitários: Testes para as classes do Model e Controller.
		Validações: Adicione validações nos métodos do Controller.		

	7. Outras Vantagens SOLID:
		Reutilização:
			A classe TDatabaseConnection pode ser usada por todos os Models que precisam de acesso ao banco de dados.

		Facilidade de Manutenção:
			Se a configuração da conexão precisar ser alterada, basta modificar a classe TDatabaseConnection.

		Desacoplamento:
			Os Models não precisam saber como a conexão é configurada, apenas usam a conexão fornecida.

		Testabilidade:
			A classe TDatabaseConnection pode ser facilmente mockada em testes unitários.
			
	8. Melhorias Futuras
		Injeção de Dependência:
			Use um contêiner de DI para gerenciar a instância de TDatabaseConnection e injetá-la nos Models.

		Pool de Conexões:
			Implemente um pool de conexões para melhorar o desempenho em aplicações com alta concorrência.			
			
	9. Utilizando arquivo Externo .INI
		Configuração Externa:
			Os parâmetros de conexão e o caminho da DLL são armazenados em um arquivo .INI, facilitando a manutenção.

		Flexibilidade:
			Você pode alterar os parâmetros de conexão sem recompilar o código.

		Reutilização:
			A classe TDatabaseConnection pode ser usada por todos os Models que precisam de acesso ao banco de dados.

		Facilidade de Manutenção:
			Se a configuração da conexão precisar ser alterada, basta modificar o arquivo .INI.			
	
## Todos os Requisitos atendidos 

![## Requisitos WKPedidos](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/FuncionandoTudo.png)

## Disponibilizado o DUMP do banco de dados no diretório raiz do projeto

	1. mysqldump -u root -pwk@123 WKPedidos > C:\WKPedidos\Dump20250131
	
	2. C:\WKPedidos\config.ini - Arquivo de Configuração de Acesso ao Banco de Dados

	3. C:\WKPedidos\DLL\libmysql.dll - Disponível nesta pasta no entanto configurável pelo config.ini

## Melhor Distribuição do projeto	

![## Distribuição do Projetos](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Distri.png)

## Implementação do Padrão de Projeto Visitor Pattern. Conceito:

	Em programação orientada a objetos e engenharia de software, 
	o Visitor Pattern é um padrão de projeto comportamental. 
	Representa uma operação a ser realizada sobre elementos da estrutura de um objeto. 
	O Visitor permite que se crie uma nova operação sem que se mude a classe dos elementos sobre as quais ela opera.

	Isto é, permite separar algoritmos dos objetos nos quais eles operam.	

	Reduz a complexidade de implementação de regras de negócios no Sistema, 
	evitando utilização de comandos condicionais como If e Case.

	Cria Sistema Desacoplado, 
	separando componentes ou camadas individuais dentro de um aplicativo para permitir que cada parte evolua, 
	seja dimensionada e mantida independentemente uma da outra.

	````
	Prós
	````
	> Princípio Aberto/Fechado: Você pode introduzir um novo comportamento que possa 
	  trabalhar com objetos de diferentes classes sem alterar essas classes.
	> Princípio de responsabilidade única: Você pode mover várias versões do mesmo comportamento 
	  para a mesma classe.
	> Um objeto visitante pode acumular algumas informações úteis ao trabalhar com vários objetos. 
	  Isso pode ser útil quando você deseja percorrer alguma estrutura complexa de objetos, 
	  como uma árvore de objetos, e aplicar o visitante a cada objeto dessa estrutura.

	````
	Exemplo
	````
	Item Preço de Venda >
		Método Identifica o Tipo de Cliente, Varejo ou Atacado.
		Conforme o Tipo aplica Desconto à Prazo ou Vista.
		
	Cliente Varejo:
		Desconto à Vista: 10%
		Desconto à Prazo: 0%

	Cliente Atacado:
		Desconto à Vista: 30%
		Desconto à Prazo: 15%
	
![## DP Visitor WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/VisitorPattern.png)

## Relatório de Pedido gerado utilizando HTML/CSS/JavaScript (Mostra meu conhecimento sobre):

	Relatório Criado Mostras os Pedidos e seus Itens, totalizando por Pedido.
	Gerado em HTML/CSS e lançado no Browser Default.

	````
	Tela
	````
![## Tela Relatório WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/RelatorioTela.png)

	````
	Relatório no Browser
	````
![## Relatório WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Relatorio.png)

	````
	SQL Utilizado
	````
	select a.NumeroPedidos, 
		   a.DataEmissaoPedidos, 
		   a.ClientePedidos, 
		   c.NomeClientes,
		   b.idItensPedido,
		   b.ProdutoItensPedido,
		   d.DescricaoProdutos,
		   b.QuantidadeItensPedido,
		   b.VlrUnitarioItensPedido,
		   b.VlrTotalItensPedido,
		   a.ValorTotalPedidos
	from pedidos a
	inner join itenspedido b on b.PedidoItensPedido = a.NumeroPedidos
	inner join clientes c on c.CodigoClientes = a.ClientePedidos
	inner join produtos d on d.CodigoProdutos = b.ProdutoItensPedido
	order by a.NumeroPedidos
	
## Criação do Filtro por Data de Emissão da Tela de Pedidos e Index para performar melhor no Banco:

	````
	Atende a Tela de Pedido e o Relatório.
	````
	
	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Pedidos` (
	  `NumeroPedidos` INT NOT NULL AUTO_INCREMENT,
	  `DataEmissaoPedidos` DATETIME NULL,
	  `ClientePedidos` INT NULL,
	  `ValorTotalPedidos` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`NumeroPedidos`),
	  INDEX `FK_CLIENTE_idx` (`ClientePedidos` ASC),
	  INDEX `INDEX_DATAEMISSAO` (`DataEmissaoPedidos` ASC),
	  CONSTRAINT `FK_CLIENTE`
		FOREIGN KEY (`ClientePedidos`)
		REFERENCES `WKPedidos`.`Clientes` (`CodigoClientes`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;	

![## Tela Filtro WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/FiltroDataEmissao.png)


## Gráfico do mais Vendidos:

	````
	Usando HTML/CSS/JS
	````
![## Gráfico WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Grafico1.png)
![## Gráfico WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/Grafico2.png)


## CheckList Final:

	````
	End Project: "Tudo funcionando perfeitamente". CheckList:
	````

![## CheckList WK](https://github.com/HelioHub/wkpedidos/blob/main/Imagens/CheckList.png)



	
	
	


