"""
    Module for filling and testing the database
"""
import argparse
import random

from settings import * # pylint: disable=wildcard-import
from src.database import Database
from src.person import Customer
from src.person import Employee
from src.shop import Shop
from src.pizza import Ingredient
from src.pizza import Size
from src.pizza import Category
from src.pizza import Pizza


class App:  # pylint: disable=too-many-instance-attributes
    """
        Application for filling and testing the database
    """
    def __init__(self):
        # Connect to the database
        self.database = Database(DB_NAME, DB_USER, DB_HOST, DB_PWD)
        self.database.connect_database()

        # Attributes for generating data
        self.customers = list()
        self.pizzeria = list()
        self.employees = list()
        self.ingredients = list()
        self.sizes = list()
        self.vat_rate = 0.055
        self.categories = list()
        self.pizzas = list()

    def init_db_structure(self, sql_file):
        """
            Reset or create the DB structure based on an SQL file
        """
        self.database.read_sql_file(sql_file)

    def random_data(self):
        """
            Generating random data for the database
        """
        self.random_customers()
        self.random_pizzeria()
        self.random_ingredients()
        self.random_sizes()
        self.random_categories()
        self.random_pizzas()

    def random_customers(self):
        """
            Generating random customers
        """
        for customer in range(random.randrange(20, 100)):
            customer = Customer(LANG_CODE)
            self.customers.append(customer)

    def random_pizzeria(self):
        """
            Generating random pizzeria and employees
        """
        for shop in range(random.randrange(3, 10)):
            shop = Shop(LANG_CODE)
            self.pizzeria.append(shop)

            # Generate employees for the current shop
            for employee in range(random.randrange(3, 6)):
                employee = Employee(LANG_CODE, shop)
                self.employees.append(employee)

    def random_ingredients(self):
        """
            Generating random ingredients
        """
        for ingredient in range(15):
            ingredient = Ingredient(LANG_CODE)
            self.ingredients.append(ingredient)

    def random_sizes(self):
        """
            Generating random sizes
        """
        for size in range(3):
            size = Size(LANG_CODE)
            self.sizes.append(size)

    def random_categories(self):
        """
            Generating random categories
        """
        for category in range(random.randrange(10, 20)):
            category = Category(LANG_CODE, self.categories)
            self.categories.append(category)

    def random_pizzas(self):
        """
            Generating random pizzas
        """
        for pizza in range(20):
            pizza = Pizza(LANG_CODE, self.categories)
            self.pizzas.append(pizza)


if __name__ == '__main__':
    # Add arguments
    PARSER = argparse.ArgumentParser()
    PARSER.add_argument('-s',
                        '--structure',
                        help='Create or reset the database structure',
                        action='store_true')
    PARSER.add_argument('-d',
                        '--data',
                        help='Insert or reset the data in the database',
                        action='store_true')
    ARGUMENTS = PARSER.parse_args()

    # Initialize the application
    APP = App()

    # Do operations depend on the argument
    if ARGUMENTS.structure:
        APP.init_db_structure(SQL_STRUCTURE)
    elif ARGUMENTS.data:
        APP.random_data()
    else:
        raise Exception('Please specify an argument')
