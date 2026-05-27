CREATE TABLE jan_job as
    SELECT *
    FROM job_postings_fact
    WHERE extract(month from job_posted_date) = 1;

CREATE TABLE feb_job as
    SELECT *
    FROM job_postings_fact
    WHERE extract(month from job_posted_date) = 2;

CREATE TABLE mar_job as
    SELECT *
    FROM job_postings_fact
    WHERE extract(month from job_posted_date) = 3;

select * from jan_job;

-- CASE STATEMENT
SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'local'
        ELSE 'Other' END as location_type
FROM
    job_postings_fact;

--AGREGRATE WITH CASE STATEMENT
SELECT
    COUNT(job_id) as num_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'local'
        ELSE 'Other' END as location_type
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Scientist'
GROUP BY
    location_type;