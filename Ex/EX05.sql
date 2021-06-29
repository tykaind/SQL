-- subQuery --
--단일행
select *
from employees
where first_name = 'Den';

select first_name,
         salary
from employees
where salary > (select salary
                       from employees
                       where first_name = 'Den');
                       
select first_name 이름,
         salary 급여,
         employee_id 아이디
from employees
where salary > (select min(salary)
                       from employees)
order by salary desc;
                       
select employee_id,
         first_name,
         salary,
         department_id
from employees
where salary IN (select salary
                       from employees
                       where department_id = 110);

--예제) 각 부서별로 최고급여를 받는 사원을 출력하세요.
-- 1.그룹별 최고급여를 구한다.
 select max(salary)
 from employees
 GROUP by department_id;
 
 -- 2. 사원테이블에서 그룹번호 와 급여가 같은 직원의 정보를 출력하세요.
 select *
 from employees
 where (department_id, salary) in ( select department_id,max(salary)
                         from employees
                         GROUP by department_id);
 
 --------------------------------------------------------------------------------------------
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요. (or연산 --> 8300보다 큰)
-- 1.부서 번호가 110인 직원의 리스트 12008, 8300
select salary
from employees
where department_id = 110;

-- 2. 부서번호가 110인 직원급여(12008, 8300) 보다 급여가 큰 직원 리스트 (사번, 이름, 급여)를 구하시오.
select employee_id,
         first_name,
         salary
from employees
where salary > 12008
or salary > 8300;
--위에를 식으로 풀기
--any는 or의 의미를 가지고있다.
select employee_id,
         first_name,
         salary
from employees
where salary >any (select salary
                             from employees
                             where department_id = 110);
                             
---------------------------------------------------------
-- all은 and의 기능을 가지고있다
select employee_id,
         first_name,
         salary
from employees
where salary >all (select salary
                             from employees
                             where department_id = 110);
                             
--예제) 각부서별로 최고급여를 받는 사원을 출력하세요.

select department_id,max(salary)
from employees
group by department_id;

select first_name 이름,
         department_id 부서명,
         salary 급여
from employees
where (nvl(department_id,0),salary) in (select nvl(department_id,0),max(salary)
                                                     from employees
                                                     group by department_id);

-- rownum
-- 예제) 급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--1차시도 rownum이 정렬전에 번호를 다매김
select rownum,
         salary 급여,
         first_name 이름,
         employee_id
from employees
order by salary desc;

--2차시도
select salary,
         first_name,
         employee_id
from employees
order by salary desc;

select rownum,
         salary,
         first_name,
         employee_id
from (select *
         from employees
         order by salary desc)
where rownum >= 1
and rownum <= 5;

--예제) 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
--1) 07년입사 한사람의 리스트를 만든다.
select *
from employees
where to_char(hire_date, 'YYYY') = '2007'
order by salary desc; 

 --2) 정렬해준 테이블을 이용하여 번호를 매겨준다. rownum사용
 select rownum,
          first_name,
          salary,
          hire_date
 from (  select *
            from employees
            where to_char(hire_date, 'YYYY') = '2007'
            order by salary desc) ot;
--where rownum >=2 and rownum <=7;

--3 정렬과번호까지 매겨준 테이블을 불러와 where조건문으로 예제를 완성시킴
select otr.first_name,
          otr.salary,
          otr.hire_date
from ( select rownum rn,
          ot.first_name,
          ot.salary,
          ot.hire_date
 from (  select *
            from employees
            where to_char(hire_date, 'YYYY') = '2007'
            order by salary desc) ot) otr
where rn >=2 and rn <=7;

