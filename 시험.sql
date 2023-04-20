SHOW TABLES;

SELECT * FROM user;

DELETE 

INSERT INTO user(username, password, address)
VALUES
    ('홍길동','1234','부산');
    
SELECT * FROM 

INSERT INTO board(title, content, userId)
VALUES
    ('테스트글1','테스트 내용1',1);
    
SELECT * FROM board;


DELETE FROM board
WHERE id = 50;


SELECT * FROM blog;

CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    address VARCHAR(100)
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

DELETE FROM user WHERE username = '아이유';

SELECT * FROM user;
    
    