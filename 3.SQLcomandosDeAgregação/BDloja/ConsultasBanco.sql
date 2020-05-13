use BDloja
go

/*Todos os clientes*/
select nomeCliente from tbCliente

/*somente o nome e o e-mail dos clientes*/
select nomeCliente,emailCliente from tbCliente

/*c)	todas as vendas*/
select COUNT (dataVenda)from tbVenda

/*d)	somente as vendas feitas em 10/02/2008*/
select count (dataVenda) from tbVenda
    where dataVenda = '10/02/2008'

/*e)	todos os produtos que possuam quantidade acima de 200 no estoque*/
select nomeProduto from tbProduto
    where qtdeProduto > 200

/*f)	somente os produtos do fabricante Unilever*/
select nomeProduto from tbProduto
    where codFabricante = 1

/*g)	todas as vendas do cliente Karen Gomes*/
select count(dataVenda)from tbVenda
    where codCliente = 2

/*h)	todas as vendas feitas pelo vendedor Patrícia Souza*/
select count(dataVenda)from tbVenda
    where codVendedor = 4

/*i)	todas as vendas feitas pelo vendedor Maria Beatriz ao cliente Pedro Barreto*/
select count (dataVenda)from tbVenda
    where codVendedor = 2 and codCliente = 1

/*j)	todas as vendas do produto “Detergente */
select count(qtdeProduto)from tbItensVenda
    where codProduto = 4

/*k)	os nomes e os códigos de todos os clientes cujo nome comece com A*/
select nomeCliente,codCliente from tbCliente
    where nomeCliente like '%a'

/*l)	todos os clientes que possuem Silva no sobrenome*/
select nomeCliente from tbCliente
    where nomeCliente like '%silva%'

/*m)	todos os campos dos produtos que custem acima de R$ 1,00*/
select nomeProduto,valorProduto,codFabricante,qtdeProduto from tbProduto
    where valorProduto > 1.0

/*n)	todos os campos dos produtos da Unilever que custem igual ou abaixo de R$ 1,00*/
select nomeProduto,valorProduto,codFabricante,qtdeProduto from tbProduto
    where codFabricante = 1 and valorProduto <= 1.0

/*o)	a média dos preços agrupados pelo código do fabricante*/
select AVG (valorProduto) from tbProduto
    group by codFabricante

/*p)a soma das vendas agrupadas pelo código do vendedor*/
select SUM (valorVenda)from tbVenda
    group by codVendedor

/*q)As somas das vendas somente do mês de fevereiro */
select SUM (valorVenda) from tbVenda
     where datepart(month,dataVenda) = 02

/*r)	As médias das vendas do ano de 2017*/
select AVG(valorVenda)from tbVenda

/*s)	A quantidade de itens no estoque que sejam da Unilever */  
select SUM (qtdeProduto)from tbProduto
   where codFabricante = 1

