use master
Drop table TabelaA;
Drop table TabelaB;

create table TabelaA(
Nome varchar(50) null)
INSERT INTO TabelaA (Nome) VALUES('Fernanda')
INSERT INTO TabelaA (Nome) VALUES('Josefa')
INSERT INTO TabelaA (Nome) VALUES('Luiz')
INSERT INTO TabelaA (Nome) VALUES('Fernando')

create table TabelaB(
Nome varchar(50) null)
INSERT INTO TabelaB (Nome) VALUES('Carlos')
INSERT INTO TabelaB (Nome) VALUES('Manoel')
INSERT INTO TabelaB (Nome) VALUES('Luiz')
INSERT INTO TabelaB (Nome) VALUES('Fernando')

select a.Nome, b.Nome
from TabelaA as A
inner join TabelaB as B
on a.Nome = b.Nome

SELECT a.Nome, b.Nome
FROM TabelaB as B
left join TabelaA as A
on a.Nome = b.Nome

select a.Nome, b.Nome
from TabelaA as A
full outer join TabelaB as B
on a.Nome = b.Nome

SELECT a.Nome, b.Nome
FROM TabelaA as A
right join TabelaB as B
on a.Nome = b.Nome