CREATE DATABASE hr_analysis;
USE hr_analysis;

USE hr_analysis;
SHOW TABLES;
SELECT COUNT(*) FROM hr_attrition_clean;

SELECT 
  COUNT(*) AS Total_Employees,
  SUM(`Attrition Flag`) AS Total_Left,
  ROUND(SUM(`Attrition Flag`) / COUNT(*) * 100, 1) AS Attrition_Rate_Pct
FROM hr_attrition_clean;

SELECT 
  Department,
  COUNT(*) AS Total_Employees,
  SUM(`Attrition Flag`) AS Total_Left,
  ROUND(SUM(`Attrition Flag`) / COUNT(*) * 100, 1) AS Attrition_Rate_Pct
FROM hr_attrition_clean
GROUP BY Department
ORDER BY Attrition_Rate_Pct DESC;

SELECT 
  OverTime,
  COUNT(*) AS Total_Employees,
  SUM(`Attrition Flag`) AS Total_Left,
  ROUND(SUM(`Attrition Flag`) / COUNT(*) * 100, 1) AS Attrition_Rate_Pct
FROM hr_attrition_clean
GROUP BY OverTime;

SELECT 
  `Income Band`,
  COUNT(*) AS Total_Employees,
  SUM(`Attrition Flag`) AS Total_Left,
  ROUND(SUM(`Attrition Flag`) / COUNT(*) * 100, 1) AS Attrition_Rate_Pct
FROM hr_attrition_clean
GROUP BY `Income Band`
ORDER BY Attrition_Rate_Pct DESC;

CREATE VIEW attrition_summary AS
SELECT 
  Department,
  `Income Band`,
  OverTime,
  COUNT(*) AS Total_Employees,
  SUM(`Attrition Flag`) AS Total_Left,
  ROUND(SUM(`Attrition Flag`) / COUNT(*) * 100, 1) AS Attrition_Rate_Pct,
  ROUND(AVG(MonthlyIncome), 0) AS Avg_Salary
FROM hr_attrition_clean
GROUP BY Department, `Income Band`, OverTime;

