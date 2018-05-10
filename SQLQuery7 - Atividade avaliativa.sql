use master
drop database aula1804
create database aula1804
use aula1804

create table tb_clientes(
	id_cliente int Primary Key identity(1,1),
	nome varchar(100),
	endereco varchar(500),
	fone nvarchar(100),
	email varchar(100)
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

create table tb_hardware(
id_hardware int Primary Key identity(1,1),
descricao varchar(100),
preco float,
qtde int,
qtde_mini int
)

insert into tb_clientes(nome, endereco, fone, email)
values('Richard de Oliveira Lopes', 'R Aguia de Haia 255', '40028922', 'richard.oliveira@hotmail.com')

insert into tb_clientes(nome, endereco, fone, email)
values('Vinicius Alves Rodrigues', 'R Aguia de Haia 362', '36063623', 'vinicius.alves@hotmail.com')

insert into tb_vendas(id_cliente, data, valor_total, desconto, valor_pago)
values('1', '30/07/2001', '500.00', '201.00', '299.0')

insert into tb_vendas_itens(id_venda, id_hardware, qtde_item, total_itens)
values (1, 1, 1, 350)

insert into tb_vendas_itens(id_venda, id_hardware, qtde_item, total_itens)
values (2, 2, 2, 592)

insert into tb_vendas_itens(id_venda, id_hardware, qtde_item, total_itens)
values (1, 3, 1, 115)

insert into tb_hardware(descricao, preco, qtde, qtde_mini)
values('Processador Intel I9-7980xe', '9900.00', '1', '1')

insert into tb_hardware(descricao, preco, qtde, qtde_mini)
values('Placa mae BG 654', '1520.95', '1', '1')

insert into tb_hardware(descricao, preco, qtde, qtde_mini)
values('Placa de video Gtx 1080', '1806.32', '1', '1')

--1 - Une as colunas das duas tabelas e os dados registrados
select*from tb_clientes as c
join tb_vendas as v
on c.id_cliente = v.id_venda
--FIM 1

--2 - Une as colunas id_cliente e endereço da tb_clientes + data e valor_pago da tb_vendas e seus respectivos dados
select c.id_cliente, c.endereco, v.data, v.valor_pago
from tb_clientes as c
join tb_vendas as v
on c.id_cliente = v.id_venda
--FIM2

--3 - Mostra o id do cliente, o valor da compra , o desconto e o valor pago 
select c.id_cliente, v.valor_total, v.desconto, v.valor_pago
from tb_clientes as c
join tb_vendas as v
on c.id_cliente = v.id_venda
--FIM3

--4 - Mostra o id do cliente, nome, id do hardware (quando o id do cliente for igual ao id da venda)
select c.id_cliente, c.nome, h.id_hardware
from tb_clientes as c
join tb_vendas_itens as h
on c.id_cliente = h.id_venda
--FIM4

--5 - Mostra o id da venda, o id do item e o nome do cliente quando o id do cliente é igual ao id da venda
select h.id_venda, h.id_item, c.nome
from tb_clientes as c
join tb_vendas_itens as h
on c.id_cliente = h.id_venda