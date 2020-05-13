use bdConfeitaria
go

/*new*/
/**1 - Procedure para inserir categorias de produto **/

CREATE PROCEDURE insere_categoriaproduto2 @categoria varchar(30)
AS
begin
    declare @codCategoriaProduto int
    if exists(select nomeCategoriaProduto from tbCategoriaProduto where nomeCategoriaProduto like @categoria  )
    begin
        print('não eh possivel cadastrar essa categoria pois ela ja existe')
    end
    
    else
    begin
        insert into tbCategoriaProduto(nomeCategoriaProduto)
        values(@categoria)
        set @codCategoriaProduto = (select max(@codCategoriaProduto)from tbProduto)
        print('Categoria Produto '+@categoria+' foi cadastrado com sucesso com o codigo '+convert(varchar (5),@codCategoriaProduto ))
    end
end

/**2 - Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado **/

CREATE PROCEDURE insere_produto @produto varchar(30),@valor smallmoney ,@codCategoriaProduto int
AS
begin
    declare @codProduto int
    if exists(select nomeProduto from tbProduto where nomeProduto like @produto  )
    begin
        print('não eh possivel cadastrar esse produto pois pois ele ja existe')
    end
    
    else
    begin
        insert into tbProduto(nomeProduto,precoKiloProduto,codCategoriaProduto)
        values(@produto,@valor,@codCategoriaProduto)
        set @codProduto = (select max(@codProduto)from tbProduto)
        print(' Produto '+@produto+' foi cadastrado com sucesso com o codigo '+convert(varchar (5),@codProduto ))
    end
end

/**3 - Criar uma stored procedure para cadastrar clientes **/
CREATE PROCEDURE insere_Cliente8 @nome varchar(60),@dataNasc varchar(50) ,@cpfCliente varchar(30),@bairro varchar(30),@ruaCliente varchar(30),@sexoCliente varchar(2),@numCasaCliente int,@cepCliente varchar(30),@cidade varchar(30),@es varchar(2)
AS
begin
    declare @codCliente int
    if exists(select cpfCliente from tbCliente where cpfCliente like @cpfCliente  ) or @bairro = 'Guaianazes' or @bairro = 'Itaquera'
    begin
        print('não eh possivel cadastrar esse cliente pois ele ja existe ou mora em guianazes ou itaquera (dois lugares que não são atendidos pela confeitaria)')
    end
    
    
    else
    begin
        insert into tbCliente(nomeCliente,dataNascCliente,cpfCliente,bairroCliente,ruaCliente,sexoCliente,numCasaCliente,cepCliente,cidadeCliente,estadoCliente )
        values(@nome,@dataNasc,@cpfCliente,@bairro,@ruaCliente,@sexoCliente,@numCasaCliente,@cepCliente,@cidade,@es )
        set @codCliente = (select max(@codCliente)from tbCliente)
        print(' O cliente e os seus dados foram armazenados com sucesso  '+@nome+'cliente foi armazenado com o codigo '+convert(varchar (5),@codCliente ))
    end    
end
/*
CREATE PROCEDURE insere_Cliente6 @nome varchar(60),@dataNasc varchar(50) ,@ruaCliente varchar(70),@numCasaCliente int,@cepCliente varchar(67), @bairro varchar(50),@sexoCliente varchar(6),@cpfCliente varchar(20)
AS
begin
    declare @codCliente int
    if exists(select cpfCliente from tbCliente where cpfCliente like @cpfCliente  ) or @bairro = 'Guaianazes' or @bairro = 'Itaquera'
    begin
        print('não eh possivel cadastrar esse cliente pois ele ja existe ou mora em guianazes ou itaquera (dois lugares que não são atendidos pela confeitaria)')
    end
    
    
    else
    begin
        insert into tbCliente(nomeCliente,dataNascCliente,ruaCliente,numCasaCliente,cepCliente,bairroCliente,sexoCliente,cpfCliente)
        values(@nome,@dataNasc,@ruaCliente,@numCasaCliente,@cepCliente,@bairro,@sexoCliente,@cpfCliente)
        set @codCliente = (select max(@codCliente)from tbCliente)
        print(' O cliente e os seus dados foram armazenados com sucesso  '+@nome+'cliente foi armazenado com o codigo '+convert(varchar (5),@codCliente ))
    end    
end
*/

