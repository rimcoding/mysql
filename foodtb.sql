CREATE DATABASE foodmarket;

DROP TABLE food_tb;
CREATE TABLE food_tb(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
price INT NOT NULL,
length INT NOT NULL,
created_at TIMESTAMP DEFAULT now()
);

INSERT INTO food_tb(name,price,length,created_at)
VALUES
('짜장면',6000,4,now()),
('탕수육',12000,1,now()),
('짬짜면',8000,2,now()),
('깐쇼새우',30000,1,now()),
('유란기',20000,3,now()),
('짬뽕',12000,1,now());

CREATE TABLE user_tb(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) NOT NULL,
created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE car_tb(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) NOT NULL,
car_number VARCHAR(50) NOT NULL,
created_at TIMESTAMP DEFAULT now()
)