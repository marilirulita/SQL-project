SELECT population FROM world WHERE name = 'Germany';
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

SELECT name, population FROM world WHERE population BETWEEN 1000000 AND 1250000;
SELECT name, population FROM world WHERE name LIKE 'Al%';
SELECT name FROM world WHERE name LIKE '%a' OR name LIKE '%l';
SELECT name,length(name) FROM world WHERE length(name)=5 and continent='Europe';
SELECT name, area*2 FROM world WHERE population = 64000;
SELECT name, area, population FROM world WHERE area > 50000 AND population < 10000000;
SELECT name, population/area FROM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');


SELECT name FROM world WHERE name LIKE 'Y%';
SELECT name FROM world WHERE name LIKE '%y';
SELECT name FROM world WHERE name LIKE '%x%';
SELECT name FROM world WHERE name LIKE '%land';
SELECT name FROM world WHERE name LIKE 'C%ia';
SELECT name FROM world WHERE name LIKE '%oo%';
SELECT name FROM world WHERE name LIKE '%a%a%a%';
SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name;
SELECT name FROM world WHERE name LIKE '%o__o%';
SELECT name FROM world WHERE name LIKE '____';
SELECT name FROM world WHERE name = capital;
SELECT name FROM world WHERE capital like '%City';
SELECT capital, name FROM world WHERE capital LIKE CONCAT('%', name, '%');
SELECT capital, name FROM world WHERE capital LIKE CONCAT(name, '_%');
SELECT name, REPLACE(capital, name, '') AS ext FROM world WHERE capital LIKE CONCAT(name, '_%');


SELECT name, continent, population FROM world;
SELECT name FROM world WHERE population > 200000000;
SELECT name, GDP/population FROM world WHERE population > 200000000;
SELECT name, population/1000000 FROM world WHERE continent = 'South America';
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');
SELECT name FROM world WHERE name LIKE '%United%';
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South America';
SELECT name, ROUND(gdp/population, -3) FROM world WHERE gdp > 1000000000000;
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;
SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';

SELECT name FROM world WHERE name LIKE 'U%';
SELECT population FROM world WHERE name = 'United Kingdom';
SELECT continent FROM world WHERE name = 'France';
SELECT name, population / 10 FROM world WHERE population < 10000;
SELECT name, population FROM world WHERE continent IN ('Europe', 'Asia');
SELECT name FROM world WHERE name IN ('Cuba', 'Togo');
SELECT name FROM world WHERE continent = 'South America' AND population > 40000000;


SELECT * FROM nobel WHERE yr = 1950;
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature';
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000;
SELECT * FROM nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;
SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');
SELECT winner FROM nobel WHERE winner LIKE 'John%';
SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;
SELECT * FROM nobel WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine';
SELECT * FROM nobel WHERE yr < 1910 AND subject = 'Medicine' OR subject = 'Literature' AND yr >= 2004;
SELECT * FROM nobel WHERE winner LIKE 'PETER GRÜNBERG';
SELECT * FROM nobel WHERE winner LIKE 'EUGENE O''NEILL';
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC;
SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;

SELECT winner FROM nobel WHERE winner LIKE 'C%n';
SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960;
SELECT COUNT(DISTINCT yr) FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%';
SELECT yr FROM nobel WHERE yr NOT IN(SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'));
SELECT DISTINCT yr FROM nobel WHERE subject='Medicine' AND yr NOT IN(SELECT yr FROM nobel WHERE subject='Literature') AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace');
SELECT subject, COUNT(subject) FROM nobel WHERE yr ='1960' GROUP BY subject;


SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia');
SELECT name FROM world WHERE (gdp/population) > (SELECT (gdp/population) FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland');
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100, 0), '%') FROM world WHERE continent = 'Europe';
SELECT name FROM world WHERE gdp > ALL (SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');
SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0);
SELECT continent, MIN(name) FROM world GROUP BY continent;
SELECT name, continent, population FROM world WHERE continent NOT IN (SELECT continent FROM world WHERE population > 25000000);
SELECT name, continent FROM world x WHERE population > ALL (SELECT population * 3 FROM world y WHERE y.continent = x.continent AND y.name != x.name);

SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);
SELECT name, region FROM bbc x WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);
SELECT name FROM bbc WHERE population > (SELECT population FROM bbc WHERE name='United Kingdom') AND region IN (SELECT region FROM bbc WHERE name = 'United Kingdom');
SELECT name FROM bbc WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');
SELECT name FROM bbc WHERE population < (SELECT population FROM bbc WHERE name='Russia') AND population > (SELECT population FROM bbc WHERE name='Denmark');
SELECT name FROM bbc WHERE population > ALL (SELECT MAX(population) FROM bbc WHERE region = 'Europe') AND region = 'South Asia';


SELECT SUM(population) FROM world;
SELECT DISTINCT continent FROM world;
SELECT SUM(gdp) FROM world WHERE continent = 'Africa';
SELECT COUNT(name) FROM world WHERE area >= 1000000;
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
SELECT continent, COUNT(name) FROM world GROUP BY continent;
SELECT continent, SUM(population) FROM world GROUP BY continent;
SELECT continent, COUNT(name) FROM world WHERE population>200000000 GROUP BY continent;
SELECT continent, SUM(population) FROM world GROUP BY continent HAVING SUM(population)>500000000;

SELECT SUM(population) FROM bbc WHERE region = 'Europe';
SELECT COUNT(name) FROM bbc WHERE population < 150000;
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region;
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);
SELECT region, SUM(area) FROM bbc GROUP BY region HAVING SUM(area)<= 20000000;

SELECT subject, COUNT(winner) FROM nobel GROUP BY subject;
SELECT subject, MIN(yr) FROM nobel GROUP BY subject;
SELECT subject, COUNT(winner) FROM nobel WHERE yr = '2000' GROUP BY subject;
SELECT COUNT(subject), COUNT(DISTINCT subject) FROM nobel WHERE yr = 1915;
SELECT subject, COUNT(DISTINCT winner) FROM nobel GROUP BY subject;
SELECT subject, COUNT(DISTINCT yr) FROM nobel GROUP BY subject;
SELECT yr FROM nobel WHERE subject = 'Physics' GROUP BY yr HAVING COUNT(winner) = 3;
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(winner) > 1;
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(DISTINCT subject) > 1;
SELECT yr, subject FROM nobel WHERE yr >= 2000 GROUP BY yr, subject HAVING COUNT(subject) = 3;


SELECT matchid, player FROM goal WHERE teamid = 'GER';
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012;
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER';
SELECT team1, team2, player FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%';
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON (teamid=id) WHERE gtime<=10;
SELECT mdate, teamname FROM game JOIN eteam ON (team1 = eteam.id) WHERE eteam.id = team1 AND coach = 'Fernando Santos';
SELECT player FROM game JOIN goal ON (id = matchid) WHERE stadium = 'National Stadium, Warsaw';
SELECT DISTINCT player FROM game JOIN goal ON matchid = id WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER');
SELECT teamname, COUNT(*) FROM eteam JOIN goal ON id=teamid GROUP BY teamname;
SELECT stadium, COUNT(stadium) FROM game JOIN goal ON id=matchid GROUP BY stadium;
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id WHERE teamid = 'GER' GROUP BY matchid, mdate;
SELECT name, population ,CASE WHEN population<1000000 THEN 'small' WHEN population<10000000 THEN 'medium' ELSE 'large' END FROM world;
SELECT mdate, team1, 
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 FROM game LEFT JOIN goal ON id = matchid GROUP BY mdate, matchid, team1, team2;

SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE' GROUP BY player, teamid;
SELECT DISTINCT teamid, mdate FROM goal JOIN game on (matchid=id) WHERE mdate = '9 June 2012';
SELECT DISTINCT player, teamid FROM game JOIN goal ON matchid = id WHERE stadium = 'National Stadium, Warsaw' AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';
SELECT DISTINCT player, teamid, gtime FROM game JOIN goal ON matchid = id WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));
SELECT teamname, COUNT(*) FROM eteam JOIN goal ON teamid = id GROUP BY teamname HAVING COUNT(*) < 3;

SELECT title, artist FROM album JOIN track ON (album.asin=track.album) WHERE song = 'Alison';
SELECT artist FROM album JOIN track ON (album.asin=track.album) WHERE song = 'Exodus';
SELECT song FROM album JOIN track ON (album.asin=track.album) WHERE title = 'Blur';
SELECT title, COUNT(*) FROM album JOIN track ON (asin=album) GROUP BY title;
SELECT title, COUNT(song) FROM album JOIN track ON (asin=album) WHERE song LIKE '%Heart%' GROUP BY title;
SELECT song FROM album JOIN track ON (asin=album) WHERE song = title;
SELECT DISTINCT title FROM album JOIN track ON (asin=album) WHERE title = artist;
SELECT song, COUNT(DISTINCT album) FROM track GROUP BY song HAVING COUNT(DISTINCT album) > 2;
SELECT title, price, COUNT(song) FROM album JOIN track x ON (asin=album) WHERE price / (SELECT COUNT(song) FROM track y WHERE x.album = y.album) < .50 GROUP BY title, price;
SELECT title, (SELECT COUNT(song) FROM track y WHERE x.album = y.album) AS counter FROM album JOIN track x ON (asin=album) GROUP BY title, album ORDER BY counter DESC, title;

