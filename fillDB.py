"""
    Module for filling and testing the database
"""
import argparse
import random

from settings import * # pylint: disable=wildcard-import
from src.database import Database
from src.person import Customer
from src.person import Employee
from src.address import Address
from src.password import Password
from src.shop import Shop
from src.ingredient import Ingredient


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

    @staticmethod
    def random_data():
        """
            Method for generating random data and fill the database
        """
        # Generate customers
        customers = list()

        for customer in range(random.randrange(20, 100)):
            customer = Customer(LANG_CODE)
            customer.address = Address(LANG_CODE, optional_address=True, additional_details=True)
            customer.password = Password(LANG_CODE)
            customers.append(customer)

        # Generate pizzeria and employees
        pizzeria = list()
        employees = list()

        for shop in range(random.randrange(3, 10)):
            shop = Shop(LANG_CODE)
            shop.address = Address(LANG_CODE)
            pizzeria.append(shop)

            # Generate employees for the current shop
            for employee in range(random.randrange(3, 6)):
                employee = Employee(LANG_CODE)
                employee.password = Password(LANG_CODE)
                employee.shop = shop
                employees.append(employee)

        # Generate ingredients
        ingredients = list()

        for ingredient in range(15):
            ingredient = Ingredient(LANG_CODE)
            ingredients.append(ingredient)
        # pizzas = list()
        # sizes = list()
        # stocks = list()
        # orders = list()




if __name__ == '__main__':
    App()
