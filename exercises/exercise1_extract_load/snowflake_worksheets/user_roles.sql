-- ROLEs and USERs
/* c) Create a user called extract_loader and setup its credentials. */
USE ROLE USERADMIN;
CREATE USER extract_loader
    PASSWORD = 'extract_l123'
    COMMENT = 'User for loading marketing data';

/* d) Create a role marketing_dlt_role and grant it access to staging */
CREATE ROLE marketing_dlt_role
    COMMENT = 'Role for loading data into the marketing staging layer';


-- Privilages/rights
-- Change role 
USE ROLE SYSADMIN;
GRANT USAGE ON DATABASE ifood
    TO ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging
    TO ROLE marketing_dlt_role;

/* e) */
USE ROLE USERADMIN;
GRANT ROLE marketing_dlt_role
    TO USER extract_loader;
ALTER USER extract_loader 
    SET DEFAULT_ROLE = marketing_dlt_role;

USE ROLE SYSADMIN;
GRANT USAGE ON WAREHOUSE marketing_wh
TO ROLE marketing_dlt_role;

GRANT CREATE TABLE ON SCHEMA ifood.staging
    TO ROLE marketing_dlt_role;