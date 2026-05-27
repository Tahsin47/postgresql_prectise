SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date::DATE as date

FROM
    job_postings_fact;

-- AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date
SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date
FROM
    job_postings_fact
LIMIT 5;

-- EXTRACT(DAY FROM job_posted_date) as day,
SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date,
    EXTRACT(DAY FROM job_posted_date) as day,
    EXTRACT(MONTH FROM job_posted_date) as month,
    EXTRACT(YEAR FROM job_posted_date) as year
FROM
    job_postings_fact
LIMIT 5;

-- EXTRACT WITH COUNT AND GROUP BY

SELECT
    COUNT(job_id) as num_jobs,
    EXTRACT(MONTH FROM job_posted_date) as month
FROM
    job_postings_fact
WHERE
    job_title = 'Data Scientist'
GROUP BY
    month
ORDER BY
    num_jobs DESC;
    

