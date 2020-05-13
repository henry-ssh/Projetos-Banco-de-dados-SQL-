create database bdBanco
go 
use bdBanco

create table tbCliente(
codCliente int primary key identity(1,1)
,nomeCliente varchar(400) not null
,cpfCliente varchar(400) null
)
create table tbContaCorrente(
numConta int primary key identity(1,1)
,saldoConta smallmoney not null
,codCliente int foreign key references tbCliente(codCliente)
)
create table tbDeposito(
codDeposito int primary key identity(1,1)
,valorDeposito smallmoney not null
,numConta int foreign key references tbContaCorrente(numConta)
,dataDeposito date not null
,horaDeposito time not null
)
create table tbSaque(
codSaque int primary key identity(1,1)
,valorSaque smallmoney not null
,numConta int foreign key references tbContaCorrente(numConta)
,dataSaque date not null
,horaSaque time not null
)

insert into tbCliente(nomeCliente,cpfCliente)
values('erisvaldo ','12345678900')

insert into tbContaCorrente(saldoConta,codCliente)
values(230.00,1)

insert into tbDeposito(valorDeposito,numConta,dataDeposito,horaDeposito)
values(210.00,1,'12/03/2015','15:34:00')

/*CREATE TRIGGER tgAtualizaProduto3
ON tbItensVenda
after INSERT
AS
BEGIN
DECLARE @codProduto int,@Qtproduto int
set @codProduto = (select codProduto from inserted)
set @Qtproduto = (select quantidadeItens from inserted)
insert into tbSaidaProduto(dataSaidaProduto,codProduto ,quantidadeSaidaProduto)
VALUES (GETDATE(),@codProduto,@Qtproduto)
END*/
/*1*/
CREATE TRIGGER tgAtualizaSaldo
ON tbDeposito
after INSERT
AS
begin
DECLARE @numConta int,@valor SMALLMONEY 
set @numConta = (select numConta from inserted)
set @valor = (select valorDeposito from inserted)
update tbContaCorrente
set saldoConta = saldoConta + @valor
where numConta = @numConta
END
GO
/*2*/
CREATE TRIGGER tgAtualizaSaque
ON tbSaque
after INSERT
AS
begin
DECLARE @valorSaque smallmoney,@numConta int
set @valorSaque = (select valorSaque from inserted)
set @numConta = (select numConta from inserted)
update tbContaCorrente
set saldoConta = saldoConta - @valorSaque
where @numConta = @numConta
END
GO

insert into tbDeposito(valorDeposito,numConta ,dataDeposito,horaDeposito)
values(500.00,1,GETDATE(),'12:05:00')
select * from tbContaCorrente

insert into tbSaque(valorSaque,numConta,dataSaque,horaSaque )
values(400.00,1,GETDATE(),'12:05:00')