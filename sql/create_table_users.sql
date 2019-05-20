CREATE TABLE `users`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture BLOB ,
last_login_time VARCHAR(45),
is_deleted BOOLEAN
);

INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (1,'Kevin','90890','C:\1.jpg','23:20',false);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (2,'tyfy','6890','C:\1.jpg','23:40',true);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (3,'fytf','900','C:\1.jpg','23:45',true);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (4,'xfdn','907','C:\1.jpg','23:47',false);
INSERT INTO `users` (id,username,password,profile_picture,last_login_time,is_deleted ) VALUES (6,'Kxfxdfn','957','C:\1.jpg','23:44',true);