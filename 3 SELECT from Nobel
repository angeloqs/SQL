SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

SELECT winner
  FROM nobel
 WHERE subject = 'peace'
   AND yr >= 2000

 SELECT yr, subject, winner
   FROM nobel
  WHERE subject = 'literature'
    AND yr BETWEEN 1980 AND 1989

SELECT *
  FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                 'Thomas Woodrow Wilson',
                 'Jimmy Carter',
                 'Barack Obama')

SELECT winner
  FROM nobel
 WHERE winner LIKE ('John%')

SELECT *
  FROM nobel
 WHERE (yr = 1980 AND subject = 'physics')
    OR (yr = 1984 AND subject = 'chemistry')

SELECT *
  FROM nobel
 WHERE yr = 1980
   AND subject NOT IN ('chemistry', 'medicine')

SELECT *
  FROM nobel
 WHERE (subject = 'Medicine' AND yr < 1910)
    OR (subject = 'Literature' AND yr >= 2004)

SELECT *
  FROM nobel
 WHERE winner = 'Peter Grünberg'

SELECT *
  FROM nobel
 WHERE winner = "Eugene O'Neill"

  SELECT winner, yr, subject
    FROM nobel
   WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

  SELECT winner, subject
    FROM nobel
   WHERE yr = 1984
ORDER BY subject IN ('chemistry', 'physics'),
         subject,
         winner
