-- Created the database 
CREATE DATABASE bird_analysis;

-- Choosing database to work in 
Use bird_Analysis;

# Overview of data

-- 1. forest_data
Select * 
from forest_data
limit 5;

-- Total rows 
Select count(*) from forest_data;

-- 2. grassland_data 
Select * 
from grassland_data
limit 5;

-- Total rows 
Select count(*) from grassland_data;

# Combining both tables

CREATE TABLE combine_bird_data AS
SELECT * FROM forest_data
UNION ALL
SELECT * FROM grassland_data; 

-- Retriving data from combine dataset
Select * from combine_bird_data limit 5;

# Number of rows of combine dataset
SELECT COUNT(*) FROM combine_bird_data;

-- Structure of combine data
DESCRIBE combine_bird_data; 

# STEP 1 - BASIC QUERIES ON COMBINE BIRD DATA

-- 1. Total Observations
SELECT COUNT(*) AS total_observations 
FROM combine_bird_data;

-- 2. Unique Species Count
SELECT COUNT(DISTINCT Scientific_Name) AS unique_species 
FROM combine_bird_data;

-- 3. Observations by Location Type
SELECT Location_Type, 
COUNT(*) AS observations
FROM combine_bird_data
GROUP BY Location_Type;

-- 4. Top 10 Most Observed Species
SELECT Common_Name, 
COUNT(*) AS observation_count
FROM combine_bird_data
GROUP BY Common_Name
ORDER BY observation_count DESC
LIMIT 10; 

-- 5. Observations by Year
SELECT Year, 
COUNT(*) AS observations
FROM combine_bird_data
GROUP BY Year
ORDER BY Year; 

# STEP 2 - INTERMEDIATE ANALYSIS ON COMBINE BIRD DATASET

-- 1. Species Count by Habitat
SELECT Location_Type, 
COUNT(DISTINCT Scientific_Name) AS species_count
FROM combine_bird_data
GROUP BY Location_Type; 

-- 2. Monthly Observation Trends
SELECT 
    MONTH(STR_TO_DATE(Date, '%y-%m-%d')) AS month,
    COUNT(*) AS observations
FROM combine_bird_data
GROUP BY month
ORDER BY month;

SELECT Date FROM combine_bird_data LIMIT 10;

-- 3. Yearly Trend (refined)
SELECT Year, 
COUNT(*) AS observations
FROM combine_bird_data
GROUP BY Year
ORDER BY observations DESC; 

-- 4. Top 5 Species per Habitat
SELECT Location_Type, Common_Name, 
COUNT(*) AS observation_count
FROM combine_bird_data
GROUP BY Location_Type, Common_Name
ORDER BY Location_Type, observation_count DESC; 

-- 5. Observation by Time of Day
SELECT 
    CASE 
        WHEN CAST(SUBSTRING_INDEX(Start_Time, '-', 1) AS UNSIGNED) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN CAST(SUBSTRING_INDEX(Start_Time, '-', 1) AS UNSIGNED) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS observations
FROM combine_bird_data
GROUP BY time_of_day;
 
SELECT Start_Time FROM combine_bird_data LIMIT 10;

# STEP 3- Advanced Analysis on combine_bird_data

-- 1. Watchlist Species Count (Conservation Insight)
SELECT PIF_Watchlist_Status, 
COUNT(*) AS count
FROM combine_bird_data
GROUP BY PIF_Watchlist_Status; 

-- 2. At-Risk Species
SELECT Common_Name, 
COUNT(*) AS observations
FROM combine_bird_data
WHERE PIF_Watchlist_Status = 'TRUE'
GROUP BY Common_Name
ORDER BY observations DESC;

-- 3. Observer-wise Analysis 
 SELECT Observer, 
 COUNT(*) AS total_observations
FROM combine_bird_data
GROUP BY Observer
ORDER BY total_observations DESC
LIMIT 10;

-- 4. Disturbance Impact Analysis
SELECT Disturbance, 
COUNT(*) AS observations
FROM combine_bird_data
GROUP BY Disturbance
ORDER BY observations DESC; 

-- 5. Temperature vs Bird Activity (Correlation-style) 
SELECT 
    ROUND(Temperature, 0) AS temp_range,
    COUNT(*) AS observations
FROM combine_bird_data
GROUP BY temp_range
ORDER BY temp_range;

-- 6. Flyover Behavior Analysis
SELECT Flyover_Observed, 
COUNT(*) AS observations
FROM combine_bird_data
GROUP BY Flyover_Observed; 

 Select distinct Flyover_Observed  from combine_bird_data ;