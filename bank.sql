
CREATE DATABASE bank;
use bank;

-- 유저 테이블 설계해 보기

CREATE TABLE user_tb(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);
-- 사용자의 계좌 정보 테이블

CREATE TABLE account_tb(
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    balance BIGINT NOT NULL COMMENT '계좌 잔액',
    user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 입금 내역 저장
-- 출금 내역 저장
-- 사용자 간 이체 내역 저장

-- 사용자들의 history 테이블
-- BIGINT 8바이트 크기의 정수형
-- 조(10에 12승) -- 경(10에16승) -- 해(10에 20승)
-- 자(10에 24승) -- 양(10에 28승)
CREATE TABLE history_tb(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '거래내역',
    amount BIGINT NOT NULL COMMENT '거래금액',
    w_account_id INT COMMENT '출금 계좌 id',
    d_account_id INT COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

SELECT * FROM account_tb;
SELECT * FROM history_tb;

a.number -- 계좌번호
a.user_id -- 조인할 유저아이디

SELECT h.*,a.number
FROM history_tb AS h
INNER JOIN account_tb AS a
ON a.user_id = h.d_account_id;

SELECT h.*,a.number
from history_tb AS h
INNER JOIN account_tb AS a
ON a.user_id = h.w_account_id;

SELECT h.d_balance, a.number AS '입금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE d_account_id IS NOT NULL;

INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234',
'고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234',
'애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234',
'마이', now());
INSERT INTO user_tb(username, password, fullname, created_at) VALUES('림이','1234',
'알',now());


SELECT * FROM user_tb;

-- 계좌 테이블 샘플 데이터 

INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());

SELECT * from account_tb;

CREATE TABLE history_tb(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "거래내역",
    amount BIGINT NOT NULL COMMENT '거래금액',
    w_account_id INT COMMENT '출금 계좌 id',
    d_account_id INT COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()
);
-- 히스토리 추적 내용 (이체, 입금 , 출금)
-- 히스토리 테이블에 이체 내역을 기록 ( 1번 계좌에서 2번계좌에 100원을 이체 한다)
INSERT INTO history_tb(amount,w_balance,d_balance,
w_account_id,d_account_id,created_at)
VALUES(100, 900, 1100, 1, 2, now());

-- 출금 내역 ( 1번 계좌에서 100원을 출금하라 )
INSERT INTO history_tb(amount,w_balance,d_balance,
w_account_id,d_account_id,created_at)
VALUES(100,800,null,1,null,now());

-- 입금 내역 ( 1번 계좌에 500원 입금 처리 )
INSERT INTO history_tb(amount,w_balance,d_balance,
w_account_id,d_account_id,created_at)
VALUES(500,null,700,null,1,now());

SELECT * FROM history_tb;

DELETE from history_tb;
ALTER TABLE history_tb AUTO_INCREMENT = 1;

