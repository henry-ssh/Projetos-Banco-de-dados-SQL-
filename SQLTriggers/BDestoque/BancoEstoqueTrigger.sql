create database bdEstoque
go 
use bdEstoque

create table  tbCliente(
    codCliente int primary key identity (1,1)
	,nomeCliente varchar (30) 
	,cpfCliente varchar (30) 
	,emailCliente varchar (30) 
	,sexoCliente varchar (1) 
	,dataNas smalldatetime 

)
create table tbVenda(
    codVenda int primary key identity (1,1)
	,dataVenda smalldatetime 
	,valorTotal money 
	,codCliente int foreign key references tbCliente(codCliente)
)
create table tbFabricante(
    codFabricante int primary key identity (1,1)
	,nomeFabricante varchar (30) 
)
create table tbFornecedor(
    codFornecedor int primary key identity (1,1)
	,nomeFornecedor varchar (30)
	,contatoFornecedor varchar (30)
)
create table tbProduto(
    codProduto int primary key identity (1,1)
	,descricaoPro varchar (30)
	,valorPro money 
	,quantidadePro int 
	,codFabricante int foreign key references tbFabricante(codFabricante)
	,codFornecedor int foreign key references tbFornecedor(codFornecedor)	
)
create table tbItensVenda(
    codItensVenda int primary key identity(1,1)
    ,codVenda int foreign key references tbVenda(codVenda)
	,codProduto int foreign key references tbProduto(codProduto)
	,quantidadeItens int
	,subTotalitens int
)
create table tbSaidaProduto(
codSaidaProduto int primary key identity(1,1)
,dataSaidaProduto smallDateTime
,codProduto int foreign key references tbProduto(codProduto)
,quantidadeSaidaProduto smallint 
)

create table tbEntradaProduto(
codEntradaProduto int primary key identity(1,1)
,dataEntradaProduto smallDateTime
,codProduto int foreign key references tbProduto(codProduto)
,quantidadeEntradaProduto smallint 
) 