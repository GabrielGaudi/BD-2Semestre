create database Renata;

use Renata;

create table tbVenda (
	NF int primary key not null auto_increment,
    DataValidade datetime not null
);

alter table tbVenda add Preco decimal(10, 2) not null;
alter table tbVenda add Qtd smallint check(Qtd >= 0);

alter table tbVenda drop DataValidade;
alter table tbVenda add DataVenda datetime default current_timestamp;

create table Produto (
	CodigoB decimal(13, 0) primary key not null,
    NomeProd varchar(50) not null
);

alter table tbVenda add CodB decimal (13, 0);
alter table tbVenda add foreign key (CodB) references Produto(CodigoB);
describe tbVenda;