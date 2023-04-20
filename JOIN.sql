CREATE DATABASE shopdb;
USE shopdb;

CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);

ALTER TABLE userTBL MODIFY mobile VARCHAR(13);

CREATE TABLE buyTBL (
	username CHAR(3) NOT NULL,
    proName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (username) REFERENCES userTBL (username)
);
INSERT INTO userTBL
VALUES
		('이승기', 1987, '서울', '010-1234-1234'),
		('홍길동', 1911, '부산', '010-2222-3333'),
		('이순신', 1999, '대구', '010-3333-4444');

SELECT * FROM buyTBL;
INSERT INTO buyTBL
VALUES
		('이승기', '운동화', 50, 1),
        ('이승기', '노트북', 150, 1),
        ('홍길동', '책', 10, 5),
        ('홍길동', '모니터', 200, 2),
        ('이순신', '청바지', 40, 1),
        ('이순신', '책', 10, 3);
        -- 부모 테이블 현재 userTBL에 야스오는 없는 사람이기 때문에 존재할 수 없다.
        -- ('야스오', '책', 10, 3)
        
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- INNER JOIN
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- LEFT JOIN
SELECT * FROM userTBL LEFT JOIN buyTBL ON userTBL.username = buyTBL.username;

-- 야스오 회원 가입 함
INSERT INTO userTBL(username, birthYear, addr, mobile)
VALUES
	('야스오', 2020, '부산', '010-1234-1234');
    
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 다시 INNER JOIN

SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

-- 별칭 사용 LEFT JOIN, LEFT JOIN IS NOT NULL

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 선정하는게 좋다.
SELECT *
FROM buyTBL AS B
LEFT JOIN userTBL AS U
ON B.username = U.username;

-- RIGHT JOIN

SELECT U.username, B.proName, B.price, B.amount
FROM userTBL AS U
RIGHT JOIN buyTBL AS B
ON U.username = B.username;

-- 문제 작성 3문제

-- 야스오 정보만 출력하기
SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NULL;

-- 책을 구매한 사람정보 출력하기
SELECT * FROM userTBL AS URIGHT JOIN buyTBL AS B ON U.username = B.username WHERE B.proName LIKE '%책%';

-- 이승기 정보,구매내역만 출력하기
SELECT *
FROM userTBL AS U
RIGHT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username LIKE '%이승기%';

-- 성이 이씨이면서 태어난 년도가 1999년인 구매한 아이템 정보를 표시해주세요.
SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username
WHERE U.birthYear = 1999 AND U.username LIKE '이%';

-- 기준 테이블은 userTBL로 하고 LEFTJOIN을 사용하여
-- 주문자 이름과 주소,전화번호,상품이름,가격,주문수량을 출력해보자 
-- (단,주문정보가 없는경우 출력하지 않는다)

SELECT U.username, U.addr, U.mobile, B.proName, B.price, B.amount
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN을 사용하여 NULL값도 확인할수 있게 출력

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE U.username IS NOT NULL;

-- userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라

SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username
WHERE B.amount >= 3;

-- buyTBL 기준으로 RIGHT JOIN 하고 username이 '이승기'이거나 '야스오'이면서
-- userTBL의 username이 null이 아닌 데이터를 조회해라.

SELECT *
FROM userTBL AS U
RIGHT JOIN buyTBL AS B
ON U.username = B.username
WHERE (U.username = '이승기' OR '야스오') 
		-- U.username IN ('이승기','야스오')
	AND U.username IS NOT NULL;

-- 기준 테이블로 buyTBL을 사용해서 LEFTJOIN을 수행하고, 
-- 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오. 

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE U.birthYear = 1999;

 -- 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, 
 -- '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
 
 SELECT U.username,U.mobile
 FROM userTBL AS U
 INNER JOIN buyTBL AS B
 ON U.username = B.username
 WHERE B.proName = '책';
 
 -- 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고,
 -- '대구'에 사는 사람이 구매한 물품들을 출력하시오.
 
 SELECT B.proName
 FROM userTBL AS U
 RIGHT JOIN buyTBL AS B
 ON U.username = B.username
 WHERE U.addr = '대구';
 
 use employees;
 
 SELECT * FROM departments;

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT * FROM buytbl;