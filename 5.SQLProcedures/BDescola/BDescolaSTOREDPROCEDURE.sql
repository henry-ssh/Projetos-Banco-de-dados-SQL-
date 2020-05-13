use BDescola
go

/*exercicio 1 :: 
Criar uma stored procedue "Busca_ALuno" que receba o codigo do aluno e retorne seu nome e data de nascimento */

CREATE PROCEDURE busca_aluno @codaluno int
AS
begin
select nomeAluno,dataNascimento from tbAluno
where codAluno = @codaluno
end

/*exercicio 2::
Criar uma Stored procedure "Insere_aluno" que Insira um registro na tabela de alunos*/

CREATE  PROCEDURE insere_aluno @nomealuno varchar(30)
AS
begin
insert into tbAluno(nomeAluno)
values(@nomealuno)

/*Selecionar os alunos*/
select * from tbAluno
end

/*exercicio 3::
Criar uma Procedure "Aumenta_preco" que ,dados o nome do cursoe um percentual ,aumente o valor do Curso com a porcentagem informada*/

CREATE  PROCEDURE aumenta_preco @por int ,@nomecurso varchar(30)
AS
begin
update tbCurso set valorCurso = (valorCurso+(valorCurso*@por)/100) from tbCurso
where nomeCurso = @nomeCurso

/*selecionar o novo valor aumentado*/
select valorCurso from tbCurso
where nomeCurso = @nomecurso
end     
     
/*exercicio 4::
Criar uma Stored Procedure "Exibe_Turma que dado o nome da turma exiba todas as informaçoes dela"
*/
CREATE PROCEDURE Exibe_turma @turma varchar(30)
AS
begin
select nomeTurma,codCurso,horarioTurma from tbTurma
where nomeTurma = @turma
end

/*exercicio 5::
Criar uma Stored Procedure "Exibe_AlunosTurma que,dado o nome da turma exiba os seus alunos"*/

CREATE PROCEDURE EXIBE_AlunosTurma @turma varchar(30)
AS
begin
select nomeAluno from tbAluno
       inner join tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	      inner join tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	       where nomeTurma = @turma
end


/*execuçao da procedure do exercicio 1*/
EXEC  busca_aluno 2;
/*execuçao da procedure do exercicio 2*/
EXEC insere_aluno 'tomas';
/*execuçao da procedure do exercicio 3*/
EXEC aumenta_preco 20,'Ingles';
/*execuçao da procedure do exercicio 4*/
EXEC Exibe_turma '1|A';
/*execuçao da procedure do exercicio 5*/
EXEC EXIBE_AlunosTurma '1|A'; 


