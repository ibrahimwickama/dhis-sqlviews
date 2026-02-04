
-- PROBLEM: Dhis2 analytics returning data only for 2024 below and above 2025 and 2026
-- Analytics runs for last 2 years daily(2026,2025)
-- Here are the queries below based on dhis2 postgres logs 

select 
ax."dx",
ax."TL1Outuihzy",
ax."yearly",
sum(value) as value 
from (select ap.* from analytics_2023 as ap 
    union all select ap.* from analytics_2024 as ap 
    union all select ap.* from analytics_2025 as ap 
    union all select ap.* from analytics_2026 as ap ) as ax 
where ax."dx" in ('f6Q9p6uSWtS') 
and ax."TL1Outuihzy" in ('KM4ToXnjKoo', 'eP9pcI4ukz6') 
and ax."yearly" in ('2026', '2025', '2024', '2023') 
and ( ax."uidlevel1" in ('m0frOspS7JY') ) 
and ax."year" in (2023, 2024, 2025, 2026) 
group by ax."dx",ax."TL1Outuihzy",ax."yearly";

     dx      | TL1Outuihzy | yearly | value 
-------------+-------------+--------+-------
 f6Q9p6uSWtS | KM4ToXnjKoo | 2023   |   233
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2023   | 76851
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2024   | 79952
 f6Q9p6uSWtS | KM4ToXnjKoo | 2024   |   292
(4 rows)




select 
ax."dx",
ax."TL1Outuihzy",
ax."yearly",
sum(value) as value 
from (select ap.* from analytics_2025 as ap 
    union all select ap.* from analytics_2026 as ap ) as ax 
where ax."dx" in ('f6Q9p6uSWtS') 
and ax."TL1Outuihzy" in ('KM4ToXnjKoo', 'eP9pcI4ukz6') 
and ax."yearly" in ('2026', '2025') 
and ( ax."uidlevel1" in ('m0frOspS7JY') ) 
and ax."year" in (2025, 2026) 
group by ax."dx",ax."TL1Outuihzy",ax."yearly"; 

     dx      | TL1Outuihzy | yearly | value 
-------------+-------------+--------+-------
 f6Q9p6uSWtS | KM4ToXnjKoo | 2025   |   505
 f6Q9p6uSWtS | KM4ToXnjKoo | 2026   |    10
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2025   | 69350
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2026   |  1562
(4 rows)

-- After checking 2024 and 2025 table definitions(\d analytics_2024 & \d analytics_2025)

-- Looking at the column order, analytics_2025 has several columns in different positions compared to analytics_2024.
-- The columns exist in both tables but in different positions. This matters because when you do UNION ALL, PostgreSQL matches columns by position, not by name.
-- The SELECT * means "select all columns in their physical order". Since the columns are in different positions between the tables, the UNION ALL is essentially mixing up the data — putting values from one column into another column's position.
-- This likely explains why:
--   - 4-year query fails: The misaligned columns corrupt the result set
--   - 2-year query (2025+2026) works: Both newer tables probably share the same structure


select 
    ax."dx",
    ax."TL1Outuihzy",
    ax."yearly",
    sum(value) as value 
from (
    select "dx", "TL1Outuihzy", "yearly", "uidlevel1", "year", value 
    from analytics_2023
    union all 
    select "dx", "TL1Outuihzy", "yearly", "uidlevel1", "year", value 
    from analytics_2024
    union all 
    select "dx", "TL1Outuihzy", "yearly", "uidlevel1", "year", value 
    from analytics_2025
    union all 
    select "dx", "TL1Outuihzy", "yearly", "uidlevel1", "year", value 
    from analytics_2026
) as ax 
where ax."dx" in ('f6Q9p6uSWtS') 
and ax."TL1Outuihzy" in ('KM4ToXnjKoo', 'eP9pcI4ukz6') 
and ax."yearly" in ('2026', '2025', '2024', '2023') 
and ax."uidlevel1" in ('m0frOspS7JY') 
and ax."year" in (2023, 2024, 2025, 2026) 
group by ax."dx", ax."TL1Outuihzy", ax."yearly";

     dx      | TL1Outuihzy | yearly | value 
-------------+-------------+--------+-------
 f6Q9p6uSWtS | KM4ToXnjKoo | 2023   |   233
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2023   | 76851
 f6Q9p6uSWtS | KM4ToXnjKoo | 2024   |   292
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2025   | 69350
 f6Q9p6uSWtS | KM4ToXnjKoo | 2026   |    10
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2026   |  1562
 f6Q9p6uSWtS | eP9pcI4ukz6 | 2024   | 79952
 f6Q9p6uSWtS | KM4ToXnjKoo | 2025   |   505
(8 rows)

-- This ensures that each column is matched by name, not position, regardless of the physical table structure.