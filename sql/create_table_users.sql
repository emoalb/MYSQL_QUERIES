CREATE TABLE `users`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture BLOB ,
last_login_time TIMESTAMP,
is_deleted BOOLEAN
);

INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (1,'Kevin','90890','C:\1.jpg','2008-11-11 23:20:00',false);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (2,'tyfy','6890','C:\1.jpg','2008-11-11 23:40:00',true);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (3,'fytf','900','C:\1.jpg','2008-11-11 23:45:00',true);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (4,'xfdn','907','C:\1.jpg','2008-11-11 23:47:00',false);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (6,'Kxfxdfn','957','C:\1.jpg','2008-11-11 23:44:00',true);

ALTER TABLE `users` 
CHANGE COLUMN `last_login_time` `last_login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;