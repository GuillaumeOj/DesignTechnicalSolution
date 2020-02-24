--
-- Select orders from a customer
--
SELECT * FROM customer_order
WHERE 
    customer_id = 
        (
            SELECT id
            FROM customer
            WHERE email = 'stephanie.ledoux@bonnet.net'
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
                        WHERE email = 'laurence.ferrand@blanc.fr'
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
                        WHERE email = 'laurence.ferrand@blanc.fr'
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
    restaurant.name = 'Levy SARL' AND
    status.name = 'attente';
