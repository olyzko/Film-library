-- Find the names and the birth dates of actors, who played in films, directed by 20th Century Fox

/*
SELECT DISTINCT actors.name, actors.birth_date
FROM studio 
INNER JOIN films ON studio.ID = films.studio
INNER JOIN roles ON films.ID = roles.film 
INNER JOIN actors ON actors.ID = roles.actor 
WHERE studio.name = '20th Century Fox';
*/

-- Find the titles of films, where at least one actor from cast was born between 1970 and 1985, sorted in alphabet order

/*
SELECT DISTINCT films.title
FROM films 
INNER JOIN roles ON films.ID = roles.film 
INNER JOIN actors ON actors.ID = roles.actor
WHERE actors.birth_date BETWEEN 1970-01-01 AND 1985-12-31
ORDER BY 1;
*/

-- Find the titles of films, where all actors from cast were born in 1970 or later

/*
SELECT DISTINCT films.title
FROM films 
INNER JOIN roles ON films.ID = roles.film 
INNER JOIN actors ON actors.ID = roles.actor
WHERE ALL actors.birth_date > 1970-01-01;
*/

-- Find the average budget of films grouped by language for those languages which have more than 1 film

/*
SELECT 
	language,
	AVG(budget) AS average_budget,
	MIN(release_year) AS earliest_year
FROM films
GROUP BY language
HAVING COUNT(*) > 1
*/

-- Find actors who played in all films of certain genre in certain language

/*
SELECT a.name
FROM actors AS a
WHERE NOT EXISTS
(
     SELECT films.ID
     FROM films
     WHERE films.genre = 'Crime film' AND films.language = 'French' AND NOT EXISTS 
     (
           SELECT *
           FROM (actors INNER JOIN roles ON actors.ID = roles.actor)
           WHERE actors.ID = a.ID AND films.ID = roles.film  
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
FROM films
ORDER BY length
*/

-- Show names and birth dates for each actor and film director

SELECT name, birth_date, country
FROM actors

UNION ALL

SELECT name, birth_date, country
FROM director