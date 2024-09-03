CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

CREATE TABLE Alunos (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Sexo ENUM("M","F","Outro","Não quero informar"),
    Programa_de_Formacao ENUM("Graduado","Mestrado","Doutorado"),
    Turma ENUM("Formando","Veterano","Novato"),
    cod_curso INT,
    FOREIGN KEY (cod_curso) REFERENCES Curso(Codigo)
);

CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nome ENUM("SI","DIREITO","JOGOS"),
    Telefone VARCHAR(15),
    Num_Disciplina INT,
    FOREIGN KEY (Num_Disciplina) REFERENCES Disciplina(Numero)

);

CREATE TABLE Disciplina (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Professor VARCHAR(50),
    Horas INT,
    Nivel VARCHAR(50),
    Departamento VARCHAR(50)
);

CREATE TABLE Turmas (
    Num_turma INT PRIMARY KEY,
    Semestre VARCHAR(10),
    Ano INT NOT NULL,
    Disciplinas INT,
    Num_Disciplina INT,
    Num_Matricula INT,
    Cod_Curso INT,
    FOREIGN KEY(Num_Disciplina) REFERENCES Disciplina(Numero),
    FOREIGN KEY(Num_Matricula) REFERENCES Alunos(Matricula),
    FOREIGN KEY(Cod_Curso) REFERENCES Curso(Codigo)
);

CREATE TABLE Programa_de_Formacao (
    matricula_aluno INT,
    Formação ENUM('Graduação', 'Mestrado', 'Doutorado') NOT NULL,
    FOREIGN KEY (matricula_aluno) REFERENCES Alunos(matricula)
);

CREATE TABLE Turma (
    formando BOOLEAN,
    veterano BOOLEAN,
    novato BOOLEAN,
    matricula_aluno INT,
    FOREIGN KEY (matricula_aluno) REFERENCES Alunos(matricula)
);

