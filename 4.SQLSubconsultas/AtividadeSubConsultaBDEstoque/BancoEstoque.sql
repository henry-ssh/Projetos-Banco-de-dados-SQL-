create database bdEstoque
go 
use bdEstoque

create table  tbCliente(
    codCliente int primary key identity (1,1)
	,nomeCliente varchar (30) not null
	,cpfCliente varchar (30) not null
	,emailCliente varchar (30) not null
	,sexoCliente varchar (1) not null
	,dataNas datetime not null

)
create table tbVenda(
    codVenda int primary key identity (1,1)
	,dataVenda datetime not null
	,valorTotal money not null
	,codCliente int foreign key references tbCliente(codCliente)
)
create table tbFabricante(
    codFabricante int primary key identity (1,1)
	,nomeFabricante varchar (30) not null
)
create table tbFornecedor(
    codFornecedor int primary key identity (1,1)
	,nomeFornecedor varchar (30) not null
	,contatoFornecedor varchar (30) not null
)
create table tbProduto(
    codProduto int primary key identity (1,1)
	,descricaoPro varchar (30) not null
	,valorPro money not null
	,quantidadePro int not null
	,codFabricante int foreign key references tbFabricante(codFabricante)
	,codFornecedor int foreign key references tbFornecedor(codFornecedor)	
)
create table tbItensVenda(
    codItensVenda int primary key identity(1,1)
    ,codVenda int foreign key references tbVenda(codVenda)
	,codProduto int foreign key references tbProduto(codProduto)
	,quantidadeItens int not null
	,subTotalitens int not null
)