use BDescolaIdioma
go
insert into tbAluno(nomeAluno,dataNasci,rgAluno,Naturalidade)
values
    ('Paulo Santos','2000/03/10','82.282.122-0','SP')
	,('Maria de Gloria','1995/10/03','45.233.123-0','SP')
	,('Pedro Nogueira da Silva','1998/04/04','23.533.211-0','SP')
	,('Gilson Barros Silva','1995/09/09','34.221.111.-x','PE')
	,('Mariana Barbosa Santos','2001/10/10','54.222.122-9','RJ')
	,('Alessandro Pereira','2003/10/11','24.402.454-9','ES')
	,('Aline Melo','2001/10/08','88.365.012-3','RJ')

insert into tbCurso(nomeCurso,cargaHoraria,valorCurso)
values
    ('Ingles',2000,356.00)
	,('Alemao',3000,478.00)
	,('Espanhol',4000,500.00)

insert into tbTurma(nomeTurma,codCurso,horario)
values 
     ('1|A','1','12:00:00')
	 ,('1|C','3','18:00:00')
	 ,('1|B','1','18:00:00')
	 ,('1AA','2','19:00:00')


insert into tbMatricula(dataMatricula,codAluno,codTurma )
values
    ('2015/10/03',1,1)
	,('2014/05/04',2,1)
	,('2014/05/04',2,4)
	,('2012/05/03',3,2)
	,('2016/03/03',1,3)
	,('2015/05/07',4,2)
	,('2015/07/05',4,3)

select distinct * from tbAluno
select distinct * from tbCurso
select * from tbMatricula
select *from tbTurma
