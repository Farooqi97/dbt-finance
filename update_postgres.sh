#!/bin/bash

echo "Starting PostgreSQL update..."

# Database credentials
DB_HOST="localhost"
DB_NAME="finance_db"
DB_USER="postgres"
DB_PASSWORD="1234"

export PGPASSWORD=$DB_PASSWORD

# SQL Commands
psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "
  ALTER TABLE finance.raw_balancesheethistory_annually ADD COLUMN new_column DOUBLE PRECISION;
  UPDATE finance.raw_balancesheethistory_annually SET new_column = totalCurrentAssets - totalCurrentLiabilities;
"

echo "PostgreSQL update complete."
