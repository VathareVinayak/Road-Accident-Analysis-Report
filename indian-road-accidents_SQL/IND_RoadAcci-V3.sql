use traffic_data;

# 1. Calculate the percentage contribution of each accident cause to overall accident numbers

SELECT ACCIDENT_TYPE, (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accident_dataset)) AS percentage_contribution
FROM accident_dataset
GROUP BY ACCIDENT_TYPE;

# 2. Track cumulative accidents over time

SELECT ACCIDENT_DATE, @cum_sum := @cum_sum + COUNT(*) AS cumulative_accidents
FROM accident_dataset, (SELECT @cum_sum := 0) AS t
GROUP BY ACCIDENT_DATE
ORDER BY ACCIDENT_DATE;

# 3. Evaluate the impact of road improvements on accident rates

SELECT LGA_NAME, YEAR(ACCIDENT_DATE) AS year, COUNT(*) AS accidents_count
FROM accident_dataset
WHERE STAT_DIV_NAME LIKE '%Improved%'
GROUP BY LGA_NAME, year;

# 4. Determine the seasonal variation in accident numbers and severity

SELECT MONTH(ACCIDENT_DATE) AS month, SEVERITY, COUNT(*) AS severity_count
FROM accident_dataset
GROUP BY month, SEVERITY;

# 5. Analyze the effect of traffic density on accident severity 
SELECT HEAVYVEHICLE, SEVERITY, COUNT(*) AS severity_count
FROM accident_dataset
GROUP BY HEAVYVEHICLE, SEVERITY;

