-- Pet Activity Table
CREATE TABLE IF NOT EXISTS raw_pet_activity (
    activity_id SERIAL PRIMARY KEY,  -- surrogate key for uniqueness
    pet_id INTEGER,                  -- keep original pet ID
    date DATE,
    activity_type TEXT,
    duration_minutes TEXT
);

-- Pet Health Table
CREATE TABLE IF NOT EXISTS raw_pet_health (
    health_id SERIAL PRIMARY KEY,    -- surrogate key for uniqueness
    pet_id INTEGER,                  -- original pet ID stays
    date DATE,
    issue TEXT,
    resolution TEXT
);

-- Users Table
CREATE TABLE IF NOT EXISTS raw_users (
    user_id SERIAL PRIMARY KEY,      -- surrogate key
    owner_id INTEGER,                -- original owner ID stays
    pet_id INTEGER,
    owner_age_group TEXT,
    pet_type TEXT
);
