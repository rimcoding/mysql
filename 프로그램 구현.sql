
-- blog 
-- 서버 프로그램 구현 - MYSQL <-- 서버 

CREATE DATABASE myblog;

use myblog;

-- 사용자 생성

CREATE USER 'bloguser'@'%' IDENTIFIED BY '1q2w3e4r5t';
-- 사용자 기본 권한 조회
-- DB를 선택
USE mysql;

-- '%' 어디서든지 접근 가능한 권한 (IP주소 개념)
SELECT user, host FROM user;

SELECT * FROM user WHERE user = 'bloguser';

GRANT ALL PRIVILEGES ON *.* TO 'bloguser'@'%';

-- 방금 권한 변경을 즉시 적용할려면 한가지 명령어를 더 해주어야 한다.
FLUSH PRIVILEGES;



CREATE DATABASE rimblog;

use rimblog;

CREATE USER 'rimuser'@'%' IDENTIFIED BY '111qqq';

SELECT user, host FROM user;

SELECT * FROM user WHERE user = 'rimuser';

GRANT ALL PRIVILEGES ON *.* TO 'rimuser'@'%';

FLUSH PRIVILEGES;
drop table user;

CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);

CREATE TABLE board(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB, 
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);

CREATE TABLE reply(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);
SELECT * from user;
DESC user;

INSERT INTO user(uswename,password,email,address,userRole,createDate)
VALUES
    ("홍길동","1234","a@naver.com","",now());
    
    SELECT * FROM user;
    DESC board;
    
    INSERT INTO board(title, content, userId)
    VALUES ('첫번째 게시글','자바는 쉬운거에요',2);
    
    SELECT * FROM board;
    
    ALTER TABLE board MODIFY content text;
    
    DESC board;
    
    DELETE FROM board where id = 4;
