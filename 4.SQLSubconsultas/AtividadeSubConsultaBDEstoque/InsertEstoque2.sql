use bdEstoque
go

insert into tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNas)
    values
	    ('Amando Jose Santana','12345678900','amandojsantana@outlook.com','M','21/02/1961')
		,('Sheila Carvalho Leal','45678909823','scarvalho@ig.com.br','F','13/09/1978')
		,('Carlos Henrique Souza','76598278299','chenrique@ig.com.br','M','08/09/1981')
		,('Maria Aparecida Souza','87365309899','mapdasouza@outlook.com','F','07/07/1962')
		,('Adriana Nogueira Silva','76354309388','drica1977@ig.com.br','F','09/04/1977')
		,('Paulo henrique silva','87390123111','phsilva80@hotmail.com','M','02/02/1987')

insert into tbVenda(dataVenda,valorTotal,codCliente)
    values
	    ('01/02/2014',4500.00,'1')
		,('03/02/2014',3400.00,'1')
		,('10/02/2014',2100.00,'2')
		,('15/02/2014',2700.00,'3')
		,('17/03/2014',560.00,'3')
		,('09/04/2014',1200.00,'4')
		,('07/05/2014',3500.00,'5')
		,('07/05/2014',3400.00,'1')
		,('05/05/2014',4000.00,'2')
		
insert into tbFabricante(nomeFabricante)
    values
	    ('Unilever')
		/*,('P&G')
		,('Bunge')*/
		
insert into tbFornecedor(nomeFornecedor,contatoFornecedor)
    values
	    ('Atacadão','Carlos Santos')
		,('Assai','Maria stella')
		,('Roldao ','Paulo cesar')
		,('Assai','Gustav karina')
		,('Roldao','Katyusha pinheiro')
		,('Atacadão','Luiz inacio ')
		,('Rossi','Irineu da silva')
		,('Rossi','Lucas nuncanemvi')
		,('Shibata','Gabriel Yoshioka')
insert into tbProduto(descricaoPro,valorPro,quantidadePro,codFabricante,codFornecedor)
    values
	    ('Amaciante downy',5.76,1500,1,1)
		,('Amaciante comfort',5.45,2300,1,1)
		,('sabão em pó OMO',5.99,1280,1,2)
		,('Margarina Qually',4.76,2500,3,1)
		,('Salsicha hot dog Sadia',6.78,2900,3,2)
		,('Mortadela Perdigão',2.50,1200,3,3)
		,('Hamburger Sadia',9.89,1600,3,1)
		,('Fralda Pampers',36.00,340,2,3)
		,('Xampu Seda',5.89,800,1,2)
		,('Condicionador Seda',6.50,700,1,3)
		,('Barra Chocolate Nestle',6.85,1234,1,null)
		,('Macarrao ',5.76,234,'2',null)
		,('Arroz',6.87,234,'3',null)

insert into tbItensVenda(quantidadeItens,subTotalitens,codVenda,codProduto)
    values
	    (200,1500.00,1,2)
		,(300,3000.00,2,3)
		,(120,1400.00,1,4)
		,(200,1000.00,2,1)
		,(130,1000.00,2,3)
		,(200,2100.00,2,1)
		,(120,1000.00,2,3)
		,(450,700.00,2,1)
		,(200,560.00,2,4)
		,(200,600.00,4,4)
		,(300,600.00,3,3)
		,(300,2500.00,2,2)
		,(200,1000.00,1,2)
		,(250,1700.00,1,3)
		,(200,1700.00,2,4)
		,(1000,4000.00,2,1)

