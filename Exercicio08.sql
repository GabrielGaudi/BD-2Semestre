create database dbescola;
use dbescola;

create table est_tb(
idUf varchar(255) primary Key,
nomeUfs char(2) not null,
nomeEstado char(40) not null
); 

create table estado_tb(
Fk_IdUF_TbEndereco char
);

create table cidade_tb(
idcid int primary key,
nomeCidade varchar(50) not null
);

show tables;

describe est_tb;
describe estado_tb;

alter table estado_tb add Foreign key(Fk_IdUF_TbEndereco) references idUf(id);

alter table est_tb drop nomeEstado;

rename table est_tb to estado_tb;

alter table est_tb rename column nomeUfs to NomeUf;

alter table estado_tb add idCit int;

alter table cidade_tb modify nomeCidade varchar(250);

alter table cidade_tb add Foreign key(Fk_IdCid_TbEndereco) references idcid(id);