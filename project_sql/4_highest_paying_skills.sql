/*Finding out the highest paid skills in Data Analyst roles*/

Select 
    sk.skills,
   ROUND( AVG(j.salary_year_avg)) as yearly_salary

FROM job_postings_fact as j
Inner JOIN skills_job_dim  as s ON j.job_id=s.job_id
Inner JOIN skills_dim as sk ON s.skill_id=sk.skill_id

WHERE j.job_title = 'Data Analyst'
AND job_work_from_home = TRUE
AND salary_year_avg IS NOT NULL

GROUP BY sk.skills
ORDER BY yearly_salary DESC

LIMIT 10