-- models/transformations/combine_health_and_act_1.sql

SELECT
    pet_id,
    date,
    issue,
    resolution,
    NULL::TEXT AS activity_type,
    NULL::TEXT AS duration_minutes
FROM {{ source('raw', 'raw_pet_health') }}

UNION ALL

SELECT
    pet_id,
    date,
    NULL::TEXT AS issue,
    NULL::TEXT AS resolution,
    activity_type,
    duration_minutes
FROM {{ source('raw', 'raw_pet_activity') }}
