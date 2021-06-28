SELECT
    em.employee_id,
    em.first_name,
    em.department_id,
    de.department_id
FROM
    employees    em,
    departments  de
WHERE
    em.department_id = de.department_id;

SELECT
    em.first_name,
    de.department_name,
    jo.job_title
FROM
    employees    em,
    departments  de,
    jobs         jo
WHERE
        em.department_id = de.department_id
    AND em.job_id = jo.job_id;

SELECT
    *
FROM
    employees    em
    LEFT OUTER JOIN departments  de ON em.department_id = de.department_id;

SELECT
    em.employee_id,
    em.first_name,
    em.department_id,
    de.department_id
FROM
    employees    em
    RIGHT OUTER JOIN departments  de ON em.department_id = de.department_id;

SELECT
    em.employee_id,
    em.first_name,
    em.department_id,
    de.department_id
FROM
    departments  de
    LEFT OUTER JOIN employees    em ON de.department_id = em.department_id;

--full outer join
SELECT
    em.employee_id,
    em.first_name,
    em.department_id,
    de.department_id
FROM
    employees    em
    FULL OUTER JOIN departments  de ON em.department_id = de.department_id;

--self join
SELECT
    em.employee_id,
    em.first_name,
    em.manager_id,
    ma.manager_id,
    ma.first_name,
    ma.employee_id
FROM
    employees  em,
    employees  ma
WHERE
    em.manager_id = ma.employee_id;

SELECT
    *
FROM
    employees  em,
    locations  lo
WHERE
    em.salary = lo.location_id;