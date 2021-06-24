-- 단일 함수 문제 풀이!

--1
select first_name||' '||last_name 이름,
         salary 월급,
         phone_number 전화번호,
         hire_date 입사일
from employees
order by hire_date asc;

--2
select job_title 업무이름,
         max_salary 최고월급
from jobs
order by job_title desc,
             max_salary desc;
             
--3
select first_name 이름,
         manager_id 매니저아이디,
         commission_pct 커미션비율,
         salary 월급
from employees
where commission_pct is null and salary >3000;

--4
SELECT
    job_title 업무이름,
    max_salary 최고월급
FROM
    jobs
    WHERE max_salary >=10000
    order by max_salary desc;
    
--5
select first_name 이름,
         salary 월급,
         NVL(commission_pct,0) 커미션퍼센트
from employees
where salary <14000 and salary >10000
order by commission_pct desc;

--6
select first_name 이름,
         salary 월급,
         to_char(hire_date, 'yyyy-mm') 입사일
from employees
where department_id in (10 ,90, 100);

--7
select first_name 이름,
         salary 월급
from employees
where first_name like '%s%' or first_name like '%S%';

--8
select department_name 부서이름
from departments
order by length(department_name) desc;

--9
SELECT upper(country_name)
from countries
order by country_name asc;

--10
select first_name 이름,
         salary 월급,
         replace(phone_number, '.', '-') 전화번호,
         hire_date 입사일
from employees
where hire_date < '03/12/31';

