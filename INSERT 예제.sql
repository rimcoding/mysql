
-- 데이터 저장
/*
여러줄 주석
*/

-- delete나 drop을 사용하고 주석처리 하는것을 습관화 하자
-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);
-- 기본 문구 모양
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ..) VALUES (값1,값2);
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (3, '이영희', 2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (4, '티모', 1, '롤학과');


-- 테이블에 데이터를 삭제하는 명령어 사용해보기
delete from student; -- 테이블 안에 있는 데이터만 삭제하는 명령어이다.

-- 복수형으로 INSERT 쿼리문 작성하기
INSERT INTO student(student_id, name, grade, major)
VALUES 
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '김영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');
    
    -- 복수형으로 데이터 3행을 넣어주세요. 단 VALUE로 사용해보세요.
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1004, '김철수2', 2, '컴퓨터공학과'),
    (1005, '김영희2', 3, '수학과'),
    (1006, '박민수2', 1, '전자공학과');
    
    -- insert 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
    -- 데이터는 정상 저장되지 않는다.
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수3', 2, '컴퓨터공학과'),
    (1008, '김영희3', 3, '수학과'),
    (1008, '박민수3', 1, '전자공학과');

SELECT * FROM student;
delete from student;

-- 직원 테이블과 고객 테이블 스키마(구조)를 확인하고 데이터 형식에 맞춰서 5행이상 데이터를 입력하시오.
-- 단 복수형으로 데이터를 입력하시오.
INSERT INTO employee(employee_id, employee_name, employee_age, employee_departMent)
VALUES
	(1, '둘리',21,'조리담당'),
    (2, '도우너', 21, '서빙'),
    (3, '고길동', 42, '총주방장'),
    (4, '홍길동', 35, '매니저'),
    (5, '이영희', 50, '사장님');
    
    SELECT * FROM employee;
		
        SELECT * FROM customer;
    INSERT INTO customer(customer_id,customer_name,customer_email,customer_address)
    VALUES
    (1,'홍길동','toto1@gmail.com','부산광역시광안동11-1'),
	(2,'이영희','toto2@gmail.com','부산광역시광안동12-1'),
    (3,'장길산','toto3@gmail.com','부산광역시광안동13-1'),
    (4,'이덕화','toto4@gmail.com','부산광역시광안동14-1'),
    (5,'이영복','toto5@gmail.com','부산광역시광안동15-1');
    
-- product 테이블을 설계하고 데이터 3행 이상 입력하시오. 단 단수형으로 데이터를 입력하시오.

create table product(
	product_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    expiration_date VARCHAR(100) NOT NULL
);

INSERT INTO product(product_id, name, expiration_date)
VALUE
(1, '설탕', '2025-12-13');
INSERT INTO product(product_id, name, expiration_date)
VALUE
(2, '소금', '2025-12-23');
INSERT INTO product(product_id, name, expiration_date)
VALUE
(3, '설탕', '2025-11-03');





