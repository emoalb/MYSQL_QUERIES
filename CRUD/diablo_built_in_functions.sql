USE `diablo`;
SELECT `name`, DATE_FORMAT(`start`,'%Y-%m-%d') AS `start` FROM `games`
WHERE (`start` BETWEEN '2010/12/31' and '2013/01/01')
ORDER BY `start`,`name`
LIMIT 50;

SELECT `user_name`, SUBSTR(`email`,LOCATE('@',`email`)+1)  `Email Provider` 
FROM `users`
ORDER BY `Email Provider`,`user_name`;

SELECT `user_name`,`ip_address` FROM `users`
WHERE `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name`;

SELECT `name` AS 'game',
CASE 
WHEN HOUR(`start`) >=0 AND HOUR (`start`)<12 THEN 'Morning'
WHEN HOUR (`start`) >=12 AND HOUR (`start`)<18 THEN 'Afternoon'
WHEN HOUR(`start`)>=18 AND HOUR (`start`)<24 THEN 'Evening'
END AS `Part of the Day`,
CASE
WHEN `duration` BETWEEN  0 AND 3 THEN 'Extra Short'
WHEN `duration` BETWEEN 3 AND 6 THEN 'Short'
WHEN `duration` BETWEEN 6 AND 10 THEN 'Long'
ELSE 'Extra Long'
END AS `Duration`
FROM `games`;