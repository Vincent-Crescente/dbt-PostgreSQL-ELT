# Define variables

source ./secrets.sh

RAW_DIR="./raw_data"

echo " Creating raw tables in database '$DB_NAME'..."
psql -h localhost -U "$DB_USER" -d "$DB_NAME" -f ./sql/create_tables.sql

echo " Loading CSVs into raw tables..."

psql -h localhost -U "$DB_USER" -d "$DB_NAME" -c "\copy raw_users(owner_id, pet_id, owner_age_group, pet_type) FROM '$RAW_DIR/users.csv' DELIMITER ',' CSV HEADER"

psql -h localhost -U "$DB_USER" -d "$DB_NAME" -c "\copy raw_pet_activity(pet_id, date, activity_type, duration_minutes) FROM '$RAW_DIR/pet_activities.csv' DELIMITER ',' CSV HEADER"

psql -h localhost -U "$DB_USER" -d "$DB_NAME" -c "\copy raw_pet_health(pet_id, date, issue, resolution) FROM '$RAW_DIR/pet_health.csv' DELIMITER ',' CSV HEADER"
echo " Data load complete."