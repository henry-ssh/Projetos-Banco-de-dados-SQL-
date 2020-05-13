use bdEstoque
go
/*
select codProduto,descricaoPro,nomefabricante from tbProduto
    inner join tbFabricante on tbProduto.codProduto = tbFabricante.codFabricante
    where valorPro = (select MAX (valorPro) from tbProduto)
    

select descricaoPro,nomefabricante from tbProduto
    inner join tbFabricante on tbProduto.codProduto = tbFabricante.codFabricante
    where valorPro > (select AVG (valorPro) from tbProduto)
    
*/
select codProduto,descricaoPro, nomeFabricante  from tbProduto
 inner join tbFabricante on tbProduto.codFabricante = tbFabricante.codFabricante
 where valorPro = (select Max(valorPro)from tbProduto)

 select codProduto, nomeFabricante  from tbProduto
 inner join tbFabricante on tbProduto.codFabricante = tbFabricante.codFabricante
 where valorPro > (select AVG(valorPro)from tbProduto)

select nomeCliente,valorTotal from tbCliente
    inner join tbVenda on tbCliente.codCliente = tbVenda.codCliente
    where valorTotal > (select AVG(valorTotal)from tbVenda) 
    
    
select descricaoPro,valorPro from tbProduto
    where valorPro = (select MAX(valorPro) from tbProduto )

select descricaoPro,valorPro from tbProduto 
       where valorPro = (select MIN (valorPro) from tbProduto)
