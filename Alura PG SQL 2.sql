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

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Luana', 'Souza', '2000-02-13');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Danilo', 'Silva', '2000-02-10');

INSERT INTO categoria (nome) VALUES ('Programação');
INSERT INTO categoria (nome) VALUES ('Front-end');
INSERT INTO categoria (nome) VALUES ('Data Science');
INSERT INTO categoria (nome) VALUES ('Inteligência Artificial');
INSERT INTO categoria (nome) VALUES ('DevOps');
INSERT INTO categoria (nome) VALUES ('UX & Design');
INSERT INTO categoria (nome) VALUES ('Mobile');
INSERT INTO categoria (nome) VALUES ('Inovação & Gestão');

INSERT INTO curso (nome, categoria_id) VALUES ('Programação em Python - Introdução', 1);
INSERT INTO curso (nome, categoria_id) VALUES ('Programação em Java - Introdução', 1);
INSERT INTO curso (nome, categoria_id) VALUES ('Desenvolvendo Sistemas Web com Angular', 2);
INSERT INTO curso (nome, categoria_id) VALUES ('Normalizando um Banco de Dados PostgreSQL', 3);

INSERT INTO aluno_curso VALUES (1, 1);
INSERT INTO aluno_curso VALUES (1, 2);
INSERT INTO aluno_curso VALUES (2, 2);
INSERT INTO aluno_curso VALUES (2, 3);