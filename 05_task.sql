WITH one_week_responded_vacancies AS (
    SELECT r.vacancy_id, v.position_name tittle, COUNT(r.vacancy_id) numbers_of_vacancies
    FROM response r
    JOIN vacancy v on r.vacancy_id = v.vacancy_id
    WHERE EXTRACT(EPOCH FROM (r.time - v.publication_date))/604800 < 1
    GROUP BY r.vacancy_id, tittle
)
SELECT vacancy_id, tittle
FROM one_week_responded_vacancies
WHERE numbers_of_vacancies > 5;
