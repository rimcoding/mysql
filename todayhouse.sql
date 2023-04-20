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
        ORDER BY p.createDate DESC LIMIT 0,12;
        
        SELECT * 
        FROM photo_board AS p
        INNER JOIN user AS u
        on p.userId = u.id
        WHERE p.id = 2;
        
        SELECT * from photo_board;
        drop TABLE reply;
        
        CREATE TABLE reply(
        id INT AUTO_INCREMENT PRIMARY KEY,
        userid INT NOT NULL,
        boardid INT NOT NULL,
        content TEXT(500) NOT NULL,
        FOREIGN KEY(boardid) REFERENCES photo_board(id)
        );
        
        SELECT * FROM reply;
        SELECT * FROM photo_board;
        SELECT * FROM photo_board;
        INSERT INTO reply(userid,boardid,content)
        VALUES
        (1,1,'잘보고갑니다');
        
        
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