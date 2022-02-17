CREATE DATABASE TCC;
USE TCC;

CREATE TABLE Disciplinas(
	NomeDaDisciplina char(50) NOT NULL,
    ##Uma condição para que haja uma disciplima para uma turma espeficifica
    AulaSemanais char(50) NOT NULL,
    PRIMARY KEY (NomeDaDisciplina) 
);

CREATE TABLE Turma(
	NomeDaTurma char(50) NOT NULL,
    Curso enum('MKT', 'TDS') NOT NULL, ## Coluna que tera so duas "resposta": Markenting (MKT) ou Desenvolvimento de Sistema(TDS)
    PRIMARY KEY (NomeDaTurma)
);

CREATE TABLE Professor(
	Nome varchar(255) NOT NULL,
	AulasTrabalhadas int NOT NULL, ##Possivelmente essa columa não vai precisar usar
	AulasNaoTrabalhadas int NOT NULL, ##Possivelmente essa columa não vai precisar usar
	NomeDaDisciplina char(50) NOT NULL,
	NomeDaTurma char(50) NOT NULL,
	PRIMARY KEY (Nome),
	CONSTRAINT Pr_Turma FOREIGN KEY (NomeDaTurma) REFERENCES Turma(NomeDaTurma),
	CONSTRAINT Pr_Disciplina FOREIGN KEY (NomeDaDisciplina) REFERENCES Disciplinas(NomeDaDisciplina)
);

INSERT INTO Professor VALUES ("Tetheus", 26, 30, "PI3", "3_TDS_'B'");
INSERT INTO Professor VALUES ("Matheus", 26, 30, "DAMO", "3_TDS_'B'");
INSERT INTO Turma VALUES ("3_TDS_'B'", 'TDS');
INSERT INTO Disciplinas VALUES ("DAMO", "Quinta-Feira");
INSERT INTO Disciplinas VALUES ("PI3", "Quarta-Feira");

SELECT * FROM Professor;
DELETE FROM Professor WHERE Nome = "Matheus";
