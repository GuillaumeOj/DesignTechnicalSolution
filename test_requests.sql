--
-- Select orders from a customer
--
SELECT
    customer.email,
    customer_order.order_date,
    status.name
FROM customer_order
JOIN customer ON customer.id = customer_order.customer_id
JOIN status ON status.id = customer_order.status_id
WHERE 
    customer_id = 
        (
            SELECT id
            FROM customer
            WHERE email = 'eugene.auger@berthelot.fr'
        );

--
-- Select order's lines from a specific order
--
SELECT * FROM order_line
WHERE
    order_id =
        (
            SELECT id FROM customer_order
            WHERE 
                customer_id = 
                    (
                        SELECT id
                        FROM customer
                        WHERE email = 'eugene.auger@berthelot.fr'
                    )
            LIMIT 1
        );
--
-- Select the content for a specific order
--
SELECT
    customer.email,
    customer_order.order_date,
    pizza.name,
    order_line.quantity,
    (order_line.tax_free_unit_price * order_line.vat_rate_100 + order_line.tax_free_unit_price) AS unit_price,
    (order_line.quantity * (order_line.tax_free_unit_price * order_line.vat_rate_100 + order_line.tax_free_unit_price)) AS total_price,
    status.name AS status_name
FROM order_line
JOIN pizza ON pizza.id = order_line.pizza_id
JOIN customer_order ON customer_order.id = order_line.order_id
JOIN customer ON customer.id = customer_order.customer_id
JOIN status ON status.id = customer_order.status_id
WHERE
    order_id =
        (
            SELECT id FROM customer_order
            WHERE 
                customer_id = 
                    (
                        SELECT id
                        FROM customer
                        WHERE email = 'eugene.auger@berthelot.fr'
                    )
            LIMIT 1
        );
--
-- Select the orders from a restaurant where status is 'pending'
--
SELECT
    customer.email,
    customer_order.order_date,
    status.name
FROM customer_order
JOIN customer ON customer.id = customer_order.customer_id
JOIN status ON status.id = customer_order.status_id
JOIN restaurant ON restaurant.id = customer_order.restaurant_id
WHERE
    restaurant.name = 'Faure' AND
    status.name = 'attente';
--
-- Select the delivery address for an order even if the customer have change her·his own
--
SELECT
    customer.email,
    CONCAT(
        customer.address_street_number,
        ' ',
        customer.address_street_name,
        ' ',
        customer.address_postal_code,
        ' ',
        customer.address_city) AS customer_current_address,
    customer_order.order_date,
    CONCAT(
        customer_order.address_street_number,
        ' ',
        customer_order.address_street_name,
        ' ',
        customer_order.address_postal_code,
        ' ',
        customer_order.address_city) AS delivery_address,
    status.name
FROM customer_order
JOIN customer ON customer.id = customer_order.customer_id
JOIN status ON status.id = customer_order.status_id
WHERE
    customer.email = 'emmanuelle.gros@arnaud.fr' AND
    customer.address_street_name != customer_order.address_street_name;
--
-- Select recipe for each pizza
--
SELECT
    ingredient.name AS 'Ingrendient name',
    COUNT(pizza_ingredient.quantity),
    ingredient.unit
FROM pizza
LEFT JOIN pizza_ingredient ON pizza_ingredient.pizza_id = pizza.id
LEFT JOIN ingredient ON ingredient.id = pizza_ingredient.ingredient_id
GROUP BY ingredient.name
ORDER BY ingredient.name;
--
-- Select all pending orders
--
SELECT
    restaurant.name AS restaurant_name,
    pizza.name AS pizza_name,
    COUNT(order_line.quantity) AS pizza_quantity
FROM order_line
JOIN customer_order ON customer_order.id = order_line.order_id
JOIN restaurant ON restaurant.id = customer_order.restaurant_id
JOIN status ON status.id = customer_order.status_id
JOIN pizza ON pizza.id = order_line.pizza_id
WHERE status.name = 'attente'
GROUP BY restaurant.name, pizza.name
ORDER BY restaurant.name, pizza.name;

