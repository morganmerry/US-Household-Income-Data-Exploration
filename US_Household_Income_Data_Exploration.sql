

SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

-- Comparing the sum of all of the states land and water

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC;

-- Join the data from two tables where there is not missing data

SELECT *
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE mean != 0;

-- Lowest 5 states based on average income

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE mean != 0
GROUP BY u.State_Name
ORDER BY 2 ASC
LIMIT 5;

-- Comparing the type to the average salary

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE mean != 0
GROUP BY Type
ORDER BY 3 DESC;

-- Highest to lowest average income based on the city

SELECT u.State_Name, City, ROUND(AVG(Mean), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE mean != 0
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean), 1) DESC;
    