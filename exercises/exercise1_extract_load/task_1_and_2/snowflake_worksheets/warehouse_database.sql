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