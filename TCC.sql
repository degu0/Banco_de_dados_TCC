CREATE DATABASE TCC;
USE TCC;

CREATE TABLE Professor(
	Nome varchar(255) NOT NULL,
	AulasTrabalhadas int NOT NULL AUTO_INCREMENT, ##Possivelmente essa columa não vai precisar usar
	AulasNaoTrabalhadas int NOT NULL, ##Possivelmente essa columa não vai precisar usar
	PRIMARY KEY (Nome),
	CONSTRAINT Pr_Turma FOREIGN KEY (NomeDaTurma) REFERENCES Turma(NomeDaTurma),
	CONSTRAINT Pr_Disciplina FOREIGN KEY (NomeDaDisciplina) REFERENCES Disciplinas(NomeDaDisciplina)
)ENGINE = innodb;

## Colocar as horas "trabalhadas" de um professor

CREATE TABLE Turma(
	NomeDaTurma char(50) NOT NULL,
    ApreviasaoDoNomeDaTurma char(35) NOT NULL, ##Opcional
    Curso enum('MKT', 'TDS') NOT NULL, ## Coluna que tera so duas "resposta": Markenting (MKT) ou Desenvolvimento de Sistema(TDS)
    PRIMARY KEY (NomeDaTurma),
    CONSTRAINT TM_Disciplina FOREIGN KEY (NomeDaDisciplina) REFERENCES Disciplinas(NomeDaDisciplina)
);

CREATE TABLE Disciplinas(
	NomeDaDisciplina char(50) NOT NULL,
    ##Uma condição para que haja uma disciplima para uma turma espeficifica
    AulaSemanais char(50) NOT NULL,
    PRIMARY KEY (NomeDaDisciplina)
);

SELECT * FROM ;
