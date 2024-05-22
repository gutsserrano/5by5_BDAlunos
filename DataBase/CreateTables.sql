USE DBAlunos

CREATE TABLE Aluno
(
	RA varchar(15) not null,
	CPF varchar(11) UNIQUE not null,
	Nome_aluno varchar(30) not null,
	Data_nasc Date not null,
	CONSTRAINT PkAluno PRIMARY KEY (RA)
);


CREATE TABLE Disciplina
(
	Sigla varchar(4) not null,
	Nome_disciplina varchar(15) not null,
	Total_aulas int not null,
	CONSTRAINT PkDisciplina PRIMARY KEY (Sigla)
);


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
	Media numeric(3,1),
	Situacao varchar(20)
	CONSTRAINT PkAlunoDisciplina PRIMARY KEY (RA_aluno, Sigla_disciplina, Semestre, Ano),
	CONSTRAINT FkRA_aluno FOREIGN KEY (RA_aluno) REFERENCES Aluno(RA),
	CONSTRAINT FkSigla_disciplina FOREIGN KEY (Sigla_disciplina) REFERENCES Disciplina(Sigla)
);
