WITH generated_data(number, text, salary) AS (
    SELECT floor(generate_series(1, 10000) * random() + 1) as number,
           md5(random()::text)                             as text,
           round((random() * 100000)::numeric, -3)        as salary
)
INSERT
INTO vacancy
(employer_id, position_name, compensation_from, compensation_to, description, area_id)
SELECT number,
       text,
       salary,
       salary * 1.5,
       text,
       number
FROM generated_data;

WITH generated_data(number, text, salary) AS (
    SELECT floor(generate_series(1, 100000) * random() + 1) as number,
           md5(random()::text)                              as text,
           round((random() * 100000)::numeric, -3)         as salary
)
INSERT
INTO resume
(employee_id, position_name, compensation_from, compensation_to, description, area_id)
SELECT number,
       text,
       salary,
       salary * 1.5,
       text,
       number
FROM generated_data;

