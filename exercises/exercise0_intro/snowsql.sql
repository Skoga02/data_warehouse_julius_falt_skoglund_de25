SHow tables;

SHOW views;

USE DATABASE GOOGLE_KEYWORDS;
USE SCHEMA DATAFEEDS;
SHOW columns;

-- c)
SELECT COUNT(*) AS amount_rows
FROM GOOGLE_KEYWORDS;

-- d)
SELECT 
    MIN(date) AS first_search,
    max(date) AS last_search
FROM GOOGLE_KEYWORDS;

-- e)
SELECT 
    keyword,
    COUNT(KEYWORD) AS most_used_keyword
FROM GOOGLE_KEYWORDS
GROUP BY keyword
ORDER BY most_used_keyword DESC
LIMIT 10;

-- f)
SELECT 
    COUNT(DISTINCT keyword) AS unique_keywords
FROM GOOGLE_KEYWORDS;


-- g)
SHOW COLUMNS IN TABLE GOOGLE_KEYWORDS;

SELECT 
    platform,
    COUNT(*) AS users
FROM GOOGLE_KEYWORDS
GROUP BY platform
ORDER BY users DESC;

-- h)
SELECT 
    keyword,
    COUNT(KEYWORD) AS most_used_keyword
FROM GOOGLE_KEYWORDS
WHERE country = 752
GROUP BY keyword
ORDER BY most_used_keyword DESC
LIMIT 20;

-- i)
SHOW COLUMNS IN TABLE GOOGLE_KEYWORDS;

SELECT 
    country,
    COUNT(keyword) AS amount_searched
FROM GOOGLE_KEYWORDS
WHERE keyword LIKE '%spotify'
GROUP BY country
ORDER BY amount_searched DESC
LIMIT 10;