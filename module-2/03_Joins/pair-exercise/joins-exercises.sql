-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)

SELECT city.name
        , c.name
        , city.population
FROM city
INNER JOIN country AS c
        ON city.countrycode = c.code
WHERE city.population > 1000000
        AND continent = 'Europe';


-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)

SELECT city.name
        , c.name
        , city.population
FROM city
INNER JOIN country AS c
        ON city.countrycode = c.code
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE city.population > 1000000
        AND isofficial = true
--        AND continent = 'Europe'
        AND language = 'French';


-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)

SELECT c.name
        , c.continent
FROM country AS c
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE language = 'Javanese';


-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)

SELECT c.name
FROM country AS c
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE continent = 'Africa'
        AND isofficial = true
        AND language = 'French';


-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)

SELECT AVG(city.population)
FROM city
INNER JOIN country AS c
        ON city.countrycode = c.code
WHERE continent = 'Europe';


-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)

SELECT AVG(city.population)
FROM city
INNER JOIN country AS c
        ON city.countrycode = c.code
WHERE continent = 'Asia';


-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)

SELECT COUNT(city.name)
FROM country AS c
INNER JOIN city
        ON c.code = city.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE language = 'English'
AND isofficial = true;


-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)

SELECT AVG(city.population)
FROM city
INNER JOIN country AS c
        ON city.countrycode = c.code
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE language = 'English'
AND isofficial = true;

-- 9. The names of all of the continents and the population of the continent???s largest city
-- (6 rows, largest population for North America: 8,591,309)

SELECT MAX(city.population)
        , c.continent
FROM country AS c
INNER JOIN city
        ON c.code = city.countrycode
GROUP BY c.continent;



-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city???s country
-- (29 rows)

SELECT city.name
        , cl.language
FROM city
INNER JOIN country AS c 
        ON c.code = city.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code =cl.countrycode
WHERE city.population > 1000000
AND c.continent = 'South America'
AND isofficial = true;

