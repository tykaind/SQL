--select 문
-- - select 절
-- - from 절
-- - where 절
-- - order by 절

--이건단일함수--
select first_name,round(salary,-4)
from employees;

-- 그룹함수 avg() 평균값 구하기
select avg(salary)
from employees;

--count() 로우의 개수 세주기 세로줄의수 null값은 제외한 실제 있는 데이터만 숫자로센다.
select count(salary), 
         count(*),
         count(commission_pct)
from employees;

--조건절 추가 count
select count(*)
from employees
where salary > 16000;

--그룹함수 sum()
select sum(salary)
from employees;

select sum(salary), count(*)
from employees
where salary > 13000;

--그룹함수 avg() null 일때 0으로 변환해서 사용

select count(*),
         count(commission_pct),
         sum(commission_pct),
         avg(nvl(commission_pct,0)),
         sum(commission_pct) /count(*),
         sum(commission_pct) /count(commission_pct)
from employees;

--그룹함수 max(), min()
select max(salary), min(commission_pct)
from employees;

-- groub by 절 --

select department_id, salary
from employees
order by department_id asc;


select department_id, avg(salary)
from employees
group by department_id
order by avg(salary) asc;

--그룹 세분화
*

select department_id, avg(salary)
from employees
group by department_id, job_id;

--예제 부서별 부서 번호와, 인원수, 급여 합계를 출력하세요.
select department_id,
         sum(salary),
         COUNT(*)
from employees
group by department_id
having sum(salary) >= 20000 and department_id = 100; --그룹전용 조건문이라 생각한다. --그룹함수에는 where절을 사용할수 없다.

--case ~ end문
select employee_id,
         job_id,
         salary,
         case
            when job_id = 'AC_ACCOUNT' then salary+salary*0.1
            when job_id = 'SA_REP' then salary+salary*0.2
            when job_id = 'ST_CLERK' then salary+salary*0.3
            else salary
        end rSalary
from employees;

--decode()
select employee_id,
         job_id,
         salary,
         decode(
         job_id, 'AC_ACCOUNT' , salary+salary*0.1,
                     'SA_REP' ,salary+salary*0.2,
                     'ST_CLERK' ,salary+salary*0.3,
            salary
         ) as rSalary
from employees;


