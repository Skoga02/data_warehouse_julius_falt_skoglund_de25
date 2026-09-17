-- Exercise 1 Extract and load

/* a) Create a marketing virtual warehouse called marketing_wh with size xs,
1 min suspend time, it should autoresume, suspend initally and give a suitable comment.*/
USE ROLE SYSADMIN;
SELECT CURRENT_ROLE();
CREATE WAREHOUSE marketing_wh
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE 
COMMENT = 'This warehouse is used for Exercise1.';

/* b) Now create a database called ifood, and add a staging layer 
by creatin a schmea called staging */
CREATE DATABASE ifood;
CREATE SCHEMA ifood.staging;

/* c) Create a user called extract_loader and setup its credentials. */
USE ROLE USERADMIN;
CREATE USER extract_loader
    COMMENT = 'User for loading marketing data';

/* d) Create a role marketing_dlt_role and grant it access to staging */
CREATE ROLE marketing_dlt_role
    COMMENT = 'Role for loading data into the marketing staging layer';

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