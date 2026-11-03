/*Finding out the most in demand skills required for a Data Analyst roles*/

SELECT 

    
    sk.skills,
    COUNT(sk.skills) as skill_demand,
    AVG(j.salary_year_avg) salary_avg
    

FROM job_postings_fact as j
Inner JOIN skills_job_dim as s ON j.job_id = s.job_id
Inner JOIN skills_dim as sk on s.skill_id = sk.skill_id

WHERE j.job_title = 'Data Analyst'

AND j.job_work_from_home = TRUE

AND j.salary_year_avg IS NOT NULL

GROUP BY sk.skills
Order by skill_demand DESC

LIMIT 10;

