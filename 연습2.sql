
DROP TABLE shopmail;

CREATE TABLE Shoes(
    id INT PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100),
    price INT
);

INSERT INTO Shopmail
    VALUES
        (1,'신발','크록스',50000),
        (2,'신발','구두',150000),
        (3,'아우터','바람막이',190000),
        (4,'아우터','바람막이',190000),
        (5,'상의','스웨터',50000),
        (6,'하의','슬랙스',70000),
        (7,'상의','셔츠',50000);

-- DROP TABLE cloth;

CREATE TABLE cloth(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    color VARCHAR(50),
    price INT
);

INSERT INTO cloth
    VALUES
        (1,'아우터','red',120000),
        (2,'아우터','red',70000),
        (3,'아우터','blue',150000),
        (4,'아우터','red',220000),
        (5,'아우터','green',130000),
        (6,'아우터','blue',110000),
        (7,'아우터','red',170000),
        (8,'아우터','green',140000),
        (9,'아우터','blue',80000),
        (10,'아우터','blue',250000);
        
SELECT * FROM cloth
WHERE color = 'red';

-- USER, BLOG, 
-- REPLY(회신하다) (중간 테이블)

CREATE TABLE USER(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(100)
);

CREATE TABLE BLOG(
    id INT PRIMARY KEY,
    
);

 DROP TABLE board;

CREATE TABLE board(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    writer VARCHAR(50) NOT NULL COMMENT '작성자',
    INDEX idx_parent_id(id),
    title VARCHAR(50) NOT NULL COMMENT '제목',
    content TEXT NOT NULL COMMENT '내용',
    regdate DATETIME NOT NULL COMMENT '등록일자',
    updatedate DATETIME NULL COMMENT '수정일자',
    deletedate DATETIME NULL COMMENT '삭제일자'
);

SELECT * FROM board;

drop TABLE reply;

CREATE TABLE reply(
reply_id INT NOT NULL,
board_id INT PRIMARY KEY NOT NULL COMMENT '게시글 ID',
writer VARCHAR(50) NOT NULL COMMENT '작성자',
content TEXT NOT NULL COMMENT '내용',
regdate DATETIME NOT NULL COMMENT '등록일자' 
);

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_board_id_board_id FOREIGN KEY (board_id)
    REFERENCES board (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

DROP TABLE member;
    
CREATE TABLE member(
id  VARCHAR(50) NOT NULL COMMENT '아이디',
pw VARCHAR(100) NOT NULL COMMENT '비밀번호',
address_number VARCHAR(100) NULL COMMENT '우편번호',
address VARCHAR(100) NULL COMMENT '주소',
address_detail VARCHAR(100) NULL COMMENT '상세주소',
regdate DATETIME NOT NULL COMMENT '가입일자',
PRIMARY KEY(id)
);
ALTER TABLE member
    ADD CONSTRAINT FK_member_id_board_writer FOREIGN KEY (id)
        REFERENCES board (writer) ON DELETE RESTRICT ON UPDATE RESTRICT;


