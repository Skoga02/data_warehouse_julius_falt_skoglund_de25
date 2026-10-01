WITH stg_job_ads (select * from {{ source('job_ads', 'stg_ads') }})

SELECT
    headline,
    description,
    description_html_formatted,
    employment_type,
    duration,
    salary_type,
    scope_of_work_min,
    scope_of_work_max
FROM stg_job_ads