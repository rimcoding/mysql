
-- 출금 내역 + 입금 내역
-- 입출금 내역
SELECT * 
FROM history_tb 
WHERE w_account_id = 2 or d_account_id = 2;

-- 입금 내역 : 쿼리 결정
SELECT h.id,h.amount,h.d_balance AS balance,h.created_at,
       ifnull(wa.number,'ATM') AS sender,
       da.number as receiver
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1;

-- 출금 내역 : 쿼리 결정
SELECT h.id,h.amount,h.w_balance AS balance,h.created_at,
       ifnull(da.number,'ATM') AS receiver,
       wa.number AS sender
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- 입출금 쿼리 결정
-- CASE WHEN THEN END

SELECT h.id,h.amount,
CASE WHEN h.w_account_id = 1 THEN (h.w_balance)
     WHEN h.d_account_id = 1 THEN (h.d_balance)
     END AS balance,
     ifnull(wa.number,'ATM') AS sender,
     ifnull(da.number,'ATM') AS receiver,
     h.created_at
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 OR h.w_account_id = 1;


