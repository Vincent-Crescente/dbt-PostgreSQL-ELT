SELECT
    pet_id,
    date,
    issue,
    resolution,
    CASE
      WHEN activity_type IS NULL OR activity_type = '' THEN 'Health'
      WHEN activity_type = 'Walk' THEN 'Walking'
      WHEN activity_type = 'Play' THEN 'Playing'
      WHEN activity_type = 'Rest' THEN 'Resting'
      ELSE activity_type
    END AS activity_type,
    duration_minutes
FROM {{ ref('combine_health_and_act_1') }}