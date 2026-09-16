USE ROLE ice_cream_writer;
USE DATABASE ice_cream_db;
USE SCHEMA PUBLIC;
USE WAREHOUSE dev_wh;

-- Creating table suppliers
CREATE TABLE suppliers(
    suppliers_id INT,
    suppliuer_name STRING
);

-- Checking if it was created as it should be
SHOW TABLES LIKE 'suppliers';

-- Trying to drop it using SYSADMIN
USE ROLE SYSADMIN;
DROP TABLE ice_cream_db.public.suppliers;

-- SYSADMIN did not have the correct privilages
-- Grant SYSADMIN with the role ice_cream_writer
USE ROLE SECURITYADMIN;
GRANT ROLE ice_cream_writer TO ROLE SYSADMIN;

-- trying again to drop the table
USE ROLE SYSADMIN;
DROP TABLE ice_cream_db.public.suppliers;

-- confirm it's gone
SHOW TABLES LIKE 'suppliers' IN SCHEMA ice_cream_db.public;

/*
No the code-along worksheets do not strictly follow snowflake's access control best practice.
ice_cream_writer was granted only to the user Skoglund02 and never to SYSADMIN,
leaving it an orphaned role. Because the creating role owns the table, 
SYSADMIN could not drop it that every custom role rolls up to SYSADMIN
so it can manage objects in the account.
 */