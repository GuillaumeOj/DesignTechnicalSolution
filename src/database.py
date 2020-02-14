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
        query = ("""INSERT IGNORE INTO customer
                        (
                            first_name,
                            last_name,
                            email,
                            password,
                            address_street_number,
                            address_street_name,
                            address_city,
                            address_postal_code,
                            address_additional_details
                        )
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                 """)
        values = [(customer.first_name,
                   customer.last_name,
                   customer.email,
                   customer.password.hashed_password,
                   customer.address.street_number,
                   customer.address.street_name,
                   customer.address.city,
                   customer.address.postal_code,
                   customer.address.additional_details) for customer in customers]
        self.insert_in_database(query, values)

    def insert_pizzeria(self, pizzeria):
        """
            Insert pizzeria in the database
        """
        print('==> Insert pizzeria in the database')
        query = ("""INSERT IGNORE INTO pizzeria
                        (
                            name,
                            address_street_number,
                            address_street_name,
                            address_city,
                            address_postal_code
                        )
                    VALUES (%s, %s, %s, %s, %s)
                 """)
        values = [(shop.name,
                   shop.address.street_number,
                   shop.address.street_name,
                   shop.address.city,
                   shop.address.postal_code) for shop in pizzeria]
        self.insert_in_database(query, values)

    def close_database(self):
        """
            Method for closing the connection with the database
        """
        self.cursor.close()
        self.connection.close()


if __name__ == '__main__':
    print('Please don\'t load me alone...')
