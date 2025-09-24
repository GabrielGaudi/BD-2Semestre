
create database exercicio1;
use exercicio1;

create table tbUsuario(
IdUsuario integer primary key,
NomeUsuario varchar(45),
DataNascimento date
);

create table tbEstado(
Id int primary key,
Uf varchar(2)
);

create table tbCliente(
CodigoCli int primary key,
Nome varchar(50),
Endereco varchar(60)
);

create table tbProduto(
Barras double(13, 0),
Valor  double(10, 4),
Descricao text
);

describe tbProduto;

show tables;

show databases;

alter table tbCliente modify Nome varchar(58);

alter table tbProduto add Qtd int;

drop table tbEstado;

alter table tbUsuario drop DataNascimento;

drop database exercicio1;