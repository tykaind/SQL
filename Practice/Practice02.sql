--실습2

--1
select count(manager_id) haveMngCnt
from employees;

--2
select max(salary)|| '-' ||
         min(salary) "최고임금 - 최저 임금"
from employees;

--3
select TO_char(max(hire_date), 'yyyy"년" mm"월" dd"일"')
from employees;

--4
select department_id 부서아이디,
         avg(salary) 평균임금,
         max(salary) 최고임금,
         min(salary) 최저임금
from employees
group by department_id
order by department_id desc;

--5
select job_id,
         min(salary),
         avg(salary)
from employees
group by job_id
order by min(salary) desc, avg(salary) asc;

--6
select to_char(min(hire_date), 'yyyy-mm-dd DAY')
from employees;

--7
select department_id,
         avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--8
select job_id,
        max(salary)-min(salary)
from employees
group by job_id
order by max(salary)-min(salary) desc;

--9
select  manager_id,
        round(avg(salary), 1),
        min(salary),
        max(salary)
from    employees
group by manager_id
having  avg(salary) >= 5000
order by avg(salary) desc;

--10
select  first_name,
        case when hire_date < '02/12/31' then '창립 멤버'
             when hire_date <= '03/12/31' then '03년 입사'
             when hire_date <= '04/12/31' then '04년 입사'
             when hire_date > '04/12/31' then '상장 이후 입사'
             end "optDate"
from    employees
order by hire_date asc;
