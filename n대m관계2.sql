SELECT *
FROM employees
GROUP BY gender;

-- 2단계 (남자,여자 숫자)
SELECT *, count(*)
FROM employees
GROUP BY gender;

-- 조건 두개 걸기
SELECT *, count(hire_date)
FROM employees
GROUP BY hire_date, gender;

-- 사원만 존재
SELECT * FROM employees;

-- 사원번호 날짜
-- employees(1) : dept_emp(N)

SELECT * FROM dept_emp;
-- dept_emp(N) : departments(1)
SELECT * FROM departments;
-- employees : departments --> N : M 관계 차수를 가진다.
-- 중간 테이블 DEPT_EMP 만들어서 N : M를 표현하고 있다.

-- employees : dept_emp --> 1:N 관계로 풀어 진다.
-- departments : dept_emp --> 1:N 관계로 풀어 진다.

-- 1단계 조인하기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 중복 컬럼 제거하기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 3단계 
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';

SELECT * FROM departments;

SELECT * FROM titles;

-- Staff --> 결과집합으로 Staff 직원에 이력을 결과 집합으로 만들기

-- order by 정렬 asc 오름차순 desc 내림차순
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no desc
LIMIT 10;

-- 2단계
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff';

desc employees;
desc titles;
SELECT * FROM titles;

SELECT * FROM salaries;

SELECT * FROM employees;

SELECT count(s.salary)
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE e.first_name = 'Georgi' AND e.last_name = 'Facello';