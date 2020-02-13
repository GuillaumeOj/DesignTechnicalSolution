-- -----------------------------------------------------
-- DELETE IF EXIST AND CREATE THE OCPIZZA DATABASE
-- -----------------------------------------------------
DROP DATABASE IF EXISTS ocpizza;
CREATE DATABASE ocpizza CHARACTER SET 'utf8mb4';
USE ocpizza;

-- -----------------------------------------------------
-- DOWN HERE ALL REQUESTS ARE CREATED BY SQL ARCHITECT
-- IT'S BASED ON THE ENTITY RELATIONSHIP DIAGRAM
-- -----------------------------------------------------

CREATE TABLE payment_status (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE vat_rate (
                id INT AUTO_INCREMENT NOT NULL,
                vat_rate_100 DECIMAL(6,4) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX vat_rate_100
 ON vat_rate
 ( vat_rate_100 );

CREATE TABLE size (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                ingredient_factor INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE category (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                parent_category VARCHAR(50),
                PRIMARY KEY (id)
);


CREATE TABLE payment (
                id INT AUTO_INCREMENT NOT NULL,
                type VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE status (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE ingredient (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                unit VARCHAR(2) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE pizza (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                tax_free_unit_price DECIMAL(10,2) NOT NULL,
                category_id INT NOT NULL,
                vat_rate_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE pizza_ingredient (
                ingredient_id INT NOT NULL,
                pizza_id INT NOT NULL,
                quantity DECIMAL(10,2) NOT NULL,
                PRIMARY KEY (ingredient_id, pizza_id)
);


CREATE TABLE pizzeria (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                address_street_number VARCHAR(10) NOT NULL,
                address_street_name VARCHAR(200) NOT NULL,
                address_city VARCHAR(100) NOT NULL,
                address_postal_code VARCHAR(6) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE stock (
                pizzeria_id INT NOT NULL,
                ingredient_id INT NOT NULL,
                quantity DECIMAL(10,2) NOT NULL,
                PRIMARY KEY (pizzeria_id, ingredient_id)
);


CREATE TABLE employee (
                id INT AUTO_INCREMENT NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                password CHAR(64) NOT NULL,
                pizzeria_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE customer (
                id INT AUTO_INCREMENT NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                email VARCHAR(200) NOT NULL,
                password CHAR(64) NOT NULL,
                address_street_number VARCHAR(10),
                address_street_name VARCHAR(200),
                address_city VARCHAR(100),
                address_postal_code VARCHAR(6),
                address_additional_details VARCHAR(200),
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX customer_email
 ON customer
 ( email );

CREATE TABLE customer_order (
                id INT AUTO_INCREMENT NOT NULL,
                order_date DATETIME NOT NULL,
                address_street_number VARCHAR(10) NOT NULL,
                address_street_name VARCHAR(200) NOT NULL,
                address_city VARCHAR(100) NOT NULL,
                address_postal_code VARCHAR(6) NOT NULL,
                address_additional_details VARCHAR(200),
                customer_id INT NOT NULL,
                status_id INT NOT NULL,
                payment_id INT NOT NULL,
                pizzeria_id INT NOT NULL,
                payment_status_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE status_history (
                id INT NOT NULL,
                status_date DATETIME NOT NULL,
                status_id INT NOT NULL,
                customer_order_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE order_line (
                order_id INT NOT NULL,
                id INT NOT NULL,
                size_id INT NOT NULL,
                quantity INT NOT NULL,
                PRIMARY KEY (order_id, id, size_id)
);


ALTER TABLE customer_order ADD CONSTRAINT payment_status_customer_order_fk
FOREIGN KEY (payment_status_id)
REFERENCES payment_status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pizza ADD CONSTRAINT vat_rate_pizza_fk
FOREIGN KEY (vat_rate_id)
REFERENCES vat_rate (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE order_line ADD CONSTRAINT size_order_line_fk
FOREIGN KEY (size_id)
REFERENCES size (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pizza ADD CONSTRAINT category_pizza_fk
FOREIGN KEY (category_id)
REFERENCES category (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT payment_order_fk
FOREIGN KEY (payment_id)
REFERENCES payment (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT status_order_fk1
FOREIGN KEY (status_id)
REFERENCES status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE status_history ADD CONSTRAINT status_status_history_fk
FOREIGN KEY (status_id)
REFERENCES status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pizza_ingredient ADD CONSTRAINT ingredient_pizza_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pizza_ingredient ADD CONSTRAINT pizza_pizza_ingredient_fk
FOREIGN KEY (pizza_id)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE order_line ADD CONSTRAINT pizza_order_line_fk
FOREIGN KEY (id)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT pizzeria_order_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employee ADD CONSTRAINT pizzeria_employee_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT customer_order_fk
FOREIGN KEY (customer_id)
REFERENCES customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE order_line ADD CONSTRAINT order_order_line_fk
FOREIGN KEY (order_id)
REFERENCES customer_order (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE status_history ADD CONSTRAINT customer_order_status_history_fk
FOREIGN KEY (customer_order_id)
REFERENCES customer_order (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;