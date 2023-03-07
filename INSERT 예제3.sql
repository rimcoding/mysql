
SHOW CREATE TABLE `order`;

-- DROP 부분은 가능한 주석처리 ** ( 모르고 실행해서 날아갈수도 있기 때문!)
-- DROP TABLE `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  customer_order VARCHAR(50) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

-- 데이터 타입 형식에 DATE 값 입력에 이해
-- 데이터를 입력하는 쿼리 구문을 작성해 주세요.

INSERT INTO `order`(id, customer_order, product_name, quantity, order_date)
VALUES (1, '리뷰 이벤트 참여','짜장면',2,'2022-03-06');

SELECT * FROM `order`;

INSERT INTO `order`(id, customer_order, product_name, quantity, order_date)
VALUES (2, '리뷰 이벤트 참여','짜장면',2,'20220306');

-- DATE 타입에 값을 넣을 때 작은따옴표나 큰따옴표를 사용해도 되고
-- 정수값을 입력하여도 된다. 단 날짜 형식에 맞는 값이어야 한다.
-- 1년은 12개월 인데 13이라는 값을 넣으면 알아서 오류를 일으켜 준다 (데이터의 무결성을 해치기 때문에) 
INSERT INTO `order`(id, customer_order, product_name, quantity, order_date)
VALUES (3, '리뷰 이벤트 참여','짜장면',2,20222206);

INSERT INTO `order`(id, customer_order, product_name, quantity, order_date)
VALUES (3, '리뷰 이벤트 참여','짜장면',2,'20222206');

-- YYYY-MM-DD :mysql 기본 DATE의 데이터 타입 기본 포멧
-- YYYY/MM-DD
-- YYYYMMDD 

-- DROP TABLE customer;
-- AUTO_INCREMENT 사용하기
-- 고객 테이블 생성

CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);

INSERT INTO customer(name, email, address)
VALUES
	('김철수', 'A@naver.com','서울시 강남구 역삼동'),
    ('박영희', 'B@naver.com','서울시 강동구 천호동'),
    ('김철수', 'C@naver.com','서울시 강남구 역삼동');

SELECT * FROM customer;

-- 놀이공원 이용권 테이블표를 만들어라.

CREATE TABLE ticket(
	id INT AUTO_INCREMENT PRIMARY KEY,
    people_name VARCHAR(100) DEFAULT '무기명' NOT NULL,
    ticket_name VARCHAR(50) DEFAULT '기본 입장권' NOT NULL,
    people_number VARCHAR(50) DEFAULT '1명' NOT NULL,
	car_number VARCHAR(50) DEFAULT '차량없음' NOT NULL
);
DESC ticket;

INSERT INTO ticket (people_name, ticket_name, people_number, car_number)
	VALUES
	('김철수','자유 이용권','2명','65_3412'),
    ('박영희','5번 이용권','3명','23_1412'),
    ('김철수','자유 이용권','1명','45_2321');

SELECT * FROM ticket;

ALTER TABLE ticket MODIFY car_number VARCHAR(50) NOT NULL DEFAULT '차량없음';

INSERT INTO ticket (people_name, ticket_name, people_number, car_number)
	VALUES
    (DEFAULT,DEFAULT,'4명',DEFAULT),
    (DEFAULT,'5번 이용권',DEFAULT,'93_4234');
    
SELECT * FROM ticket;


