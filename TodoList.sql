CREATE DATABASE login;
drop table member;
CREATE table member(
id VARCHAR(50),
pw VARCHAR(50),
name VARCHAR(50) 
);

INSERT INTO member
VALUES
 ('dfas','dsaf','adfs');
 
 SELECT * from member;
 
 CREATE DATABASE todo;
 use todo;
 -- id, 제목, 내용, 우선순위, 완료 여부, 생성일
 -- DDL(Data Definition Language)
 CREATE TABLE TodoList(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    decription TEXT,
    priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );
 
 -- 카테고리 테이블
 -- id, 이름
 CREATE TABLE Category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
 );
 
 -- TodoList : 자식 테이블
 ALTER TABLE TodoList
 ADD COLUMN category_id INT,
 ADD CONSTRAINT fk_catrgory FOREIGN KEY(category_id)
 REFERENCES Category(id)
 ON UPDATE CASCADE
 ON DELETE CASCADE;
 
 
 SELECT * FROM Category;
 INSERT INTO category
 VALUES
    (1,'DSF'),
    (2,'DSF'),
    (4,'DSF'),
    (6,'DSF'),
    (7,'DSF'),
    (8,'DSF');
 
 SELECT * from todolist;
 
 DESC TodoList;
 
 
 INSERT INTO todolist(title,decription,category_id) 
 VALUES
    ('afdds','sdfsdf','1'),
    ('afdds','sdfsdf','1'),
    ('afdds','sdfsdf','1'),
    ('afdds','sdfsdf','1'),
    ('afdds','sdfsdf','1');
 
 
UPDATE todolist SET title ='yoyo' WHERE decription = 'afew';

DELETE FROM todolist WHERE title = 'wer';

SELECT * FROM todolist;
SELECT * FROM category;

SELECT * FROM todolist AS t
INNER JOIN category AS c
on t.category_id = c.id
HAVING t.title = 'afdds';
