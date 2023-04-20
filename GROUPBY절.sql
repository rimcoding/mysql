SHOW TABLES;

SELECT * FROM salaries
LIMIT 10;

-- 10번째부터 5개만 들고와라
SELECT * FROM salaries
LIMIT 10, 5;

-- 횟수를 알고싶을때 count를 사용한다.
SELECT count(emp_no) 
FROM salaries;

-- GROUP BY절에 조건절을 사용할 때는 having 절을 사용한다.
SELECT *
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10001;

-- 월급 받은 횟수 알아보기
SELECT *, count(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계 (최소,최고 금액 알아보기)
SELECT *, count(salary) AS count,
        MAX(salary) AS max,
        MIN(salary) AS min,
        sum(salary) AS sum,
        round(AVG(salary)) AS avg
FROM salaries
GROUP BY emp_no;

-- 2문제 생성 직접 쿼리 출력

SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;

-- 남성 직원 수
SELECT *, count(gender) AS men
FROM employees
GROUP BY gender
HAVING gender = 'M';

-- 여성 직원 수
SELECT *, count(gender) AS women
FROM employees
GROUP BY gender
HAVING gender = 'F';

-- G자로 시작하는 이름 수
SELECT *,count(hire_date) AS 'first_name=G'
FROM employees
GROUP BY gender
HAVING first_name LIKE 'G%';

-- 1.emp_no로 그룹을 나누고 title table에서 title과 salaries table에서 salary를 출력하라
SELECT t.title, s.salary
FROM salaries AS s
INNER JOIN titles AS t
on t.emp_no = s.emp_no
GROUP BY t.emp_no,s.emp_no;

-- 2.위에서 출력한 값에서 연봉이 65000원 이상인 사람만 출력하라 (몇명인지도 출력)
SELECT t.title, s.salary
FROM salaries AS s
INNER JOIN titles AS t
on t.emp_no = s.emp_no
GROUP BY t.emp_no,s.emp_no
HAVING salary >= 65000;
-- t.title = 'Senior Engineer'

-- 3.Enginner (시니어, 어시스턴트 , 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력하라.
SELECT * , MAX(s.salary)
FROM salaries AS s
LEFT JOIN titles AS t
on t.emp_no = s.emp_no
GROUP BY t.title;

-- 4. 각 부서에는 몇명이 있는지 출력해보자
SELECT d.dept_name, count(de.dept_no)
FROM dept_emp AS de
LEFT JOIN departments AS d
on de.dept_no = d.dept_no
GROUP BY de.dept_no;

-- 5. 각 직급 별로 몇명이 있는지 출력해보자.
SELECT t.title, count(t.title)
FROM titles AS t
LEFT JOIN salaries AS s
on t.emp_no = s.emp_no
GROUP BY t.title;







