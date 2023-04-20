
use mydb;
SELECT * FROM customer;
use myblog;

-- user 테이블 생성
-- id : pk 부여
-- username : 사용자 이름 100자 NOT NULL,중복 허용 불가(유니크)
-- password : 100자 NOT NULL,
-- email : 100자 NOT NULL,
-- address : 100자
-- userRole : ADMIN, MANAGER, USER
-- createDate
drop TABLE user;

CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);

SELECT * FROM user;

-- 블로그 사이트 

CREATE TABLE board(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB, 
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);
SELECT * FROM board;
-- user : board -> 1: N

-- 댓글 테이블 만들기
CREATE TABLE reply(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);

-- user : reply -> 1: N
-- board : reply -> 1: N