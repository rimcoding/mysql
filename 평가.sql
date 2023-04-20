use shopdb;

CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    grade VARCHAR(50) NOT NULL
);

CREATE TABLE clothes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO clothes
VALUES
    (1,'바지',80000),
    (2,'스웨터',60000),
    (3,'아우터',150000),
    (4,'모자',20000),
    (5,'셔츠',50000);
    
CREATE TABLE buy(
    buy_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    buy_date DATE NOT NULL,
    clothes_id INT,
    FOREIGN KEY (clothes_id) REFERENCES clothes(id)
);

INSERT INTO buy
VALUES
    (1,'홍길동','2023-03-01',1),
    (2,'장길산','2021-02-11',3),
    (3,'고길동','2021-02-13',2),
    (4,'도우너','2021-02-13',5);
    
    SELECT * FROM clothes;
    SELECT * FROM buy;
    
    SELECT * 
    FROM clothes AS C
    INNER JOIN buy AS B
    ON C.id = B.clothes_id
    WHERE C.id IS NOT NULL;
   
    
    