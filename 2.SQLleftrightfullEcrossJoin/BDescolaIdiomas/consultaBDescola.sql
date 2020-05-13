use BDescolaIdioma
go

/*1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem*/
select  nomeAluno as 'nome Aluno',nomeCurso as 'nome curso' from tbAluno
     inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
	   inner join tbTurma on tbMatricula.codMatricula = tbTurma.codTurma
	     inner join tbCurso on tbTurma.codTurma = tbCurso.codCurso


/*2)  Apresentar a quantidade de alunos matriculados por nome do curso*/
select COUNT(nomeAluno) as 'nome Aluno',nomeCurso as 'nome curso'from tbAluno
     inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
	   inner join tbTurma on tbMatricula.codMatricula = tbTurma.codTurma
	     inner join tbCurso on tbTurma.codTurma = tbCurso.codCurso
		 group by nomeCurso

/*3) Apresentar a quantidade de alunos matriculados por nome da turma*/     
select COUNT (nomeAluno) as 'nome Aluno',nomeTurma as 'nome turma'from tbAluno
     inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
	   inner join tbTurma on tbMatricula.codMatricula = tbTurma.codTurma
	   group by nomeTurma

/*4)  Apresentar a quantidade de alunos que fizeram matricula em maio de 2016*/
select COUNT (nomeAluno) as 'nome Aluno'from tbAluno
     inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
	 where datepart(year,dataMatricula) = 2016

/*5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas em que estão matriculados */
select nomeAluno as 'nome Aluno',nomeTurma as 'nome turma'from tbAluno
     inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
	   inner join tbTurma on tbMatricula.codMatricula = tbTurma.codTurma
	   order by nomeAluno

/*6) Apresentar o nome dos cursos e os horários em que eles são oferecidos */
select nomeCurso as 'nomeCurso' ,horario as 'horario' from tbCurso
       inner join tbTurma on tbCurso.codCurso = tbturma.codTurma
	      inner join tbMatricula on tbTurma.codTurma = tbMatricula.codMatricula

/*7)  Apresentar a quantidade de alunos nascidos por estado */		
/*SP*/
select COUNT(nomeAluno) as 'nascidos em SP'from tbAluno
    where Naturalidade like '%SP%'
/*RJ*/
select COUNT(nomeAluno) as 'nascidos em RJ'from tbAluno
    where Naturalidade like '%RJ%'
/*ES*/
select COUNT(nomeAluno) as 'nascidos em ES'from tbAluno
    where Naturalidade like '%ES%'
/*PE*/
select COUNT(nomeAluno) as 'nascidos em PE'from tbAluno
    where Naturalidade like '%PE%'

/*8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa */
select nomeAluno as 'nome Aluno',dataMatricula from tbAluno
	      inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula

/*9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês */
select nomeAluno as 'nome Aluno',codTurma from tbAluno
        inner join tbMatricula on tbAluno.codAluno = tbMatricula.codMatricula
		where nomeAluno like '%A' and codTurma = 1 or codTurma = 3

/*10) Apresentara quantidade de matriculas feitas no ano de 2016*/
select COUNT(dataMatricula) from tbMatricula
       where datepart(year,dataMatricula) = 2016