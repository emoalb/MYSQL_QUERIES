USE `minions`;
CREATE TABLE `people`(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture BLOB ,
height FLOAT(65,2),
weight FLOAT(65,2),
gender ENUM('m','f') NOT NULL, 
birthdate VARCHAR(40) NOT NULL,
biography VARCHAR(255)
);

INSERT INTO `people` (id,name,picture,height,weight,gender,birthdate,biography) VALUES (1,'Kevin','C:\1.jpg',22.2,100.3,'m','10-6-1988','blab blab bla');
INSERT INTO `people` (id,name,picture,height,weight,gender,birthdate,biography) VALUES (2,'KOKO','C:\1.jpg',21.2,72.36,'m','11-6-1998','fydrtdf');
INSERT INTO `people` (id,name,picture,height,weight,gender,birthdate,biography) VALUES (3,'Kfds','C:\1.jpg',21.2,78.36,'f','11-6-1989','fdrtdftyf');
INSERT INTO `people` (id,name,picture,height,weight,gender,birthdate,biography) VALUES (4,'KOsfdsO','C:\1.jpg',21.62,73.36,'f','11-6-1999','fydtrdtyf');
INSERT INTO `people` (id,name,picture,height,weight,gender,birthdate) VALUES (5,'KOsfdssO','C:\1.jpg',21.52,79.36,'m','11-6-1981');