SELECT
    pet_id,
    date,
    NULLIF(issue, '') AS issue,
    NULLIF(resolution, '') AS resolution,
    activity_type,
    CASE 
        WHEN activity_type = 'Health' THEN 0
        WHEN duration_minutes = '-' THEN NULL
        ELSE CAST(duration_minutes AS INTEGER)
    END AS duration_minutes
FROM {{ ref('fill_nulls_and_replace_2') }}
