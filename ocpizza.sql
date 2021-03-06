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

CREATE TABLE role (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(100) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE payment_status (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX payment_status_name
 ON payment_status
 ( name );

CREATE TABLE vat_rate (
                vat_rate_100 DECIMAL(6,4) NOT NULL,
                PRIMARY KEY (vat_rate_100)
);


CREATE UNIQUE INDEX vat_rate_100
 ON vat_rate
 ( vat_rate_100 );

CREATE TABLE size (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                ingredient_factor DECIMAL(2,1) NOT NULL,
                extra_price DECIMAL(10,2) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX size_name
 ON size
 ( name );

CREATE TABLE category (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                parent_category_id INT,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX category_name
 ON category
 ( name );

CREATE TABLE payment (
                id INT AUTO_INCREMENT NOT NULL,
                type VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX payment_type
 ON payment
 ( type );

CREATE TABLE status (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX status_name
 ON status
 ( name );

CREATE TABLE ingredient (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                unit VARCHAR(2) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX ingredient_name
 ON ingredient
 ( name );

CREATE TABLE pizza (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                tax_free_unit_price DECIMAL(10,2) NOT NULL,
                category_id INT NOT NULL,
                vat_rate_100 DECIMAL(6,4) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX pizza_name
 ON pizza
 ( name );

CREATE TABLE recipe (
                ingredient_id INT NOT NULL,
                pizza_id INT NOT NULL,
                quantity DECIMAL(10,2) NOT NULL,
                PRIMARY KEY (ingredient_id, pizza_id)
);


CREATE TABLE restaurant (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(50) NOT NULL,
                phone_number VARCHAR(25) NOT NULL,
                address_street_number VARCHAR(10) NOT NULL,
                address_street_name VARCHAR(200) NOT NULL,
                address_city VARCHAR(100) NOT NULL,
                address_postal_code VARCHAR(6) NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX pizzeria_name
 ON restaurant
 ( name );

CREATE TABLE stock (
                restaurant_id INT NOT NULL,
                ingredient_id INT NOT NULL,
                quantity DECIMAL(10,2) NOT NULL,
                PRIMARY KEY (restaurant_id, ingredient_id)
);


CREATE TABLE employee (
                id INT AUTO_INCREMENT NOT NULL,
                role_id INT NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                email VARCHAR(200) NOT NULL,
                password CHAR(64) NOT NULL,
                restaurant_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE UNIQUE INDEX employee_email
 ON employee
 ( email );

CREATE TABLE customer (
                id INT AUTO_INCREMENT NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                email VARCHAR(200) NOT NULL,
                phone_number VARCHAR(25) NOT NULL,
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
                restaurant_id INT NOT NULL,
                payment_status_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE status_history (
                id INT AUTO_INCREMENT NOT NULL,
                status_date DATETIME NOT NULL,
                status_id INT NOT NULL,
                customer_order_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE order_line (
                order_id INT NOT NULL,
                pizza_id INT NOT NULL,
                size_id INT NOT NULL,
                quantity INT NOT NULL,
                tax_free_unit_price DECIMAL(6,4) NOT NULL,
                vat_rate_100 DECIMAL(6,4) NOT NULL,
                PRIMARY KEY (order_id, pizza_id, size_id)
);


ALTER TABLE employee ADD CONSTRAINT role_employee_fk
FOREIGN KEY (role_id)
REFERENCES role (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT payment_status_customer_order_fk
FOREIGN KEY (payment_status_id)
REFERENCES payment_status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pizza ADD CONSTRAINT vat_rate_pizza_fk
FOREIGN KEY (vat_rate_100)
REFERENCES vat_rate (vat_rate_100)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE order_line ADD CONSTRAINT vat_rate_order_line_fk
FOREIGN KEY (vat_rate_100)
REFERENCES vat_rate (vat_rate_100)
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

ALTER TABLE category ADD CONSTRAINT category_category_fk
FOREIGN KEY (parent_category_id)
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

ALTER TABLE recipe ADD CONSTRAINT ingredient_pizza_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE recipe ADD CONSTRAINT pizza_pizza_ingredient_fk
FOREIGN KEY (pizza_id)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE order_line ADD CONSTRAINT pizza_order_line_fk
FOREIGN KEY (pizza_id)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer_order ADD CONSTRAINT pizzeria_order_fk
FOREIGN KEY (restaurant_id)
REFERENCES restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employee ADD CONSTRAINT pizzeria_employee_fk
FOREIGN KEY (restaurant_id)
REFERENCES restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (restaurant_id)
REFERENCES restaurant (id)
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