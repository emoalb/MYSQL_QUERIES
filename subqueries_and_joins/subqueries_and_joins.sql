USE `soft_uni`;
SELECT e.`employee_id` ,  e.`job_title`, e.`address_id`, a.`address_text`
FROM `employees` e
INNER JOIN addresses a ON e.`address_id`= a.`address_id`
ORDER BY `address_id` LIMIT 5;

SELECT e.`first_name` ,  e.`last_name`, t.`name`, a.`address_text`
FROM `employees` AS e
INNER JOIN addresses AS a ON e.`address_id`= a.`address_id`
INNER JOIN towns AS t ON a.`town_id`=t.`town_id`
ORDER BY e.`first_name` ASC , e.`last_name` LIMIT 5;

SELECT e.`employee_id`, e.`first_name` ,  e.`last_name`,d.`name` AS 'department_name'
FROM `employees` AS e
INNER JOIN departments AS d ON  e.`department_id`=d.`department_id`
HAVING `department_name`= 'Sales'
ORDER BY e.`employee_id` DESC;

SELECT e.`employee_id`, e.`first_name` , e.`salary`, d.`name` AS 'department_name'
FROM `employees` AS e
INNER JOIN departments AS d ON  e.`department_id`=d.`department_id`
WHERE e.`salary`>15000
ORDER BY d.`department_id` DESC LIMIT 5;

SELECT e.`employee_id`, e.`first_name`
FROM `employees` AS e
LEFT JOIN employees_projects as e_prj ON  e.`employee_id` = e_prj.`employee_id`
WHERE e_prj.`employee_id` IS NULL
ORDER BY e.`employee_id` DESC;

SELECT  e.`first_name`,e.`last_name`,e.`hire_date`,d.`name` AS 'dept_name'
FROM `employees` AS e
LEFT JOIN departments as d ON  e.`department_id` = d.`department_id`
WHERE DATE(e.`hire_date`) > STR_TO_DATE('01/01/1999 ','%d/%m/%Y') AND 
d.`name` IN ('Sales','Finance')
ORDER BY e.`hire_date` ASC;

SELECT e.`employee_id`, e.`first_name`  , p.`name` AS 'project_name'
FROM `employees_projects` AS ep
INNER JOIN projects AS p ON ep.`project_id` = p.`project_id`
INNER JOIN employees AS e ON ep.`employee_id`=e.`employee_id`
WHERE DATE(p.`start_date`) < STR_TO_DATE('13.08.2002','%d.%m.%y') AND p.`end_date` IS NULL 
GROUP BY e.`first_name`
HAVING COUNT(e.`first_name`)<2
ORDER BY e.`first_name`  , `project_name` LIMIT 5;

SELECT e.`employee_id`, e.`first_name`, 
CASE
	WHEN YEAR(p.`start_date`)>=2005 THEN p.`name` = NULL
    ELSE p.`name`
END AS 'project_name'
FROM `employees_projects` AS ep
RIGHT JOIN projects AS p ON ep.`project_id` = p.`project_id`
RIGHT JOIN employees AS e ON ep.`employee_id`=e.`employee_id`
WHERE e.`employee_id`=24
ORDER BY p.`name`;

 
SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, m.`first_name` AS 'manager_name'
FROM `employees` AS e
LEFT JOIN `employees` as m ON e.`manager_id`=m.`employee_id`
WHERE e.`manager_id`=7 OR e.`manager_id` = 3
ORDER BY `first_name`;


SELECT e.`employee_id`, CONCAT(e.`first_name`,' ',e.`last_name`) AS 'employee_name' , CONCAT (m.`first_name`,' ', m.`last_name`) AS 'manager_name', d.`name` AS 'department_name'
FROM `employees` AS e
LEFT JOIN `employees` as m ON e.`manager_id`=m.`employee_id`
INNER JOIN `departments`AS d ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id` LIMIT 5;

SELECT COUNT(e.employee_id) AS `count` 
FROM employees AS e
WHERE e.salary >
(
SELECT AVG(salary) AS 
'average_salary' FROM employees
);
SELECT AVG(e.salary) AS 'min_average_salary'
FROM `employees`AS e
GROUP BY e.`department_id`
ORDER BY `min_average_salary` LIMIT 1;

SELECT MIN(min_avg_salary) AS 'min_average_salary'
FROM (
SELECT AVG(salary) AS min_avg_salary
FROM employees 
GROUP BY department_id
) AS cocaine;

USE `geography`;

SELECT mc.`country_code`, m.`mountain_range`,
p.`peak_name`,p.`elevation` 
FROM `mountains_countries` AS mc
JOIN `mountains` AS m
ON mc.mountain_id = m.id
JOIN peaks AS p
ON m.id = p.mountain_id
WHERE mc.country_code='BG' AND  p.elevation >2835
ORDER BY p.`elevation` DESC;

SELECT country_code, mountains AS 'mountain_range'
FROM  (
SELECT mc.`country_code` AS country_code, COUNT(mc.`mountain_id`) AS mountains
FROM `mountains_countries` AS mc
GROUP BY mc.`country_code`
) AS mountains_count
HAVING `country_code`='BG' OR `country_code`='RU' OR `country_code`='US' 
ORDER by `mountains` DESC;

SELECT c.`country_name`, r.`river_name`
FROM `countries_rivers` AS cr
RIGHT JOIN `countries` AS c ON cr.`country_code`=c.`country_code`
LEFT JOIN `rivers` AS r ON cr.`river_id` = r.`id`
WHERE c.`continent_code`= 'AF'
ORDER BY c.`country_name` ASC LIMIT 5;

SELECT COUNT(country_with_no_mountain) AS 'country_count'
FROM (
SELECT  c.`country_code` AS country_with_no_mountain, mc.`mountain_id`
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
WHERE mc.`mountain_id` IS NULL
) AS some_table;

SELECT c.`country_name`, MAX(p.`elevation`) AS 'highest_peak_elevation', MAX(r.`length`) AS 'longest_river_length'
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
ON mc.`country_code`=c.`country_code`
LEFT JOIN `peaks` AS p
ON mc.`mountain_id` = p.`mountain_id`
LEFT JOIN `countries_rivers` AS cr
ON cr.`country_code` = c.`country_code`
LEFT JOIN `rivers` AS r
ON cr.`river_id` = r.`id`
GROUP BY c.`country_name`
ORDER BY `highest_peak_elevation` DESC , `longest_river_length` DESC , c.`country_name`
LIMIT 5;