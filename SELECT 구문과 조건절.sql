
USE mydb;

-- 나중에 실수로 삭제 방지
-- DROP TABLE student;

CREATE TABLE student(
	STUdENT_Id INT AUTO_INCREMENT PRIMARY KEY,
    NAmE VARCHAR(30) NOT NULL,
    GRADE INT NOT NULL,
    maJOR VARCHAR(20) NOT NULL
);

SELECT * FROM StUdenT;
INSERT INTO student (STUDEnT_ID, name, grade, major)
VALUES
	(1,'김철수', 3, '컴퓨터공학과');
    
INSERT INTO student (student_iD, name, GRADE, MAJor)
VALUES
  (2, '박영희', 2, '경영학과'),
  (3, '이민수', 4, '전자공학과'),
  (4, '홍길동', 1, '디자인학과'),
  (5, '임성민', 3, '컴퓨터공학과'),
  (6, '한지원', 2, '경영학과'),
  (7, '박준형', 4, '전자공학과'),
  (8, '김민지', 1, '디자인학과'),
  (9, '이현수', 3, '컴퓨터공학과'),
  (10, '정미경', 2, '경영학과'),
  (11, '김성진', 4, '전자공학과'),
  (12, '임승환', 1, '디자인학과');
  
  
  -- WHERE 사용해보기
  DESC student;
  -- 학과가 '컴퓨터공학과' 학생들에 이름과 학번을 조회하고 싶을 떄
  -- 사용하는 쿼리문 작성해 보자.
  SELECT * FROM student;
  
  SELECT student_id, name
  FROM student
  WHERE major = '컴퓨터공학과';
  
  -- student
  -- 1. grade가 3인 학생들 조회 하기
  SELECT * 
  FROM student 
  WHERE grade = 3;
  
  -- 2.이름이 홍길동인 학생 조회 하기
  -- 단일형 결과값
  -- 독립적인 하나의 객체가 된다.
  SELECT * 
  FROM student 
  WHERE name = '홍길동';
  
  -- 3. 학번이 1부터 10까지인 학생들 조회하기
  -- 복수형 결과값
  -- 배열로 값을 담거나 Array list로 값을 담는다.
  SELECT *
  FROM student
  WHERE student_id BETWEEN 1 AND 10;
  
  -- 4. 학과가  디자인학과이고, 학년이 1학년인 학생들만 조회해줘
  SELECT *
  FROM student
  WHERE major = '디자인학과' AND grade = 1;
  
  -- 5. 학과가 컴퓨터공학과 이거나 학년이 2학년인 학생들을 조회 해주세요.
  SELECT *
  FROM student
  WHERE major = '컴퓨터공학과' OR grade = 2;
  
  -- 6. 학생 이름이 홍길동이 아닌 학생들을 조회하기
  SELECT *
  FROM student
  WHERE name != '홍길동';
  
   SELECT *
  FROM student
  WHERE name <> '홍길동';
  
  -- 7. 학생들의 학년이 2학년 이상인 사람들을 조회하기
  
  SELECT *
  FROM student
  WHERE grade >= 2;
  
  -- 8. 학생들의 학년이 2학년 미만인 사람들을 조회하기
  
  SELECT *
  FROM student
  WHERE grade < 2;
  
  -- 9. 학년이 1학년, 3학년, 4학년 학생들 조회하기 (IN으로 사용)
  
  SELECT *
  FROM student
  WHERE grade IN(1,3,4);
  
  DROP TABLE subject;
  DROP TABLE customer;
  
  CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);

-- subject 테이블 샘플 데이터 

INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');


-- customer 샘플 데이터 

INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

-- 1. 과목 이름이 '미국사'인 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_name = '미국사';
-- 2. 학점이 3점인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE credit = 3;
-- 3. 국어국문학과에서 개설된 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE department = '국어국문학과';
-- 4. 과목 이름이 '영어회화'이거나 교수명이 '이승호'인 과목 데이터를 조회하는 쿼리  
SELECT *
FROM subject
WHERE subject_name = '영어회화' OR professor = '이승호';
-- 5. 과목 번호가 5보다 큰 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_id > 5;
-- 6. 과목 이름이 '데이터베이스 개론'이 아닌 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_name <> '데이터베이스 개론';
-- mysql에 문자열 값을 다룰 때는 공백도 하나의 값으로 생각한다.

-- 7. 학과가 '컴퓨터공학과'이고 교수명이 '박철수'인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE department = '컴퓨터공학과' AND professor = '박철수';

-- 8. 교수명이 '김현진'이거나 '최영식'이면서 학과가 '외국어학과'인 과목 데이터를 조회하는 쿼리

SELECT *
FROM subject
WHERE (professor = '김현진' OR professor ='최영식') 
AND department = '외국어학과';

-- 단축키 컨트롤 + 쉬프트 + 엔터
-- 습관적으로 검증 쿼리를 출력해 볼 수 있다.
SELECT *
FROM subject
WHERE professor = '김현진';
 
-- 도전과제
-- customer 테이블과 입력되어 있는 데이터를 활용해서 문제를 직접 만들어보세요 (문제 5개이상)
SELECT * FROM customer;

-- 1. 아이디가 1번부터 5번까지 데이터를 출력해라
SELECT *
FROM customer
WHERE id BETWEEN 1 AND 5;

-- 2. 이메일 주소가 null값이 아닌사람을 출력해라
SELECT *
FROM customer
WHERE email != ' ';

-- 3. 서울시에 사는 사람들을 출력해라
SELECT *
FROM customer
WHERE address like'%서울시%';

-- 4. 경기도에 사는 사람들을 출력해라
SELECT *
FROM customer
WHERE address like '%경기도%';


-- 문제 제출 (다른 학생분들)

-- 1. 강남 3구 사는 사람들을 조회 (서초구,송파구,강남구)
SELECT *
FROM customer
WHERE address IN ('서울시 강남구','서울시 서초구','서울시 송파구');

 -- 2.email을 입력하지 않은 사람의 데이터를 출력하시오.
 SELECT *
 FROM customer
 WHERE email <=> null; 
 
 -- 3. id가 5이상이며 주소가 서울시에 거주하는 사람이름을 검색해라
 -- 단, 서울시는 다음과 같은 주소가 있다 (강남구,서초구,송파구,강서구,종로구)
 
 SELECT *
 FROM customer
 WHERE id >= 5 AND address LIKE '%서울시%';
 
-- 4.이메일이 NULL이 아니고 주문 번호가 2번이 넘으며 종로구에 사시는분은
 
 SELECT *
 FROM customer
 WHERE email IS NOT NULL AND ID > 2 AND address LIKE '%종로구%';

-- 5. 주소가 '서울'이면서 id가 5이하인 고객 조회하는 쿼리

SELECT *
FROM customer
WHERE address LIKE '%서울%' AND ID >= 5;

-- 6.아이디가 3에서 8까지의 사람중 '경기도 의정부'에 거주하고 있는 사람중
-- 이메일을 입력한 사람을 출력하시오.

SELECT *
FROM customer
WHERE ID BETWEEN 3 AND 8
AND address LIKE '%경기도 의정부%'
AND email IS NOT NULL; 

-- 7. 서울시에 사는 고객들을 조회하는 쿼리 (LIKE 사용해보기)

SELECT *
FROM customer
WHERE address LIKE '%서울시%';