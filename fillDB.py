"""
    Module for filling and testing the database
"""
import argparse
import hashlib
import uuid
from random import randrange

import faker

from settings import * # pylint: disable=wildcard-import
from src.database import Database


class App:
    """
        Application for filling and testing the database
    """
    def __init__(self):
        # Add an argument for initialise the database
        parser = argparse.ArgumentParser()
        parser.add_argument('-i',
                            '--initdb',
                            help='Initialize the database',
                            action='store_true')
        parser.add_argument('-r',
                            '--reset',
                            help='Reset the data in the database',
                            action='store_true')
        arguments = parser.parse_args()

        # Connect to the database
        self.database = Database(DB_NAME, DB_USER, DB_HOST, DB_PWD)
        self.database.connect_database()

        if arguments.initdb:
            self.database.read_sql_file('OCPizza-structure.sql')
        elif arguments.reset:
            self.random_data()
        else:
            raise Exception('Please specify an argument')

        self.fake = None

    def random_data(self):
        """
            Method for generating random data and fill the database
        """
        self.fake = faker.Faker('fr_FR')

        self.random_customer()

    def random_customer(self):
        """
            Method for generating a random customer
        """

        first_name = self.fake.first_name
        last_name = self.fake.last_name

        mail_domain = self.fake.domain_name()
        mail = f'{first_name}.{last_name}@{mail_domain}'

        password = self.fake.password(length=15).encode('utf-8')
        salt = uuid.uuid4().hex.encode('utf-8')
        hashed_password = hashlib.sha256(password + salt).hexdigest()

        if randrange(0, 1) == 1:
            street_number = self.fake.building_number()
            street_name = self.fake.street_name()
            city = self.fake.city()
            postal_code = self.fake.postcode()




if __name__ == '__main__':
    App()
