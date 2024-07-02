USE MASTER
GO

--DROP DATABASE IF EXISTS BYTES_GAME

CREATE DATABASE BYTES_GAME

ON PRIMARY (
	NAME= "BYTES_GAME_MDF",
	FILENAME= 'C:\BYTES_GAME\BYTES_GAME.mdf',			--	CAMBIALO POR LA RUTA DONDE CREARAS TU DB
	SIZE= 50MB,
	MAXSIZE= 250MB,
	FILEGROWTH= 10MB
)

LOG ON (
	NAME= "BYTES_GAME_LDF",
	FILENAME= 'C:\BYTES_GAME\BYTES_GAME.ldf',			--	CAMBIALO POR LA RUTA DONDE CREARAS TU DB
	SIZE= 20MB,
	FILEGROWTH= 10MB
)
GO

USE BYTES_GAME
GO

-- TABLA COMPA�IA
CREATE TABLE COMPANIES (
	idCompany INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title VARCHAR(40),
	email VARCHAR(60),
	director VARCHAR(40)
)
GO

-- TABLA PROVEEDORES
CREATE TABLE PROVIDERS (
	idProvider INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	provName VARCHAR(30),
	contactName VARCHAR(40),
	address VARCHAR(50),
	city VARCHAR(20),
	phone CHAR(9),
	fax VARCHAR(20),
	postalCode VARCHAR(10)
)
GO

-- TABLA CATEGORIA DE VIDEOJUEGOS
CREATE TABLE CATEGORIES (
	idCategory INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	catName VARCHAR(15)
)
GO

-- TABLA CLIENTE
CREATE TABLE CLIENTS (
	idClient INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	nameCli VARCHAR(30),
	emailCli VARCHAR(60),
	phoneCli CHAR(9)
)
GO

-- TABLE DE JUEGOS
CREATE TABLE VIDEOGAMES (
	idGame INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	idCategory INT FOREIGN KEY REFERENCES CATEGORIES(idCategory),
	idProvider INT FOREIGN KEY REFERENCES PROVIDERS(idProvider),
	title VARCHAR(60),
	publishDate DATE,
	unitPrice MONEY
)

-- TABLA DE JUEGOS Y COMPA�IAS
CREATE TABLE GAMECOMPANIES (
	idCompany INT FOREIGN KEY REFERENCES COMPANIES(idCompany),
	idGame INT FOREIGN KEY REFERENCES VIDEOGAMES(idGame)
)

-- TABLA DE ORDENES
CREATE TABLE ORDERS (
	idOrder INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	orderDate DATE,
	idClient INT FOREIGN KEY REFERENCES CLIENTS(idClient)
)
GO

-- TABLA DE DETALLE DE ORDENES
CREATE TABLE ORDER_DETAILS (
	idOrder INT FOREIGN KEY REFERENCES ORDERS(idOrder),
	idGame INT FOREIGN KEY REFERENCES VIDEOGAMES(idGame),
	quantity INT NOT NULL,
	discount DEC(3, 2),
	unitPrice MONEY
)
GO

