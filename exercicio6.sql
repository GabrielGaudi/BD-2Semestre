create database dbdesenvolvimento;
use dbdesenvolvimento;

create table tbproduto(
IdProp varchar(50) primary key,
NomeProd varchar(50) not null,
Qtd int,
DataValidade date not null,
Preco decimal(15, 2) not null
);

alter table tbproduto add Peso float;
alter table tbproduto add Cor varchar(50);
alter table tbproduto add Marca varchar(50);


alter table tbproduto drop Cor;
alter table tbproduto modify Peso float not null;

/* não é possível remover a coluna,
 pois ela já foi removida anteriormente */

create database dbLojaGrande;

alter table tbproduto add Cor varchar(50);

create database dblojica;
use dblojica;

create table tbcliente(
NomeCli varchar(50) not null,
CodigoCli int primary key,
DataCadastro date not null
);

use dblojagrande;

create table tbfuncionario(
NomeFunc varchar(50) not null,
CodigoFunc int primary key,
DataCadastro datetime not null
);

drop database dbLojaGrande;

use dblojica;
alter table  tbcliente add cpf int not null unique;