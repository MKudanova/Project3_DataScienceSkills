-- =========================================
-- Project 3: Data Science Skills
-- PostgreSQL Schema
-- =========================================

-- Optional: create a dedicated schema
CREATE SCHEMA IF NOT EXISTS project3;
SET search_path TO project3;

-- =========================================
-- Drop old objects if re-running
-- =========================================
DROP VIEW IF EXISTS vw_job_skill_details;
DROP TABLE IF EXISTS job_skills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS jobs;

-- =========================================
-- 1. Jobs table
-- =========================================
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title TEXT NOT NULL,
    rating NUMERIC(3,1),
    company_name TEXT NOT NULL,
    location TEXT,
    type_of_ownership TEXT,
    industry TEXT,
    sector TEXT,
    min_salary INT,
    max_salary INT,
    avg_salary INT,
    job_state VARCHAR(10),
    company_age INT,
    job_simp TEXT
);

-- =========================================
-- 2. Skills table
-- =========================================
CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    skill_name TEXT NOT NULL UNIQUE
);

-- =========================================
-- 3. Job_Skills bridge table
-- =========================================
CREATE TABLE job_skills (
    job_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (job_id, skill_id),
    CONSTRAINT fk_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_skill
        FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =========================================
-- Helpful indexes
-- =========================================
CREATE INDEX idx_jobs_job_simp ON jobs(job_simp);
CREATE INDEX idx_jobs_job_state ON jobs(job_state);
CREATE INDEX idx_jobs_company_name ON jobs(company_name);
CREATE INDEX idx_job_skills_skill_id ON job_skills(skill_id);
CREATE INDEX idx_job_skills_job_id ON job_skills(job_id);

-- =========================================
-- Joined view for easier analysis
-- =========================================
CREATE VIEW vw_job_skill_details AS
SELECT
    j.job_id,
    j.job_title,
    j.job_simp,
    j.company_name,
    j.location,
    j.job_state,
    j.rating,
    j.type_of_ownership,
    j.industry,
    j.sector,
    j.min_salary,
    j.max_salary,
    j.avg_salary,
    j.company_age,
    s.skill_id,
    s.skill_name
FROM job_skills js
JOIN jobs j
    ON js.job_id = j.job_id
JOIN skills s
    ON js.skill_id = s.skill_id;