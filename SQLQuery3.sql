CREATE DATABASE Library2Db

USE Library2Db

CREATE TABLE Genres(
	Id int primary key identity,
	Name nvarchar(100) not null
)

CREATE TABLE Authors(
	Id int primary key identity,
	Name nvarchar(100) not null,
	GenresId int references Genres(Id)
)

CREATE TABLE Customers(
	Id int primary key identity,
	Name nvarchar(100) not null
)

CREATE TABLE Books(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Price int,
	GenresId int references Genres(Id),
	AuthorsId int references Authors(Id),
	CustomersId int references Customers(Id)
)

INSERT INTO Genres
VALUES('Thriller'),
	  ('Fiction')

INSERT INTO Authors
VALUES('Dan Brown', 2),
	  ('J.K.Rownling', 3),
	  ('Khaled Hosseini', 1),
	  ('Lev Tolstoy', 2)

INSERT INTO Customers
VALUES('Customer A'),
	  ('Customer B'),
	  ('Customer C')
	  
INSERT INTO Books
VALUES('Da Vinci Code', 10, 1, 1, 2),
	  ('Harry Potter and the Deathly Hallows', 40, 2, 2, 1),
	  ('Kite Runner', 30, 3, 2, 1),
	  ('War and Peace', 55, 4, 2, 3)


SELECT b.Id, b.Name 'Book', Price, g.name 'Genres'
FROM Books b
LEFT JOIN Genres g
ON b.GenresId= g.id

SELECT b.Id, b.Name 'Book', Price, c.name 'Customers'
FROM Books b
LEFT JOIN Customers c
ON b.CustomersId= c.id

SELECT b.Id, b.Name 'Book', Price, a.name 'Authors'
FROM Books b
LEFT JOIN Authors a
ON b.AuthorsId= a.id

SELECT a.Id, a.Name 'Authors', g.name 'Genres'
FROM Authors a
LEFT JOIN Genres g
ON a.GenresId= g.id