SELECT area_id,
       AVG(compensation_from)                         AS среднее_compensation_from,
       AVG(compensation_to)                           AS среднее_compensation_to,
       AVG((compensation_from + compensation_to) / 2) AS среднее_арифметическое_from_и_to
FROM resume
GROUP BY area_id
ORDER BY area_id;