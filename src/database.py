"""
    This module manage all operations with the database
"""
import mysql.connector
from mysql.connector import errorcode


class Database: # pylint: disable=too-many-public-methods
    """
        This class manage differents operations with the database like:
            - connection
            - select a database
            - read an init file
            - check if the database is not empty
            - insert data
            - remove data
            - select data
    """

    def __init__(self, db_name, user, host, password):
        self.db_name = db_name
        self.user = user
        self.host = host
        self.password = password
        self.connection = False
        self.cursor = False

    def connect_database(self):
        """
            Connect the application to the database
        """
        try:
            self.connection = mysql.connector.connect(
                user=self.user,
                host=self.host,
                password=self.password)
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                message = f'Les informations de connexion sont eronnées.'
                message = f'{message} Merci de vérifier "settings.py"'
                message = f'{message} ou de suivre les instructions du Readme.md.\n{err}'
                raise Exception(message)
            raise err

        self.cursor = self.connection.cursor(buffered=True)

    def select_database(self):
        """
            Select the database
        """
        try:
            self.connection.database = self.db_name
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_BAD_DB_ERROR:
                message = f'La base de données n\'existe pas.'
                message = f'{message} Merci de vérifier "settings.py"'
                message = f'{message} ou de suivre les instructions de démarrage.\n{err}'
                raise Exception(message)
            raise err

    def read_sql_file(self, sql_file):
        """
            Read an sql file and execute each commands
        """
        with open(sql_file, 'r') as file:
            # Read all the file as a string
            sql_commands = file.read()

            # Split the file in a list by using ';' as a separator for each SQL command
            sql_commands = sql_commands.split(';')

        # Eaxecute each command
        for command in sql_commands:
            command = command.strip('\n')
            self.cursor.execute(command)

    def insert_in_database(self, query, values):
        """
            Insert data in the database
        """
        try:
            if isinstance(values, tuple):
                self.cursor.execute(query, values)
            else:
                self.cursor.executemany(query, values)
            self.connection.commit()
        except mysql.connector.Error as err:
            raise err

    def select_in_database(self, query, values=None):
        """
            Select data in the database
        """
        try:
            self.cursor.execute(query, values)
        except mysql.connector.Error as err:
            raise err

        return self.cursor

    def insert_customers(self, customers):
        """
            Insert customers in the database
        """
        print('==> Insert customers in the database')
        query = ("""INSERT INTO customer
                        (
                            first_name,
                            last_name,
                            email,
                            phone_number,
                            password,
                            address_street_number,
                            address_street_name,
                            address_city,
                            address_postal_code,
                            address_additional_details
                        )
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                 """)
        values = [(customer.first_name,
                   customer.last_name,
                   customer.email,
                   customer.phone_number,
                   customer.password.hashed_password,
                   customer.address.street_number,
                   customer.address.street_name,
                   customer.address.city,
                   customer.address.postal_code,
                   customer.address.additional_details) for customer in customers]
        self.insert_in_database(query, values)

    def insert_restaurants(self, restaurants):
        """
            Insert restaurants in the database
        """
        print('==> Insert restaurants in the database')
        query = ("""INSERT INTO restaurant
                        (
                            name,
                            phone_number,
                            address_street_number,
                            address_street_name,
                            address_city,
                            address_postal_code
                        )
                    VALUES (%s, %s, %s, %s, %s, %s)
                 """)
        values = [(restaurant.name,
                   restaurant.phone_number,
                   restaurant.address.street_number,
                   restaurant.address.street_name,
                   restaurant.address.city,
                   restaurant.address.postal_code) for restaurant in restaurants]
        self.insert_in_database(query, values)

    def insert_roles(self, roles):
        """
            Insert roles in the database
        """
        print('==> Insert roles in the database')
        query = ('INSERT INTO roles (name) VALUES %s')

        values = [(role.name, ) for role in roles]
        self.insert_in_database(query, values)

    def insert_employees(self, employees):
        """
            Insert employees in the database
        """
        print('==> Insert employees in the database')
        query = ("""INSERT IGNORE INTO employee
                        (
                            first_name,
                            last_name,
                            email,
                            password,
                            pizzeria_id
                        )
                    VALUES
                        (
                            %s,
                            %s,
                            %s,
                            %s,                        
                            (
                                SELECT id
                                FROM pizzeria
                                WHERE name = %s
                            )
                        )
                 """)
        values = [(employee.first_name,
                   employee.last_name,
                   employee.email,
                   employee.password.hashed_password,
                   employee.shop.name) for employee in employees]
        self.insert_in_database(query, values)

    def insert_ingredients(self, ingredients):
        """
            Insert ingredients in the database
        """
        print('==> Insert ingredients in the database')
        query = ("""INSERT IGNORE INTO ingredient
                    (name, unit)
                    VALUES (%s, %s)
                 """)
        values = [(ingredient.name,
                   ingredient.unit) for ingredient in ingredients]
        self.insert_in_database(query, values)

    def insert_sizes(self, sizes):
        """
            Insert sizes in the database
        """
        print('==> Insert sizes in the database')
        query = ("""INSERT IGNORE INTO size
                    (name, ingredient_factor)
                    VALUES (%s, %s)
                 """)
        values = [(size.name,
                   size.ingredient_factor) for size in sizes]
        self.insert_in_database(query, values)

    def insert_categories(self, categories):
        """
            Insert categories in the database
        """
        print('==> Insert categories in the database')
        # First insert all categories
        query = ('INSERT INTO category (name) VALUES (%s)')
        values = [(category.name, ) for category in categories]
        self.insert_in_database(query, values)

        # The update each category with the potential parent id
        query = ("""
                    UPDATE category AS child
                    SET child.parent_category_id = 
                        (
                            SELECT id
                            FROM (SELECT id, name FROM category) AS parent_category
                            WHERE parent_category.name = %s
                        )
                    WHERE child.name = %s
                 """)
        values = [(category.parent_category.name, category.name)
                  for category in categories if category.parent_category]
        self.insert_in_database(query, values)

    def insert_vat_rates(self, vat_rates):
        """
            Insert vat rates in the database
        """
        print('==> Insert vat rates in the database')
        query = ('INSERT IGNORE INTO vat_rate (vat_rate_100) VALUES (%s)')
        values = [(vat_rate, ) for vat_rate in vat_rates]
        self.insert_in_database(query, values)

    def insert_pizzas(self, pizzas):
        """
            Insert pizzas in the database
        """
        print('==> Insert pizzas in the database')
        query = ("""INSERT IGNORE INTO pizza
                    (name, tax_free_unit_price, category_id, vat_rate_id)
                    VALUES
                        (
                            %s,
                            %s,
                            (
                                SELECT id
                                FROM category
                                WHERE name = %s
                            ),
                            (
                                SELECT id
                                FROM vat_rate
                                WHERE vat_rate_100 = %s
                            )
                        )
                 """)
        values = [(pizza.name,
                   pizza.tax_free_unit_price,
                   pizza.category.name,
                   pizza.vat_rate) for pizza in pizzas]
        self.insert_in_database(query, values)

    def insert_stock(self, stock):
        """
            Insert stock in the database
        """
        print('==> Insert stock in the database')
        query = ("""INSERT INTO stock
                    (pizzeria_id, ingredient_id, quantity)
                    VALUES
                        (
                            (
                                SELECT id
                                FROM pizzeria
                                WHERE name = %s
                            ),
                            (
                                SELECT id
                                FROM ingredient
                                WHERE name = %s
                            ),
                            %s
                        )
                 """)
        values = [(stock_line.shop.name,
                   stock_line.ingredient.name,
                   stock_line.quantity) for stock_line in stock]
        self.insert_in_database(query, values)

    def insert_recipes(self, recipes):
        """
            Insert recipes in the database
        """
        print('==> Insert recipes in the database')
        query = ("""INSERT INTO pizza_ingredient
                    (pizza_id, ingredient_id, quantity)
                    VALUES
                        (
                            (
                                SELECT id
                                FROM pizza
                                WHERE name = %s
                            ),
                            (
                                SELECT id
                                FROM ingredient
                                WHERE name = %s
                            ),
                            %s
                        )
                 """)
        values = [(recipe.pizza.name,
                   recipe.ingredient.name,
                   recipe.quantity) for recipe in recipes]
        self.insert_in_database(query, values)

    def insert_statutes(self, statutes):
        """
            Insert statutes in the database
        """
        print('==> Insert statutes in the database')
        query = ('INSERT INTO status (name) VALUES (%s)')
        values = [(status.name, ) for status in statutes]
        self.insert_in_database(query, values)

    def insert_payments(self, payments):
        """
            Insert statutes in the database
        """
        print('==> Insert payments types in the database')
        query = ('INSERT INTO payment (type) VALUES (%s)')
        values = [(payment.type, ) for payment in payments]
        self.insert_in_database(query, values)

    def insert_payments_statutes(self, payments_statutes):
        """
            Insert payments statutes in the database
        """
        print('==> Insert payments statutes in the database')
        query = ('INSERT INTO payment_status (name) VALUES (%s)')
        values = [(payment_status.name, ) for payment_status in payments_statutes]
        self.insert_in_database(query, values)

    def insert_orders(self, orders):
        """
            Insert orders in the database
        """
        print('==> Insert orders in the database')
        query = ("""INSERT INTO customer_order
                    (
                        order_date,
                        address_street_number,
                        address_street_name,
                        address_city,
                        address_postal_code,
                        address_additional_details,
                        customer_id,
                        status_id,
                        payment_id,
                        pizzeria_id,
                        payment_status_id
                    )
                    VALUES
                    (
                        %s,
                        %s,
                        %s,
                        %s,
                        %s,
                        %s,
                        (
                            SELECT id
                            FROM customer
                            WHERE email = %s
                        ),
                        (
                            SELECT id
                            FROM status
                            WHERE name = %s
                        ),
                        (
                            SELECT id
                            FROM payment
                            WHERE type = %s
                        ),
                        (
                            SELECT id
                            FROM pizzeria
                            WHERE name = %s
                        ),
                        (
                            SELECT id
                            FROM payment_status
                            WHERE name = %s
                        )
                    )
                 """)

        values = list()
        for order in orders:
            order_address_additional_details = str()
            if order.address.additional_details:
                order_address_additional_details = order.address.additional_details

            values.append((order.date,
                           order.address.street_number,
                           order.address.street_name,
                           order.address.city,
                           order.address.postal_code,
                           order_address_additional_details,
                           order.customer.email,
                           order.status.name,
                           order.payment.type,
                           order.pizzeria.name,
                           order.payment_status.name))

        self.insert_in_database(query, values)

    def insert_orders_lines(self, orders_lines):
        """
            Insert orders lines in the database
        """
        print('==> Insert orders lines in the database')
        query = ("""INSERT INTO order_line
                    (order_id, pizza_id, size_id, quantity)
                    VALUES
                    (
                        (
                            SELECT id
                            FROM customer_order
                            WHERE
                                order_date = %s AND
                                customer_id = (SELECT id FROM customer WHERE email = %s)
                        ),
                        (
                            SELECT id
                            FROM pizza
                            WHERE name = %s
                        ),
                        (
                            SELECT id
                            FROM size
                            WHERE name = %s
                        ),
                        %s
                    )
                 """)

        values = [(order_line.order.date,
                   order_line.order.customer.email,
                   order_line.pizza.name,
                   order_line.size.name,
                   order_line.quantity) for order_line in orders_lines]

        self.insert_in_database(query, values)

    def insert_statutes_history(self, statutes_history):
        """
            Insert the history of statutes in the database
        """
        print('==> Insert the history of statutes in the database')
        query = ("""INSERT INTO status_history
                    (status_date, status_id, customer_order_id)
                    VALUES
                        (
                            %s,
                            (
                                SELECT id
                                FROM status
                                WHERE name = %s
                            ),
                            (
                                SELECT id
                                FROM customer_order
                                WHERE
                                    order_date = %s AND
                                    customer_id = (SELECT id FROM customer WHERE email = %s)
                            )
                        )
                 """)
        values = [(status_history.date,
                   status_history.status.name,
                   status_history.order.date,
                   status_history.order.customer.email) for status_history in statutes_history]
        self.insert_in_database(query, values)

    def close_database(self):
        """
            Method for closing the connection with the database
        """
        self.cursor.close()
        self.connection.close()


if __name__ == '__main__':
    print('Please don\'t load me alone...')
