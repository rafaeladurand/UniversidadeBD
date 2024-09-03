CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

-- SCRIPT CONTENDO TODAS AS ALTERAÇÕES NAS TABELAS
-- ALGUMAS COLUNAS FORAM ALTERADAS MANUALMENTE PARA MELHOR VISUALIZAÇÃO E ENTENDIMENTO

CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50),
    Telefone VARCHAR(15)
);

ALTER TABLE Curso DROP FOREIGN KEY fk_disciplina;
ALTER TABLE Curso DROP COLUMN Num_Disciplina;
ALTER TABLE Curso DROP COLUMN Nome;

CREATE TABLE Turmas (
    Num_turma INT PRIMARY KEY,
    Semestre VARCHAR(50),
    Ano INT NOT NULL,
    Cod_Curso INT,
    FOREIGN KEY (Cod_Curso) REFERENCES Curso(Codigo)
);

ALTER TABLE Turmas MODIFY Semestre VARCHAR(50);
ALTER TABLE Turmas DROP FOREIGN KEY turmas_ibfk_1, DROP FOREIGN KEY turmas_ibfk_2;
ALTER TABLE Turmas DROP COLUMN Disciplinas, DROP COLUMN Num_Disciplina, DROP COLUMN Num_Matricula;
ALTER TABLE Turmas ADD CONSTRAINT fk_cod_curso FOREIGN KEY (Cod_Curso) REFERENCES Curso(Codigo);
SHOW CREATE TABLE Turmas;
ALTER TABLE Turmas MODIFY Semestre INT;

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
    FOREIGN KEY (cod_curso) REFERENCES Curso(Codigo)
);

ALTER TABLE Alunos RENAME COLUMN Turma TO Periodo;
ALTER TABLE Alunos DROP FOREIGN KEY alunos_ibfk_1;
ALTER TABLE Alunos ADD cod_turma INT;
ALTER TABLE Alunos ADD CONSTRAINT fk_cod_turma FOREIGN KEY (cod_turma) REFERENCES Turmas(Num_turma);

CREATE TABLE Disciplina (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Professor VARCHAR(50),
    Horas INT,
    Nivel VARCHAR(50), 
	Status ENUM('Cursada', 'Cursando', 'Não Cursada'),
    Departamento VARCHAR(50), 
    Codigo_curso INT,
    FOREIGN KEY (Codigo_curso) REFERENCES Curso(Codigo),
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID)
);

ALTER TABLE Disciplina ADD COLUMN Status ENUM('Cursada', 'Cursando', 'Não Cursada');
ALTER TABLE Disciplina ADD CONSTRAINT fk_curso FOREIGN KEY (Codigo_curso) REFERENCES Curso(Codigo);
ALTER TABLE Disciplina DROP FOREIGN KEY fk_curso;
ALTER TABLE Disciplina CHANGE COLUMN Professor ID_Professor INT;
ALTER TABLE Disciplina ADD CONSTRAINT fk_idProf FOREIGN KEY (ID_Professor) REFERENCES Professores(ID);
ALTER TABLE Disciplina CHANGE COLUMN Nivel Nivel ENUM('Básico', 'Médio', 'Avançado');
ALTER TABLE Disciplina DROP COLUMN Departamento;

CREATE TABLE Professores (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

ALTER TABLE Professores ADD IDCurso INT;
ALTER TABLE Professores ADD IDTurma INT;
ALTER TABLE Professores ADD CONSTRAINT fk_id_curso FOREIGN KEY (IDCurso) REFERENCES Curso(Codigo);
ALTER TABLE Professores ADD CONSTRAINT fk_id_turma FOREIGN KEY (IDTurma) REFERENCES Turmas(Num_turma);

CREATE TABLE Avaliacao (
    Numero_Disciplina INT,
    Nota FLOAT,
    Matricula_Aluno INT,
    FOREIGN KEY (Matricula_Aluno) REFERENCES Alunos(Matricula),
    FOREIGN KEY (Numero_Disciplina) REFERENCES Disciplina(Numero)
);

ALTER TABLE Avaliacao ADD ID INT;
ALTER TABLE Avaliacao ADD CONSTRAINT PK_Avaliacao PRIMARY KEY (ID);

DROP TABLE Programa_de_Formacao;
DROP TABLE Turma;

DROP TABLE Turmas;










