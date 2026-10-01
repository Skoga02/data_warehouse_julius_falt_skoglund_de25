WITH stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

SELECT 
    employer_name,
    employer_workplace,
    employer_organization_number,
    workplace_address_street_address as workplace_street_address,
    workplace_address_region as workplace_region,
    workplace_address_postcode as workplace_postcode,
    workplace_adress_city as workplace_city,
    workplace_address_country as workplace_country 
from stg_job_ads