use BDloja
go

insert into tbVendedor(nomeVendedor,endVendedor,CPFVendedor)
       values
	         ('Jose Paulo','R. Celeste, 10','123.456.789-00')
			 ,('Maria Beatriz','R. Andradas, 56','256.896.789-66')
			 ,('Solange Gomes','R. Florida, 10','124.875.965-88')
			 ,('Patricia Souza','R. Catarina I, 9','235.654.965-66')
			 ,('Vitor Frias','R. Santos Dummont, 45','147.325.985-01')
insert into tbCliente(nomeCliente,CPFCliente ,emailCliente)
       values
	         ('Pedro Barreto Silva','874.965.741-52','pedrob@ceu.com')
			 ,('Karen Gomes','214.985.965-65','karen.g@mar.com')
			 ,('Silvia Amorim','874.965.741-53','samorim@terra.com')
			 ,('Alicia Silva','214.985.965-66','alicias@fogo.com')
			 ,('Andre Cordeiro','874.965.741-54','andre@ar.com')
insert into tbFabricante(nomeFabricante)
      values
	        ('Unilever')
			,('Bunge')
			,('Cargill')
			
insert into tbProduto (nomeProduto,valorProduto,codFabricante,qtdeProduto)
      values
	        ('Achocolatado','2.5 ','1','1000')
			,('Sabonete','0.9','1','1500')
			,('Margarina','1.4','2','2500')
			,('Detergente','0.75','3','1800')
			,('Bolacha','1.2','2','1750')

insert into tbVenda(codCliente,codVendedor,dataVenda,valorVenda)
       values
	        ('1','2','10/02/2017',240.99)
			,('1','2','10/02/2017',56.7)
			,('2','1','11/03/2017',76.4)
			,('2','3','12/04/2017',43.5)
			,('3','4','13/02/2017',150.7)
			,('4','4','13/06/2018',432.6)
			,('5','5','13/02/2018',231.5)

insert into tbItensVenda(codVenda,codProduto,qtdeProduto)
       values
	        ('1','2','300')
			,('1','2','350')
			,('2','5','500')
			,('3','4','600')
			,('4','2','400')
			,('5','1','100')
			,('6','1','150')
			,('7','3','200')
			,('7','3','200')

select * from tbFabricante
select * from tbVendedor
select * from tbCliente
select * from tbProduto