create database bdConfeitaria
go
use bdConfeitaria

create table tbCliente(
    codCliente int primary key identity(1,1)
    ,nomeCliente varchar(70)
    ,dataNascCliente varchar(70) 
    ,ruaCliente varchar(60) 
    ,numCasaCliente int 
    ,cepCliente varchar(68)
    ,bairroCliente varchar(60)
    ,cidadeCliente varchar(65) 
    ,estadoCliente varchar(20) 
    ,cpfCliente varchar(30) 
    ,sexoCliente varchar(2)
)

create table tbEncomenda(
    codEncomenda int primary key identity(1,1)
    ,dataEncomenda smalldatetime not null
    ,codCliente int foreign key references tbCliente(codCliente)
    ,valorTotalEncomenda smallmoney not null
    ,dataEntregaEncomenda smalldatetime not null
    
)

create table tbCategoriaProduto(
     codCategoriaProduto int primary key identity(1,1)
     ,nomeCategoriaProduto varchar(30)  not null  
)

create table tbProduto(
     codProduto int primary key identity(1,1)
     ,nomeProduto varchar(30) not null
     ,precoKiloProduto smallmoney not null
     ,codCategoriaProduto int foreign key references tbCategoriaProduto(codCategoriaProduto)
)
create table tbItensEncomenda(
    codItensEncomenda int primary key identity(1,1)
    ,codEncomenda int foreign key references tbEncomenda(codEncomenda)
    ,codProduto int foreign key references tbProduto(codProduto)
    ,quantidadeKilos int not null
    ,subTotal int not null
)