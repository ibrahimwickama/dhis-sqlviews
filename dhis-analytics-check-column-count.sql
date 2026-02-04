-- Get Column count from analytics tables
SELECT table_schema, table_name, COUNT(column_name) AS column_count
FROM information_schema.columns
WHERE 
    table_name LIKE 'analytics_2%'
    AND table_schema NOT IN ('information_schema', 'pg_catalog') -- exclude system schemas
GROUP BY table_schema, table_name
ORDER BY column_count DESC;

-- Now check what is different in the tables in columns 
-- Imagine this is the example 
--  public       | analytics_2024 |           98
--  public       | analytics_2023 |           96


WITH table_2024_columns AS (
    SELECT column_name
    FROM information_schema.columns
    WHERE table_name = 'analytics_2024' AND table_schema = 'public'
),
table_2023_columns AS (
    SELECT column_name
    FROM information_schema.columns
    WHERE table_name = 'analytics_2023' AND table_schema = 'public'
)

SELECT 
    'analytics_2024' AS table_name,
    column_name
FROM table_2024_columns
WHERE column_name NOT IN (SELECT column_name FROM table_2023_columns)

UNION ALL

SELECT 
    'analytics_2023' AS table_name,
    column_name
FROM table_2023_columns
WHERE column_name NOT IN (SELECT column_name FROM table_2024_columns)
ORDER BY table_name;