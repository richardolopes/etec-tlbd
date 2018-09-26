use master
go

drop database lojainfo
go

create database lojainfo
go

use lojainfo 
go

create table tb_clientes (
id_cliente int primary key identity(1,1) not null,
nome nvarchar(80),
endereco nvarchar(50),
fone nvarchar(20),
email nvarchar(70)
)
go

create table tb_hardware (
id_hardware int primary key identity(1,1) not null,
descricao nvarchar(200),
preco decimal,
qtde int,
qtde_min int
) 
go

create table tb_vendas (
id_vendas int primary key identity(1,1) not null,
id_cliente int,
data date,
valor_total decimal,
desconto float,
valor_pago decimal
)
go

create table tb_vendas_itens (
id_item int primary key identity(1,1) not null,
id_vendas int,
id_hardware int, 
qtde_item int,
total_item int
)
go

alter table tb_vendas add constraint fk_id_cliente foreign key (id_cliente) references tb_clientes (id_cliente)
alter table tb_vendas_itens add constraint fk_id_vendas foreign key (id_vendas) references tb_vendas (id_vendas)
alter table tb_vendas_itens add constraint fk_id_hardware foreign key (id_hardware) references tb_hardware (id_hardware)

insert into tb_clientes(nome, endereco, fone, email)
values('Richard de Oliveira Lopes', 'R Aguia de Haia 255', '40028922', 'richard.oliveira@hotmail.com')

insert into tb_clientes(nome, endereco, fone, email)
values('Vinicius Alves Rodrigues', 'R Aguia de Haia 362', '36063623', 'vinicius.alves@hotmail.com')

insert into tb_clientes(nome, endereco, fone, email)
values('Vitãozinho Hugo', 'R Aguia de Haia 457', '25186066', 'vitaozinho.hugo@hotmail.com')

insert into tb_clientes(nome, endereco, fone, email)
values('Raul Benjamin Victor Lopes', 'Rua Frei Luiz Carolino 487', '25649403', 'rraulbenjaminvictorlopes@construtoraplaneta.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Isaac Fernando Rodrigo Castro', 'Rua JP 44', '39895786', 'isaacfernandorodrigocastro-83@accent.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Yago Carlos Eduardo Gustavo Almeida', 'Rua Aretuza Machado de Andrade 869', '26614946', 'yyagocarloseduardogustavoalmeida@vegacon.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Igor Caio Fernando Fernandes', 'Rua Coletor Antônio Gadelha 32', '28580715', 'iigorcaiofernandofernandes@jcoronel.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Bernardo Ian Yago da Conceição', 'Rua Curitiba 399', '37447668', 'bernardoianyagodaconceicao_@zyb.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Lucas Augusto Fernando da Rocha', 'Avenida Candeias 488', '29310978', 'lucasaugustofernandodarocha@caej.com.br')

insert into tb_clientes(nome, endereco, fone, email)
values('Gabriel Otávio Moreira', 'Rua Vinícius de Morais 460', '29337669', 'gabrielotaviomoreira@icloud.com')
go

-- MM

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('1', '30/07/2001', '380.74', '201.00', '0.0')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('2', '01/06/1999', '1520.95', '10.00', '0.0')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('3', '28/02/2017', '380.74', '0.0', '25.00')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('4', '05/09/2015', '1520.95', '20.00', '15.00')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('5', '10/12/1998', '362.25', '152.35', '210.15')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('6', '22/08/2016', '9900.00', '100.00', '350.65')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('7', '23/04/2014', '9900.00', '12.54', '14.68')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('8', '12/05/2011', '1806.32', '0.00', '8.0')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('9', '03/06/2003', '380.74', '10.0', '25.00')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('10', '10/01/2018', '1806.32', '10.0', '250.00')
go

-- MM

insert into tb_hardware(descricao, preco, qtde, qtde_min)
values('Processador Intel I9-7980xe', '9900.00', '1', 1)

insert into tb_hardware(descricao, preco, qtde, qtde_min)
values('Placa mae BG 654', '1520.95', '1', 1)

insert into tb_hardware(descricao, preco, qtde, qtde_min)
values('Placa de video Gtx 1080', '1806.32', '1', 1)

insert into tb_hardware(descricao, preco, qtde, qtde_min)
values('Memoria ram 8gb 2400', '380.74', '1', 1)
go

-- MM

insert into tb_vendas_itens(id_vendas, id_hardware, qtde_item, total_item)
values(1, 4, 1, 1)
go


if OBJECT_ID('select_produtos_desconto') is not null
	drop proc select_produtos_desconto
go

if OBJECT_ID('update_desconto_produto') is not null
	drop proc update_desconto_produto
go

create procedure update_desconto_produto
as begin
	update tb_vendas set desconto = '10' --where id_vendas = 1;
end
go

create procedure select_produtos_desconto
as begin
	select valor_total, (valor_total - (valor_total * desconto/100)) 
	as valor_final, (valor_total * desconto/100) as valor_desconto, desconto 
	from tb_vendas
end
go

exec update_desconto_produto
go

exec select_produtos_desconto