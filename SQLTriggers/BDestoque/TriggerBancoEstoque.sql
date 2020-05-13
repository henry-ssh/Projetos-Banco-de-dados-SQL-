use bdEstoque
go
select * from tbItensVenda
select * from tbCliente
select * from tbSaidaProduto
select * from tbEntradaProduto
select * from tbFabricante
select * from tbFornecedor
select * from tbProduto

/*1*/
CREATE TRIGGER tgAtualizaProduto
ON tbItensVenda
after INSERT
AS
BEGIN
DECLARE @codProduto int,@Qtproduto int 
set @codProduto = (select codProduto from inserted)
set @Qtproduto = (select quantidadeItens  from inserted)
update tbProduto
set quantidadePro = quantidadePro - @Qtproduto
where codProduto = @codProduto
END
GO


insert into tbItensVenda(codVenda,codProduto,quantidadeItens,subTotalitens)
values(1,1,500,200)
/*2*/
CREATE TRIGGER tgAtualizaProduto2
ON tbEntradaProduto
after INSERT
AS
BEGIN
DECLARE @codProduto int,@Qtproduto INT
set @codProduto = (select codProduto from inserted)
set @Qtproduto = (select quantidadeEntradaProduto  from inserted)
update tbProduto
set quantidadePro = quantidadePro + @Qtproduto
where codProduto = @codProduto
END
GO

insert into tbEntradaProduto(codProduto,quantidadeEntradaProduto)
values(2,5)

/*3*/
CREATE TRIGGER tgAtualizaProduto3
ON tbItensVenda
after INSERT
AS
BEGIN
DECLARE @codProduto int,@Qtproduto int
set @codProduto = (select codProduto from inserted)
set @Qtproduto = (select quantidadeItens from inserted)
insert into tbSaidaProduto(dataSaidaProduto,codProduto ,quantidadeSaidaProduto)
VALUES (GETDATE(),@codProduto,@Qtproduto)
END
insert into tbItensVenda(codVenda,codProduto,quantidadeItens)
values(1,1,300)