SELECT who, name FROM ttms JOIN country ON (ttms.country=country.id) WHERE games = 2000;
SELECT who, color FROM ttms JOIN country ON (ttms.country=country.id) WHERE name = 'Sweden';
SELECT games FROM ttms JOIN country ON (ttms.country=country.id) WHERE name = 'China' AND color = 'gold';
SELECT who FROM ttws JOIN games ON (ttws.games=games.yr) WHERE city = 'Barcelona';
SELECT city, color FROM ttws JOIN games ON (ttws.games=games.yr) WHERE who = 'Jing Chen';
SELECT who, city FROM ttws JOIN games ON (ttws.games=games.yr) WHERE color = 'gold';
SELECT games, color FROM ttmd JOIN team ON (ttmd.team=team.id) WHERE name = 'Yan Sen';
SELECT name FROM ttmd JOIN team ON (ttmd.team=team.id) WHERE color = 'gold' AND games = 2004;
SELECT name FROM ttmd JOIN team ON (ttmd.team=team.id) WHERE country = 'FRA';


SELECT * FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id WHERE actor.name='John Hurt';
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = 11768;
SELECT name FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movieid = movie.id WHERE movie.title = 'Alien';
SELECT title FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movieid = movie.id WHERE actor.name = 'Harrison Ford';
SELECT title FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movieid = movie.id WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;
SELECT title, name FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movieid = movie.id WHERE yr = 1962 AND casting.ord = 1;
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;
SELECT title, name FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id WHERE ord = 1 AND movieid IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'));
SELECT name FROM casting JOIN actor ON actorid=actor.id WHERE ord = 1 GROUP BY name HAVING COUNT(name) >= 15 ORDER BY name;
SELECT title, COUNT(actorid) FROM movie JOIN casting ON movie.id=movieid WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title;
SELECT name FROM casting JOIN actor ON actorid=actor.id WHERE name != 'Art Garfunkel' AND movieid IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Art Garfunkel'));

SELECT name FROM actor INNER JOIN movie ON actor.id = director WHERE gross < budget;
SELECT * FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid;
SELECT name, COUNT(movieid) FROM casting JOIN actor ON actorid=actor.id WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;
SELECT title FROM movie JOIN casting ON (movieid=movie.id) JOIN actor ON (actorid=actor.id) WHERE name='Paul Hogan' AND ord = 1;
SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351;
SELECT title, yr FROM movie, casting, actor WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;


SELECT code, name FROM party WHERE leader IS NULL;
SELECT name FROM teacher WHERE dept IS NULL;
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id);
SELECT name, party, COALESCE(party,'None') AS aff FROM msp WHERE name LIKE 'C%';
SELECT name, party, NULLIF(party,'Lab') AS aff FROM msp WHERE name LIKE 'C%';
SELECT name, COALESCE(mobile, '07986 444 2266')  FROM teacher;
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);
SELECT COUNT(name), COUNT(mobile) FROM teacher;
SELECT dept.name, COUNT(teacher.dept) FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id) WHERE teacher.dept = dept.id OR teacher.dept IS NULL GROUP BY dept.name;
SELECT teacher.name, CASE WHEN dept.id = 1 OR dept.id = 2 THEN 'Sci' ELSE 'Art' END AS names FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);
SELECT teacher.name, CASE WHEN dept.id = 1 OR dept.id = 2 THEN 'Sci' WHEN dept.id = 3 THEN 'Art' ELSE 'None' END AS names FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;
SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher;
SELECT name, CASE WHEN phone = 2752 THEN 'two' WHEN phone = 2753 THEN 'three' WHEN phone = 2754 THEN 'four' END AS digit FROM teacher;
SELECT name, CASE WHEN dept IN (1) THEN 'Computing' ELSE 'Other' END FROM teacher;

