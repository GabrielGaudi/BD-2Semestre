create database Maria;

use Maria;

create table tbProduto (
	IdProp int primary key not null,
    NomeProd varchar(50) not null,
    Qtd int,
    DataValidade date not null,
    Preco decimal(10,2) not null
);

alter table tbProduto add Peso decimal;
alter table tbProduto add Cor varchar(50);
alter table tbProduto add Marca varchar(50) not null;
alter table tbProduto drop Cor;
alter table tbProduto modify Peso decimal(4, 1) not null;
alter table tbProduto drop DataValidade;

describe tbProduto;