use bdEstoque
go

/*1*/
select descricaoPro as 'descricao Produto' ,SUM(quantidadePro*valorPro)as 'soma quantidade Produto' from tbProduto
group by descricaoPro

/*2*/
select SUM(valorTotal)as 'Soma Valor Venda agrupados pela data Venda',dataVenda as 'Venda' from tbVenda
   group by dataVenda

/*3*/
select SUM (quantidadePro)as 'Soma Quantidade Produto agrupados pelo nome Fabricante' from tbProduto
    inner join tbFabricante on tbProduto.codProduto = tbFabricante.codFabricante
	group by nomeFabricante

/*4*/
select SUM (valorTotal)as'Soma Valor Venda Agrupado pela descricao do Produto ' from tbVenda
    inner join tbProduto on tbVenda.codVenda = tbProduto.codProduto
	group by descricaoPro

/*5*/
select SUM (valorTotal)as 'Soma Valor Venda agrupados pelo nome Cliente' from tbVenda
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente	
	group by nomeCliente

/*6*/
select SUM (valorTotal)as'Soma Valor Venda agrupados pelo nome Fabricante ' from tbVenda
    inner join tbFabricante on tbVenda.codVenda = tbFabricante.codFabricante	
	group by nomeFabricante

/*7*/
select AVG (valorTotal)as'Media valor Venda agrupados pelo nome Cliente'from tbVenda
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	group by nomeCliente

/*8*/
select SUM (valorTotal)as 'Soma valor Venda agrupados pelo nome Cliente' ,nomeCliente from tbVenda
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	group by nomeCliente

/*9*/
select COUNT (dataVenda)as 'quantidade de vendas agrupados por nome cliente' ,nomeCliente from tbVenda
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	group by nomeCliente

/*10*/
select SUM(valorTotal)as 'Soma valor total de clientes nascidos antes de 1980'from tbVenda
   inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
   where datepart(year,dataNas) < 1980

/*11*/
select AVG (valorTotal) as 'media valor total agrupados pelo nome do Fabricante' from tbVenda
    inner join tbFabricante on tbVenda.codVenda = tbFabricante.codFabricante
	group by nomeFabricante

/*12*/
select COUNT (valorTotal)as 'quantidade valor Venda agrupados pelo nome Fabricante' from tbVenda
      inner join tbFabricante on tbVenda.codVenda = tbFabricante.codFabricante
	  group by nomeFabricante 

/*13*/
select AVG (valorTotal)as 'Média valor Venda agrupado pelo nome Fornecedor ' from tbVenda
     inner join tbFornecedor on tbVenda.codVenda=tbFornecedor.codFornecedor
	 group by nomeFornecedor

/*14*/
select valorTotal as 'Valor Total', nomeCliente as 'Nome Cliente' from tbVenda 
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	where datepart(year,dataNas) < 1990

/*15*/
select valorTotal as 'Valor Total',nomeCliente as 'Nome Cliente' from tbVenda
    inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	where datepart(month,dataNas) = 02 

/*16*/
select SUM(valorTotal)as 'Soma valor venda agrupados pelo fornecedor de codigo 1' from tbVenda
     inner join tbFornecedor on tbVenda.codVenda = tbFornecedor.codFornecedor
	 where codFornecedor = 1 
	 group by codFornecedor 

/*17*/
select COUNT(valorTotal)as 'Quantidade de vendas agrupadas pelo codigo fornecedor' from tbVenda
     inner join tbFornecedor on tbVenda.codVenda = tbFornecedor.codFornecedor
	 group by nomeFornecedor

/*18*/
select SUM(valorTotal)as 'Soma das vendas agrupadas pelo fornecedor 1 e 2'from tbVenda
     inner join tbFornecedor on tbVenda.codVenda = tbFornecedor.codFornecedor
	 where codFornecedor = 1 or codFornecedor = 2
	 group by codFornecedor

/*19*/
select SUM(valorTotal)as 'valor Venda',nomeFornecedor'nome Fornecedor' from tbVenda
       inner join tbFornecedor on tbVenda.codVenda = tbFornecedor.codFornecedor
	   where nomeFornecedor like '%A'
	   group by nomeFornecedor

/*20*/
select AVG(ValorTotal)as 'Media do valor venda de cliente que nasceram antes de 1995' from tbVenda
     inner join tbCliente on tbVenda.codVenda = tbCliente.codCliente
	 where datepart(year,dataNas) < 1995


