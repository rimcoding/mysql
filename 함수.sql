use shopdb;

/*
NOW(), CURDATE(),
CURTIME(), YEAR(),
MONTH(), DAY(), HOUR()
*/

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

-- String Function

SELECT ASCII('U');
-- 글자수 띄워쓰기도 포함
SELECT char_length('my sql test');
-- 합쳐서 표현해줌 띄워쓰기 포함
SELECT concat("green","class","   100") AS title;
-- 첫번째 문자열이 중간 중간 들어감
SELECT CONCAT_WS("->","class","mysql","홍길동");
-- 단어가 몇번째 위치인지 알려줌
SELECT FIND_IN_SET('q','s,q,l');
-- 소수점을 몇자리까지 나오게 할지 정함
SELECT FORMAT(2500.123,2);
-- 소문자로 바꿔줌
SELECT LCASE('HELLO JAVA');
-- 대문자로 바꿔줌
SELECT UCASE('hello java');
-- 양쪽에 공백제거 (양쪽 띄워쓰기 제거)
SELECT TRIM(' MY S Q L ');
-- 뒤에 공백크기를 정해준 값이랑 동일한 공백 제거
SELECT REPLACE('   MY S Q L ', ' ',  '');

-- MySql NUMBERIC FUNCTION
SELECT * FROM buyTBL;

SELECT *, SUM(price) as '상품가격에 총 합' FROM buyTBL;

SELECT *,(SELECT SUM(price) FROM buyTBL) as 총합계
FROM
buytbl;

-- avg 평균 값 계산
SELECT *, AVG(price) AS '상품평균가격'
FROM buyTBL;

SELECT *, (SELECT AVG(price) FROM buyTBL) AS 평균값
FROM buyTBL;

-- 올림 함수
SELECT CEIL(25.12);

-- 반올림 함수
SELECT ROUND(123.36, 1);

-- 내림 함수
SELECT FLOOR(25.75);
    
SELECT MIN(price)
FROM buytbl;
    
SELECT proName, MAX(price)
FROM buytbl;