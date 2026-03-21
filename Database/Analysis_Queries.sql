--Its Optional Reference analysis queries but all the Analysis should be done through R in rStudio.


SET search_path TO project3;

-- average salary by skill
SELECT
    s.skill_name,
    ROUND(AVG(j.avg_salary), 2) AS avg_salary,
    COUNT(*) AS postings
FROM job_skills js
JOIN jobs j
    ON js.job_id = j.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY avg_salary DESC;

-- skills by role
SELECT
    j.job_simp,
    s.skill_name,
    COUNT(*) AS skill_count
FROM job_skills js
JOIN jobs j
    ON js.job_id = j.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY j.job_simp, s.skill_name
ORDER BY j.job_simp, skill_count DESC;

-- skills by state
SELECT
    j.job_state,
    s.skill_name,
    COUNT(*) AS skill_count
FROM job_skills js
JOIN jobs j
    ON js.job_id = j.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY j.job_state, s.skill_name
ORDER BY j.job_state, skill_count DESC;