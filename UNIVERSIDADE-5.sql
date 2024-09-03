USE UNIVERSIDADE;

-- CONSULTAS 

-- 1
SELECT Nome, Email 
FROM Professores;

-- 2
SELECT Nome, Horas 
FROM Disciplina;

-- 3
SELECT Nome, Horas 
FROM Disciplina 
WHERE Status = 'Cursada';

-- 4
SELECT p.Nome 
FROM Professores p
JOIN Disciplina d ON p.ID = d.ID_Professor
WHERE d.Horas = 80;

-- 5
SELECT a.Nota 
FROM Avaliacao a
JOIN Disciplina d ON a.Numero_Disciplina = d.Numero
WHERE d.Nome = 'Lógica de programação';

-- 6
SELECT Nome 
FROM Disciplina 
WHERE Status = 'Não Cursada';

-- 7
SELECT SUM(Horas) AS Total_Horas_Cursadas 
FROM Disciplina 
WHERE Status = 'Cursada';

-- 8
SELECT AVG(Nota) AS Media_Notas
FROM Avaliacao;

-- 9
SELECT a.Nome AS Nome_Aluno, d.Nome AS Nome_Disciplina, t.Num_turma 
FROM Alunos a
JOIN Turmas t ON a.cod_turma = t.Num_turma
JOIN Disciplina d ON t.Cod_Curso = d.Codigo_curso;

-- 10
SELECT t.Num_turma, COUNT(a.Matricula) AS Numero_Alunos, d.Nome AS Nome_Disciplina, p.Nome AS Nome_Professor
FROM Turmas t
JOIN Alunos a ON t.Num_turma = a.cod_turma
JOIN Disciplina d ON t.Cod_Curso = d.Codigo_curso
JOIN Professores p ON d.ID_Professor = p.ID
GROUP BY t.Num_turma, d.Nome, p.Nome
ORDER BY Numero_Alunos DESC;
