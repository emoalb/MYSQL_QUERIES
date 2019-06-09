USE `soft_uni`;

DELIMITER $$

CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS DOUBLE 
BEGIN
	DECLARE e_count DOUBLE;
	SET e_count := (SELECT COUNT(employee_id) FROM employees AS e
	INNER JOIN addresses AS a ON a.address_id = e.address_id
	INNER JOIN towns AS t ON t.town_id = a.town_id
	WHERE t.name = town_name);
	RETURN e_count;
END $$

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT e.`first_name`, e.`last_name`
FROM `employees` AS e
WHERE e.`salary`>35000
ORDER BY e.`first_name`,e.`last_name`,e.`employee_id`;
END $$
CALL usp_get_employees_salary_above_35000();

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(salary DECIMAL(19,4))
BEGIN
SELECT e.`first_name`, e.`last_name`
FROM `employees` AS e
WHERE e.`salary`>salary OR e.`salary`=salary
ORDER BY e.`first_name`,e.`last_name`,e.`employee_id`;
END $$

CALL usp_get_employees_salary_above(48100);
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(town_fragment VARCHAR(40))
BEGIN
SELECT t.`name` AS 'town_name'
FROM `towns` AS t
WHERE t.`name` LIKE CONCAT(town_fragment,'%')
ORDER BY `town_name`;
END $$
CALL usp_get_towns_starting_with('sof');


 DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town (town_name VARCHAR(50))
BEGIN
SELECT e.`first_name`, e.`last_name`
FROM `addresses` AS a
INNER JOIN `towns` AS t ON a.`town_id`=t.`town_id`
INNER JOIN `employees` AS e ON a.`address_id`=e.`address_id`
WHERE t.`name`=town_name
ORDER BY  e.`first_name`, e.`last_name`;
END $$

CALL usp_get_employees_from_town('Sofia');
SET GLOBAL log_bin_trust_function_creators = 1;


 DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19,4))
RETURNS VARCHAR(7)
BEGIN 
DECLARE lvl VARCHAR(7);
IF salary<30000 THEN SET lvl :='Low';
ELSEIF salary>=30000 AND salary<=50000 THEN SET lvl := 'Average';
ELSE SET lvl := 'High';
END IF;
RETURN lvl;
END $$

SELECT  e.`salary`, ufn_get_salary_level(e.`salary`) AS 'salary_level'
FROM `employees` AS e;

CREATE PROCEDURE usp_get_employees_by_salary_level()



