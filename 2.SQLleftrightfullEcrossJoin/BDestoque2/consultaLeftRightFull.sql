use bdEstoque
go

select nomeFornecedor,descricaoPro from tbFornecedor
inner join tbProduto on tbFornecedor.codFornecedor = tbProduto.codProduto

select nomeFornecedor,descricaoPro from tbFornecedor
right outer join tbProduto on tbFornecedor.codFornecedor = tbProduto.codProduto

select nomeFornecedor,descricaoPro from tbProduto
left join tbFornecedor on tbFornecedor.codFornecedor = tbProduto.codFornecedor

select nomeFornecedor ,descricaoPro from tbFornecedor
full outer join tbProduto on tbFornecedor.codFornecedor = tbProduto.codFornecedor

select nomeFornecedor ,descricaoPro from tbFornecedor
cross join tbProduto 

/*apáreceu mais de 468 registros obs:cross join eh realmente uma coisa louca*/ 