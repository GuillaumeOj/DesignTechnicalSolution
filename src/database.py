"""
    This module manage all operations with the database
"""
import mysql.connector
from mysql.connector import errorcode


class Database:
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
            This method connect the application to the database
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
            This method select the database
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
            This method read an sql file and execute each commands
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

    def check_database(self):
        """
            This method check if there is something in the database
        """
        try:
            query = 'SELECT * FROM Products LIMIT 1'
            self.cursor.execute(query)
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_NO_SUCH_TABLE:
                message = f'La base de données ne contient aucune table.'
                message = f'{message} Merci de lancer le script avec l\'option --init.\n{err}'
                raise Exception(message)
            raise err

        return self.cursor.fetchone()

    def insert_in_database(self, query, values):
        """
            This method insert data in the database
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
            This method select data in the database
        """
        try:
            self.cursor.execute(query, values)
        except mysql.connector.Error as err:
            raise err

        return self.cursor

    def insert_products(self, products):
        """
            Insert a product in the database
        """
        print('\nInsertion des produits...')
        query = ("""INSERT IGNORE INTO Products
                    (code, name, common_name, quantity, ingredients_text, nutriscore_grade, url)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)
                 """)
        values = [(product.code,
                   product.name,
                   product.common_name,
                   product.quantity,
                   product.ingredients_text,
                   product.nutriscore_grade,
                   product.url) for product in products]
        self.insert_in_database(query, values)

        print('Insertion des catégories...')
        # Insert categories
        query = ("INSERT IGNORE INTO Categories (name) VALUES (%s)")
        values = [(category,) for product in products for category in product.categories]
        self.insert_in_database(query, values)

        print('Insertion des marques...')
        # Insert brands
        query = ("INSERT IGNORE INTO Brands (name) VALUES (%s)")
        values = [(brand,) for product in products for brand in product.brands]
        self.insert_in_database(query, values)

        print('Insertion des magasins...')
        # Insert stores
        query = ("INSERT IGNORE INTO Stores (name) VALUES (%s)")
        values = [(store,) for product in products for store in product.stores]
        self.insert_in_database(query, values)

        print('Association des produits et des catégories...')
        # Insert products categories
        query = ("""INSERT IGNORE INTO Products_categories (product_id, category_id)
                    VALUES (
                        (SELECT id FROM Products WHERE code=%s),
                        (SELECT id FROM Categories WHERE name=%s)
                    )
                 """)
        values = [(product.code,
                   category) for product in products for category in product.categories]
        self.insert_in_database(query, values)

        print('Association des produits et des marques...')
        # Insert products brands
        query = ("""INSERT IGNORE INTO Products_brands (product_id, brand_id)
                    VALUES (
                        (SELECT id FROM Products WHERE code=%s),
                        (SELECT id FROM Brands WHERE name=%s)
                    )
                 """)
        values = [(product.code, brand) for product in products for brand in product.brands]
        self.insert_in_database(query, values)

        print('Association des produits et des magasins...')
        # Insert products stores
        query = ("""INSERT IGNORE INTO Products_stores (product_id, store_id)
                    VALUES (
                        (SELECT id FROM Products WHERE code=%s),
                        (SELECT id FROM Stores WHERE name=%s)
                    )
                 """)
        values = [(product.code, store) for product in products for store in product.stores]
        self.insert_in_database(query, values)

    def close_database(self):
        """
            Method for closing the connection with the database
        """
        self.cursor.close()
        self.connection.close()


if __name__ == '__main__':
    print('Please don\'t load me alone...')