/**4 - Criar uma stored procedure para encomendas**/
CREATE PROCEDURE encomenda2 @cpfCliente varchar (30),@dataEncomenda smalldatetime ,@valorTotalEncomenda smallmoney,@dataEntregaEncomenda smalldatetime,@codCliente int,@quanti int,@produto int,@subtotal int
AS
begin 
    declare @codItem int
    declare @codEncomenda int
    if not exists(select cpfCliente from tbCliente where cpfCliente like @cpfCliente) or @dataEncomenda < GETDATE()
    begin
        print('não eh possivel realizar a encomenda pois o cliente eh inexistente no banco de dados ou a realização da encomenda foi realizada em uma data menor do que a atual')
    end
    
    else
    begin 
        insert into tbEncomenda(dataEncomenda,codCliente,valorTotalEncomenda,dataEntregaEncomenda)
        values(@dataEncomenda,@codCliente,@valorTotalEncomenda,@dataEntregaEncomenda)
		
        set @codEncomenda = (select max(@codEncomenda)from tbEncomenda)
        print('Encomenda criada com sucesso')

		insert into tbItensEncomenda(codEncomenda,codProduto,quantidadeKilos,subTotal)
		values(@codEncomenda,@produto,@quanti,@subtotal)

		set @codItem = (select max(@codItem)from tbItensEncomenda)
		



    end
end

/*5 - Procedures para alteração de preços */
CREATE PROCEDURE aumentaPreco @novoval smallmoney,@produto varchar(30)
AS
begin 
    update tbProduto set precoKiloProduto= (precoKiloProduto+(precoKiloProduto*@novoval)/100) from tbProduto
    where nomeProduto = @produto
	print('preço alterado com sucesso')
end

CREATE PROCEDURE descontoPreco @novoval smallmoney,@produto varchar(30)
AS
begin 
    update tbProduto set precoKiloProduto= (precoKiloProduto-(precoKiloProduto*@novoval)/100) from tbProduto
    where nomeProduto = @produto
	print('preço alterado com sucesso')
end

/*6 - Procedure para exclusão de Clientes*/
CREATE PROCEDURE excluiClientes @nomeCliente varchar(30),@codCliente int
AS
begin
    if exists(select codCliente from tbEncomenda where codCliente = @codCliente )
	begin
	   print('não eh possivel excluiro cliente pois ele tem uma encomenda')
	end
    else
	begin
	    delete from tbCliente
		where codCliente = @codCliente
	    print('cliente excluido com sucesso')
	end
end
/*7 - Procedure para exclusão de encomendas*/
CREATE PROCEDURE excluiEncomenda @dataEntrega smalldatetime ,@codEncomenda int 
AS
begin
    if @dataEntrega < GETDATE() 
	begin
	   delete from tbEncomenda
	   where codEncomenda = @codEncomenda
	   delete from tbItensEncomenda
	   where codItensEncomenda = @codEncomenda
	   PRINT('encomenda excluida com sucesso')
	end

	else
	begin
	    print('não foi possivel realizar a exclusao')
	end 
end


/*1 - EXECUTION - Procedure para inserir categorias de produto*/
EXEC insere_categoriaproduto2 'BoloFesta'
EXEC insere_categoriaproduto2 'BoloSimples'
EXEC insere_categoriaproduto2 'Torta'
EXEC insere_categoriaproduto2 'Salgado'

