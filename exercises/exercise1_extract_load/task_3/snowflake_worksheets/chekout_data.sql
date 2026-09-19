USE DATABASE iparking;
USE SCHEMA staging;
USE ROLE parking_dlt_role;

DESCRIBE TABLE motorcycle_parking;
SELECT *
FROM motorcycle_parking
LIMIT 10;

SELECT COUNT(*) 
FROM motorcycle_parking;

SELECT * 
FROM motorcycle_parking
LIMIT 1;

SELECT PROPERTIES__STREET_NAME
FROM motorcycle_parking
LIMIT 20;

SELECT 
    PROPERTIES__STREET_NAME,
    PROPERTIES__ADDRESS
FROM motorcycle_parking
WHERE PROPERTIES__ADDRESS NOT LIKE '%Adress saknas%'
LIMIT 20;

SELECT DISTINCT PROPERTIES__CITY_DISTRICT
FROM staging.motorcycle_parking;

SELECT COUNT(*)
FROM staging.motorcycle_parking;

SELECT
    PROPERTIES__PARKING_RATE,
    COUNT(*) AS number_of_places
FROM staging.motorcycle_parking
GROUP BY PROPERTIES__PARKING_RATE;

SELECT DISTINCT PROPERTIES__START_WEEKDAY
FROM staging.motorcycle_parking;