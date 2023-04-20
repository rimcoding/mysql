DROP TABLE product;

CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  description VARCHAR(200)
);

INSERT INTO product (id, name, price, description) 
VALUES
(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
(5, '아이패드', 800000, 'Apple의 태블릿'),
(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

SELECT * FROM product;

DELETE FROM product WHERE id = 5;
DELETE FROM product WHERE name = '맥북에어';
-- 가격이 1,000,000원 이상인 제품 삭제
DELETE FROM product WHERE price >= 1000000;
-- id가 2 또는 3인 제품 삭제
DELETE FROM product WHERE id In(2,3);

-- LIKE 갤럭시
SELECT * FROM product WHERE NAME LIKE '갤럭시%';
DELETE FROM product WHERE name LIKE '갤럭시%';

-- 이름이 '에어팟 프로'이거나 설명이 '삼성'을 포함하는 제품 삭제
DELETE FROM product 
WHERE name = '에어팟 프로' OR 
description LIKE '%삼성%';

  CREATE DATABASE todayhouse;

-- DROP TABLE user;

SELECT * from user;

CREATE TABLE user(
    id int AUTO_INCREMENT PRIMARY key,
    email VARCHAR(50) NOT NULL UNIQUE,   
    password VARCHAR(50) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    createDate TIMESTAMP
);

INSERT INTO user(email,password)
VALUES
    ('yog4130@gmail.com','1111','mori');
    
    
    SELECT email,password
    FROM user
    WHERE id = 'yog4130' AND password = '1234';
    
    SELECT * From photo_board;
    
     SELECT * FROM USER;
    
	DROP TABLE photo_board;
    
    SELECT * from photo_board;
    CREATE TABLE photo_board(
    id int AUTO_INCREMENT PRIMARY KEY,
    userId INT not null,
    photoImage VARCHAR(50) not null,
    content longtext not null,
    readCount INT DEFAULT 0,
    favorite INT DEFAULT 0,
    createDate TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES user (id)
    );
    
    SELECT * FROM photo_board;
    
    UPDATE photo_board SET readCount = readCount+1
    WHERE id = 1;
    
    INSERT INTO photo_board(userId,photoImage,content,createDate)
    VALUES
        (1,'닭','꼬끼오',now());
        
        SELECT * FROM photo_board AS p
        ORDER BY p.createDate DESC LIMIT 0,4;
        drop TABLE user;
        drop table photo_board;
        
        SELECT *
        FROM photo_board AS p
        INNER JOIN user AS u
        ON p.userId = u.id
        ORDER BY p.createDate DESC LIMIT 0,4;
        
        SELECT * 
        FROM photo_board AS p
        INNER JOIN user AS u
        on p.userId = u.id
        WHERE p.id = 2;
        
        SELECT * from photo_board;
        
        DELETE FROM photo_board
        where id = 1 AND userId = 1;
        
        -- drop TABLE reply;
        SELECT * FROM reply;
        drop TABLE reply;
        CREATE TABLE reply(
        id INT AUTO_INCREMENT PRIMARY KEY,
        userid Int NOT NULL,
        boardid Int NOT NULL,
        nickname VARCHAR(50) not null,
        content VARCHAR(500) NOT NULL,
        FOREIGN KEY (userid) REFERENCES photo_board(id),
        FOREIGN KEY(nickname) REFERENCES user(nickname)
        );
        on DELETE cascade
        -- on delete cascade foreign key 무시하고 지워진다.
        -- drop TABLE reply;
        alter table reply drop foreign key userid;
        alter table reply drop foreign key nickname;
        ALTER TABLE reply ADD CONSTRAINT nickname 
        FOREIGN KEY(nickname) 
        REFERENCES user(nickname) 
        ON DELETE CASCADE;
        -- DROP TABLE reply;
        SELECT * FROM reply;
        
        DELETE FROM reply
        WHERE id = 1 AND userid = 1;
    
        SELECT * from photo_board;
  
     drop TABLE user;
     drop TABLE reply;
     drop TABLE photo_board;
    
    SELECT * From reply;
    SELECT * from photo_board;
    SELECT * FROM user;
    INSERT INTO reply(userid,boardid,content,nickname) 
	 VALUES 
    ( 1 , 10 , 'dfsaads' , 'momo' );

    UPDATE reply
    set content = '좋은구경'
    WHERE userid = 1 AND id = 1;
    
    SELECT * 
    FROM photo_board AS p 
    INNER JOIN user AS u 
    on p.userId = u.id 
    WHERE p.id = 4;
    
    SELECT * FROM dept;
    SELECT * FROM employees;
    
    SELECT * FROM departments;
    SELECT * FROM employees;
    SELECT * FROM salaries;
    SELECT * FROM titles;
    
    SELECT title, COUNT(title)
    FROM titles
    GROUP BY title;
    
    SELECT * FROM employees;
    SELECT * FROM titles;
    SELECT * FROM salaries;
   
   SELECT * from dept_emp;
   SELECT * FROM departments;
    
    SELECT *
    FROM employees AS e
    WHERE EXISTS
    (SELECT *
    FROM departments AS d
    WHERE e.emp_no = d.dept_no
    AND(dept_name));
    SELECT * from dept_emp;
    
    SELECT *
    FROM employees
    WHERE birth_date >= '1960-01-01';
    
    SELECT *
    FROM dept_emp
    WHERE emp_no
    in (SELECT emp_no FROM employees WHERE birth_date >= '1960-01-01');
    
    SELECT * FROM salaries; -- 월급
    SELECT * FROM dept_emp; -- 입사일
    SELECT * FROM departments; -- 부서
    SELECT * FROM employees; -- 사람정보
    SELECT * FROM titles;
    
    -- Parto란 성을 가졌고 Staff중에 연봉 최고치를 찍은사람을 뽑아주세오.
    -- (단 ,서브쿼리를 사용하세요)
    SELECT et.first_name,et.last_name,et.gender,et.birth_date,et.hire_date,max(sa.salary)
    FROM
    (
    SELECT e.emp_no,e.first_name,e.last_name,e.gender,e.birth_date,e.hire_date
    FROM employees AS e 
    INNER JOIN titles AS t
    on e.emp_no = t.emp_no
    WHERE first_name = 'Parto' AND t.title = 'Staff'
    ) AS et
    INNER JOIN salaries AS sa
    on et.emp_no = sa.emp_no;
    
    SELECT e.emp_no,e.first_name,e.last_name,e.gender,e.hire_date 
    FROM employees AS e 
    INNER JOIN titles AS t
    on e.emp_no = t.emp_no
    WHERE first_name = 'Parto' AND t.title = 'Staff';
    
    -- Finance 부서에서 1953년중 생일이 가장 빠른순서대로 성,이름,생일을 뽑아주세요.
    SELECT de.first_name,de.last_name,de.birth_date
    FROM (
    SELECT e.first_name,e.last_name,e.birth_date,d.dept_no
    FROM employees AS e
    INNER JOIN dept_emp AS d
    on e.emp_no = d.emp_no
    WHERE e.birth_date LIKE '%1953%'
    ) AS de
    INNER JOIN departments AS dep
    ON de.dept_no = dep.dept_no
    WHERE dep.dept_name = 'Finance'
    ORDER BY de.birth_date;
    
    
    
    -- 1953년생중에 생일이 빠른순서 
    SELECT e.first_name,e.last_name,e.birth_date,d.dept_no
    FROM employees AS e
    INNER JOIN dept_emp AS d
    on e.emp_no = d.emp_no
    WHERE e.birth_date LIKE '%1953%'
    ORDER BY e.birth_date;
    
    -- 입사일이 가장 늦은사람
    SELECT em.first_name,em.last_name,MAX(hire_date)
    FROM dept_emp AS de
    INNER JOIN employees AS em
    ON de.emp_no = em.emp_no;
    
    -- 급여가 가장낮을때 사람정보
    SELECT min(salary),e.first_name,e.last_name,e.emp_no
    from employees AS e
    INNER Join salaries AS s
    on e.emp_no = s.emp_no
    GROUP BY e.last_name;
    
    -- 직원의 성,이름,타이틀,연봉이 나오고 시니어 엔지니어의 가장낮은 연봉이 나오도록 하시오
    -- (단, 서브쿼리를 사용하세요)
    
    
    
    
    SELECT es.first_name,es.last_name,t.title,es.salary
    FROM (
    SELECT min(salary),e.first_name,e.last_name,e.emp_no,s.salary
    from employees AS e
    INNER Join salaries AS s
    ON e.emp_no = s.emp_no
    GROUP BY e.last_name) AS es
    INNER JOIN titles AS t
    ON es.emp_no = t.emp_no
    WHERE t.title = 'Senior Engineer';
    
    -- 마케팅부에서 퇴사한 사람의 정보를 뽑으세요.
    -- (단, 서브쿼리를 이용하세요)
    SELECT deem.first_name,deem.last_name,deem.birth_date,deem.gender
    FROM departments AS dep
    INNER JOIN (
    SELECT em.first_name,em.last_name,de.dept_no,em.birth_date,em.gender,em.emp_no
    FROM dept_emp AS de
    INNER JOIN employees AS em
    on em.emp_no = de.emp_no
    WHERE de.to_date = '99990101'
    ) AS deem
    ON dep.dept_no = deem.dept_no
    WHERE dep.dept_name = 'Marketing';
    
    SELECT * FROM departments WHERE dept_name = 'Marketing';
    
    -- 퇴사한 사람 이름 구하는 형식(성,이름,emp_no)
    SELECT em.first_name,em.last_name,de.dept_no,em.birth_date,em.gender,em.emp_no
    FROM dept_emp AS de
    INNER JOIN employees AS em
    on em.emp_no = de.emp_no
    WHERE de.to_date = '99990101';
    
    
    
    