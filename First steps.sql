CREATE DATABASE film_libr;
CREATE SCHEMA film_libr; 

CREATE TABLE Actors (
	ID int IDENTITY(1,1) PRIMARY KEY,
	name varchar(255) NOT NULL,
	sex varchar(255) NOT NULL,
	birth_date datetime,
	country varchar(255) NOT NULL
)

CREATE TABLE Directors (
	ID int IDENTITY(1,1) PRIMARY KEY,
	name varchar(255) NOT NULL,
	birth_date datetime,
	country varchar(255) NOT NULL
)

CREATE TABLE Studios (
	ID int IDENTITY(1,1) PRIMARY KEY,
	name varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	headquarters varchar(255) NOT NULL
)

CREATE TABLE Films(
	ID int IDENTITY(1,1) PRIMARY KEY,
	title varchar(255) NOT NULL,
	release_year smallint NOT NULL,
	genre varchar(255) NOT NULL,
	language varchar(255) NOT NULL,
	budget money NOT NULL,
	director int FOREIGN KEY REFERENCES Directors(ID),
	studio int FOREIGN KEY REFERENCES Studios(ID),
	length int NOT NULL
)

CREATE TABLE Roles(
	ID int IDENTITY(1,1) PRIMARY KEY,
	actor int FOREIGN KEY REFERENCES actors(ID),
	film int FOREIGN KEY REFERENCES films(ID)
)

INSERT INTO Actors 
VALUES (
	'Mark Hamill',
	'Male',
	'1951-09-25',
	'United States'
),
(
	'Alec Guinness',
	'Male',
	1914-04-02,
	'United Kingdom'
),

(
	'Robin Williams',
	'Male',
	1951-07-21,
	'United States'
),
(
	'Rutger Hauer',
	'Male',
	1944-01-23,
	'Netherlands'
),
(
	'Vanessa Kirby',
	'Female',
	1988-04-18,
	'United Kingdom'
),
(
	'Tahar Rahim',
	'Male',
	1981-07-04,
	'France'
),
(
	'Le?la Bekhti',
	'Female',
	1984-03-06,
	'France'
)

INSERT INTO Directors 
VALUES (
	'Jacques Audiard',
	1952-04-30,
	'France'
),
(
	'Ridley Scott',
	1937-11-30,
	'United Kingdom'
),
(
	'Shawn Levy',
	1968-07-23,
	'Canada'
),
(
	'Robert Zemeckis',
	1952-05-14,
	'United States'
)

INSERT INTO Studios
VALUES (
	'Paramount Pictures',
	'United States',
	'Los Angeles'
),
(
	'Warner Bros. Pictures',
	'United States',
	'Burbank'
),
(
	'Columbia Pictures',
	'United States',
	'Culver City'
),
(
	'UGC',
	'Neuilly-sur-Seine',
	'France'
)

INSERT INTO Films 
VALUES (
	'A Prophet',
	2009,
	'Crime film',
	'French',
	$13000000,
	2,
	5,
	155
),
(
	'Blade Runner',
	1982,
	'Science fiction',
	'English',
	$30000000,
	3,
	3,
	117
),
(
	'Napoleon',
	2023,
	'Historical drama',
	'English',
	$150000000,
	3,
	4,
	157
),
(
	'Night at the Museum',
	2006,
	'Comedy',
	'English',
	$110000000,
	4,
	1,
	108
),
(
	'Forrest Gump',
	1994,
	'Comedy',
	'English',
	$55000000,
	5,
	2,
	142
)

INSERT INTO Roles
VALUES (2, 1), (2, 3), (4, 1), (10, 2), (9, 2), (8, 4), (9, 4), (7, 3), (5, 1), (6, 5), (11, 6), (10, 7)

UPDATE Studios
SET country = 'France',
	headquarters = 'Neuilly-sur-Seine'
WHERE ID = 5

INSERT INTO Directors
VALUES (
	'Bong Joon-ho',
	'1969-09-14',
	'South Korea'
)

INSERT INTO Studios
VALUES (
	'CJ Entertainment',
	'South Korea',
	'Seoul'
)*/

INSERT INTO Films 
VALUES (
	'Dheepan',
	2015,
	'Crime film',
	'French',
	$8000000,
	2,
	5,
	115
),
(
	'Parasite',
	2018,
	'Thriller',
	'Korean',
	$15500000,
	6,
	6, 
	132
)

