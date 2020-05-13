create database BDescola
go
use BDescola

create table tbCurso(
    codCurso int primary key identity(1,1)
	,nomeCurso varchar(30) not null
	,cargaHoraria int not null
	,valorCurso smallmoney not null
)
create table tbTurma(
    codTurma int primary key identity(1,1)
	,nomeTurma varchar (30) not null
	,codCurso int foreign key references tbCurso(codCurso)
	,horarioTurma smalldatetime not null
	
)
create table tbAluno(
    codAluno int primary key identity(1,1)
	,nomeAluno varchar(30) not null
	,dataNascimento datetime not null
	,rgAluno varchar(30) not null
	,naturalidadeAluno varchar(2)not null
    
)
create table tbMatricula(
    codMatricula int primary key identity(1,1)
	,dataMatricula datetime not null
	,codAluno int foreign key references tbAluno(codAluno)not null
	,codTurma int foreign key references tbTurma(codTurma)not null
)