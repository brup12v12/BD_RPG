--DDL
CREATE DATABASE RPG_online
GO

USE	RPG_online 
GO

CREATE TABLE Usuarios
(
  UsuarioID INT PRIMARY KEY IDENTITY,
  Email VARCHAR(75) UNIQUE NOT NULL,
  Senha VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Classes
(
  ClasseID INT PRIMARY KEY IDENTITY,
  Nome VARCHAR(40) UNIQUE NOT NULL,
  Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens
(
  PersonagemID INT PRIMARY KEY IDENTITY,
  Nome VARCHAR(20) UNIQUE NOT NULL,
  UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID),
  ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)
GO

CREATE TABLE Habilidades
(
  HabilidadeID INT PRIMARY KEY IDENTITY,
  Nome VARCHAR(100) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade
(
  ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
  HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)
--FINAL DDL

--DML
INSERT INTO Usuarios VALUES ('email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição da classe bárbaro')
INSERT INTO Personagens VALUES ('DeuBug', 1, 1)
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO ClasseHabilidade VALUES (1, 1), (1,2)

INSERT INTO Usuarios VALUES ('email2email.com', '123456')
INSERT INTO Classes VALUES ('Monge', 'Descrição da classe monge')
INSERT INTO Personagens VALUES ('BitBug', 2, 2)
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO ClasseHabilidade VALUES (2, 2), (2, 3)
--UPDATE Usuarios
--SET Senha = '123456'
--WHERE UsuarioID = 1

--FINAL DML

--DQL
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade
--ex1
SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID
--ex2
SELECT Personagens.Nome, Classes.Nome, Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID
--ex3
SELECT Personagens.Nome AS 'Nome Personagem', Classes.Nome AS 'Classe', Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID
--ex4
SELECT P.Nome 'Nome Personagem', C.Nome 'Classe', C.Descricao FROM Personagens P
INNER JOIN Classes C
ON P.ClasseID = C.ClasseID



--=====================
   --EXEMPLO JOINs
--=====================

--DDL
--CREATE DATABASE ExemploJoin
--GO

--USE ExemploJoin
--GO

--CREATE TABLE TabelaA
--(
--  Nome VARCHAR(50) NULL
--)
--GO

--CREATE TABLE TabelaB
--(
-- Nome VARCHAR(50) NULL
--)
--GO

--DML
--INSERT INTO TabelaA VALUES ('Fatima')
--INSERT INTO TabelaA VALUES ('Carla')
--INSERT INTO TabelaA VALUES ('Ana')
--INSERT INTO TabelaA VALUES ('Pedro')

--INSERT INTO TabelaB VALUES ('Fatima'), ('José'), ('Silvia'), ('Denilson')

--SELECT * FROM TabelaA
--INNER JOIN TabelaB
--ON TabelaA.Nome = TabelaB.Nome

--SELECT * FROM TabelaA
--LEFT JOIN  TabelaB
--ON TabelaA.Nome = TabelaB.Nome
--WHERE TabelaB.Nome IS NULL

--SELECT * FROM TabelaA
--RIGHT JOIN  TabelaB
--ON TabelaA.Nome = TabelaB.Nome

--SELECT * FROM TabelaA
--FULL OUTER JOIN  TabelaB
--ON TabelaA.Nome = TabelaB.Nome
--===========================
      --FIM EX JOINs--
--==========================
