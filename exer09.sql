create database dbBANCO;
use dbBanco;

create table tbbanco(
Codigo int primary key,
Nome varchar(50) not null
);

create table tbagencia(
CodBanco int null,
Foreign key(CodBanco) references tbbanco(Codigo),
NumAgencia int primary key,
Endereco varchar(50) not null
);

create table tbConta(
NumeroConta int primary key,
Saldo decimal(7,2) null,
TipoConta smallint null,
NumAgencia int not null,
Foreign key(NumAgencia) references tbagencia(NumAgencia)
);

create table tbcliente(
Cpf bigint primary key,
Nome varchar(50) not null,
Sexo char (1) not null,
Endereco varchar(50)
);


create table tbhistorico(
Cpf bigint,
Foreign key(Cpf) references tbcliente(Cpf),
NumeroConta int,
Foreign key(NumeroConta) references tbConta(NumeroConta),
DataInicio date null
);




create table tbtelefone_cliente(
Cpf bigint null,
Foreign key(Cpf) references tbcliente(Cpf),
Telefone int primary key
);

alter table tbhistorico add primary key (Cpf, NumeroConta);

insert into tbbanco (Codigo, Nome) values(1, "Banco do Brasil");
insert into tbbanco (Codigo, Nome) values(104, "Caixa Economica Federal");
insert into tbbanco (Codigo, Nome) values(801, "Banco Escola");

insert into tbagencia (CodBanco, NumAgencia, Endereco) values(1, 123, "Av Paulista,78");
insert into tbagencia (CodBanco, NumAgencia, Endereco) values(104, 159, "Rua Liberdade,124");
insert into tbagencia (CodBanco, NumAgencia, Endereco) values(801, 401, "Rua Vinte Tres,23");
insert into tbagencia (CodBanco, NumAgencia, Endereco) values(801, 485, "Av Marechal,68");

insert into tbcliente (Cpf, Nome, Sexo, Endereco) values(12345678910,"Enildo", "M", "Rua Grande,75");
insert into tbcliente (Cpf, Nome, Sexo, Endereco) values(12345678911,"Astrogildo", "M", "Rua Pequena,789");
insert into tbcliente (Cpf, Nome, Sexo, Endereco) values(12345678912,"Monica", "F", "Av Larga,148");
insert into tbcliente (Cpf, Nome, Sexo, Endereco) values(12345678913,"Cascao", "M", "Av Principal,369");

insert into tbConta (NumeroConta, Saldo, TipoConta, NumAgencia) values(9876, 456.05, 1, 123);
insert into tbConta (NumeroConta, Saldo, TipoConta, NumAgencia) values(9877, 321.00, 1, 123);
insert into tbConta (NumeroConta, Saldo, TipoConta, NumAgencia) values(9878, 100.00, 2, 485);
insert into tbConta (NumeroConta, Saldo, TipoConta, NumAgencia) values(9879, 5589.48, 1, 401);

insert into tbhistorico (Cpf, NumeroConta, DataInicio) values(12345678910, 9876 , "2001-04-15");
insert into tbhistorico (Cpf, NumeroConta, DataInicio) values(12345678911, 9877 , "2011-03-10");
insert into tbhistorico (Cpf, NumeroConta, DataInicio) values(12345678912, 9878 , "2011-03-11");
insert into tbhistorico (Cpf, NumeroConta, DataInicio) values(12345678913, 9879 , "2000-07-05");

/*insert into tbtelefone_cliente (Cpf, Telefone) values(1, "Banco do Brasil");
insert into tbtelefone_cliente (Cpf, Telefone) values(104, "Caixa Economica Federal");
insert into tbtelefone_cliente (Cpf, Telefone) values(801, "Banco Escola");
insert into tbtelefone_cliente (Cpf, Telefone) values(801, "Banco Escola");*/

describe tbbanco;

show tables;