SELECT name FROM msp WHERE party IS NULL;
SELECT name, leader FROM party;
SELECT name, leader FROM party WHERE leader IS NOT NULL;
SELECT DISTINCT party.name FROM party JOIN msp ON party = code WHERE msp.name IS NOT NULL;
SELECT msp.name, party.name FROM party RIGHT JOIN msp ON party = code ORDER BY msp.name;
SELECT party.name, COUNT(msp.name) FROM party RIGHT JOIN msp ON party = code WHERE party.name IS NOT NULL GROUP BY party.name;
SELECT party.name, COUNT(msp.name) FROM party LEFT JOIN msp ON party = code GROUP BY party.name;


--- nss tests, pending 6, 7, 8 ---
SELECT A_STRONGLY_AGREE FROM nss WHERE question='Q01' AND institution='Edinburgh Napier University' AND subject='(8) Computer Science';
SELECT institution, subject FROM nss WHERE question='Q15' AND score >=100;
SELECT institution,score FROM nss WHERE question='Q15' AND subject='(8) Computer Science' AND score < 50;
SELECT subject, SUM(response) FROM nss WHERE question='Q22' AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design') GROUP BY subject;
SELECT subject, SUM((A_STRONGLY_AGREE * response) / 100) FROM nss WHERE question='Q22' AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design') GROUP BY subject;


--- window functions, pending 5 and 6 ---
SELECT lastName, party, votes FROM ge WHERE constituency = 'S14000024' AND yr = 2017 ORDER BY votes DESC;
SELECT party, votes, RANK() OVER (ORDER BY votes DESC) as posn FROM ge WHERE constituency = 'S14000024' AND yr = 2017 ORDER BY party;
SELECT yr,party, votes, RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn FROM ge WHERE constituency = 'S14000021' ORDER BY party, yr;
SELECT constituency,party, votes, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn FROM ge WHERE constituency BETWEEN 'S14000021' AND 'S14000026' AND yr  = 2017 ORDER BY posn, constituency;

--- posible answer 5 ---
SELECT * FROM (SELECT constituency,party, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
  FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
) t WHERE posn = 1 
ORDER BY constituency;

SELECT constituency,party, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
  FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY constituency;


--- window lag, covid 19, pending 8 ---
SELECT name, DAY(whn), confirmed, deaths, recovered FROM covid WHERE name = 'Spain' AND MONTH(whn) = 3 ORDER BY whn;
SELECT name, DAY(whn), confirmed, LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) FROM covid WHERE name = 'Italy' AND MONTH(whn) = 3 ORDER BY whn;
SELECT name, DAY(whn), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS lag FROM covid WHERE name = 'Italy' AND MONTH(whn) = 3 ORDER BY whn;
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS lag FROM covid WHERE name = 'Italy' AND WEEKDAY(whn) = 0 ORDER BY whn;
SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), tw.confirmed - lw.confirmed FROM covid tw LEFT JOIN covid lw ON DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn AND tw.name=lw.name WHERE tw.name = 'Italy' AND WEEKDAY(tw.whn) = 0 ORDER BY tw.whn;
SELECT name, confirmed, RANK() OVER (ORDER BY confirmed DESC) rc, deaths, RANK() OVER (ORDER BY deaths DESC) rd FROM covid WHERE whn = '2020-04-20' ORDER BY confirmed DESC;
SELECT world.name, ROUND(100000*confirmed/population,0), RANK() OVER (ORDER BY confirmed/population) rank FROM covid LEFT JOIN world ON covid.name=world.name WHERE whn = '2020-04-20' AND population > 10000000 ORDER BY population DESC;


SELECT COUNT(*) FROM stops;
SELECT id FROM stops WHERE name = 'Craiglockhart';
SELECT id, name FROM stops JOIN route ON id = stop WHERE company = 'LRT' AND num = '4';
SELECT company, num, COUNT(*) FROM route WHERE stop=149 OR stop=53 GROUP BY company, num HAVING COUNT(*) = 2;
SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) WHERE a.stop=53 AND b.stop = 149;
SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Haymarket' AND stopb.name = 'Leith';
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross';
SELECT DISTINCT stopb.name, a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' AND a.company = 'LRT';

--- posible answer self join, question 10 ---
SELECT DISTINCT  a.num, a.company, stopb.name, b.num, b.company
FROM route a JOIN route b ON
  (a.stop=b.stop)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

SELECT DISTINCT a.name, b.name FROM stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Haymarket';
SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id AND R2.num='2A';
SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Tollcross';
