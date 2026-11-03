/* 1. Identify the necessary skills required to top paying Data Analyst roles */


SELECT 
    j.job_id,
    sk.skills,
    j.job_work_from_home,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
    

FROM job_postings_fact as j
Inner JOIN skills_job_dim as s ON j.job_id = s.job_id
Inner JOIN skills_dim as sk on s.skill_id = sk.skill_id

WHERE j.job_title = 'Data Analyst'

AND j.job_work_from_home = TRUE

AND j.salary_year_avg IS NOT NULL

ORDER BY j.salary_year_avg DESC

LIMIT 10;

