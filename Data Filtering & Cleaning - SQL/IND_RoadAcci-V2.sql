use traffic_data;




# 1. Analyze accident distribution by weather conditions, time of day, or road type
SELECT ALCOHOLTIME, LIGHT_CONDITION, COUNT(*) AS accident_count
FROM accident_dataset
GROUP BY ALCOHOLTIME, LIGHT_CONDITION;


# 2. Group accidents by location and calculate the average number of accidents per location:
SELECT LGA_NAME, COUNT(*) AS accident_count,
(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM accident_dataset)) AS average_accidents_per_location
FROM accident_dataset
GROUP BY LGA_NAME;

# 3. Analyze accident trends over time by cause or location 
# Trends by cause:
SELECT ACCIDENT_DATE, ACCIDENT_TYPE, COUNT(*) AS accident_count
FROM accident_dataset
GROUP BY ACCIDENT_DATE, ACCIDENT_TYPE
ORDER BY ACCIDENT_DATE;

# Trends by Location:
SELECT ACCIDENT_DATE, LGA_NAME, COUNT(*) AS accident_count
FROM accident_dataset
GROUP BY ACCIDENT_DATE, LGA_NAME
ORDER BY ACCIDENT_DATE;


# 4. Identify the top 3 most common causes of fatal accidents:

SELECT ACCIDENT_TYPE, COUNT(*) AS fatal_occurrences
FROM accident_dataset
WHERE INJ_OR_FATAL = 'Fatal'
GROUP BY ACCIDENT_TYPE
ORDER BY fatal_occurrences DESC
LIMIT 3;

# 5. Calculate the average number of fatalities per accident for different road types:
SELECT ALCOHOLTIME, AVG(FATALITY) AS avg_fatalities_per_accident
FROM accident_dataset
GROUP BY ALCOHOLTIME;

# 6. Analyze the distribution of accidents by day of the week:
SELECT DAY_OF_WEEK, COUNT(*) AS accidents_count
FROM accident_dataset
GROUP BY DAY_OF_WEEK;

# 7. Determine the correlation between weather conditions and accident severity:
SELECT ALCOHOLTIME, SEVERITY, COUNT(*) AS severity_count
FROM accident_dataset
GROUP BY ALCOHOLTIME, SEVERITY;

# 8. Identify locations with the highest increase in accidents over time:

SELECT LGA_NAME, YEAR(ACCIDENT_DATE) AS year, COUNT(*) AS accidents_count
FROM accident_dataset
GROUP BY LGA_NAME, year
ORDER BY year ASC, accidents_count DESC;


