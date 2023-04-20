
INSERT INTO
    usertbl(username, birthYear, addr, mobile)
    VALUES
    ('티모','2000','대구','010-1234-1234');

SELECT * from buytbl;

show CREATE TABLE buytbl;
 SELECT * from usertbl;
 
 UPDATE usertbl
    SET birthYear = '1999', addr = '천안', mobile = '010-2222-2222'
    WHERE username = '야스오2';
    
    desc usertbl;
    
    DELETE FROM userTBL
    WHERE username = '티모2';
    
    -- 구매 테이블에 데이터 입력할 때 유저 테이블에 이름이 없으면 입력 안됨
    -- 구매 테이블
    select * from buytbl;
    -- 이승기를 삭제할려면
    -- 100 있다.
    -- 자식 테이블에 데이터를 먼저 삭제하고 부모테이블에 정보를 삭제할 수 있다.
    
    SELECT * FROM usertbl;
    
    UPDATE buytbl
    SET username = '이순신', proName = '책', price = 30, amount = 4
    WHERE username = '이순신';
    