drop table Album;

CREATE TABLE Album(
    userid int,
    id int,
    title text
);

INSERT INTO Album (userid,id,title)
VALUES
    (5,1,'aewfew');
    
    SELECT * FROM Album;
    
SELECT *
FROM Album
WHERE userid = 1 AND title LIKE '%quidem%';

drop table user ;

CREATE TABLE User(
 userid Int PRIMARY KEY AUTO_INCREMENT ,
 id INT,
 name VARCHAR(100),
 username VARCHAR(100),
 email VARCHAR(100),
 phone VARCHAR(100),
 website VARCHAR(100)
 );
 
 
 INSERT INTO User(id,name,username,email,phone,website)
 VALUE
    (1,'sss2','sss2','sss3','sss4','sss5');
 
 CREATE TABLE address(
    userid INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100),
    suite VARCHAR(100),
    city VARCHAR(100),
    zipcode VARCHAR(100),
    FOREIGN KEY(userid) REFERENCES User(userid)
 );
 
 INSERT INTO address(street,suite,city,aipcode)
 VALUES
    ('','','','','');
    
 INSERT INTO company(name,catchPhrase,bs)
 VALUES
    ('','','');
 
 CREATE TABLE company(
 userid Int PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(200),
 catchPhrase VARCHAR(500),
 bs VARCHAR(300),
 FOREIGN KEY(userid) REFERENCES User(userid)
 );
 
 
 