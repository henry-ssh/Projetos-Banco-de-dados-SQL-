use BDescola
go

select nomeAluno,rgAluno,dataNascimento from BDescola.dbo.tbAluno
    where naturalidade like '%SP%'

select nomeAluno,rgAluno from BDescola.dbo.tbAluno
    where nomeAluno like 'P%'

select nomeCurso from BDescola.dbo.tbCurso
    where cargaHoraria > 2000

select nomeAluno,rgAluno from BDescola.dbo.tbAluno
    where nomeAluno = '%Silva%'	
	
select nomeAluno from BDescola.dbo.tbAluno
    where codAluno = '3'

select codAluno,dataMatricula from BDescola.dbo.tbMatricula
    where codMatricula = '1'

select codAluno,dataMatricula from BDescola.dbo.tbMatricula
    where codMatricula = '3'

select codAluno,dataMatricula from BDescola.dbo.tbMatricula
    where codMatricula = '4'

select codAluno from BDescola.dbo.tbMatricula
    where codTurma = '1'

select codAluno from BDescola.dbo.tbMatricula
    where codTurma = '2'

select codAluno from BDescola.dbo.tbMatricula
    where codTurma = '3'

select codAluno,nomeAluno,rgAluno,dataNascimento,naturalidade from BDescola.dbo.tbAluno

select codTurma,nomeTurma,codCurso from BDescola.dbo.tbMatricula
 