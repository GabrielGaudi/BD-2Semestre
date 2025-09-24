/* GaudiSabrina*/

create database dbescola;
use dbescola;

create table tbcliente(
IdCli int primary key,
NomeCli varchar(50) not null,
NumEnd smallint,
DataCadastro datetime default current_timestamp()
);

alter table tbcliente add cpf decimal (11, 0) unique not null;
alter table tbcliente add cep decimal (5, 0);


create database dbempresa;

create table tbendereco(
Cep decimal(5,0) primary key,
Logradourto varchar(250) not null,
IdUf tinyint
);

alter table tbCliente add constraint Fk_Cep_TbCliente foreign key (cep) references tbendereco(Cep);

describe tbCliente;

/* salvar o arquivo errado
ler
erros de digitação*/ 

show databases;

drop database dbEmpresa;
