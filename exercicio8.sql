
use dbescola;

create table tbest(
idUf tinyint primary Key,
nomeUfs char(2) not null,
nomeEstado char(40) not null
); 


alter table tbendereco add constraint FK_IdUF_TbEndereco Foreign key(idUf) references tbest(idUf);

alter table tbest drop nomeEstado;

rename table tbest to tbestado;

alter table tbestado rename column nomeUfs to NomeUf;

alter table tbendereco add idCid int;



create table estado_tb(
Fk_IdUF_TbEndereco char
);

create table tbcidade(
idcid int primary key,
nomeCidade varchar(50) not null
);

alter table tbcidade modify nomeCidade varchar(250);

alter table tbendereco add constraint FK_IdCid_TbEndereco Foreign key(idCid) references tbcidade(idcid);

show tables;

describe tbendereco;
describe tbestado;







alter table estado_tb add idCit int;



