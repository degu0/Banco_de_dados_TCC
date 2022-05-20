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
    primary key(id),
    constraint Hr_DiasDaSemana foreign key (DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint Hr_Turno foreign key (Turnos) references Turno(Turnos)
);
CREATE TABLE Instituto(
	NomeDoInstituto varchar(50) NOT NULL,
	primary key(NomeDoInstituto),
    constraint Ins_Horario foreign key (id) references Horarios(id)
);
CREATE TABLE Turma(
	Ano int not null,
    Serie varchar(20) not null,
    Curso varchar(20) not null,
    TotalAulasSemanais int not null,
    AulasGeminadas varchar(50) not null,
    constraint Tu_Professores foreign key (id) references Professor(id),
    constraint Tu_Disciplina foreign key (NomeDaDisciplina) references Disciplinas(NomeDaDisciplina)
);
CREATE TABLE ProfessorHorarios(
	Disponibilidade varchar(50),
    constraint PH_Professores foreign key (id) references Professor(id),
    constraint PH_DiasDaSemana foreign key (DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint PH_Turnos foreign key (Turnos) references Turno(Turnos),
    constraint PH_Horarios foreign key (id) references Horarios(id)
);

CREATE TABLE TurmasHorarios(
	id int auto_increment,
    constraint TH_Ano foreign key (Ano) references Turma(Ano),
    constraint PH_Serie foreign key (Serie) references Turma(Serie),
    constraint PH_Curso foreign key (Curso) references Turma(Curso),
    constraint PH_DiasDaSemana foreign key (DiasDaSemana) references DiasDaSemana(DiasDaSemana),
    constraint PH_Turno foreign key (Turnos) references Turno(Turnos),
    constraint PH_Horarios foreign key (id) references Horarios(id)
);
