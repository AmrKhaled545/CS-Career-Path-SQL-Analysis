-- Creating the database & using it ;
CREATE DATABASE Nti_Training_SQL ;
USE Nti_Training_SQL ;

-- NOTE: Ensure you have successfully imported data into the CS_Fields_Tracks table.

-- --------------------------------------------------------------------------------
-- SECTION I: MAX / HIGHEST RANKING QUERIES (Original Core)
-- --------------------------------------------------------------------------------

-- 1️ Which main CS field has the highest average salary?
SELECT Main_Field, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Main_Field
ORDER BY Avg_Salary DESC;

-- 2️ Which CS sub-track has the highest average job demand score?
SELECT Sub_Track, ROUND(AVG(Job_Demand_Score), 2) AS Avg_Demand
FROM CS_Fields_Tracks
GROUP BY Sub_Track
ORDER BY Avg_Demand DESC;

-- 3️ Which country has the highest demand for each CS track?
SELECT Main_Field, Country_Demand AS Top_Country_Demand, COUNT(*) AS Demand_Count 
FROM CS_Fields_Tracks 
GROUP BY Main_Field, Country_Demand 
ORDER BY Main_Field, Demand_Count DESC;

-- 4️ Which age group earns the highest average salary?
SELECT 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30' 
        WHEN Age BETWEEN 31 AND 40 THEN '31-40' 
        WHEN Age > 40 THEN '40+' 
        ELSE 'Other' 
    END AS Age_Group, 
    '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30' 
        WHEN Age BETWEEN 31 AND 40 THEN '31-40' 
        WHEN Age > 40 THEN '40+' 
        ELSE 'Other' 
    END
ORDER BY Avg_Salary DESC;

-- 5️ Which CS fields have the highest growth rate?
SELECT Main_Field, 
       CAST(ROUND(AVG(Growth_Rate_Percentage), 2) AS VARCHAR) + '%' AS Avg_Growth
FROM CS_Fields_Tracks
GROUP BY Main_Field
ORDER BY Avg_Growth DESC;

-- --------------------------------------------------------------------------------
-- SECTION II: TOP N / MIN / BOTTOM RANKING QUERIES (New Variety)
-- --------------------------------------------------------------------------------

-- 6️ Which Main Field has the absolute lowest average salary? (MIN)
SELECT TOP 1 Main_Field, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Min_Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Main_Field
ORDER BY AVG(Avg_Salary_USD) ASC;

-- 7️ Which 10 sub-tracks have the highest average salary? (TOP 10)
SELECT TOP 10 Sub_Track, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Sub_Track
ORDER BY Avg_Salary DESC;

-- 8️ Which 10 certifications lead to the highest salaries? (TOP 10)
SELECT TOP 10 Certification_Recommended, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Certification_Recommended
ORDER BY Avg_Salary DESC;

-- 9️ Which 10 sub-tracks have the lowest job demand score? (BOTTOM 10)
SELECT TOP 10 Sub_Track, 
       ROUND(AVG(Job_Demand_Score), 2) AS Avg_Demand
FROM CS_Fields_Tracks
GROUP BY Sub_Track
ORDER BY Avg_Demand ASC;

-- 10️ Which track requires the maximum average learning time (in months)? (MAX)
SELECT TOP 1 Sub_Track, 
       ROUND(AVG(Learning_Time_Months), 0) AS Max_Avg_Learning_Time
FROM CS_Fields_Tracks
GROUP BY Sub_Track
ORDER BY Max_Avg_Learning_Time DESC;

-- --------------------------------------------------------------------------------
-- SECTION III: COMPARATIVE & RATIO QUERIES (Engagement)
-- --------------------------------------------------------------------------------

-- 11️ The ROI Question: Which sub-track provides the highest salary return per month of learning?
SELECT 
    Sub_Track,
    ROUND(AVG(Avg_Salary_USD) / NULLIF(AVG(Learning_Time_Months), 0), 2) AS Salary_Per_Learning_Month
FROM 
    CS_Fields_Tracks
GROUP BY 
    Sub_Track
