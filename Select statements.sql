-- Find the names and the birth dates of actors, who played in films, directed by 20th Century Fox

/*
SELECT DISTINCT Actors.name, Actors.birth_date
FROM Studios 
INNER JOIN Films ON studio.ID = Films.studio
INNER JOIN Roles ON Films.ID = Roles.film 
INNER JOIN Actors ON Actors.ID = Roles.actor
WHERE Studios.name = '20th Century Fox';
*/

-- Find the titles of films, where at least one actor from cast was born between 1970 and 1985, sorted in alphabet order

/*
SELECT DISTINCT Films.title
FROM Films 
INNER JOIN Roles ON films.ID = Roles.film 
INNER JOIN Actors ON Actors.ID = Roles.actor
WHERE Actors.birth_date BETWEEN 1970-01-01 AND 1985-12-31
ORDER BY 1;
*/

-- Find the titles of films, where all actors from cast were born in 1970 or later

/*
SELECT DISTINCT Films.title
FROM Films 
INNER JOIN Roles ON Films.ID = Roles.film 
INNER JOIN Actors ON Actors.ID = Roles.actor
WHERE ALL Actors.birth_date > 1970-01-01;
*/

-- Find the average budget of films grouped by language for those languages which have more than 1 film

/*
SELECT 
	language,
	AVG(budget) AS average_budget,
	MIN(release_year) AS earliest_year
FROM Films
GROUP BY language
HAVING COUNT(*) > 1
*/

-- Find actors who played in all films of certain genre in certain language

/*
SELECT a.name
FROM Actors AS a
WHERE NOT EXISTS
(
     SELECT Films.ID
     FROM Films
     WHERE Films.genre = 'Crime film' AND Films.language = 'French' AND NOT EXISTS 
     (
           SELECT *
           FROM (Actors INNER JOIN Roles ON Actors.ID = Roles.actor)
           WHERE Actors.ID = a.ID AND Films.ID = Roles.film  
     )
);
*/

-- Rank films by budget for each language

/*
SELECT 
	title,
	language,
	budget,
	ROW_NUMBER() OVER (PARTITION BY language ORDER BY budget DESC ) AS budget_rank
FROM Films
ORDER BY length
*/

-- Show names and birth dates for each actor and film director
/*
SELECT name, birth_date, country
FROM Actors
UNION ALL
SELECT name, birth_date, country
FROM Director
*/

-- Find directors of all films where at least one actor from France of United Kingdom, whose first name starts with 'T', played

/*
SELECT DISTINCT Directors.name
FROM Directors
INNER JOIN Films ON Directors.id = Films.director
INNER JOIN Roles ON Films.ID = Roles.film 
INNER JOIN Actors ON Roles.actor = Actors.ID
WHERE Actors.name LIKE 'T%'
AND Actors.country IN ('France', 'United Kingdom')
*/

-- Find title and director name for films with 50% highest budget

/*
SELECT TOP 50 PERCENT 
	Films.title AS film,
	Directors.name AS directors,
	Films.budget
FROM Directors
LEFT JOIN Films ON Directors.id = Films.director
ORDER BY budget DESC
*/