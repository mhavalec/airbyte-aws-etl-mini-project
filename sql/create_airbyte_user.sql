-- Creating airbyte user for reading from source data
CREATE USER airbyte_reader WITH PASSWORD 'admin_abr'; -- passowrd was created but for security purposes not shared

-- Grant coonection permissions
GRANT CONNECT ON database postgres TO airbyte_reader;

-- Allow acces to public schema, our source destination
GRANT USAGE ON SCHEMA public TO airbyte_reader;

-- Allow reading existing tables in public schema
GRANT SELECT ON ALL tables IN SCHEMA public TO airbyte_reader;

-- Allow reading future tables
ALTER DEFAULT PRIVILEGES IN schema public
GRANT SELECT ON TABLES TO airbyte_reader;

-- Creating airbyte user for writing to destination schema
CREATE USER airbyte_user WITH PASSWORD '' -- passowrd was created but for security purposes not shared

-- Grant connection permissions
GRANT CONNECT ON DATABASE postgres TO airbyte_user;

-- Grant create permissions on database
GRANT CREATE, TEMPORARY ON DATABASE postgres TO airbyte_user;

-- Grant permissions to write
GRANT USAGE, CREATE ON SCHEMA stage TO airbyte_user;