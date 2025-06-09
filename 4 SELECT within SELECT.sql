SELECT name 
  FROM world
 WHERE population > (
       SELECT population
         FROM world
        WHERE name='Russia'
       )

SELECT name
  FROM world
 WHERE continent = 'Europe'
   AND gdp/population > (
       SELECT gdp/population
         FROM world
        WHERE name='United Kingdom'
       )

SELECT name, continent
  FROM world
 WHERE continent IN (
       SELECT continent
         FROM world
        WHERE name IN ('Argentina', 'Australia')
       )

SELECT name, population
  FROM world
 WHERE population > (
       SELECT population
         FROM world
        WHERE name = 'United Kingdom'
       )
   AND population < (
       SELECT population
         FROM world
        WHERE name = 'Germany'
       )

SELECT name, CONCAT(ROUND((population/(
                           SELECT population
                             FROM world
                            WHERE name = 'Germany'
                            ))*100, 0),'%')
                        AS percentage
  FROM world
 WHERE continent = 'Europe'

SELECT name
  FROM world
 WHERE gdp > ALL (
             SELECT gdp
               FROM world
              WHERE continent = 'Europe'
 )

SELECT continent, name, area
  FROM world x
 WHERE area >= ALL (
               SELECT area
               FROM world y
               WHERE y.continent=x.continent
               AND area > 0
 )

SELECT continent, name
  FROM world x
 WHERE name = (
       SELECT MIN(name)
         FROM world y
        WHERE x.continent = y.continent
          AND name LIKE 'A%'
 )

SELECT name, continent, population
  FROM world
 WHERE continent IN (
       SELECT continent
       FROM world
       HAVING MAX(population) <= 25000000
 )

SELECT name, continent
  FROM world x
 WHERE population > ALL (
       SELECT 3 * population
       FROM world y
       WHERE x.continent = y.continent  -- Same continent
       AND y.name != x.name            -- Exclude self
 )