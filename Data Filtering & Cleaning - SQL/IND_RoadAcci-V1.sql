show databases;

create database traffic_data;

use traffic_data;
SHOW TABLES;
select * from accident_dataset;
desc accident_dataset;
show columns from accident_dataset;
# Basic Tasks 
# 1. Retrieve the total number of accidents recorded.
SELECT COUNT(*) FROM accident_dataset;

SELECT COUNT(*) AS total_accidents FROM accident_dataset;

# 2. Calculate the number of accidents involving fatalities:
SELECT COUNT(*) AS fatal_accidents FROM accident_dataset;



# 3 .Count of the most common cause of accidents.
SELECT ACCIDENT_TYPE, COUNT(*) AS occurrence
FROM accident_dataset
GROUP BY ACCIDENT_TYPE
ORDER BY occurrence DESC
LIMIT 1;


# 4. List the top 5 accident-prone locations:

SELECT LGA_NAME, COUNT(*) AS accident_count
FROM accident_dataset
GROUP BY LGA_NAME
ORDER BY accident_count DESC
LIMIT 5;


# 5. Determine the number of accidents that occurred during nighttime:
SELECT COUNT(*) AS nighttime_accidents
FROM accident_dataset
WHERE (ACCIDENT_TIME >= '18:00:00' AND ACCIDENT_TIME <= '23:59:59')
   OR (ACCIDENT_TIME >= '00:00:00' AND ACCIDENT_TIME < '06:00:00');


# 6. Calculate the total number of injuries in all accidents:
SELECT SUM(SERIOUSINJURY + OTHERINJURY) AS total_injuries FROM accident_dataset;


# 7. Find the percentage of accidents that occurred in urban areas:
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accident_dataset)) AS urban_accidents_percentage
FROM accident_dataset
WHERE SPEED_ZONE <= 60;


# 8. Count the number of accidents involving two-wheeler vehicles:
SELECT COUNT(*) AS two_wheeler_accidents
FROM accident_dataset
WHERE MOTORCYCLE > 0;

