WITH resume_grouped_by_month AS (
    SELECT EXTRACT(MONTH FROM r.publication_date) AS month, COUNT(resume_id) AS numbers_of_resume
    FROM resume r
    GROUP BY month
), vacancy_grouped_by_month AS (
    SELECT EXTRACT(MONTH FROM v.publication_date) AS month, COUNT(vacancy_id) AS numbers_of_vacancies
    FROM vacancy v
    GROUP BY month
)
SELECT r.month,r.numbers_of_resume,v.month,v.numbers_of_vacancies
FROM resume_grouped_by_month r, vacancy_grouped_by_month v
WHERE numbers_of_resume = (
    SELECT MAX(numbers_of_resume)
    FROM resume_grouped_by_month
    )
  AND numbers_of_vacancies = (
    SELECT MAX(numbers_of_vacancies)
    FROM vacancy_grouped_by_month
    );
