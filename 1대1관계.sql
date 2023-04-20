use mydb;

-- 회원 정보와 회원 등급정보 1:1 관계로 설계
-- DROP TABLE IF EXISTS member;
CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE member_grade(
	member_id INT PRIMARY KEY,
    grade VARCHAR(10), 
    point INT,
    FOREIGN KEY(member_id) REFERENCES member(id)
);

DESC member_grade;

-- 직원 정보와 직위 정보를 저장하는 테이블 설계 1:1 관계
-- 직원
-- DROP TABLE employee;

CREATE TABLE employee(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	hire_date TEXT NOT NULL
);

-- employee_position
CREATE TABLE employee_position(
	employee_position_id INT PRIMARY KEY,
	position VARCHAR(100) NOT NULL,
    end_date TEXT,
    FOREIGN KEY (employee_position_id) REFERENCES employee (id)
);

 -- DROP TABLE product;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT
);

CREATE TABLE product_detail(
	product_id INT PRIMARY KEY,
    description TEXT,
    FOREIGN KEY (product_id) REFERENCES product (id)
);




