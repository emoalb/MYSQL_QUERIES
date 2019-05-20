USE `soft_uni`;
UPDATE `employees`
SET `salary` = `salary`+`salary`*0.1
WHERE `id`>0;
SELECT `salary` FROM `employees` 


