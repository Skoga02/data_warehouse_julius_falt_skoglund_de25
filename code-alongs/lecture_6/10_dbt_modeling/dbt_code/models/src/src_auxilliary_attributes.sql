with stg_job_ads as (
    select * 
    from {{ source('job_ads', 'stg_ads') }}
)

select
    experience_requierd as experience_required,
    driving_license_requierd as driver_license,
    access_to_own_car
from stg_job_ads