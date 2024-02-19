-- Deletando a tabela aluno
drop table aluno;

-- Criando a tabela aluno
create table aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INT,
	dinheiro numeric(10,2),
	altura real,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em timestamp
);

--Selecionando a tabela aluno
select * from aluno;

--Inserindo dados na tabela aluno
insert into aluno (
	nome, 
	cpf, 
	observacao, 
	idade, 
	dinheiro, 
	altura, 
	ativo, 
	data_nascimento, 
	hora_aula, 
	matriculado_em)
	
values (
	'Thiaguinho', 
	'12345678912', 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 
	21, 
	5000.00, 
	1.75, 
	TRUE, 
	'1980-02-05', 
	'18:00:00', 
	'2024-02-20 12:45:20')
	

-- Atualizando registros
update aluno 
set observacao = 'nada consta' 
where observacao = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'


-- Deletando registros
select * from aluno where nome = 'Thiaguinho'
delete from aluno where nome = 'Thiaguinho'


-- Selecionando colunas especificas de uma tabela e adicionar um alias
select nome as "Nome do Aluno",
		idade,
		matriculado_em as "Quando Se Matriculou"
	from aluno;

-- Inserindo novos alunos
insert into aluno (nome) values ('Vinicius Duarte');
insert into aluno (nome) values ('Daniel Coelho');
insert into aluno (nome) values ('João Alberto');
insert into aluno (nome) values ('Diego');
insert into aluno (nome) values ('Diogo');
insert into aluno (nome) values ('Nico');

-- Selecionando valor diferente
select * from aluno where nome != 'Diego';

-- Selecionando valores exatos
select * from aluno where nome = 'Diogo';

-- Selecionando valores não exatos
select * from aluno where nome like 'Di_go';
select * from aluno where nome like '%i%a%';

-- Selecionando valores nulos
select * from aluno where cpf is null;

-- Selecionando valores não nulos
select * from aluno where cpf is not null;

-- Selecionando valores entre dois valores
select * from aluno where idade between 10 and 23;

-- Operadores lógicos
select * from aluno where nome like 'V%' and cpf is not null;
select * from aluno where nome like 'V%' or cpf is not null;


-- Criando tabela com chave primária
create table curso (
	id serial primary key, --primary key = not null unique
	nome varchar(255) not null
);

insert into curso (nome) values ('HTML');
insert into curso (nome) values ('JS');
insert into curso (nome) values ('JAVA');


select * from curso;


-- Criando tabela com chave estrangeira
create table aluno(
	id serial primary key,
	nome varchar(255) not null
);

insert into aluno (nome) values ('Victor');
insert into aluno (nome) values ('Vinicius');

select * from aluno;

drop table aluno_curso;
create table aluno_curso (
	aluno_id integer,
	curso_id integer,
	primary key (aluno_id, curso_id),
	
	foreign key (aluno_id) 
	references aluno (id) 
	on delete cascade
	on update cascade,	
	
	foreign key (curso_id) 
	references curso (id)
);

insert into aluno_curso (aluno_id, curso_id) values (2,1);
insert into aluno_curso (aluno_id, curso_id) values (3,1);


-- Consultas com relacionamento
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id


-- Consultando alunos não matriculados
 SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  full JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  full JOIN curso ON curso.id = aluno_curso.curso_id

 SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  left JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  left JOIN curso ON curso.id = aluno_curso.curso_id

  SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  right JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  right JOIN curso ON curso.id = aluno_curso.curso_id
  
  SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  cross join curso 


-- Deletando dados com chave estrangeira
delete from aluno where id = 1;


-- Update cascade
update aluno 
set id = 20
where id = 2;

SELECT aluno.id as aluno_id,
	   aluno.nome as "Nome do Aluno",
	   curso.id as curso_id,
	   curso.nome as "Nome do Curso"
from aluno 
join aluno_curso on aluno_curso.aluno_id = aluno.id 
join curso 		 on curso.id 			 = aluno_curso.curso_id 


--Tabela de funcionarios + Consulta Ordenada
drop table funcionarios;

create table funcionarios (
	id serial primary key,
	matricula varchar(10),
	nome varchar(255),
	sobrenome varchar(255)
);

insert into funcionarios (matricula, nome, sobrenome) values ('M001', 'Alan', 'Hudson');
insert into funcionarios (matricula, nome, sobrenome) values ('M002', 'Julia', 'Victoria');
insert into funcionarios (matricula, nome, sobrenome) values ('M003', 'Alexandre', 'Junior');
insert into funcionarios (matricula, nome, sobrenome) values ('M004', 'Matheus', 'Henrique');
insert into funcionarios (matricula, nome, sobrenome) values ('M005', 'Vinicius', 'Junior');

select * 
from funcionarios
order by 4 desc, funcionarios.nome desc, 2 asc;


-- Consultas limitadas
select * 
from funcionarios 
order by id
limit 3
offset 2;


-- Funções de agregação

-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros


SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM funcionarios;

 
-- Agrupando Consultas
SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;

 
 SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT curso.nome, COUNT(aluno.id) AS quantidade_alunos
FROM aluno
JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY curso.nome
ORDER BY curso.nome;

-- Filtrando consultas agrupadas
SELECT nome,
       COUNT(id)
    FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1;





