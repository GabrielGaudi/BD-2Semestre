use dbdistribuidora;

insert into tbfornecedor(Codigo, Nome, CNPJ, Telefone) values
(1, "Revenda Chico Loco", 1245678937123, 11934567897),
(2, "José Faz Tudo S/A", 1345678937123, 11934567898),
(3, "Vadalto Entregas", 1445678937123, 11934567899),
(4, "Astrogildo das Estrelas", 1545678937123, 11934567800),
(5, "Amoroso e Doce", 1645678937123, 11934567801),
(6, "Marcelo Dedal", 1745678937123, 1193457802),
(7, "Franciscano Cachaça", 1845678937123, 11934567803),
(8, "Joãozinho Chupeta", 1945678937123, 11934567804);

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


Delimiter $$
create procedure inserirEstado(Id int, UF char(2))
begin
insert into tbestado(UFId, UF) value(Id, UF);
end $$


call inserirEstado(1,"SP");
call inserirEstado(2,"RJ");
call inserirEstado(3,"RS");

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



Delimiter $$
create procedure inserirClientePF(NovoId int, NovoNomeCli varchar(200), NovoNumEnd decimal(6,0), NovoCompEnd varchar(50), NovoCepCli decimal(8,0), NovoCPF decimal(11,0), 
NovoRG decimal(9,0), NovoRG_Dig char(1), NovoNasc date, NovoLogradouro varchar(200), NovoCidade varchar(200), NovoBairro varchar(200), NovoUF char(2))
begin


call inserirEndereco(NovoLogradouro, NovoCepCli, NovoBairro, NovoCidade, NovoUF);


insert into tbCliente(Id, NomeCli, NumEnd, CompEnd, CepCli) values(NovoId, NovoNomeCli, NovoNumEnd, NovoCompEnd, NovoCepCli);


insert into tbClientePF(CPF, RG, RG_Dig, Nasc, Id) values (NovoCPF, NovoRG, NovoRg_Dig, NovoNasc, NovoId);
end
$$

call inserirClientePF(1, "Pimpão", 325, Null, 12345051, 12345678911, 12345678, 0, '2000-10-12', "Av Brasil", "Campinas", "Lapa", "SP");

select * from tbCliente;
select * from tbClientePF;
select * from tbEndereco;
select * from tbBairro;
select * from tbCidade;
select * from tbEstado;