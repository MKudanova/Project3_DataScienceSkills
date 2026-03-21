## Data Folder

This folder contains the datasets used in the project.

### Raw Data
- `jobsFromGlassdoor.csv`  
  This is the original dataset obtained from Kaggle, containing data science job postings.

### Processed Data
- `processed/`  
  This subfolder contains cleaned and normalized datasets derived from the original data.

  - `jobs_updated.csv`: job-level information after cleaning and removing unnecessary columns  
  - `skills_updated.csv`: unique list of skills with assigned IDs  
  - `job_skills_updated.csv`: mapping between jobs and skills (many-to-many relationship)

### Notes
- The raw dataset is preserved for reference and reproducibility.
- The processed datasets were transformed from wide format to long format to support relational database design and analysis.
