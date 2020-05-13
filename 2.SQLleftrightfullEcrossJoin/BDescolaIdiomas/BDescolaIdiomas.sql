create database BDescolaIdioma
go
use BDescolaIdioma

create table tbAluno(
codAluno int primary key identity(1,1)
,nomeAluno varchar (30) not null
,dataNasci smalldatetime not null
,rgAluno varchar (15) not null
,Naturalidade varchar(25) not null

) 

create table tbCurso(
codCurso int primary key identity (1,1)
,nomeCurso varchar(30) not null
,cargaHoraria int not null
,valorCurso smallmoney  not null
)
create table tbPeriodo(
codPeriodo int primary key identity(1,1)
,descricaoPeriodo varchar(30)
)
create table tbNivel(
codNivel int primary key identity(1,1)
,descricaoNivel varchar(30)
)
create table tbTurma(
codTurma int primary key identity (1,1)
,nomeTurma varchar(30) not null
,codCurso int foreign key references tbCurso(codCurso) 
,horario varchar(25) not null
)

create table tbMatricula(
codMatricula int primary key identity (1,1)
,dataMatricula datetime not null
,codAluno int foreign key references tbAluno(codAluno)not null
,codTurma int foreign key references tbTurma(codTurma)not null
)
