use BDescolaIdioma
go

select nomeCurso,valorCurso from tbCurso
    where valorCurso < (select AVG(valorCurso) from tbCurso)

select nomeAluno, rgAluno from tbAluno
    where datepart(year,dataNasci) = (select MIN(datepart(year,dataNasci))from tbAluno)

select nomeAluno from tbAluno
    where datepart(year,dataNasci) = (select MAX(datepart(year,dataNasci))from tbAluno)
	
select nomeCurso,valorCurso from tbCurso
    where valorCurso = (select MAX(valorCurso)from tbCurso )
/*
select nomeAluno,nomeCurso from tbAluno
    inner join tbCurso on tbAluno.codAluno = tbCurso.codCurso
       inner join tbMatricula on tbCurso.codCurso = tbMatricula.codMatricula
          where datepart(year,dataMatricula) = (select Max (datepart(year,dataMatricula))from tbMatricula)

select nomeAluno,nomeCurso,dataMatricula from tbAluno
    inner join tbCurso on tbAluno.codAluno = tbCurso.codCurso
       inner join tbMatricula on tbCurso.codCurso = tbMatricula.codMatricula
          where datepart(year,dataMatricula) = (select Min (datepart(year,dataMatricula))from tbMatricula)
*/
select nomeAluno, nomeCurso from tbAluno
    inner join tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	 inner join tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	  inner join tbCurso on tbTurma.codCurso = tbCurso.codCurso
	   where dataMatricula =(select max(dataMatricula) from tbMatricula)

select nomeAluno, nomeCurso from tbAluno
    inner join tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	 inner join tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	  inner join tbCurso on tbTurma.codCurso = tbCurso.codCurso
	   where dataMatricula =(select min(dataMatricula) from tbMatricula)
	   
select nomeAluno as 'nome Aluno',codTurma from tbAluno
        inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
		where codTurma = 1 or codTurma = 3