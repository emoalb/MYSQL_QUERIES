USE `soft_uni`;
SELECT * FROM `departments`
ORDER BY `department_id`;

SELECT `name` FROM `departments`
ORDER BY `department_id`;

SELECT `first_name`, `middle_name`,`last_name` FROM `employees`
ORDER BY `employee_id`;

SELECT concat(`first_name`,'.',`last_name`,'@softuni.bg') AS `full_email_address`
FROM `employees` ORDER BY `employee_id`;
 
 SELECT DISTINCT `salary`
 FROM `employees`
  ORDER BY `employee_id`;
  
  SELECT * FROM `employees`
  WHERE `job_title`='Sales Representative'
  ORDER BY `employee_id`;
  
  SELECT `first_name`, `last_name`, `job_title` FROM `employees`
  WHERE `salary` BETWEEN 20000 AND 30000
  ORDER BY `employee_id`;
 
SELECT concat_ws(' ',`first_name`,`middle_name`,`last_name`) AS `Full Name`
FROM `employees` 
WHERE `salary`=25000 OR `salary`=14000 OR `salary`=12500 OR `salary`=23600;

SELECT `first_name`,`last_name` FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `first_name`,`last_name`,`salary` FROM `employees`
WHERE `salary`>50000
ORDER BY `salary` DESC;

SELECT `first_name`,`last_name` FROM `employees`
WHERE `salary`
ORDER BY `salary` DESC LIMIT 5;

SELECT `first_name`,`last_name` FROM `employees`
WHERE  NOT (`department_id`= 4);


  SELECT * FROM `employees`
  ORDER BY `salary` DESC , `first_name` , `last_name`  DESC, `middle_name`;
  
  
  CREATE VIEW `v_employees_job_titles` AS
SELECT concat_ws(' ',`first_name`, IFNULL(`middle_name`,''),`last_name`) AS `Full Name`, `job_title` FROM `employees`;

 CREATE VIEW `v_employees_salaries` AS
  SELECT `first_name`, `last_name`, `salary` FROM `employees`;
  
  SELECT DISTINCT `job_title` FROM `employees`
  ORDER BY `job_title`;
 
SELECT * FROM `projects`
ORDER BY `start_date` ASC,`name`,`project_id` LIMIT 10;

SELECT `first_name`,`last_name`,`hire_date` FROM `employees`
ORDER BY `hire_date` DESC  LIMIT 7;

SET SQL_SAFE_UPDATES = 0;

UPDATE `employees`
SET `salary`=`salary`+(`salary`*0.12)
WHERE `department_id` IN (1,2,4,11);
SELECT `salary` FROM `employees`

