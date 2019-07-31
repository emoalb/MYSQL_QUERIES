CREATE SCHEMA `exam`;
USE `exam`;
CREATE TABLE `branches`(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE `employees`(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
started_on DATE NOT NULL,
branch_id INT NOT NULL,
CONSTRAINT fk_employee_branch
FOREIGN KEY (branch_id) REFERENCES branches(id)
);
CREATE TABLE `clients`(
id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(50) NOT NULL UNIQUE,
age INT NOT NULL
);
CREATE TABLE `employees_clients` (
employee_id INT,
client_id INT,
CONSTRAINT fk_employeesClients_employees 
FOREIGN KEY (employee_id) REFERENCES employees(id),
CONSTRAINT fk_employeeClient_client
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE `bank_accounts`(
id INT PRIMARY KEY AUTO_INCREMENT,
account_number VARCHAR(10) NOT NULL,
balance DECIMAL(10,2) NOT NULL,
client_id INT NOT NULL UNIQUE,
CONSTRAINT fk_bankAccount_client
FOREIGN KEY(client_id) REFERENCES clients(id)
);

CREATE TABLE `cards` (
 id INT PRIMARY KEY AUTO_INCREMENT,
 card_number VARCHAR(19) NOT NULL,
 card_status VARCHAR(7) NOT NULL,
 bank_account_id INT NOT NULL,
 CONSTRAINT fk_card_bankAccount 
 FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
 );
 
 