-- table world

-- name	        continent	    area	    population	gdp	            capital
-- Australia	Oceania	        7692024	    23545500	1564419000000	Canberra
-- Brazil	    South America	8515767	    202794000	2254109000000	BrasÃ­lia
-- Canada	    North America	9984670	    35427524	1585000000000	Ottowa
-- Indonesia	Asia	        1904569	    252164800	878043000000	Jakarta
-- Mozambique	Africa	        801590	    23700715	14605000000	    Maputo
-- Russia	    Eurasia	        17125242	146000000	2029812000000	Moscow

-- 1. XOR
-- SELECT [column 명] FROM [table 명] WHERE [condition 1] XOR [condition 2]
-- condition 1 또는 condition 2를 만족하고 둘 다 동시에 만족하지 않는 조건
-- [condition 1] AND NOT [condition 2] OR NOT [condition 1] AND [condition 2] 와 동치

-- ex)
SELECT name, population, area
FROM world
WHERE (area >= 3000000) XOR (population >= 250000000);

-- result:

-- name         population      area
-- Australia	23545500	    7692024
-- Brazil	    202794000	    8515767
-- Canada	    35427524	    9984670
-- Indonesia	252164800	    1904569
-- Russia	    146000000	    17125242

-- 2. ROUND
-- 1) ROUND(column 명) => 숫자 컬럼을 소수점 첫번째 자리에서 반올림
-- 2) ROUND(column 명, 1) => 숫자 컬럼을 소수점 두번째 자리에서 반올림하여 소수점점 첫짜리까지 표시

-- ex)
SELECT name,(ROUND(population / 1000000, 2)) AS population, (ROUND(gdp / 1000000000, 2)) AS GDP
FROM world
WHERE continent = 'South America';

-- result:

-- name     population  GDP
-- Brazil	202.79	    2254.11

-- 3. LEFT, RIGHT, <>
-- LEFT(column 명, num), RIGHT(column 명, num) => 각각 해당 column의 문자열 왼쪽, 오른쪽에서 num번째의 문자를 읽음

-- ex)
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital;

-- result:

-- name         capital
-- Brazil       Brasilia
-- Mozambique   Maputo

-- => name의 첫 번째 문자와 capital의 첫 번째 문자가 같되, name != capital 인 data 조회

-- 4. NOT LIKE

-- ex)
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'

-- result:

-- name
-- Mozambique

-- => name컬럼에서 a, e, i, o, u 모든 모음을 포함하고, 공백으로 분리되지 않은(NOT LIKE '% %') data 조회