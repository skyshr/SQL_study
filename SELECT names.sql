-- table world

-- name	    continent   capital
-- Afghanistan	Asia    Kabul
-- Albania	    Europe  Tirana
-- Algeria	    Africa  Algiers
-- Andorra	    Europe  Andorra la Vella
-- Angola	    Africa  Luanda

-- 1. LIKE 
-- SELECT [column 명] FROM [table 명] WHERE [column 명] LIKE [PATTERN]
-- LIKE는 문자열 패턴 일치조건으로 쓰인다.

-- ex)
SELECT name FROM world WHERE name LIKE '%a';

-- result:

-- name
-- Albania
-- Algeria
-- Andorra
-- Angola

-- => %는 서식 지정자로 임의의 문자열을 의미한다(asterisk *에 해당).
-- => '%a'는 테이블에서 a로 끝나는 모든 name들을 조회한다.

-- ex) 
SELECT name FROM world WHERE name LIKE '%o%';

-- result:

-- name
-- Andorra
-- Angola

-- ex)
SELECT name FROM world WHERE name LIKE '%stan';

-- result:

-- name	
-- Afghanistan

-- ex)
SELECT name FROM world WHERE name LIKE '%r%r%';

-- result:

-- name	
-- Andorra

-- ex)
SELECT name FROM world WHERE name LIKE '_______';

-- result:

-- name
-- Albania
-- Algeria
-- Andorra

-- => _는 공백이 아닌 임의의 문자 하나를 의미한다. 따라서 위의 조건은 길이가 7인 단어들을 조회한다.

-- 2. ORDER BY
-- SELECT [column 명] FROM [table 명] WHERE [column 명] [condition 1] ORDER BY [condition 2]
-- => ORDER BY [condition]은 condition 조건으로 테이블을 정렬한다는 뜻이다.

-- ex)
SELECT name FROM world WHERE name LIKE '_l%' ORDER BY name;

-- result:

-- name
-- Albania
-- Algeria


-- 3. CONCAT
-- SELECT [column 명] FROM [table 명] WHERE [column 명] LIKE CONCAT(string 1, string 2, ...)
-- CONCAT(string 1, string 2, ...)는 string1, string2, ...을 이어붙인 문자열을 뜻한다.

-- ex)
SELECT capital, name FROM world 
WHERE capital LIKE CONCAT(name, '%') 
AND LENGTH(capital) > LENGTH(name);

-- result:

-- capital          name
-- Andorra la Vella Andorra

-- 1) SELECT capital, name FROM world  =>  world테이블에서 capital, name컬럼들 순으로 조회
-- 2) WHERE capital LIKE CONCAT(name, '%')  => 그 중 capital의 결과가 name컬럼과 임의의 문자열을 합친 것
-- 3) AND LENGTH(capital) > LENGTH(name);   => 그리고 capital의 길이가 name의 길이보다 긴 것들을 선택

-- 4. REPLACE
-- REPLACE(string, pattern 1, pattern 2)
-- string에서 pattern 1에 해당하는 모든 부분을 pattern 2로 치환환

-- ex)
SELECT name, REPLACE(capital, name, '') as extension FROM world
WHERE capital LIKE CONCAT(name, '%')
AND LENGTH(capital) > LENGTH(name);

-- result:

-- name    extension
-- Andorra  la Vella

-- 1) SELECT name, REPLACE(capital, name, '') as extension FROM world
-- => name 컬럼과 REPLACE(capital, name, '')컬럼을 extension으로 칭하여 조회
-- => 이때 REPLACE컬럼은 capital에서 name에 해당되는 부분을 ''으로 공백치환한 결과를 저장

-- 2) WHERE capital LIKE CONCAT(name, '%')
-- AND LENGTH(capital) > LENGTH(name);
-- => 위의 예시와 동일
