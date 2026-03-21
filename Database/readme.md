# PostgreSQL Setup Instructions

This folder contains the SQL files needed to recreate the Project 3 database locally in PostgreSQL using pgAdmin.

## Files
- `schema.sql`: creates the `project3` schema, tables, indexes, and view
- `validation_queries.sql`: checks that data loaded correctly
- `analysis_queries.sql`: Optional useful SQL queries for analysis

## Required CSV files
Use the processed CSV files from:
- `DATA/processed/jobs_updated.csv`
- `DATA/processed/skills_updated.csv`
- `DATA/processed/job_skills_updated.csv`

## Steps to create the database locally

1. Open pgAdmin.
2. Create a new database, for example: `project3_datascience_skills`
3. Open the Query Tool for that database.
4. Run `schema.sql`
5. In pgAdmin, go to:
   - `Schemas > project3 > Tables`
6. For each table (`jobs`, `skills`, `job_skills`):
   - right click table
   - choose **Import/Export Data**
   - choose **Import**
   - select the matching CSV file
   - format = `csv`
   - in the **Options** tab, turn **Header = ON**
   - click **OK**

## Table-to-file mapping
- `jobs` <- `jobs_updated.csv`
- `skills` <- `skills_updated.csv`
- `job_skills` <- `job_skills_updated.csv`

## After import
Run `validation_queries.sql` to confirm:
- row counts are correct
- sample rows appear
- joins work
- the view works

## Notes
- The database uses a normalized structure:
  - `jobs`
  - `skills`
  - `job_skills`
- `job_skills` is the bridge table for the many-to-many relationship between jobs and skills.
- `vw_job_skill_details` is a joined view for easier querying and analysis in R.
