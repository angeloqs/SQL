SELECT matchid, player 
  FROM goal
 WHERE teamid = 'GER'

SELECT id, stadium, team1, team2
  FROM game
 WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER'

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%'

 SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime <= 10

SELECT mdate, teamname
  FROM game JOIN eteam ON (team1=eteam.id)
 WHERE coach = 'Fernando Santos'

SELECT player
  FROM game JOIN goal ON (id=matchid)
 WHERE stadium =  'National Stadium, Warsaw'

/* Errada */.
SELECT player
  FROM game JOIN goal ON (matchid = id)
WHERE (team1='GER' OR team2='GER')

SELECT teamname, COUNT(gtime)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

SELECT stadium, COUNT(gtime)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium

SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON id = matchid
 WHERE 'POL' IN (team1, team2)
 GROUP BY id, mdate

/* Errada */.
   SELECT g.mdate,
          t1.id AS team1,
          SUM(CASE WHEN go.teamid = g.team1 THEN 1 ELSE 0 END) AS score1,
          t2.id AS team2,
          SUM(CASE WHEN go.teamid = g.team2 THEN 1 ELSE 0 END) AS score2
     FROM game g LEFT JOIN goal go ON g.id = go.matchid
LEFT JOIN eteam t1 ON g.team1 = t1.id
LEFT JOIN eteam t2 ON g.team2 = t2.id
 GROUP BY g.id, g.mdate, t1.teamname, t2.teamname
 ORDER BY g.mdate, g.id, team1, team2;