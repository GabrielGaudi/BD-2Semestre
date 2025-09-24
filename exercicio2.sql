create database exercicio2ValdemirEJose;
use exercicio2ValdemirEJose;

create table tbproduto(
IdProp int primary key,
NomeProd varcshar(50) not null,
Qtd int,
DataValidade date not null,
Preco float not null
);

create table tbclient(
Codigo int primary key,
NomeCli varchar(50) not null,
DataNascimento date
)