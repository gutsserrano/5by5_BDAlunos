USE DBAlunos;

INSERT INTO Aluno (RA, CPF, Nome_aluno, Data_nasc)
VALUES 
	('123456789000000', '11122233344', 'Augusto', '05/05/2020'),
	('098765432111111', '44433322211', 'Gustavo', '05/05/2021');


INSERT INTO Disciplina (Sigla, Nome_disciplina, Total_aulas)
VALUES 
	('BD', 'Banco de dados', 20),
	('.Net', '.Net framework', 20);

INSERT INTO Aluno_Disciplina (RA_aluno, Sigla_disciplina, Semestre, Ano, N1, N2, Sub, Faltas)
VALUES 
	('123456789000000', 'BD', 2, 2022, 4.7, 9, null, 6),
	('098765432111111', '.Net', 1, 2022, 7, 1, 6, 4);


SELECT * FROM Aluno ORDER BY Nome_aluno;
SELECT * FROM Disciplina;
SELECT * FROM Aluno_Disciplina;

EXEC Calculo_Media_Parcial
EXEC Fechar_semestre