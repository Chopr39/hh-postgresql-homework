CREATE TABLE vacancy (
  vacancy_id serial primary key,
  employer_id integer not null,
  position_name text not null,
  compensation_from integer,
  compensation_to integer,
  description text,
  area_id integer,
  publication_date timestamp not null default current_timestamp
);

CREATE TABLE resume (
  resume_id serial primary key,
  employee_id integer not null,
  position_name text not null,
  compensation_from integer,
  compensation_to integer,
  description text,
  area_id integer,
  ready_to_relocate boolean,
  publication_date timestamp not null default current_timestamp
);

CREATE TABLE specialization (
  specialization_id integer primary key,
  section text not null,
  subsection text not null
);

CREATE TABLE response (
  time timestamp not null default current_timestamp,
  vacancy_id integer not null references vacancy (vacancy_id),
  resume_id integer not null references resume (resume_id)
);

CREATE TABLE specialization_mapping (
  specialization_id integer not null,
  vacancy_id integer references vacancy (vacancy_id),
  resume_id integer references resume (resume_id)
);