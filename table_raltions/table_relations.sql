USE `book_library`;
CREATE TABLE `passports` (
`passport_id` INT PRIMARY KEY,
`passport_number` VARCHAR(8) UNIQUE NOT NULL
);
CREATE TABLE `persons` (
`person_id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(64) NOT NULL,
`salary` DECIMAL(10,2) NOT NULL,
`passport_id` INT NOT NULL UNIQUE,
CONSTRAINT fk_person_passport
FOREIGN KEY (passport_id) REFERENCES passports(passport_id)
);
INSERT INTO passports VALUES (101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

INSERT INTO persons(`first_name`,`salary`,`passport_id`)
VALUES ('Roberto','43300.00',102),
('Tom','56100.00',103),
('Yana','60200.00',101);

CREATE TABLE `teachers`(
teacher_id INT PRIMARY KEY NOT NULL,
name VARCHAR(20) NOT NULL,
manager_id INT
);
INSERT INTO `teachers` VALUES (101,'John',null),
(102,'Maya',106),
(103,'Silvia',106),
(104,'Ted',105),
(105,'Mark',101),
(106,'Greta',101);
ALTER TABLE `teachers`
ADD CONSTRAINT fk_manager_teacher
FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id);


USE `book_library`;
CREATE TABLE manufacturers(
manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
established_on DATE NOT NULL
);


CREATE TABLE models(
model_id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
manufacturer_id INT NOT NULL,
CONSTRAINT fk_model_manufacturer
FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);


INSERT INTO `manufacturers`(name,established_on) VALUES ('BMW',STR_TO_DATE('01/03/1916','%d/%m/%Y')),
 ('Tesla',STR_TO_DATE('01/01/2003','%d/%m/%Y')),
 ('Lada',STR_TO_DATE('01/05/1966','%d/%m/%Y'));
 
 INSERT INTO `models` VALUES 
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);

CREATE SCHEMA `students`;
USE `students`;

CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL
);
CREATE TABLE exams(
exam_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL
);

CREATE TABLE students_exams (
student_id INT NOT NULL,
exam_id INT NOT NULL,
CONSTRAINT pk_students_exams
PRIMARY KEY (student_id,exam_id),
CONSTRAINT fk_students_exams_students
FOREIGN KEY (student_id) REFERENCES students(student_id),
CONSTRAINT fk_students_exams_exams
FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);
INSERT INTO `students`(name) VALUES ('Mila'),
('Toni'),
('Ron');

INSERT INTO `exams` VALUES (101,'Spring MVC'),
(102,'Neo4j'),
(103,'Oracle 11g'); 
 
 INSERT INTO `students_exams` VALUES (1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103); 

USE `geography`;
SELECT mountains.`mountain_range`,  peaks.`peak_name`, peaks.`elevation` AS `peak_elevation`
FROM peaks
INNER JOIN mountains ON peaks.`mountain_id`=mountains.`id`
WHERE mountains.`mountain_range`='Rila'
ORDER BY `peak_elevation` DESC;