-- 출금 내역 (3번이 1000원을 출금, 잔액 0원인 상태 거래 내역 기록
INSERT INTO history_tb(amount,w_balance,d_balance,
w_account_id,d_account_id,created_at)
VALUES(1000,1000,null,3,null,now());

-- id INT AUTO_INCREMENT PRIMARY KEY COMMENT "거래내역",
--    amount BIGINT NOT NULL COMMENT '거래금액',
--    w_account_id INT COMMENT '출금 계좌 id',
--    d_account_id INT COMMENT '입금 계좌 id',
--    w_balance BIGINT COMMENT '출금 요청된 계좌 잔액',
--    d_balance BIGINT COMMENT '입금 요청된 계좌 잔액',

-- 이체연습(2번에서 3번으로 1000원 이체 한다.)
-- 입금연습
-- 출금연습

SELECT * FROM account_tb; -- 계좌 정보
SELECT * FROM history_tb; -- 입출금 거래 내역
SELECT * FROM user_tb; -- 유저 정보

-- 1. history_tb에서 계좌 id 1번인 입금 내역 만드시오.
SELECT d_account_id,d_balance 
FROM history_tb
INNER JOIN account_tb
WHERE  d_account_id = 1;

-- 2. history_tb에서 계좌 id 1번인 출금 내역 만드시오.
SELECT w_account_id,w_balance
FROM history_tb
INNER JOIN account_tb
WHERE w_account_id = 1;

-- 3. history_tb에서 계좌 id 1번인 입출금 쿼리를 만드시오.
SELECT d_account_id,d_balance,w_account_id,w_balance
FROM history_tb
INNER JOIN account_tb
WHERE w_account_id = 1;


-- fullname 애기공룡의 계좌id를 뽑아 계좌 입출금 내역을 출력해주세요. 
-- 서브쿼리 사용
SELECT *
FROM history_tb AS h 
WHERE h.w_account_id in (
SELECT *
FROM user_tb AS u
INNER JOIN account_tb AS a 
ON u.id = a.id
WHERE u.username = '둘리' AND u.fullname = '애기공룡'
);


-- 둘리의 계좌정보
SELECT a.id
FROM user_tb AS u
INNER JOIN account_tb AS a 
ON u.id = a.id
WHERE u.username = '둘리' AND u.fullname = '애기공룡';


SELECT * FROM history_tb
 WHERE id = 1;

-- 유저 테이블 설계해 보기
CREATE TABLE user_tb(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);
-- 사용자의 계좌 정보 테이블

CREATE TABLE account_tb(
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    balance BIGINT NOT NULL COMMENT '계좌 잔액',
    user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE history_tb(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "거래내역",
    amount BIGINT NOT NULL COMMENT '거래금액',
    w_account_id INT COMMENT '출금 계좌 id',
    d_account_id INT COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

START TRANSACTION

INSERT INTO user_tb(username, password, fullname)
values('john','1234','kim');

INSERT INTO user_tb(username, password, fullname)
values('john','1234','kim');

ROLLBACK;
SELECT * FROM user_tb;

/*
    계좌 간 이체
    계좌 A의 잔액은 3,000원 입니다.
    계좌 B의 잔액은 0원 입니다.
    계좌 A에서 B로 3000원 이체 하기
    
*/
-- 테스트를 위한 설정
UPDATE account_tb SET balance = 3000 WHERE id = 1;
UPDATE account_tb SET balance = 0 WHERE id = 2;


SELECT * FROM account_tb;
SELECT * FROM history_tb;
DESC history_tb;

START TRANSACTION;
UPDATE account_tb SET balance = balance - 3000 WHERE id = 1;
UPDATE account_tb SET balance = balance + 3000 WHERE id = 2;

INSERT INTO history_tb(amount,w_balance, 
    d_balance, w_account_id,d_account_id)
    VALUES (3000,
    (SELECT balance FROM account_tb WHERE id = 1),
    (SELECT balance FROM account_tb WHERE id = 2),
    1,2);

COMMIT;




SELECT h.*,a.number AS '출금 계좌번호'
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE h.d_account_id IS NOT NULL AND
h.w_account_id in (
SELECT u.id
FROM user_tb AS u
INNER JOIN account_tb AS a 
ON u.id = a.id
WHERE u.username = '둘리' AND u.fullname = '애기공룡'
);

SELECT * FROM user_tb;
SELECT * FROM account_tb;
SELECT * FROM history_tb;
SELECT u.id
FROM user_tb AS u
INNER JOIN account_tb AS a 
ON u.id = a.id
WHERE u.username = '둘리' AND u.fullname = '애기공룡';

SELECT * FROM history_tb;
SELECT * FROM account_tb;

-- 1 -> 1111
-- 1번 계좌의 출금 내역  
SELECT * FROM history_tb WHERE w_account_id = 1;

-- 1번 계좌의 입금 내역
SELECT * FROM history_tb WHERE d_account_id = 1;

-- 1번 계좌 입금 내역에 계좌 번호 정보 까지 결과 집합 만들기
SELECT h.id,h.amount,h.d_balance,
a.number,h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE h.d_account_id = 1;


SELECT * FROM history_tb;

-- 1번 계좌에 출금 내역 뽑기
SELECT h.id,h.amount,h.w_balance,
a.number,h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE h.w_account_id = 1;

-- 1번 계좌에 입출금 내역 뽑기
