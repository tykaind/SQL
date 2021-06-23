SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

--예제
SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;

SELECT
    first_name,
    last_name,
    phone_number,
    email,
    hire_date
FROM
    employees;
    
    --출력할 때 컬럼에 별명 사용하긔긔 ><
SELECT
    employee_id  empno,
    first_name   "f-name",
    salary       "급 여"
FROM
    employees;
    
    --예제)
SELECT
    first_name    이름,
    phone_number  전화번호,
    hire_date     입사일,
    salary        급여
FROM
    employees;
    
    --연결 연산자로 컬럼들 붙이기
SELECT
    first_name
    || ' ==== '
    || last_name 입사일
FROM
    employees;
    
    --산술 연산자 사용하기
SELECT
    first_name,
    salary
FROM
    employees
    
SELECT
    first_name 이름,
    salary 월급,
    salary*12 연봉
FROM
    employees;
    
    SELECT
    first_name 이름,
    salary 월급,
    salary*12 연봉,
    (salary+300)*12 연봉
FROM
    employees
    
SELECT
    job_id
FROM
    employees;
SELECT
    first_name||
    last_name fl
FROM
    employees;

select first_name||'-'||last_name 이름,
         salary 급여,
         salary*12 연봉,
         salary*12+5000 연봉2,
         phone_number 전화번호
from employees;

--비교 연산자
SELECT
    first_name
FROM employees
where department_id != 60;
--예제
select first_name 이름,
         salary 월급
from employees
where salary >= 15000;

SELECT
    first_name 이름,
    hire_date 입사일
FROM
    employees
where hire_date > '07/01/01';

select salary 연봉
from employees
where first_name = 'Lex';

select first_name 이름,
         salary 연봉
from employees
where salary >= 14000
and salary  <= 17000;

--예제)
select first_name 이름,
         salary 연봉
from employees
where salary <= 14000
or salary  >= 17000;

select first_name 이름,
         hire_date 입사일
from employees
where hire_date >= '04.01.01'
and hire_date <= '05.12.31';

--where절
--between 연산자로 특정구간 값 출력하기
select first_name, salary
from employees
where salary between 14000 and 17000;

--in 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name 이름,
         salary 연봉
from employees
where salary in(2100,3100,4100,5100);


--like 연산자로 비슷한것을 모두 찾기 글자수는 _를 한글자로 한다.
select first_name, last_name, salary
from employees
where first_name like '%L%';

select first_name,  salary
from employees
where first_name like '%am%'

select first_name, salary
from employees
where first_name like '_a%'

select first_name
from employees
where first_name like '___a%'

select first_name, salary
from employees
where first_name like '__a_'