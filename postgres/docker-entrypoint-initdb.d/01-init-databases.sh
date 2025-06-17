#!/bin/bash
#set -e

export PGPASSWORD="$POSTGRESQL_PASSWORD"

psql -v ON_ERROR_STOP=1 -U "$POSTGRESQL_USERNAME" -d postgres <<-EOSQL
  CREATE USER tpuser WITH PASSWORD 'LfrnUtVxwfbXFr9w';
  CREATE DATABASE tp_analytics_db;
  CREATE DATABASE tp_license_db;
  CREATE USER repl_user WITH PASSWORD 'repl_password';
EOSQL

psql -v ON_ERROR_STOP=1 -U "$POSTGRESQL_USERNAME" -d tp_analytics_db <<-EOSQL
  -- Create extension (requires superuser privileges)
  CREATE EXTENSION IF NOT EXISTS vector
    SCHEMA public
    VERSION '0.8.0';

  GRANT ALL PRIVILEGES ON SCHEMA public TO tpuser;
  GRANT ALL PRIVILEGES ON DATABASE tp_analytics_db TO tpuser;
  CREATE SCHEMA idm AUTHORIZATION tpuser;
  CREATE SCHEMA master AUTHORIZATION tpuser;
  CREATE SCHEMA analytics AUTHORIZATION tpuser;
  CREATE SCHEMA report AUTHORIZATION tpuser;
EOSQL

psql -v ON_ERROR_STOP=1 -U "$POSTGRESQL_USERNAME" -d tp_license_db <<-EOSQL
  GRANT ALL PRIVILEGES ON SCHEMA public TO tpuser;
EOSQL
