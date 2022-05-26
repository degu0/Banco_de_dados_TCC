CREATE DATABASE TCC;
USE TCC;

CREATE TABLE Login(
	id int auto_increment,
    Nome varchar(50) UNIQUE NOT NULL,
    Senha varchar(50) UNIQUE NOT NULL,
    primary key(id) 
);
CREATE TABLE Professor(
	id int auto_increment,
	NomeProfessor varchar(50) UNIQUE NOT NULL,
    FoneProfessor int NOT NULL,
    CargaHoraria int not null,
    primary key(id)
);
CREATE TABLE Disciplinas(
    NomeDisciplina varchar(50) not null,
    primary key(NomeDisciplina)
);
CREATE TABLE Turno(
	Turnos varchar(50) not null,
    primary key(Turnos)
);

CREATE TABLE DiasDaSemana(
    DiasDaSemana varchar(50) not null,
    primary key(DiasDaSemana)
);
CREATE TABLE Horarios(
	id int auto_increment,
	Inicio int not null,
    Final int not null,
	Hr_DiasDaSemana int,
	Hr_Turno int,
    primary key(id),
    constraint FK_DiasDaSemana foreign key (Hr_DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint FK_Turno foreign key (Hr_Turno) references Turno(Turnos)
);
CREATE TABLE Instituto(
	NomeDoInstituto varchar(50) NOT NULL,
	primary key(NomeDoInstituto),
	Ins_Horario int,
    constraint FK_Horario foreign key (Ins_Horario) references Horarios(id)
);
CREATE TABLE Turma(
	Ano int not null,
    Serie varchar(20) not null,
    Curso varchar(20) not null,
    TotalAulasSemanais int not null,
    AulasGeminadas varchar(50) not null,
	Tu_Professores varchar(50),
	Tu_Disciplina varchar(50),
    constraint FK_Professores foreign key (Tu_Professores) references Professor(id),
    constraint FK_Disciplina foreign key (Tu_Disciplina) references Disciplinas(NomeDaDisciplina)
);
CREATE TABLE ProfessorHorarios(
	Disponibilidade varchar(50),
	PH_Professores varchar(50),
	PH_DiasDaSemana int,
	PH_Turnos int,
	PH_Horarios int,
    constraint FK_Professores foreign key (PH_Professores) references Professor(id),
    constraint FK_DiasDaSemana foreign key (PH_DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint FK_Turnos foreign key (PH_Turnos) references Turno(Turnos),
    constraint FK_Horarios foreign key (PH_Horarios) references Horarios(id)
);

CREATE TABLE TurmasHorarios(
	id int auto_increment,
	TH_Ano int,
	PH_Serie int,
	PH_Curso int,
	PH_DiasDaSemana int,
	PH_Turno int,
	PH_Horarios int,
    constraint FK_Ano foreign key (TH_Ano) references Turma(Ano),
    constraint FK_Serie foreign key (PH_Serie) references Turma(Serie),
    constraint FK_Curso foreign key (PH_Curso) references Turma(Curso),
    constraint FK_DiasDaSemana foreign key (PH_DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint FK_Turno foreign key (PH_Turno) references Turno(Turnos),
    constraint FK_Horarios foreign key (PH_Horarios) references Horarios(id)
);
