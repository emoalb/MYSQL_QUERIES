USE `gringotts`;
SELECT COUNT(w.`id`) AS `count`
FROM `wizzard_deposits` AS w;

SELECT e.`deposit_group`, MAX(e.`magic_wand_size`) AS 'longest_magic_wand'
FROM `wizzard_deposits` AS e
GROUP BY e.`deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

SELECT e.`deposit_group`, SUM(e.`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits` AS e
GROUP BY e.`deposit_group`
ORDER BY `total_sum`;

SELECT e.`deposit_group`, SUM(e.`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits` AS e
WHERE e.`magic_wand_creator`='Ollivander family'
GROUP BY e.`deposit_group`
HAVING `total_sum` < 150000
ORDER BY  `total_sum` DESC;

SELECT e.`deposit_group`, SUM(e.`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits` AS e
WHERE e.`magic_wand_creator`='Ollivander family'
GROUP BY e.`deposit_group`
ORDER BY e.`total_sum`;

SELECT e.`deposit_group`, e.`magic_wand_creator`, MIN(e.`deposit_charge`) AS `min_deposit_charge`
FROM `wizzard_deposits` AS e
GROUP BY e.`deposit_group`, e.`magic_wand_creator`
ORDER BY e.`magic_wand_creator`, e.`deposit_group`;

SELECT 
CASE 
WHEN w.`age`>=0 AND w.`age`<=10 THEN '[0-10]'
WHEN w.`age` >= 11 AND age < 21 THEN '[11-20]'
WHEN w.`age` >= 21 AND age < 31 THEN '[21-30]'
WHEN w.`age` >= 31 AND age < 41 THEN '[31-40]'
WHEN w.`age` >= 41 AND age < 51 THEN '[41-50]'
WHEN w.`age` >= 51 AND age < 61 THEN '[51-60]'
WHEN w.`age` >= 61 THEN '[61+]'
END AS `age_group`,count(w.`age`) AS `wizard_count`
FROM `wizzard_deposits` AS w
GROUP BY `age_group`
ORDER BY `age_group`;
SELECT substr(w.`first_name`,1,1) AS `first_letter`
FROM `wizzard_deposits` AS w
WHERE w.`deposit_group`='Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;

SELECT w.`deposit_group`,w.`is_deposit_expired`, AVG(w.`deposit_interest`) AS `average_interest`
FROM `wizzard_deposits` AS w
WHERE DATE(w.`deposit_start_date`) < STR_TO_DATE('01-01-1985','%m-%d-%y')
GROUP BY w.`deposit_group`,`is_deposit_expired`
ORDER BY w.`deposit_group` DESC , w.`is_deposit_expired`;
