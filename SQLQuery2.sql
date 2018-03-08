use master
drop database ETEC07032018
create database ETEC07032018
use ETEC07032018

create table tb_clientes(
id_cliente int Primary Key identity(1,1),
nome varchar(100),
endereco varchar(500),
fone nvarchar(100),
email varchar(100)
)

create table tb_hardware(
id_hardware int Primary Key identity(1,1),
descricao varchar,
preco float,
qtde int,
qtde_mini int
)

create table tb_vendas(
id_venda int Primary Key identity(1,1),
id_cliente int,
data date,
valor_total float,
desconto float,
valor_pago float,
)

create table tb_vendas_itens(
id_item int Primary Key identity(1,1),
id_venda int,
id_hardware int,
qtde_item int,
total_itens int
)

alter table tb_vendas
add constraint fk_id_cliente
foreign key(id_cliente)
references tb_clientes(id_cliente)

--insert into tb_clientes(nome)
--values('richard')

--insert into tb_clientes(nome)
--values('dsadsadsa')

select*from tb_clientes