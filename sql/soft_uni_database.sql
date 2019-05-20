CREATE SCHEMA soft_uni;
Use soft_uni;
CREATE TABLE `towns` (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
CONSTRAINT pk_towns PRIMARY KEY (id)
);
CREATE TABLE `addresses` (
id INT NOT NULL AUTO_INCREMENT,
address_text VARCHAR(100),
town_id INT,
CONSTRAINT pk_adresses PRIMARY KEY(id),
CONSTRAINT fk_adresses_towns FOREIGN KEY (town_id) REFERENCES towns(id)
);
CREATE TABLE `departments` (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
CONSTRAINT pk_departments_id PRIMARY KEY (id)
);
CREATE TABLE `employees` (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
middle_name VARCHAR(50),
last_name VARCHAR(50),
job_title VARCHAR(20),
department_id INT,
hire_date DATETIME,
salary DOUBLE(12,4),
address_id INT,
CONSTRAINT pk_employees PRIMARY KEY (id),
CONSTRAINT fk_employees_departments FOREIGN KEY (department_id) REFERENCES departments(id),
CONSTRAINT fk_employees_adresses FOREIGN KEY (address_id) REFERENCES addresses(id)
);
INSERT INTO towns (name) VALUES('Sofia');
INSERT INTO towns (name) VALUES('Plovdiv');
INSERT INTO towns (name) VALUES('Varna');
INSERT INTO towns (name) VALUES('Burgas');

INSERT INTO departments (name) VALUES('Engineering');
INSERT INTO departments (name) VALUES('Sales');
INSERT INTO departments (name) VALUES('Marketing');
INSERT INTO departments (name) VALUES('Software Development');
INSERT INTO departments (name) VALUES('Quality Assurance');

INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES ('Ivan','Ivanov', 'Ivanov', '.NET Developer', 'Software Development', '01/02/2013',3500.00);
INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES ('Petar','Petrov', 'Petrov', 'Senior Engineer', 'Engineering', '02/03/2004',4000.00);
INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES ('Maria','Petrova', 'Ivanova', 'Intern', 'Quality Assurance', '28/08/2016',525.25);
INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES ('Georgi','Terziev', 'Ivanov', 'CEO', 'Sales', '09/12/2007',3000.00);
INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES ('Peter','Pan', 'Pan', 'Marketing', 'Quality Assurance', '28/08/2016',599.88);