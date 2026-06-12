select 
    skills_dim.skill_id,
    skills_dim.skills as skill_name,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
    job_title_short = 'Data Analyst' and job_work_from_home = TRUE and salary_year_avg is not null
group by
    skill_name, skills_dim.skill_id
order by
   avg_salary desc
limit 10

