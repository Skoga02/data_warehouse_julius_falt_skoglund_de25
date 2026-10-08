with src_auxilliary_attributes as ( select * from {{ ref('src_auxilliary_attributes') }})

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'experience_required',
        'driver_license',
        'access_to_own_car'
    ]) }} as auxilliary_attributes_id,
    experience_required,
    driver_license,
    access_to_own_car
FROM src_auxilliary_attributes
GROUP BY
    experience_required,
    driver_license,
    access_to_own_car