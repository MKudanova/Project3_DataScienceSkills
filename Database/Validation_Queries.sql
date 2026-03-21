SET search_path TO project3;

-- row counts
SELECT COUNT(*) AS jobs_count FROM jobs;
SELECT COUNT(*) AS skills_count FROM skills;
SELECT COUNT(*) AS job_skills_count FROM job_skills;

-- sample rows
SELECT * FROM jobs LIMIT 10;
SELECT * FROM skills LIMIT 10;
SELECT * FROM job_skills LIMIT 10;

-- check joined view
SELECT * FROM vw_job_skill_details LIMIT 20;

-- top skills
SELECT
    s.skill_name,
    COUNT(*) AS skill_count
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY skill_count DESC;

-- jobs without matched skills
SELECT
    j.job_id,
    j.job_title,
    j.company_name
FROM jobs j
LEFT JOIN job_skills js
    ON j.job_id = js.job_id
WHERE js.job_id IS NULL;