--is , is not
SELECT
    commission_pct  그거,
    first_name      이름,
    salary          연봉
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

--예제
SELECT
    first_name      이름,
    salary          연봉,
    commission_pct  비율
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

SELECT
    first_name 이름
FROM
    employees
WHERE
    manager_id IS NULL
    AND commission_pct IS NULL;

--order by절 을 사용하여 보기 좋게 정렬하기 내림차순-desc ,오름차순-asc
SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
ORDER BY
    salary ASC,
    first_name DESC; --1순위 급여 오름차순, 급여가 동률일때 이름은 내림차순

--where절 order by절 같이 쓸때 
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 9000
ORDER BY
    salary DESC;

--예제
SELECT
    department_id  부서번호,
    salary         급여,
    first_name     이름
FROM
    employees
ORDER BY
    department_id ASC;

SELECT
    first_name  이름,
    salary      급여
FROM
    employees
WHERE
    salary >= 10000
ORDER BY
    salary DESC;

SELECT
    department_id  부서번호,
    salary         급여,
    first_name     이름
FROM
    employees
ORDER BY
    department_id ASC,
    salary DESC;


--단일행 함수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--맨앞만 대문자
SELECT
    email,
    initcap(email),
    department_id
FROM
    employees
WHERE
    department_id = 100;

--가상의 테이블 dual
SELECT
    initcap('aaaaaa')
FROM
    dual;

--올소문자 or 올대문자
SELECT
    first_name,
    lower(first_name),
    upper(first_name)
FROM
    employees
WHERE
    department_id = 100;

--substr() 특정 자리에 문자만 출력
SELECT
    substr('abcdefg', 2, 2)
FROM
    dual;

SELECT
    first_name,
    substr(first_name, 1, 3),
    substr(first_name, 1, 4)
FROM
    employees
WHERE
    department_id = 100;

--lpad() ,rpad()
--자리수를 정해주고 빈공백만큼 지정한 문자로 채워준다.
SELECT
    first_name,
    lpad(first_name, 10, '*!@#'),
    rpad(first_name, 10, '*!@#')
FROM
    employees;
    
--replace 단어찾아서 바꾸기
SELECT
    first_name,
    replace(first_name, 'a', '*'),
    replace(first_name, substr(first_name, 2, 3),'***')
FROM
    employees;
    
select first_name, substr(first_name, 2, 3)
from employees;

--숫자함수
select round(123.345 ,2), --2번째 자리까지 출력 하고 뒤에숫자들은 반올림
         round(123.545 ,0),
         round(153.345 ,-2)
from dual;

select trunc(123.456, 2), --라운드랑 다르게 반올림을 하지않고 바로 버려버린다. 잔인한놈
         trunc(123.456, 0),
         trunc(123.456, -2)
from dual;

--날짜 함수
select sysdate --현날짜
from dual;


--MONTHS_BETWEEN 날짜 사이에 개월수 출력
select 
    sysdate,
    hire_date,
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date), 0)
from employees;
--where department_id =110;

select 
    sysdate,
    hire_date,
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date), 0)
from employees;

--to_char()
select first_name 이름,
        salary * 12 연봉,
         to_char(salary * 12, '$999,999.99')
from employees
where department_id =110;

--숫자에서 문자로 변환
select to_char(9876, '99999'),
         to_char(9876, '0999999'),
         to_char(9876, '9999.99'),
         to_char(9876, '999,999')
from dual;

--날짜에서 문자로 변환
select sysdate,
         to_char(sysdate, 'YYYY'),
         to_char(sysdate, 'YY'),
         to_char(sysdate, 'MM'),
         to_char(sysdate, 'MONTH'),
         to_char(sysdate, 'DD'),
         to_char(sysdate, 'DAY'),
         to_char(sysdate, 'DDTH'),
         to_char(sysdate, 'HH24'),
         to_char(sysdate, 'HH'),
         to_char(sysdate, 'MI'),
         to_char(sysdate, 'SS')
from dual;


--nvl() nvl2()
SELECT first_name,
           commission_pct,
           nvl(commission_pct, 0)
from employees;

SELECT first_name,
           commission_pct,
           nvl2(commission_pct, 100,0)
from employees;


select first_name, 
         avg(salary)
from employees;