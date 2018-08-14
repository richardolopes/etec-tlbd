use master
go

drop database atividade07082018
go

create database atividade07082018
go

use atividade07082018
go

create table tarefa (
id int primary key identity (1,1),
titulo varchar(100) not null,
prazo_estimado date,
descricao varchar(250),
data_inicio date not null,
data_termino date
)

create table pessoas (
id int primary key identity (1,1),
nome varchar(100),
email varchar(100),
sexo varchar(20)
)

create table rel_tarefa_pessoa (
id int primary key identity (1,1),
id_tarefa int,
id_pessoas int,

foreign key (id_pessoas) references pessoas (id),
foreign key (id_tarefa) references tarefa (id)
)

create table metodologia (
id int primary key identity (1,1),
titulo varchar(100),

foreign key (id) references tarefa (id)
)
go

insert into pessoas (nome, email, sexo)
values 
('Juliana','pessoa1@gmail.com','feminino'),
('Vanessa','pessoa2@gmail.com','feminino'),
('Mariana','pessoa3@gmail.com','feminino'),

-- Tarefas atrasadas.
('Hebert','pessoa4@gmail.com','masculino'), 

-- Não fazem parte de nenhuma tarefa.
('Richard','pessoa5@gmail.com','masculino'),
('Caio','pessoa6@gmail.com','masculino')


insert into tarefa
values 
('Tarefa 1','2018-07-08','Descricao tarefa 1','2018-07-08','2018-07-08'),
('Tarefa 2','2018-07-08','Descricao tarefa 2','2018-07-08','2018-07-08'),

-- Tarefas atrasadas.
('Tarefa 3','2018-07-08','Descricao tarefa 3','2018-07-08','2018-07-09'),
('Tarefa 4','2018-07-08','Descricao tarefa 4','2018-07-05','2018-07-09')

insert into rel_tarefa_pessoa
values 
-- Tarefa 1 > Juliana
(1,1),

-- Tarefa 1 > Vanessa
(1,2),

-- Tarefa 2 > Mariana
(2,3),

-- Tarefa 3 > Richard
(3,4),

-- Tarefa 4 > Richard
(4,4)

insert into metodologia (titulo)
values 
('OIOIOIO'),
('OIOIOIO'),
('OIOIOIO'),
('Fim')
go

select * from rel_tarefa_pessoa
select * from pessoas
select * from metodologia
select * from tarefa

-- 1 > Listar pessoas que não fazem parte de nenhuma tarefa 
select p.nome, r.id_tarefa
from pessoas as p
left join rel_tarefa_pessoa as r
on r.id_pessoas = p.id where r.id_tarefa is null
go

-- 2 > Listar quais os nomes das metodologias mais utilizadas
select count(titulo) as 'Qtd utilizada', titulo as 'Metodologia'
from metodologia group by titulo order by count(titulo) DESC
go

-- 3 > Quantidade de tarefas realizadas com mulheres e com homens
create view homens as 
select count(*) as 'Homens'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas where p.sexo = 'masculino'
go

create view mulheres as
select count(*) as 'Mulheres'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas where p.sexo = 'feminino'
go

select * from homens, mulheres

-- 4 > Quais o nome das pessoas com tarefas atrasadas ?
select p.nome as 'Nome', t.prazo_estimado as 'Prazo estimado', t.data_termino as 'Termino'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas
join tarefa as t
on r.id_tarefa = t.id where t.data_termino > t.prazo_estimado