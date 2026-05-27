SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_job

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_job
UNION 
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    mar_job;


--UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_job

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_job
UNION ALL 
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    mar_job;


/*
find job postings from the first quarter that have a salary greater than $57k.
-combine job posting tables from the first quarter of 2023 jan_mar
-get job postings with average yearly salary > $70000 
*/
SELECT
    quarter_job_postings.job_location,
    quarter_job_postings.job_via,
    quarter_job_postings.job_posted_date::DATE,
    quarter_job_postings.salary_year_avg
FROM(
    SELECT *
    FROM jan_job
    UNION ALL
    SELECT *
    FROM feb_job
    UNION ALL
    SELECT *
    FROM mar_job
) AS quarter_job_postings
WHERE quarter_job_postings.salary_year_avg > 70000 AND 
quarter_job_postings.job_title_short = 'Data Analyst'
ORDER BY
     quarter_job_postings.salary_year_avg DESC