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
            customers.append(customer)

        # Generate pizzeria and employees
        pizzeria = list()
        employees = list()

        for shop in range(random.randrange(3, 10)):
            shop = Shop(LANG_CODE)
            pizzeria.append(shop)

            # Generate employees for the current shop
            for employee in range(random.randrange(3, 6)):
                employee = Employee(LANG_CODE, shop)
                employees.append(employee)

        # Generate ingredients
        ingredients = list()

        for ingredient in range(15):
            ingredient = Ingredient(LANG_CODE)
            ingredients.append(ingredient)

        # Generate sizes for pizza
        sizes = list()

        for size in range(3):
            size = Size(LANG_CODE)
            sizes.append(size)

        # Genrerate a Vat Rate
        vat_rate = 0.055

        # Genereate categories for pizza
        categories = list()
        for category in range(random.randrange(10, 20)):
            category = Category(LANG_CODE, categories)
            categories.append(category)

        # Generate pizzas
        pizzas = list()

        for pizza in range(20):
            pizza = Pizza(LANG_CODE, categories)
            pizzas.append(pizza)
        # stocks = list()
        # orders = list()




if __name__ == '__main__':
    App()
