use master
drop database atividade09052018
create database atividade09052018

use atividade09052018

create table teste(
id int Primary Key identity(1,1),
nome char(150),
endereco varchar(500),
fone nvarchar(100),
email varchar(100)
)

insert into teste(nome, endereco, fone, email)
values('Richard', 'Aguia de haia', 11111111, 'ri.olive@hotmail.com')
insert into teste(nome, endereco, fone, email)
values('Joao', 'Aguia de haia', 11111111, 'joao.olive@hotmail.com')
insert into teste(nome, endereco, fone, email)
values('Gabriel', 'n sei', 11111111, 'gabriel.olive@hotmail.com')
insert into teste(nome, endereco, fone, email)
values('Vinicius', 'ola', 11111111, 'vinicius.olive@hotmail.com')


--update top(3) teste set nome = 'Gabriel', endereco = 'oi', fone = 22222
-- ALTERA OS TRES PRIMEIROS

update teste set nome = 'Gabriel', endereco = 'oi', fone = 22222
where id = 1
delete from teste
where id = 2

select*from teste