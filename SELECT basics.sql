-- table world

-- name             continent	area	population	gdp
-- Afghanistan	    Asia	    652230	25500100	20343000000
-- Albania	        Europe	    28748	2831741	    12960000000
-- Algeria	        Africa	    2381741	37100000	188681000000
-- Andorra	        Europe	    468	    78115	    3712000000
-- Angola	        Africa	    1246700	20609294	100990000000

-- 단일 컬럼 선택
-- 1. SELECT [column 명] FROM [table 명] WHERE [column 명] = [VALUE]
-- ex)
SELECT continent FROM world WHERE population = 78115;

-- result: 
-- continent
-- Europe

-- 다중 컬럼 선택, IN 조건
-- 2. SELECT [column 명], [column 명] FROM [table 명] WHERE [column 명] IN [(VALUE1, VALUE2, ...)]
-- ex)
SELECT name, area FROM world WHERE name IN ('Afghanistan', 'Algeria', 'Andorra', 'Angolla');

-- result:
-- name             area
-- Afghanistan      652230
-- Algeria          2381741
-- Andorra          468

-- BETWEEN 조건
-- 3. SELECT [column 명] FROM [table 명] WHERE [column 명] BETWEEN [VALUE1] AND [VALUE2]
-- ex)
SELECT name, population FROM world WHERE gdp BETWEEN 10000000000 AND 100990000001;

-- result:
-- name             population
-- Afghanistan      25500100
-- Albania          2831741
-- Angola           20609294