use bdEstoque
go

/*realizando a soma das quantidades de produto em estoque*/
select sum (quantidadePro) from tbProduto
    where codFornecedor = '2'
	
/*a media de preços dos produtos que sao da P&G */
select avg (valorPro) from tbProduto
    where codFornecedor = '2'
	
/*soma dos preços dos produtos da unilever*/
select sum (valorPro) from tbProduto
    where codFornecedor = '1'

/*o preço médio dos produtos da Bunge */
select avg (valorPro) from tbProduto
    where codFornecedor = '3'

/*soma da quantidade de todos os produtos que sao da bunge*/
select sum (quantidadePro) from tbProduto
    where codFornecedor = '3'
	
/*o preço medio dos produtos da unilever*/
select avg (valorPro)from tbProduto
    where codFornecedor = '1'
    
/*a quantidade media dos produtos da P&G no estoque*/
select avg (quantidadePro) from tbProduto
    where codFornecedor = '2'

/*o preço  medio dos produtos no estoque cuja quantidade for menor a 200*/
select avg(valorPro) from tbProduto
    where quantidadePro < 2000
	
/*a quantidade de todos os produtos no estoque fabricados pela unilever*/
select sum (quantidadePro)from tbProduto
    where codFornecedor = '1'
	
/*a soma das vendas ocorridas entre fevereiro e março de 2014*/
select sum (valorTotal) from tbVenda 
    where dataVenda between '01/02/2014' and '31/03/2014'
	
/*a soma das quantidades do produto amaciante no estoque*/
select sum(quantidadePro)from tbProduto
    where descricaoPro like '%Amaciante%'

/*o valor do produto mais caro*/
select max (valorPro) from tbProduto

/*o valor do produto mais barato*/
select min (valorPro) from tbProduto

/*o preço médio de todos os produtos no estoque que seja amaciante de qualquer fabricante*/
select avg(valorPro) from tbProduto
    where descricaoPro like '%Amaciante%'

/*quantos itens diferentes existem no estoque*/
select count (descricaoPro) from tbProduto

/*quantos itens no estoque sao da unilever*/
select count (descricaoPro) from tbProduto
    where codFornecedor = '1'
	
/*a soma das qauntidades dos produtos que possuam mais de 800 unidades no estoque*/
select sum (quantidadePro)from tbProduto
    where quantidadePro > 800

/*o preço medio dos produtos que possuam mais de 1000 unidades no estoque e que sejam fabricados pela unilever*/
select avg (valorPro) from tbProduto
    where codFornecedor = '1' and quantidadePro > 1000
	
/*media das vendas ocorridas no ano de 2014*/
select avg (valorTotal)from tbVenda
    where between '01/01/2014' and '31/12/2014'
    