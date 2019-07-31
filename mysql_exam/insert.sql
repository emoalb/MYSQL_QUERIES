/*2*/
ALTER TABLE `cards` MODIFY card_number VARCHAR(50);
INSERT INTO `cards` (card_number,card_status,bank_account_id) SELECT REVERSE(c.`full_name`),'Active',c.`id`
FROM `clients` AS c
LEFT JOIN bank_accounts as ba ON ba.client_id=c.id
LEFT JOIN cards as ca ON ca.bank_account_id= ba.id
WHERE c.`id`>=191 AND c.`id`<=200
GROUP BY c.`id`;
/*3*/
UPDATE `employees_clients`
 INNER JOIN
(
SELECT e.`employee_id`, COUNT(e.`client_id`) AS cnt
FROM employees_clients AS e
GROUP BY e.`employee_id`
ORDER BY cnt ASC,e.`employee_id` ASC
) AS test ON employees_clients.`employee_id`  = employees_clients.`client_id`
SET employees_clients.`employee_id`  = test.`employee_id`;

/*4*/

DELETE e  FROM `employees` AS e
LEFT JOIN `employees_clients` AS ec ON ec.employee_id = e.id
WHERE ec.`employee_id` IS NULL;

/*5*/

SELECT c.`id`, c.`full_name` FROM 
`clients` as c
ORDER BY c.`id`;

/*6*/

SELECT e.`id` , CONCAT(e.`first_name`,' ',e.`last_name`)AS 'full_name', CONCAT('$',e.`salary`) AS 'salary', e.`started_on`
FROM `employees` AS e
WHERE e.`salary`>=100000 AND DATE(e.`started_on`)>STR_TO_DATE('01-01-2018','%d-%m-%Y') 
ORDER BY e.`salary` DESC , e.`id`;

/*7*/
SELECT c.`id`, CONCAT(c.`card_number`,' : ',cl.`full_name`) AS 'card_token'
FROM `bank_accounts` AS ba
INNER JOIN cards AS c  ON ba.`id`=c.`bank_account_id`
INNER JOIN clients AS cl ON ba.`client_id` =cl.`id`
 ORDER BY c.`id` DESC;
 
 /*8*/
 
 SELECT CONCAT(e.`first_name`,' ',e.`last_name`)AS 'name', e.`started_on` , COUNT(ec.`client_id`) AS 'count_of_clients'
 FROM `employees_clients` AS ec
 INNER JOIN `employees` AS e  ON e.`id` = ec.`employee_id`
 GROUP BY ec.`employee_id`
 ORDER BY `count_of_clients` DESC, e.`id` ASC LIMIT 5;
 
/*9*/
 SELECT b.`name`, COUNT(c.`id`) AS 'count_of_cards'
 FROM `employees` AS e
 LEFT JOIN  `employees_clients` AS emp_cl ON emp_cl.`employee_id` = e.`id`
	RIGHT JOIN `branches` AS b ON e.`branch_id` = b.`id`
	LEFT JOIN `clients` AS cl ON emp_cl.`client_id` = cl.`id`
	LEFT JOIN `bank_accounts` AS ba ON cl.`id` = ba.`client_id`
	LEFT JOIN `cards` AS c ON c.`bank_account_id` = ba.`id`
 GROUP BY b.`name`
 ORDER BY `count_of_cards` DESC, b.`name`;
 
 /*10*/
 DELIMITER $$
 
 CREATE FUNCTION udf_client_cards_count(name VARCHAR(30))
 RETURNS int
 BEGIN
 DECLARE cnt INT;
 SET cnt :=(
 SELECT COUNT(c.`id`) FROM `bank_accounts` AS ba
 INNER JOIN `cards` AS c ON ba.`id`=c.`bank_account_id`
 INNER JOIN `clients` AS cl ON ba.`client_id`=cl.`id`
 WHERE cl.`full_name`=name
 GROUP BY cl.`full_name`
 );
 RETURN cnt;
 END $$

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';
/*11*/

 DELIMITER $$
 
CREATE PROCEDURE udp_clientinfo(full_name VARCHAR(50))
BEGIN
SELECT c.`full_name`, c.`age`, ba.`account_number`, CONCAT('$',ba.`balance`) AS 'balance' FROM
`bank_accounts` AS ba
INNER JOIN `clients` AS c ON ba.`client_id`=c.`id`
WHERE c.`full_name`  = full_name;
END $$

CALL udp_clientinfo('Hunter Wesgate');
