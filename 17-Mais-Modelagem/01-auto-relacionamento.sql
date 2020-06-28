show databases;

create database escola;
use escola;

create table cursos(
  idcurso int primary key auto_increment,
  nome varchar(30),
  horas int,
  valor float(10,2),
  id_prereq int
);

alter table cursos add constraint fk_prereq
foreign key(id_prereq) references cursos(idcurso);

insert into cursos values(null, 'Banco de Dados Relacional', 20, 423.45, null);
insert into cursos values(null, 'BUSINESS INTELLIGENCE', 40, 923.89, 1);
insert into cursos values(null, 'Relatórios Avançados', 20, 785.49, 2);
insert into cursos values(null, 'Lógica de Programação', 35, 234.67, null);
insert into cursos values(null, 'Ruby', 45, 456.78, 4);

select idcurso, nome, horas, valor, ifnull(id_prereq, 'Sem Requisitos') 'Pré Requisitos' from cursos;

select idcurso, nome, horas, valor from cursos;
select nome from cursos where id_prereq is not null or id_prereq = idcurso;

select idcurso, nome, horas, valor
from cursos where (select nome from cursos where id_prereq is not null or id_prereq = idcurso);



select 
c.nome as 'Curso', c.valor as 'Valor R$', c.horas as 'Carga Horária',
ifnull(p.nome, 'Sem Requisitos') as 'Pré Requisitos'
from cursos as c
inner join cursos as p
on p.idcurso = c.id_prereq;

-- correta
-- tras todos do lado esquerdo indepentende  do que tem na tabela da direita
select 
c.nome as 'Curso', c.valor as 'Valor R$', c.horas as 'Carga Horária',
ifnull(p.nome, 'Sem Requisitos') as 'Pré Requisitos'
from cursos as c
left join cursos as p
on p.idcurso = c.id_prereq;

