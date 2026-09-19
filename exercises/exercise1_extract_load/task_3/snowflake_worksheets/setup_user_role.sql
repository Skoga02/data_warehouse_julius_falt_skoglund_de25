USE ROLE USERADMIN;

SELECT CURRENT_ROLE();

CREATE USER extract_loader_api
    PASSWORD = 'extract_api'
    COMMENT = 'User for loading parking data';

CREATE ROLE parking_dlt_role
    COMMENT = 'Role for loading data into the parking staging layer';

USE ROLE SYSADMIN;

GRANT USAGE ON DATABASE iparking
    TO ROLE parking_dlt_role;

GRANT USAGE ON SCHEMA iparking.staging
    TO ROLE parking_dlt_role;

GRANT USAGE ON WAREHOUSE parking_wh
    TO ROLE parking_dlt_role;

GRANT CREATE TABLE ON SCHEMA iparking.staging
    TO ROLE parking_dlt_role;

USE ROLE USERADMIN;

GRANT ROLE parking_dlt_role 
    TO USER extract_loader_api;

USE ROLE SYSADMIN;

GRANT SELECT ON TABLE iparking.staging.motorcycle_parking
    TO ROLE parking_dlt_role;

GRANT ROLE parking_dlt_role TO USER SKOGLUND02;