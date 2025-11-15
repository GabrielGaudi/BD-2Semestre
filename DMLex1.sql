use dbdistribuidora;

/*exercicio 1*/
insert into tbfornecedor(Codigo, Nome, CNPJ, Telefone) values
(1, "Revenda Chico Loco", 1245678937123, 11934567897),
(2, "José Faz Tudo S/A", 1345678937123, 11934567898),
(3, "Vadalto Entregas", 1445678937123, 11934567899),
(4, "Astrogildo das Estrelas", 1545678937123, 11934567800),
(5, "Amoroso e Doce", 1645678937123, 11934567801),
(6, "Marcelo Dedal", 1745678937123, 1193457802),
(7, "Franciscano Cachaça", 1845678937123, 11934567803),
(8, "Joãozinho Chupeta", 1945678937123, 11934567804);

/*exercicio 2*/
Delimiter $$
create procedure inserirCidade(Id int, Cidade varchar(200))
begin
insert into tbcidade(CidadeId, Cidade) value(Id, Cidade);
end $$

call inserirCidade(1,"Rio de Janeiro");
call inserirCidade(2,"São Carlos");
call inserirCidade(3,"Campinas");
call inserirCidade(4,"Franco da Rocha");
call inserirCidade(5,"Osasco");
call inserirCidade(6,"Pirituba");
call inserirCidade(7,"Lapa");
call inserirCidade(8,"Ponta Grossa");

/*exercicio 3*/
Delimiter $$
create procedure inserirEstado(Id int, UF char(2))
begin
insert into tbestado(UFId, UF) value(Id, UF);
end $$


call inserirEstado(1,"SP");
call inserirEstado(2,"RJ");
call inserirEstado(3,"RS");

/*exercicio 4*/
Delimiter $$
create procedure inserirBairro(Id int, Bairro varchar(200))
begin
insert into tbbairro(BairroId, Bairro) value(Id, Bairro);
end $$

drop procedure inserirProduto;

call inserirBairro(1,"Aclimação");
call inserirBairro(2,"Capão Redondo");
call inserirBairro(3,"Pirituba");
call inserirBairro(4,"Liberdade");

/*exercicio 5*/
Delimiter $$
create procedure inserirProduto(CodigoBarras decimal(14,0), Nome varchar(200), Valor decimal(8,2), Qtd int)
begin
insert into tbproduto(CodigoBarras, Nome, Valor, Qtd) value(CodigoBarras, Nome, Valor, Qtd);
end $$

call inserirProduto(12345678910111, "Rei de Papel Mache",  54.61, 120);
call inserirProduto(12345678910112, "Bolinha de Sabão", 100.45, 120);
call inserirProduto(12345678910113, "Carro Bate",  44.00, 120);
call inserirProduto(12345678910114, "Bola Furada",  10.00, 120);
call inserirProduto(12345678910115, "Maçã Laranja", 99.44, 120);
call inserirProduto(12345678910116, "Boneco do Hitler", 124.00, 200);
call inserirProduto(12345678910117, "Farinha de Suruí",  50.00, 200);
call inserirProduto(12345678910118, "Zelador de Cemitério",  24.50, 100);

/*exercicio 6*/
Delimiter $$
create procedure inserirEndereco(Logradouro varchar(200), CEP decimal(8,0), BairroNome varchar(200), CidadeNome varchar(200), UFNome varchar(200))
begin
declare BairroNovoId int;
declare CidadeNovaId int;
declare UFNovoId int;

if not exists (select BairroId from tbBairro where Bairro = BairroNome)
then insert into tbBairro(Bairro) value(BairroNome);

end if;

set BairroNovoId = (select BairroId from tbBairro where Bairro = BairroNome);

if not exists (select CidadeId from tbCidade where Cidade = CidadeNome)
then insert into tbCidade(Cidade) value(CidadeNome);

end if;

set CidadeNovaId = (select CidadeId from tbCidade where Cidade = CidadeNome);

if not exists (select UFId from tbEstado where UF = UFNome)
then insert into tbEstado(UF) value(UFNome);

end if;

set UFNovoId = (select UFId from tbEstado where UF = UFNome);

insert into tbendereco(Logradouro, CEP, BairroId, CidadeId, UFId) value(Logradouro, CEP, BairroNovoId, CidadeNovaId, UFNovoId);
end $$

call inserirEndereco("Rua da Federal ", 12345050, "Lapa", "São Paulo", "SP");
call inserirEndereco("Av Brasil", 12345051, "Lapa", "Campinas", "SP");
call inserirEndereco("Rua Liberdade", 12345052, "Consolação", "São Paulo", "SP");
call inserirEndereco("Av Paulista", 12345053, "Penha", "Rio de Janeiro", "RJ");
call inserirEndereco("Rua Ximbú", 12345054, "Penha", "Rio de Janeiro", "RJ");
call inserirEndereco("Rua Piu XI", 12345055, "Penha", "Campinas", "SP");
call inserirEndereco("Rua Chocolate", 12345056, "Aclimação", "Barra Mansa", "RJ");
call inserirEndereco("Rua Pão na Chapa", 12345057, "Barra Funda", "Ponta Grossa", "RS");


