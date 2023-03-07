DROP TABLE member;

CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(50) NOT NULL, 
  email VARCHAR(50) UNIQUE, 
  phone VARCHAR(20), 
  address VARCHAR(100) NOT NULL
);


INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

UPDATE member
SET address = '서울시 중구'
WHERE name = '이철수';

-- 이메일이 중복이 되어서 추가 할수가 없다.
INSERT INTO member (name, email, phone, address)
VALUES
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구');


-- id가 2인 회원의 이름과 전화번호를 각각 '임성준','010-9876-5432'로 수정
UPDATE member
SET name = '임성준', phone = '010-9876-5432'
WHERE id = 2;

-- id가 5인 회원의 이메일과 주소를 각각 'leejaehyun@test.com','서울시 강서구'로 수정 
UPDATE member
SET email = 'leejaehyun@test.com', address = '서울시 강서구'
WHERE id = 5;

SELECT * FROM member; 

CREATE TABLE movie(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    director VARCHAR(30) NOT NULL,
    release_date VARCHAR(50) NOT NULL,
	genre VARCHAR(30) NOT NULL,
    rating decimal(3,2)
);

DROP TABLE movie;

INSERT INTO movie
VALUES
	(1,'괴물', '봉준호', '2006-07-27', '드라마', 8.28),
    (2,'극한직업', '이병헌', '2019-01-23','코미디',9.20),
    (3,'명량', '김한민', '2014-07-30','사극',9.17),
    (4,'신과함께-죄와 벌', '김용화', '2017-12-20','판타지',7.56),
    (5,'밀양', '임권택', '2016-09-07','드라마',7.76),
    (6,'반도', '연상호', '2020-07-15','액션',6.71),
    (7,'베테랑', '류승완', '2015-08-05','액션',8.49),
    (8,'변호인', '양우석', '2013-12-18','드라마',8.41),
    (9,'군함도', '류승완', '2017-07-26','사극',8.01),
    (10,'암살', '최동훈', '2015-07-22','액션',8.37);
    
    SELECT * FROM movie;
    
    -- 데이터를 수정하는 문제를 작성하고 직접 쿼리 구문도 작성해주세요.
    -- id가 5이하이고 장르가 드라마는 rating을 8.20으로 수정해라 
    UPDATE movie
    SET rating = '8.20'
    WHERE id <= 5 AND genre = '드라마';
	
