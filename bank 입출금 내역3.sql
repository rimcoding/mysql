
-- 출금 내역 + 입금 내역
-- 입출금 내역
SELECT * 
FROM history_tb 
WHERE w_account_id = 2 or d_account_id = 2;


-- 입금 내역
SELECT h.id,h.amount,h.d_balance,h.created_at,
       da.number AS receiver,
       ifnull(h.w_account_id,'ATM') as sender,
       wa.number
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 or h.w_account_id = 1;



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




