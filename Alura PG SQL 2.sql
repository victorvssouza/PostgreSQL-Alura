CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES 
	('Luana', 'Souza', '2000-02-13'), 
	('Danilo', 'Silva', '2000-02-10'), 
	('Maria', 'Feitosa', '2000-02-09'), 
	('Juliano', 'Cabral', '2000-02-08');

INSERT INTO categoria (nome) VALUES 
	('Programação'), 
	('Front-end'), 
	('Data Science'), 
	('Inteligência Artificial'), 
	('DevOps'), 
	('UX & Design'), 
	('Mobile'), 
	('Inovação & Gestão');

INSERT INTO curso (nome, categoria_id) VALUES 
	('Programação em Python - Introdução', 1),
	('Programação em Java - Introdução', 1),
	('Desenvolvendo Sistemas Web com Angular', 2),
	('Normalizando um Banco de Dados PostgreSQL', 3);

INSERT INTO aluno_curso VALUES 
	(1, 1),
	(1, 2),
	(2, 2),
	(2, 3);
