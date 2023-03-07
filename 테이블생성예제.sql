
-- 데이터 베이스 생성
-- create delete <데이터 베이스 이름>
CREATE DATABASE mydb;

-- DB를 사용할려면 사용한다고 명령어를 실행 해야 한다.
use mydb;
-- 테이블 생성시, SQL 작성시 어떤 DB를 사용해야 하는지 먼저 선택 되어야 한다.

-- 테이블 생성
CREATE TABLE student (
	student_id INT,
    name varchar(50) NOT NULL,
    grade int not null,
    major varchar(50) not null
);
-- 검색
select * from student;
-- 테이블 타입 확인
desc student;

-- 과목 테이블 생성하기
CREATE TABLE subject (
	subject_id int,
    subject_name varchar(50) not null,
	credit int not null,
    -- varchar와 char의 차이점 char는 메모리 고정적으로 들어가고 varchar는 문자값의 갯수에 따라 메모리가 다르다
    -- 예로 들어 char는 값을 몇개를 선언하든 고정적으로 메모리가 들어가고 varchar는 문자값 갯수에 따라 메모리가 달라진다.
    department varchar(50),
    professor char(50) not null
);

select * from subject;
desc subject;

-- 이미 생성된 테이블에 PK(기본키 - 제약조건 ) 추가 해보기

desc Student;
-- 이미 생성된 테이블에 기본 키 추가 하는 쿼리 사용방법
alter table student ADD primary key(student_id);
-- 사전기반지식 : 특정 컬럼을 기본키로 만들게 되면 중복된 데이터를 허용 못하고
-- null 값이 있어서는 안됨

-- subject 테이블에 pk 추가 대상 - subject_id
-- 제약 확인
alter table subject add primary key(subject_id);
desc subject;

-- 생성될 시점에 테이블 생성 명령어를 보여줘
show create table student;

-- 테이블을 삭제하는 명령어 확인
drop table student;
drop table subject;

-- 학생 테이블 생성 pk 추가
create table student(
	student_id int primary key,
    name varchar(50) not null,
    grade int not null,
    major varchar(50) not null
);
desc student;

create table subject(
	subject_id int primary key,
    subject_name varchar(50) not null,
    credit int not null,
    department varchar(10) not null,
    professor varchar(20) not null
);
desc subject;


create table employee(
	employee_id int primary key,
    employee_name varchar(50) not null,
    employee_age int not null,
    employee_departMent varchar(10) not null
);
desc employee;

create table customer(
	customer_id int primary key,
    customer_name varchar(50) not null,
    customer_email varchar(50),
    customer_address varchar(100) not null
);
desc customer;

create table product(
	id int primary key,
	name varchar(50) not null,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
desc product;

-- `order` 예약어 테이블 이름을 선정할 수 없다 기본적으로
-- 하지만 강제적으로 '' 작은 따옴표를 사용해서 테이블 이름이라고 명시 할 수 있다.

CREATE TABLE `order` (
	id INT PRIMARY KEY,
    cusotmer_order VARCHAR(50),
    product_name VARCHAR(20) not null,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);
desc `order`;

CREATE TABLE testplace (
	test_date DATE NOT NULL,
    test_number INT NOT NULL,
	id int PRIMARY KEY,
    name VARCHAR(20) not null,
    age int not null
);
desc testplace;





