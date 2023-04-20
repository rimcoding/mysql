

CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
    subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 중간 테이블
-- 학생 : 수강 테이블에 관계는? 1 : N
-- 과목 : 수강 테이블에 관계는? 1 : N
CREATE TABLE enrollment(
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축해보세요.
-- 여기서 사람 , 도시 관계를 관계차수 표현해보세요.
-- 한 사람이 여러 도시를 방문하고, 한 도시에 여러 사람이 방문을 한다.

-- 사람 1.ID 2.NAME 3.도시
-- 중간 테이블 1.도시이름 2.방문횟수
-- 도시 1.ID 2.도시이름 3. 방문횟수

CREATE TABLE person(
    person_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE city(
    city_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);

CREATE TABLE travel(
    travel_id INT,
    trip_number DATE NOT NUll,
    person_id INT,
    FOREIGN KEY(person_id) REFERENCES person(person_id),
    city_id INT,
    FOREIGN KEY(city_id) REFERENCES city(city_id),
    PRIMARY KEY(travel_id,person_id,city_id)
);

INSERT INTO person
VALUES
    (1,'김영희'),
    (2,'박철수'),
    (3,'이민호'),
    (4,'한지민'),
    (5,'송혜교');
    
INSERT INTO city
VALUES
    (1,'서울'),
    (2,'부산'),
    (3,'제주'),
    (4,'홍콩'),
    (5,'도쿄');
    
INSERT INTO travel
VALUES
    (1, '2022-07-10',1,1 ),
    (2, '2022-07-10',2,4 ),
    (3, '2022-07-10',3,3 ),
    (4, '2022-07-10',4,5 ),
    (5, '2022-07-10',1,4 );
    
    -- 문제 join 구문을 활용해서 2문씩 만들어 보세요.
    
    SELECT *
    FROM person AS P
    INNER JOIN travel AS T
    ON P.person_id = T.person_id
    WHERE T.trip_number;
    
    SELECT *
    FROM city AS C
    LEFT JOIN travel AS T
    ON C.city_id = T.city_id
    WHERE T.city_id = 4;
    
    -- 고객, 상품정보, 주문목록 --> N : M --> 중간 테이블 주문 목록
    -- 주문 -- 1(홍길동), 1(신발), "일자"
    
    -- 테이블 설계
    -- 고객, 상품, 주문 목록
    CREATE TABLE customer(
        person_id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE shop(
        shop_id INT PRIMARY KEY,
        name VARCHAR(50),
        price INT 
    );
    
    CREATE TABLE `order`(
        id INT PRIMARY KEY,
        person_id INT,
        FOREIGN KEY (person_id) REFERENCES person(person_id),
        shop_id INT,
        FOREIGN KEY (shop_id) REFERENCES shop(shop_id),
        amout INT
    );
    
    SELECT * FROM
    clothes;
    
    SELECT * FROM buytbl;
    SELECT * FROM usertbl;
    
    DESC employees;
    SELECT * FROM employees
    WHERE emp_no = 10002;
    
    desc buytbl;
    desc usertbl;
    