/*exercicio 7*/
Delimiter $$
create procedure inserirClientePF(NovoId int, NovoNomeCli varchar(200), NovoNumEnd decimal(6,0), NovoCompEnd varchar(50), NovoCepCli decimal(8,0), NovoCPF decimal(11,0), 
NovoRG decimal(9,0), NovoRG_Dig char(1), NovoNasc date, NovoLogradouro varchar(200), NovoBairro varchar(200), NovoCidade varchar(200), NovoUF char(2))
begin

call inserirEndereco(NovoLogradouro, NovoCepCli, NovoBairro, NovoCidade, NovoUF);


insert into tbCliente(Id, NomeCli, NumEnd, CompEnd, CepCli) values(NovoId, NovoNomeCli, NovoNumEnd, NovoCompEnd, NovoCepCli);

insert into tbClientePF(CPF, RG, RG_Dig, Nasc, Id) values (NovoCPF, NovoRG, NovoRg_Dig, NovoNasc, novoId);
end
$$

call inserirClientePF(1, "Pimpão", 325, Null, 12345051, 12345678911, 12345678, "0", '2000-10-12', "Av Brasil", "Lapa", "Campinas", "SP");
call inserirClientePF(2, "Disney Chaplin", 89, "Ap. 12", 12345053, 12345678912, 12345679, "0", '2001-11-21', "Av Paulista", "Penha", "Rio de Janeiro", "RJ");
call inserirClientePF(3, "Marciano", 744, Null, 12345054, 12345678913, 12345680, "0", '2001-06-01', "Rua Ximbú", "Penha", "Rio de Janeiro", "RJ");
call inserirClientePF(4, "Lança Perfume", 128, Null, 12345059, 12345678914, 12345681, "X", '2004-04-05', "Rua Veia", "Jardim Santa Isabel", "Cuiabá", "MT");
call inserirClientePF(5, "Remédio Amargo", 2585, Null, 12345058, 12345678915, 12345682, "0", '2002-07-15', "Av Nova", "Jardim Santa Isabel", "Cuiabá", "MT");

/*exercicio 8*/
Delimiter $$
create procedure inserirClientePJ(NovoId int, NovoNomeCli varchar(200), NovoCNPJ decimal(14,0), NovoIE decimal (11,0), NovoCepCli decimal(8,0), 
 NovoLogradouro varchar(200), NovoNumEnd decimal(6,0), NovoCompEnd varchar(50), NovoCidade varchar(200), NovoBairro varchar(200), NovoUF char(2))
begin

call inserirEndereco(NovoLogradouro, NovoCepCli, NovoCidade, NovoBairro, NovoUF);

insert into tbCliente(Id, NomeCli, NumEnd, CompEnd, CepCli) values(NovoId, NovoNomeCli, NovoNumEnd, NovoCompEnd, NovoCepCli);

insert into tbClientePJ(CNPJ, IE, Id) values(NovoCNPJ, NovoIE, NovoId);

end
$$

call inserirClientePJ(6, "Paganada", 12345678912345, 98765432198, 12345051, "Av Brasil", 159, Null, "Lapa", "Campinas", "SP");
call inserirClientePJ(7, "Caloteando", 12345678912346, 98765432199, 12345053, "Av Paulista", 69, Null, "Penha" "Rio de Janeiro", "RJ");
call inserirClientePJ(8, "Semgrana", 12345678912347, 98765432100, 12345060, "Rua dos Amores", 189, Null, "Sei Lá", "Recife", "PE");
call inserirClientePJ(9, "Cemreais", 12345678912348, 98765432101, 12345-060, "Rua dos Amores" 5024, "Sala 23", "Sei Lá", "Recife", "PE");
call inserirClientePJ(10, "Durango", 12345678912349, 98765432102, 12345-060, "Rua dos Amores", 1254, Null, "Sei Lá", "Recife", "PE");

/*exercicio 9 */
Delimiter $$
create procedure inserirCompras(NovoNotaFiscal int, NovoNomeFornecedor varchar(200), NovoDataCompra char(10), NovoCodigoBarras decimal(14,0), NovoValorItem decimal(8,2), NovoQtd int,
 NovoQtdTotal int, NovoValorTotal decimal(8,2))
begin

declare DataFormatada date;
declare FornecedorCodigo int;


if exists(select CodigoBarras from tbProduto where CodigoBarras = NovoCodigoBarras) and 
exists(select Nome from tbFornecedor where Nome = NovoNomeFornecedor)
then

set DataFormatada = str_to_date(NovoDataCompra, "%d/%m/%Y");
set FornecedorCodigo = (select Codigo from tbFornecedor where Nome = NovoNomeFornecedor);

