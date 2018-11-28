use master 
go

drop database atvTransaction
go

create database atvTransaction
go

use atvTransaction
go

create table tbDepartamento (
idDep int primary key identity(1,1) not null,
nome varchar(100) UNIQUE,
)
go

create table tbPessoa (
idPess int primary key identity(1,1) not null,
nome varchar(100),
)
go

create table tbRelPessDep (
idRel int primary key identity(1,1) not null,
idDep int not null,
idPess int not null,
)
go

alter table tbRelPessDep
add constraint fk_idDep foreign key (idDep) 
references tbDepartamento(idDep)

alter table tbRelPessDep
add constraint fk_idPess foreign key (idPess) 
references tbPessoa(idPess)

insert into tbDepartamento (nome) values 
('Marketing'),
('Operacional'),
('Departamento Pessoal'),
('Comercial')
go

insert into tbPessoa (nome) values 
('Beatriz'), 
('Carlos'),
('Laura'), 
('Bruna')
go

insert into tbRelPessDep (idDep, idPess) values 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4)
go


if OBJECT_ID ('trgAfterInsertPessoa') is not null
drop TRIGGER trgAfterInsertPessoa
go

create trigger trgAfterInsertPessoa on tbDepartamento for insert as 
declare @IdDpto int;
begin
	declare @IdPessoa int;
	select @IdPessoa = max(idPess) from tbPessoa;
	
	IF NOT EXISTS(select idPess from tbRelPessDep where idPess = @IdPessoa)
	begin
		declare @NmDpto nvarchar(180);
		declare @auditAction nvarchar(180);
		
		select @IdDpto = i.idDep from inserted i;
		
		set @auditAction = 'Registro inserido';		
		
		insert into tbRelPessDep (idDep, idPess)
		values (@IdDpto, @IdPessoa);
	end;
	ELSE
	begin
		rollback;
		set @auditAction = 'Registro não inserido';
	end;
end
go

begin transaction
	insert into tbPessoa (nome) values ('Richard')
	go
	insert into tbDepartamento (nome) values ('Financeiro')
commit
go

select * from tbPessoa
select * from tbRelPessDep
select * from tbDepartamento order by idDep

--insert into tbRelPessDep (idDep, idPess) values (5,2)