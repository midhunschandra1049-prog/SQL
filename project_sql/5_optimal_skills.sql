/* Finding out the skills that are both in_demand and high_paying*/
WITH skills_demand as (

    Select 
        sk.skill_id,
        sk.skills, 
        COUNT(sk.skills) as skill_demand,
        ROUND(AVG(j.salary_year_avg)) as salary_avg

    FROM job_postings_fact as j
    INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
    INNER JOIN skills_dim as sk ON s.skill_id=sk.skill_id

    WHERE j.job_title = 'Data Analyst'
    AND j.job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
    GROUP BY sk.skill_id
    ORDER BY skill_demand DESC


) ,   

 avg_salary as (
    Select 
        sk.skill_id,
        sk.skills,
    ROUND( AVG(j.salary_year_avg)) as yearly_salary

    FROM job_postings_fact as j
    Inner JOIN skills_job_dim  as s ON j.job_id=s.job_id
    Inner JOIN skills_dim as sk ON s.skill_id=sk.skill_id

    WHERE j.job_title = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL

    GROUP BY sk.skill_id
    ORDER BY yearly_salary DESC

  

)

SELECT
    skills_demand.skill_id,
    skills_demand.skill_demand,
    skills_demand.skills,
    avg_salary.yearly_salary
FROM skills_demand 
INNER JOIN avg_salary ON skills_demand.skill_id = avg_salary.skill_id
ORDER BY
skill_demand DESC,
avg_salary DESC
LIMIT 10