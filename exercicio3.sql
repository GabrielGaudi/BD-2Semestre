create database dbcomercio;
use dbcomercio;

create table tbCliente(
Id int primary key,
NomeCli varchar(200) not null,
NumEnd decimal(6) not null,
CompEnd varchar(50)
);

create table tbClientePF(
CPF decimal(11) primary key,
RG decimal(9),
Rgdig char(1),
Nascimento date not null
);