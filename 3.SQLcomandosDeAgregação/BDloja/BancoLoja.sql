create database BDloja
go 
use BDloja

create table tbVendedor(
codVendedor int primary key identity(1,1)
,nomeVendedor varchar(30) not null
,endVendedor varchar(30) not null
,CPFVendedor varchar(30) not null
)

create table tbCliente(
codCliente int primary key identity(1,1)
,nomeCliente varchar(30) not null
,CPFCliente varchar(30) not null
,emailCliente varchar(35) not null

)
create table tbVenda(
codVenda int primary key identity(1,1)
,codCliente int foreign key references tbCliente(codCliente) 
,codVendedor int foreign key references tbVendedor(codVendedor) 
,dataVenda smalldatetime not null
,valorVenda smallmoney not null
)
create table tbFabricante(
codFabricante int primary key identity(1,1)
,nomeFabricante varchar(30)
)
create table tbProduto(
codProduto int primary key identity(1,1)
,nomeProduto varchar(30)not null
,codFabricante int foreign key references tbFabricante(codFabricante)
,valorProduto smallmoney not null
,qtdeProduto int not null
)
create table tbItensVenda(
codVenda int foreign key references tbVenda(codVenda)
,codProduto int foreign key references tbProduto(codProduto)
,qtdeProduto int not null
)