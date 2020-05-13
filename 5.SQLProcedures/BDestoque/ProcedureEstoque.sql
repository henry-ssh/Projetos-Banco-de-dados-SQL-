/*exercicio de procedure 1 criar uma procedure para inserir novos clientes verificando pelo cpf se o cliente ja esta cadastrado */
/*exercicio de procedure 2 criar uma procedure para que ao ter informado o cpf do cliente , uma data inicial e uma data final informe a somatoria das vendas do cliente no periodo fornecido*/
/*exercicio de procedure 3 criar uma procedure ao ser passado o nome do fabricante informe o valor total em estoque (tbproduto) que o fabricante possui*/
/*exercicio de procedure 4 criar uma procedure que dada a descrição de um produto informe quantas unidades do produto foram vendidas*/
use bdEstoque
go

create procedure insertClient @nomeCliente varchar(30),@cpfCliente varchar(30),@emailCliente varchar(40),@sexo varchar(1),@dataNas smalldatetime
AS
begin 
    if exists(select cpfCliente from tbCliente where cpfCliente = @cpfCliente)
	begin 
	    print('o cliente ja existe no banco de dados')
	end
	else
	begin
	    insert into tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNas)
		values(@nomeCliente,@cpfCliente,@emailCliente,@sexo,@dataNas)
		print ('cliente cadastrado com sucesso')
	end
end

create procedure qtitemvenda12 @cpfCliente varchar(30),@datainic smalldatetime , @datafim smalldatetime 
AS
begin
    declare @codCliente int
	set @codCliente = (select codCliente from tbCliente where cpfCliente = @cpfCliente)
	print(@codCliente)
    select SUM(valorTotal) from tbVenda
	where codCliente = @codCliente  and dataVenda between @datainic and @datafim 
end


create procedure verfabricante6 @nomefabricante varchar(30)
AS
begin
    declare @codfabri int
    set @codfabri = (select codfabricante from tbFabricante where nomeFabricante like @nomefabricante)
	print (@codfabri)
	select SUM(quantidadePro)from tbProduto
	where codFabricante like @codfabri
end 

create procedure qtProduto @descriProduto varchar(50)
AS
begin
    declare @codproduto int
	set @codproduto = (select codproduto from tbProduto where descricaoPro = @descriProduto)
	
	select SUM(quantidadeitens) from tbItensVenda
	where codProduto = @codproduto
end

EXEC insertClient 'Bolsonaro','22345678900','Bolsonaro@gmail.com','M','12/03/2013'
EXEC qtitemvenda12'12345678900','01/02/2014','05/05/2014'
EXEC verfabricante6 'Unilever'
EXEC qtProduto 'Amaciante downy'

