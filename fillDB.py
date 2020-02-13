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
from src.shop import Stock
from src.pizza import Ingredient
from src.pizza import Size
from src.pizza import Category
from src.pizza import Pizza
from src.pizza import Recipe
from src.order import Order


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
        self.stock = list()
        self.recipes = list()
        self.orders = list()

    def init_db_structure(self, sql_file):
        """
            Reset or create the DB structure based on an SQL file
        """
        self.database.read_sql_file(sql_file)

    def random_data(self):
        """
            Generate random data for the database
        """
        self.random_customers()
        self.random_pizzeria()
        self.random_ingredients()
        self.random_sizes()
        self.random_categories()
        self.random_pizzas()
        self.random_stock()
        self.random_recipes()
        self.random_orders()

    def random_customers(self):
        """
            Generate random customers
        """
        for customer in range(random.randrange(20, 100)):
            customer = Customer(LANG_CODE)
            self.customers.append(customer)

    def random_pizzeria(self):
        """
            Generate random pizzeria and employees
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
            Generate random ingredients
        """
        for ingredient in range(15):
            ingredient = Ingredient(LANG_CODE)
            self.ingredients.append(ingredient)

    def random_sizes(self):
        """
            Generate random sizes
        """
        for size in range(3):
            size = Size(LANG_CODE)
            self.sizes.append(size)

    def random_categories(self):
        """
            Generate random categories
        """
        for category in range(random.randrange(10, 20)):
            category = Category(LANG_CODE, self.categories)
            self.categories.append(category)

    def random_pizzas(self):
        """
            Generate random pizzas
        """
        for pizza in range(20):
            pizza = Pizza(LANG_CODE, self.categories)
            self.pizzas.append(pizza)

    def random_stock(self):
        """
            Generate a random stock for each pizzeria
        """
        for shop in self.pizzeria:
            for ingredient in self.ingredients:
                stock_line = Stock(shop, ingredient)
                self.stock.append(stock_line)

    def random_recipes(self):
        """
            Generate a random recipe for each pizza
        """
        for pizza in self.pizzas:
            for ingredient in self.ingredients:
                if random.choice([True, False]):
                    recipe_line = Recipe(pizza, ingredient)
                    self.recipes.append(recipe_line)

    def random_orders(self):
        """
            Generate random orders for each customer
        """
        for customer in self.customers:
            for order in range(random.randrange(0, 4)):
                order = Order(LANG_CODE, customer, self.pizzeria)
                self.orders.append(order)


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
