USE `soft_uni`;
SELECT first_name, last_name FROM `employees`
WHERE substring(first_name,1,2) = "Sa"
order by `employee_id`;

SELECT `first_name`,`last_name` FROM `employees`
WHERE last_name LIKE "%ei%"
order by `employee_id`;

SELECT `first_name` FROM `employees`
WHERE (`hire_date` BETWEEN '1994/12/31' and '2006/01/01') AND
 (`department_id`=3 OR `department_id`=10)
order by `employee_id`;

SELECT `first_name`,`last_name` FROM `employees`
WHERE NOT `job_title` LIKE '%engineer%' 
order by `employee_id`;

SELECT `name` FROM `towns`
WHERE LENGTH(name)=6 OR LENGTH(name)=5
ORDER BY `name`;

SELECT * FROM `towns`
WHERE (LEFT(`name`,1) = 'M' OR LEFT(`name`,1) = 'K' OR LEFT(`name`,1) = 'B' OR LEFT(`name`,1) = 'E' )
ORDER BY `name`;
 
SELECT * FROM `towns`
WHERE NOT (LEFT(`name`,1) = 'R' OR LEFT(`name`,1) = 'B' OR LEFT(`name`,1) = 'D')
ORDER BY `name`;

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`,`last_name` FROM `employees`
WHERE YEAR(`hire_date`) > 2000;

SELECT `first_name`,`last_name` FROM `employees`
WHERE LENGTH(`last_name`)=5;
