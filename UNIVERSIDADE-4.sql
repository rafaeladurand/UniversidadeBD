CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

-- SCRIPT COMPLETO DAS TABELAS APÓS AS ALTERAÇÕES 

CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50),
    Telefone VARCHAR(15)
);

CREATE TABLE Turmas (
    Num_turma INT PRIMARY KEY,
    Semestre INT,
    Ano INT NOT NULL,
    Cod_Curso INT,
    FOREIGN KEY (Cod_Curso) REFERENCES Curso(Codigo)
);

CREATE TABLE Alunos (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Sexo ENUM("M","F","Prefiro não especificar"),
    Programa_de_Formacao ENUM("Graduado","Mestrado","Doutorado"),
    Periodo ENUM("Formando","Veterano","Novato"),
    cod_curso INT,
    cod_turma INT,
    FOREIGN KEY (cod_curso) REFERENCES Curso(Codigo),
    FOREIGN KEY (cod_turma) REFERENCES Turmas(Num_turma)
);

CREATE TABLE Professores (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50),
    IDCurso INT,
    IDTurma INT,
    FOREIGN KEY (IDCurso) REFERENCES Curso(Codigo),
    FOREIGN KEY (IDTurma) REFERENCES Turmas(Num_turma)
);

CREATE TABLE Disciplina (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
	ID_Professor INT,
    Horas INT,
    Nivel ENUM('Básico', 'Médio', 'Avançado'), 
	Status ENUM('Cursada', 'Cursando', 'Não Cursada'),
    Codigo_curso INT,
    FOREIGN KEY (Codigo_curso) REFERENCES Curso(Codigo),
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID)
);


CREATE TABLE Avaliacao (
	ID INT PRIMARY KEY,
    Numero_Disciplina INT,
    Nota FLOAT,
    Matricula_Aluno INT,
    FOREIGN KEY (Matricula_Aluno) REFERENCES Alunos(Matricula),
    FOREIGN KEY (Numero_Disciplina) REFERENCES Disciplina(Numero)
);