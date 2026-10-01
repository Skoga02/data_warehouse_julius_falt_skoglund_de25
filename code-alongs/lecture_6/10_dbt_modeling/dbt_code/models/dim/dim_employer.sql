with src_employer as ( select * from {{ ref('src_employer') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['employer_name'])}} as employer_id,
    employer_name,
    MAX(employer_workplace) AS employer_workplace,
    MAX(employer_organization_number) AS employer_organization_number,
    MAX(workplace_street_address) AS workplace_street_address,
    MAX(workplace_region) AS workplace_region,
    MAX(workplace_postcode) AS workplace_postcode,
    MAX(workplace_city) AS workplace_city,
    MAX(workplace_country) AS workplace_country
FROM src_employer
GROUP BY employer_name
