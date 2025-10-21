drop database dbdistribuidora;
create database dbdistribuidora;
use dbdistribuidora;


create table tbBairro(
BairroId int primary key auto_increment,
Bairro varchar(200) not null
);

create table tbCidade(
CidadeId int primary key auto_increment,
Cidade varchar(200) not null
);

create table tbEstado(
UFId int primary key auto_increment,
UF char(2) not null
);

create table tbEndereco(
Logradouro varchar(200) not null,
CEP decimal(8,0) primary key,
BairroId int not null,
foreign key(BairroId) references tbBairro(BairroId),
CidadeId int not null,
foreign key(CidadeId) references tbCidade(CidadeId),
UFId int not null,
foreign key(UFId) references tbEstado(UFId)
);

create table tbCliente(
Id int primary key auto_increment,
NomeCli varchar(200) not null,
NumEnd decimal(6,0) not null,
CompEnd varchar(50),
CepCli decimal(8,0),
foreign key (CepCli) references tbEndereco(CEP)
);

create table tbClientePF(
CPF decimal(11,0) primary key,
RG decimal(9,0) not null,
RG_Dig char(1) not null,
Nasc date not null,
Id int,
foreign key(Id) references tbCliente(Id)
);

create table tbClientePJ(
CNPJ decimal(14,0) primary key,
IE decimal (11,0) unique,
Id int,
foreign key(Id) references tbCliente(Id)
);

create table tbNota_fiscal(
NF int primary key,
TotalNota decimal(8,2) not null,
DataEmissao date not null
);


create table tbVenda (
NumeroVenda int not null primary key,
DataVenda date not null,
TotalVenda decimal(8,2) not null,
Id_Cli int not null,
foreign key(Id_Cli) references tbCliente(Id),
NF int null,
foreign key(NF) references tbNota_Fiscal(NF)
);



create table tbProduto (
CodigoBarras decimal(14,0) primary key,
Nome varchar(200) not null,
Valor decimal(8,2) not null,
Qtd int null
);


create table tbItemVenda (
NumeroVenda int not null,
CodigoBarras decimal(14,0) not null,
ValorItem decimal(8,2) not null,
Qtd int not null,
primary key (NumeroVenda, CodigoBarras),
constraint NumeroVenda
foreign key (NumeroVenda) references tbVenda (NumeroVenda),
constraint CodigoBarras
foreign key (CodigoBarras) references tbProduto (CodigoBarras)
);
    
create table tbFornecedor(
Codigo int primary key auto_increment,
CNPJ decimal(14,0) unique,
Nome varchar(200) not null,
Telefone decimal(11,0)
);

create table tbCompra(
NotaFiscal int primary key,
DataCompra date not null,
ValorToral decimal(8,2) not null,
QtdTotal int not null,
Codigo int,
foreign key(Codigo) references tbFornecedor(Codigo)
);

create table tbItemCompra(
NotaFiscal int,
CodigoBarras decimal(14,0),
ValorItem decimal(8,2) not null,
Qtd int not null,
primary key(NotaFiscal, CodigoBarras),
constraint NotaFiscal
foreign key(NotaFiscal) references tbCompra(NotaFiscal),
constraint CodigoBarrasCompra
foreign key(CodigoBarras) references tbProduto(CodigoBarras)
);