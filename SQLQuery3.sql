USE DBAlunos

CREATE TABLE Aluno
(
	RA varchar(15) not null,
	CPF varchar(11) UNIQUE not null,
	Nome_aluno varchar(30) not null,
	Data_nasc Date not null,
	CONSTRAINT PkAluno PRIMARY KEY (RA)
);

INSERT INTO Aluno (RA, CPF, Nome_aluno, Data_nasc)
VALUES 
	('123456789000000', '11122233344', 'Augusto', '05/05/2020'),
	('098765432111111', '44433322211', 'Gustavo', '05/05/2021');



CREATE TABLE Disciplina
(
	Sigla varchar(4) not null,
	Nome_disciplina varchar(15) not null,
	Total_aulas int not null,
	CONSTRAINT PkDisciplina PRIMARY KEY (Sigla)
);

INSERT INTO Disciplina (Sigla, Nome_disciplina, Total_aulas)
VALUES 
	('BD', 'Banco de dados', 20),
	('.Net', '.Net framework', 20);



CREATE TABLE Aluno_Disciplina 
(
	RA_aluno varchar(15) not null,
	Sigla_disciplina varchar(4) not null,
	Semestre int not null,
	Ano int not null,
	N1 numeric (3, 1),
	N2 numeric (3, 1),
	Sub numeric (3, 1),
	Faltas int,
	CONSTRAINT PkAlunoDisciplina PRIMARY KEY (RA_aluno, Sigla_disciplina, Semestre, Ano),
	CONSTRAINT FkRA_aluno FOREIGN KEY (RA_aluno) REFERENCES Aluno(RA),
	CONSTRAINT FkSigla_disciplina FOREIGN KEY (Sigla_disciplina) REFERENCES Disciplina(Sigla)
);

ALTER TABLE Aluno_Disciplina ADD Media numeric(3,1) null;
ALTER TABLE Aluno_Disciplina ADD Situacao varchar(17) null;

INSERT INTO Aluno_Disciplina (RA_aluno, Sigla_disciplina, Semestre, Ano, N1, N2, Sub, Faltas)
VALUES 
	('123456789000000', 'BD', 2, 2022, 4.7, 9, null, 6),
	('098765432111111', '.Net', 1, 2022, 7, 1, 6, 4);

DROP TABLE Aluno_Disciplina

--ALTER TABLE Aluno ADD CONSTRAINT UQCPF UNIQUE (CPF);

--INSERT INTO Aluno (RA, CPF, Nome_aluno, Data_nasc)
--VALUES 
--	('456', '11122233344', 'Fulano', '05/05/2020');