ORDER BY 
    Salary_Per_Learning_Month DESC;

-- 12️ The Risk vs. Reward Question: What is the average salary difference between High Difficulty and Low Difficulty tracks?
SELECT 
    Difficulty_Level,
    '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM 
    CS_Fields_Tracks
WHERE 
    Difficulty_Level IN ('Beginner', 'Intermediate','Advanced') 
GROUP BY 
    Difficulty_Level
ORDER BY 
    Avg_Salary DESC;

-- 13️ The Gender Gap Insight: What is the most significant gender salary gap (difference) across all Main_Field categories?
WITH SalaryData AS (
    SELECT 
        Main_Field, 
        Gender,
        AVG(Avg_Salary_USD) AS Avg_Salary
    FROM 
        CS_Fields_Tracks
    WHERE
        Gender IN ('Male', 'Female') 
    GROUP BY 
        Main_Field, 
        Gender
)
SELECT
    M.Main_Field,
    '$' + CAST(ROUND(ABS(M.Avg_Salary - F.Avg_Salary), 2) AS VARCHAR) AS Salary_Difference
FROM 
    SalaryData M
JOIN 
    SalaryData F 
    ON M.Main_Field = F.Main_Field
WHERE 
    M.Gender = 'Male' AND F.Gender = 'Female'
ORDER BY 
    ABS(M.Avg_Salary - F.Avg_Salary) DESC;

-- 14️ Does gender impact average salary in CS tracks (Overall)?
SELECT Gender, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Gender
ORDER BY Avg_Salary DESC;

-- 15️ Do remote-friendly tracks pay more? (Comparison)
SELECT Remote_Friendly,
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Remote_Friendly
ORDER BY Avg_Salary DESC;

-- --------------------------------------------------------------------------------
-- SECTION IV: MULTI-CRITERIA & SPECIFIC FOCUS QUERIES (Detailed Analysis)
-- --------------------------------------------------------------------------------

-- 16️ Which CS fields are the hardest AND highest-paid?
SELECT Main_Field,
       Difficulty_Level,
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM CS_Fields_Tracks
GROUP BY Main_Field, Difficulty_Level
ORDER BY Difficulty_Level,Avg_Salary  DESC;

-- 17️ The Current Trend: Which industry pays the highest salary for the most demanded main field?
SELECT 
    Industry_Using_It,
    '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM 
    CS_Fields_Tracks
WHERE 
    Main_Field = (
        SELECT TOP 1 Main_Field 
        FROM CS_Fields_Tracks 
        GROUP BY Main_Field 
        ORDER BY COUNT(*) DESC
    )
GROUP BY 
    Industry_Using_It
ORDER BY 
    Avg_Salary DESC;

-- 18️ Which 5 tracks are the MOST remote-friendly based on high salary AND job demand?
SELECT TOP 5
    Sub_Track,
    ROUND(AVG(Job_Demand_Score), 2) AS Avg_Demand,
    '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary
FROM 
    CS_Fields_Tracks
WHERE 
    Remote_Friendly = '1'
GROUP BY 
    Sub_Track
ORDER BY 
    AVG(Job_Demand_Score) DESC, 
    AVG(Avg_Salary_USD) DESC;   

-- 19️ What are the top 5 highest-paying tracks that require LESS than 12 months of learning?
SELECT TOP 5 Sub_Track, 
       '$' + CAST(ROUND(AVG(Avg_Salary_USD), 2) AS VARCHAR) AS Avg_Salary,
       ROUND(AVG(Learning_Time_Months), 0) AS Avg_Learning_Time
FROM CS_Fields_Tracks
WHERE Learning_Time_Months < 12
GROUP BY Sub_Track
ORDER BY Avg_Salary DESC;

-- 20️ Which tools are used in the TOP 5 highest-paying individual records (not aggregated)?
SELECT TOP 5
    Sub_Track,
    '$' + CAST(Avg_Salary_USD AS VARCHAR) AS Salary,
    Tools_Used
FROM CS_Fields_Tracks
ORDER BY Avg_Salary_USD DESC;