/*2 - EXECUTION - Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado */
EXEC insere_produto 'Bolo Floresta negra' , 42.00,1
EXEC insere_produto 'Bolo Prestigio ',43.00,1
EXEC insere_produto 'Bolo Nutella',44.00,1
EXEC insere_produto 'Bolo Formigueiro',17.00,2
EXEC insere_produto 'Bolo de Cenoura',19.00,2
EXEC insere_produto 'Torta de Palmito',45.00,3
EXEC insere_produto 'Torta de frango e catupiry',47.00,3
EXEC insere_produto 'Torta de escarola',44.00,3
EXEC insere_produto 'Cozinha frango',25.00,4
EXEC insere_produto 'Esfiha Carne',27.00,4
EXEC insere_produto 'Folhada queijo',31.00,4
EXEC insere_produto 'Risoles Misto',29.00,4


/*
EXEC insere_Cliente6 'Samira Fatah','1990/05/05','Rua Aguapei',1000,'08.090-000','Guaianazes','F',''
EXEC insere_Cliente6 'Celia Nogueira','1992/06/06','Rua Andes',234,'08.456-090','Ferraz','F',''
EXEC insere_Cliente6 'Paulo Cesar Siqueira','1984/04/04','Rua Castelo',232,'08.109-000','Itaquere','M',''
EXEC insere_Cliente6 'Rodrigo Favonni','1991/04/09','Rua sansao Castelo Branco',10,'04.431-000','Guaianazes','M',''*/

/*3 - EXECUTION - Criar uma stored procedure para cadastrar clientes  */

EXEC insere_Cliente8 'Flavia regina erito', '2000/03/10','12345678900','Ferraz','Rua Mariano Moro','F',200,'22.876-000','são paulo','SP'
EXEC insere_Cliente8 'Rodrigo Favonni','1991/04/09','45678909823','Ferraz','Rua Sansão Castelo Branco','M',23,'25.654-00','são paulo','SP'
EXEC insere_Cliente8 'Celia Nogueira','1992/06/06','76598278299','Guaianazes','Rua Andes','F',45,'45.654-765','são paulo','SP'
EXEC insere_Cliente8 'Paulo Cesar Siqueira','1984/04/04','87365309899','Osasco','Rua Castelo','F',65,'12.765-00','são paulo','SP'
EXEC insere_cliente8 'Samira fatah','1990/05/05','76354309388','Guaianazes','Rua Aguapei','F',54,'12.656-000','são paulo','SP'
EXEC insere_Cliente8 'Alexia Pereira','2002/04/05','12345678912','Penha','Rua Aguapei','F',78,'12.541-000','são paulo','SP'
EXEC insere_Cliente8 'Leonardo Amancio da silva','2003/04/02','24582907641','Liberdade','Rua Irineu','M',54,'38.098-000','são paulo','SP'


/*4 - EXECUTION - Criar uma stored procedure para encomendas */
EXEC encomenda2 '12345678900','08/08/2019',430.00,'15/09/2019',1,200,2,300
EXEC encomenda2 '45678909823','10/12/2040',200.00,'15/12/2050',5,300,3,200
EXEC encomenda2 '24582907641','10/10/2015',200.00,'15/08/2015',3,200,4,120


/*5 - EXECUTION - Procedures para alteração de preços */
/*aumentar o preço*/
EXEC aumentaPreco 45.00,'Bolo Floresta negra'

/*fazer desconto do preço*/
EXEC descontoPreco 45.00,'Bolo Floresta negra'

/*6 - EXECUTION - Procedure para exclusão de clientes */
EXEC excluiClientes 'Flavia regina erito' ,1
EXEC excluiClientes 'Flavia regina erito' ,2
EXEC excluiClientes 'Flavia regina erito' ,7

/*7 - EXECUTION - Procedure para exclusão de encomendas*/
EXEC excluiEncomenda '15/10/2015',3

select * from tbCliente
select * from tbEncomenda
select* from tbCliente
select * from tbItensEncomenda
select * from tbProduto