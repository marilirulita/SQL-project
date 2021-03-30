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