insert into tbCompra(NotaFiscal, DataCompra, ValorTotal, QtdTotal, Codigo) values(NovoNotaFiscal, DataFormatada, NovoValorTotal, NovoQtdTotal, FornecedorCodigo);
insert into tbItemCompra(NotaFiscal, CodigoBarras, ValorItem, Qtd) values(NovoNotaFiscal, NovoCodigoBarras, NovoValorItem, NovoQtd);

end if;
end
$$

call inserirCompras(8459, "Amoroso e Doce", "01/05/2018", 12345678910111, 22.22, 200, 700, 21944.00);
call inserirCompras(2482, "Revenda Chico Loco", "22/04/2020", "12345678910112", 40.50, 180, 180, 7290.00);
call inserirCompras(21563, "Marcelo Dedal", "12/07/2020", 12345678910113, 3.00, 300, 300, 900.00);
call inserirCompras(8459, "Amoroso e Doce", "01/05/2018", 12345678910114, 35.00, 500, 700, 21944.00);
call inserirCompras(156354, "Revenda Chico Loco", "23/11/2021", 12345678910115, 54.00, 350, 350, 18900.00);

/*exercicio 10 completo*/
Delimiter $$
create procedure inserirVenda(NumVenda int, VendaNomeCli varchar(200), VendaCodBarras decimal(14,0), VendaQtd int)
begin

declare ValorProduto decimal(8,2);
declare IdCliVenda int;

if exists(select NomeCli from tbCliente where NomeCli = VendaNomeCli)
and exists(select CodigoBarras from tbProduto where CodigoBarras = VendaCodBarras)
then
set ValorProduto = (select Valor from tbProduto where CodigoBarras = VendaCodBarras);
set IdCliVenda = (select Id from tbCliente where NomeCli = VendaNomeCli);

insert into tbVenda(NumeroVenda, DataVenda, TotalVenda, Id_Cli) values(NumVenda, curdate(), ValorProduto * VendaQtd, IdCliVenda);
insert into tbItemVenda(NumeroVenda, CodigoBarras, ValorItem, Qtd) values(NumVenda, VendaCodBarras, ValorProduto, VendaQtd);


end if;
end
$$


call inserirVenda(1, "Pimpão", 12345678910111, 1);
call inserirVenda(2, "Lança Perfume", 12345678910112, 2);
call inserirVenda(3, "Pimpão", 12345678910113, 1);

select * from tbVenda;
select * from tbItemVenda;

/*exercicio 11*/
Delimiter $$
create procedure inserirNota(NumeroNota int, NomeNota varchar(200))
begin
declare IdCliente int;
declare NovoTotalNota decimal(8,2);

set IdCliente = (select Id from tbCliente where NomeCli = NomeNota);

if exists(select Id_Cli from tbVenda where Id_Cli = IdCliente)
then 

set NovoTotalNota = (select TotalVenda from tbVenda where Id_Cli = IdCliente);


insert into tbNota_fiscal(NF, TotalNota, DataEmissao) values(NumeroNota, NovoTotalNota, curdate());
update tbVenda set NF = NumeroNota where Id_Cli = IdCliente;

end if;
end
$$

drop procedure inserirNota;

call inserirNota(359, "Pimpão");

/*exercicio 12*/
Delimiter $$
create procedure inserirProduto(NovoCodigoBarras decimal(14,0), NovoNome varchar(200), NovoValor decimal(8,2), NovoQtd int)
begin

insert into tbProduto(CodigoBarras, Nome, Valor, Qtd) values(NovoCodigoBarras, NovoNome, NovoValor, NovoQtd);
end
$$

call inserirProduto(12345678910130, "Camiseta de Poliéster", 35.61, 100);
call inserirProduto(12345678910131, "Blusa Frio Moletom", 200.00, 100);
call inserirProduto(12345678910132, "Vestido Decote Redondo", 144.00, 50);


/*exercicio 13*/
Delimiter $$
create procedure removerProduto(CodigoBarrasRemover decimal(14,0))
begin

delete from tbProduto where CodigoBarras = CodigoBarrasRemover;
end
$$

call removerProduto(12345678910116);
call removerProduto(12345678910117);

/*exercicio 14*/
Delimiter $$
create procedure atualizarProduto(CodigoBarrasAtualizado decimal(14,0), NomeAtualizado varchar(200), ValorAtualizado decimal(8,2))
begin

update tbProduto set Nome = NomeAtualizado, Valor = ValorAtualizado where CodigoBarras = CodigoBarrasAtualizado;

end
$$

call atualizarProduto(12345678910111, "Rei de Papel Mache", 64.50);
call atualizarProduto(12345678910112, "Bolinha de Sabão", 120.00);
call atualizarProduto(12345678910113, "Carro Bate Bate", 64.00);


/*exercicio 15*/
Delimiter $$
create procedure mostrarProdutos()
begin
select * from tbProduto;
end 
$$

call mostrarProdutos();



select * from tbCliente;
select * from tbClientePJ;
select * from tbEndereco;
select * from tbBairro;
select * from tbCidade;
select * from tbEstado;

select * from tbCompra;
select * from tbItemCompra;
select * from tbFornecedor;
select * from tbProduto;

drop procedure inserirCompras;