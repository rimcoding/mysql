
-- NOT NULL과 디폴트 값 사용

DROP TABLE student;
SELECT * FROM student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL
);

DESC student;

-- 디폴트 제약을 사용했을 때 값을 넣은 방법 1
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1,'John',3,'경영학과'),
    (2,'Jane',2,'경영학과'),
    (3,'mike',1,DEFAULT),
    (4,'David',2,DEFAULT);
    
    SELECT * FROM student;
    
-- 디폴트 제약을 사용했을 때 값을 넣은 방법 2
INSERT INTO student(student_id, name, grade)
VALUES
	(5,'홍길동1',2),
    (6,'홍길동2',3),
    (7,'홍길동3',1),
    (8,'홍길동4',3);
    
    
    DESC subject;

-- professor 컬럼 제약 사항을 default로 추가 하고 값을 빈 문자열로 만들어 주세요.
-- 빈 문자열에 의미는 " " 처리 하면 됩니다.


SET SQL_SAFE_UPDATES = 0;

CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);

-- 테이블이 생성 되어 있을 때 제약 변경 default 구문 추가
ALTER TABLE subject MODIFY professor VARCHAR(30) NOT NULL DEFAULT ' ';

DESC subject;
    
