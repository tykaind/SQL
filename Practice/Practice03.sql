-- 6/28 실습예제

-- 1
SELECT
    em.employee_id,
    em.first_name,
    em.last_name,
    em.department_id
FROM
    employees    em
    LEFT OUTER JOIN departments  de ON em.department_id = de.department_id
ORDER BY
    em.department_id ASC,
    em.employee_id DESC;

-- 2
SELECT
    em.employee_id,
    em.first_name,
    em.salary,
    em.department_id
FROM
    employees    em,
    departments  de
WHERE
    em.department_id = de.department_id
ORDER BY
    em.employee_id ASC;
-- 2-1
SELECT
    em.employee_id,
    em.first_name,
    em.salary,
    em.department_id
FROM
    employees    em
    LEFT OUTER JOIN departments  de ON em.department_id = de.department_id;

-- 3
SELECT
    lo.location_id        도시아이디,
    lo.city               도시명,
    de.department_name    부서명
FROM
    locations    lo,
    departments  de
WHERE
        lo.location_id = de.location_id
    AND de.department_name IS NOT NULL
ORDER BY
    lo.location_id ASC;

-- 3-1
SELECT
    lo.location_id        도시아이디,
    lo.city               도시명,
    de.department_name    부서명
FROM
    locations    lo
    LEFT OUTER JOIN departments  de ON lo.location_id = de.location_id
                                      AND de.department_name IS NOT NULL
ORDER BY
    lo.location_id ASC;

-- 4
SELECT
    re.region_name,
    co.country_name
FROM
    regions    re
    LEFT OUTER JOIN countries  co ON re.region_id = co.region_id
ORDER BY
    re.region_name ASC,
    co.country_name;

-- 5
SELECT
    em.employee_id,
    em.first_name,
    em.hire_date
FROM
    employees  em,
    employees  ma
WHERE
        ma.manager_id = em.employee_id
    AND ma.hire_date < em.hire_date;

-- 6
SELECT
    co.country_name       나라명,
    co.country_id         나라아이디,
    lo.city               도시명,
    lo.location_id        도시아이디,
    de.department_name    부서명,
    de.department_id      부서아이디
FROM
    countries    co,
    locations    lo,
    departments  de
WHERE
        co.country_id = lo.country_id
    AND lo.location_id = de.location_id;

-- 7
SELECT
    em.employee_id,
    em.first_name || em.last_name,
    em.job_id,
    jh.start_date,
    jh.end_date
FROM
    job_history  jh
    LEFT OUTER JOIN employees    em ON jh.job_id = em.job_id
WHERE
    jh.job_id = 'AC_ACCOUNT';

--8
select de.department_id,
         de.department_name,
         em.manager_id,
         em.first_name,
         lo.city,
         co.country_name,
         re.region_name     
from employees em, departments de, locations lo, countries co, regions re
where em.employee_id = de.manager_id
and de.location_id = lo.location_id 
and lo.country_id = co.country_id
and co.region_id = re.region_id;

-- 9
select em.employee_id 사번,
         em.first_name 이름,
         de.department_name 부서,
         ma.first_name
from employees em ,employees ma, departments de
where em.manager_id = ma.employee_id and em.department_id= de.department_id(+)
order by em.employee_id asc;