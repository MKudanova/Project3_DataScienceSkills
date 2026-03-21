## Processed Data

This folder contains cleaned and transformed datasets derived from the original Glassdoor dataset.

- jobs.csv: job-level information (title, company, salary, etc.)
- skills.csv: unique list of skills with assigned IDs
- job_skills.csv: mapping between jobs and skills (many-to-many relationship)

The data has been transformed from wide format to long format to support database normalization and analysis.
