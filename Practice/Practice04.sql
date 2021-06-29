--6월 29일 프렉티스4

--1) 평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
select count(salary)
from employees
where (select avg(salary) from employees) > salary;

--2)
select  em.employee_id 직원번호,
          em.first_name 이름,
          em.salary 급여
from employees em
where (select avg(salary) from employees) <= salary
and (select max(salary) from employees) >= salary
order by salary asc;

--3
select lo.location_id 도시아이디,
         lo.street_address 거리명,
         lo.postal_code 우편번호,
         lo.city 도시명,
         lo.state_province 주,
         lo.country_id 나라아이디
from locations lo, departments de, employees em
where lo.location_id = de.location_id
and de.manager_id = em.employee_id
and em.first_name = 'Steven'
and em.last_name = 'King';

--4
select em.employee_id,
         em.first_name,
         em.salary
from employees em
where em.salary <any (select salary
                              from employees
                              where job_id = 'ST_MAN')
order by em.salary desc;

--5 조건절비교, 테이블조인
--5-1
select em.employee_id,
         em.first_name,
         em.salary,
         em.department_id
from employees em
where em.salary = (select max(salary)
                            from employees emp
                            where emp.department_id = em.department_id)
order by em.salary desc;

--5-2 pass

--6
select jo.job_title,
         emp.ssa
from (select sum(salary) ssa,
                  job_id
         from employees
         group by job_id)emp , jobs jo
where emp.job_id = jo.job_id
order by emp.ssa desc;

--7
select em.employee_id,
         em.first_name,
         em.salary
from employees em , ( select avg(salary) avsa,
                                          department_id
                                from employees
                                group by department_id ) emp
where em.department_id = emp.department_id
and emp.avsa < em.salary;

--8
select rownum rn,
         em.employee_id,
         em.first_name,
         em.salary,
         em.hire_date
from (select rownum rn,
         emp.hire_date,
         emp.employee_id,
         emp.first_name,
         emp.salary
                from (select *
                         from employees
                         order by hire_date asc) emp) em
where rn >= 11 and rn <= 15;