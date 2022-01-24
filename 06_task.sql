--На главной странице hh предлагается найти вакансии, введя в поиск профессию, должность или имя компании
--Соответственно в первую очередь необходимо создать индекс для этих запросов
--Причём часто в запросе будет указан регион поиска работы
CREATE INDEX tittle_index ON vacancy (position_name, area_id);

--Работодатель скорее будет искать сотрудников не только по заголовку резюме, но и по специализации.
--Регион кандитата не так важен, если поле "готов к релокации" true.
CREATE INDEX resume_index ON resume (position_name) WHERE ready_to_relocate = true;
CREATE INDEX specialization_index ON specialization_mapping (resume_id,specialization_id);

--Пользователи сервисов обычно работают с актуальными резюме/вакансиями, поэтому будет не лишним
--создать индекс на поле "publication_date" в порядке убывания даты.
CREATE INDEX resume_publication_index ON resume (publication_date DESC);
CREATE INDEX vacancy_publication_index ON vacancy (publication_date DESC);
