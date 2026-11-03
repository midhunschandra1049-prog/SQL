/*  1. Identify the top 10 highest paying Data Analyst roles that are available remotely.
    2. Focuses on job postings with specified salaries. */


SELECT 
    company_dim.company_id,
    company_dim.name as company_name,
    job_id,
    job_work_from_home,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

FROM job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE job_title = 'Data Analyst'

AND job_work_from_home = TRUE

AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;