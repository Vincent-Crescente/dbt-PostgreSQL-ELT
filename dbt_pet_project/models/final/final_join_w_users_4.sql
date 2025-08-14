SELECT
  a.pet_id,
  a.date,
  a.activity_type,
  a.duration_minutes,
  a.issue,
  a.resolution,
  u.owner_id,
  u.owner_age_group,
  u.pet_type
FROM {{ ref('clean_fields_3') }} a
LEFT JOIN {{ source('raw', 'raw_users') }} u
  ON a.pet_id = u.pet_id
