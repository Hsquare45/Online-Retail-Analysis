-- 1. Total Salary and Overtime Cost Analysis by Agency
-- objective: Determine how much each agency spends on base salaries and overtime.
SELECT agency_name, sum(base_salary) as Total_base_salary, 
SUM(total_ot_paid) AS Total_overtime_cost,
SUM(Total_overtime_cost)/NULLIF(SUM(Total_base_salary), 0)* 100 AS Overtime_percentage
FROM pays
GROUP BY 1
ORDER BY 2 DESC

-- Result: This shows the Total base salary, Total overtime cost and the Overtime percentage (7.35)

-- 2. Employee Count by Work Location
-- Objective: Get the number of employees at each work location by borough.
SELECT work_location_borough, count(*) employee_count
FROM pays
GROUP BY 1
ORDER BY 1 DESC

-- Result: This table calculates the total number of employees from each location
     
-- 3. Average Base Salary by Job Title
-- Objective: Find the average salary for each job title.
SELECT avg(base_salary) avg_base_salary, title_description
FROM pays
GROUP BY 2
ORDER BY 1 DESC

-- Result: It shows the average base salary earned by each position. 
-- The position with the highest base salary is Exec Assistant to the Deputy commissioner (185,400)

-- 4. Overtime Analysis for Top 10 Employees
-- Objective: Identify employees with the most overtime pay.
SELECT CONCAT(last_name,' ', first_name) name, payroll_number, title_description, total_ot_paid
FROM pays
ORDER BY 4 desc
LIMIT 10

-- Result: It shows the top 10 overtime amount earned by each position/role. the role with with the most
-- paid overtime staff is City Laborer with (94,360)

-- 5. Total Payroll Cost by Fiscal Year
--Objective: Assess the annual payroll cost for each fiscal year.
SELECT fiscal_year, SUM(base_salary + total_ot_paid + total_other_pay) total_payroll_cost
FROM pays
GROUP BY 1
ORDER BY 2 DESC

-- Result: It shows the total staff cost (76,779,471.52) in the Fiscal year under consideration (2020)


-- 6. Leave Status Distribution
-- Objective: Analyze the distribution of employees’ leave status.
SELECT leave_status_as_of_july_31, COUNT(*)
FROM pays
GROUP BY 1
ORDER BY 2 DESC

-- Result: These are the number of staff that are on leave during this particular time


-- 7. Employees Starting After a Specific Date
-- Objective: Find employees who joined after a certain date (Using: 2020-01-01).
SELECT name, agency_name, agency_start_date
FROM pays
WHERE agency_start_date > '2020-01-01'
ORDER BY 3

-- Result: These are the names of employees that began working after Jan 2020. there are 12 of them.


-- 8. Monthly Cost Analysis for Regular and Overtime Hours
-- Objective: Calculate average monthly pay for regular and overtime hours.
SELECT EXTRACT(MONTH FROM agency_start_date) AS month,
AVG(regular_gross_paid) AS avg_monthly_reg_pay, AVG(total_ot_paid) AS avg_monthly_overtime_pay
FROM pays
GROUP BY 1
ORDER BY 1

-- Result: These shows the average staff cost (basic and overtime) for each month
-- June had the highest monthly staff base salary cost (68266.25). For average monthly overtime pay, July records the highest (7294.41)