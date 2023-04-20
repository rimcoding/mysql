use employees;

DROP TABLE album;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * from titles;

SELECT s.salary,t.title
FROM titles AS t
INNER join salaries AS s
on t.emp_no = s.emp_no
GROUP BY t.emp_no,t.title
HAVING salary > 50000;

CREATE TABLE employees(
    id INTEGER AUTO_INCREMENT PRIMARY key,
    name VARCHAR(200),
    profile JSON
);

CREATE DATABASE mypet;

create TABLE user(
user_id INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(100) not null,
password VARCHAR(100) not null,
username VARCHAR(100) not null,
animal_name VARCHAR(100) UNIQUE not null,
brithday VARCHAR(100) not null,
email VARCHAR(100) not null,
phone VARCHAR(100) not null
);



CREATE TABLE animal(
	animal_id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(100) NOT NULL,
    animal_type VARCHAR(100) NOT NULL,
    age VARCHAR(50) NOT NULL,
    animal_information VARCHAR(500),
    time TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (animal_name) REFERENCES user(animal_name) 
);

INSERT INTO animal(animal_name,animal_type,age,animal_information)
VALUES
    ('몽이','말티즈',5,'머리가 뾰족하다'),
    ('사랑','말티즈',5,'머리가 뾰족하다'),
    ('양갱','말티즈',5,'머리가 뾰족하다'),
    ('영지','말티즈',5,'머리가 뾰족하다'),
    ('행복','말티즈',5,'머리가 뾰족하다'),
    ('우정','말티즈',5,'머리가 뾰족하다'),
    ('만두','말티즈',5,'머리가 뾰족하다'),
    ('미키','말티즈',5,'머리가 뾰족하다'),
    ('달래','말티즈',5,'머리가 뾰족하다'),
    ('우영','말티즈',5,'머리가 뾰족하다'),
    ('강쥐','말티즈',5,'머리가 뾰족하다'),
    ('홍시','말티즈',5,'머리가 뾰족하다');
    
    CREATE DATABASE login;
    

CREATE DATABASE demo5;

desc TABLE user;

SELECT * FROM user;

CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

show VARIABLES LIKE 'c%';

SELECT * FROM ;
desc todolist;

-- 샘플 데이터 준비
INSERT INTO category(name)
VALUES
    ('운동'),
    ('공부'),
    ('연애'),
    ('집안일');
    
    
    UPDATE category SET name = '헬스' WHERE id= 1 ;

    DELETE FROM category WHERE id = 6;
    
    desc todolist;
    
    CREATE DATABASE todayhouse;
    
    use todayhouse;
    
    CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password INT NOT NULL,
    nickname VARCHAR(50) NOT NULL
    );
    
    INSERT INTO user(email,password,nickname)
    VALUES
        ('yog4130@gmail.com',32423,'moo');

    SELECT * FROM user;

    SELECT * FROM user
    WHERE email = 'yog4130@gmail.com' AND password = '32423';
