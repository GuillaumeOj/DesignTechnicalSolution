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
from src.order import OrderLine
from src.order import Status
from src.order import StatusHistory
from src.order import Payment


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
        self.orders_lines = list()
        self.status = list()
        self.status_history = list()
        self.payment = list()

    def init_db_structure(self, sql_file):
        """
            Reset or create the DB structure based on an SQL file
        """
        self.database.read_sql_file(sql_file)

    def random_data(self):
        """
            Create random data for the database
        """
        self.random_customers()
        self.random_pizzeria()
        self.random_employees()
        self.random_ingredients()
        self.random_sizes()
        self.random_categories()
        self.random_pizzas()
        self.random_stock()
        self.random_recipes()
        self.random_status()
        self.random_orders()
        self.random_orders_lines()
        self.random_status_history()
        self.random_payment()

    def random_customers(self):
        """
            Create random customers
        """
        print('==> Create customers')
        for customer in range(random.randrange(20, 100)):
            customer = Customer(LANG_CODE)
            print(f'{customer.first_name} {customer.last_name}')
            self.customers.append(customer)
        print('')

    def random_pizzeria(self):
        """
            Create random pizzeria
        """
        print('==> Create pizzeria')
        for shop in range(random.randrange(3, 10)):
            shop = Shop(LANG_CODE)
            print(f'==> Pizzeria name: {shop.name}')
            self.pizzeria.append(shop)
        print('')

    def random_employees(self):
        """
            Create random employees for each pizzeria
        """
        for shop in self.pizzeria:
            print(f'==> Create employees for {shop.name}')
            for employee in range(random.randrange(3, 6)):
                employee = Employee(LANG_CODE, shop)
                print(f'{employee.first_name} {employee.last_name}')
                self.employees.append(employee)
            print('')

    def random_ingredients(self):
        """
            Create random ingredients
        """
        print('==> Create ingredients')
        for ingredient in range(15):
            ingredient = Ingredient(LANG_CODE)
            print(f'{ingredient.name}')
            self.ingredients.append(ingredient)
        print('')

    def random_sizes(self):
        """
            Create random sizes
        """
        print('==> Create sizes')
        for size in range(3):
            size = Size(LANG_CODE)
            print(f'{size.name}')
            self.sizes.append(size)
        print('')

    def random_categories(self):
        """
            Create random categories
        """
        print('==> Create categories')
        for category in range(random.randrange(10, 20)):
            category = Category(LANG_CODE, self.categories)
            print(f'{category.name}')
            self.categories.append(category)
        print('')

    def random_pizzas(self):
        """
            Create random pizzas
        """
        print('==> Create pizzas')
        for pizza in range(20):
            pizza = Pizza(LANG_CODE, self.categories)
            print(f'{pizza.name}')
            self.pizzas.append(pizza)
        print('')

    def random_stock(self):
        """
            Create a random stock for each pizzeria
        """
        print('==> Create stocks for each pizzeria')
        for shop in self.pizzeria:
            print(f'==> Stock for {shop.name}')
            for ingredient in self.ingredients:
                stock_line = Stock(shop, ingredient)
                print(f'{stock_line.ingredient.name} = {stock_line.quantity}')
                self.stock.append(stock_line)
            print('')
        print('')

    def random_recipes(self):
        """
            Create a random recipe for each pizza
        """
        print('==> Genereate recipes for each pizza')
        for pizza in self.pizzas:
            print(f'==> Recipe for the {pizza.name}')
            for ingredient in self.ingredients:
                if random.choice([True, False]):
                    recipe_line = Recipe(pizza, ingredient)
                    print(f'{recipe_line.ingredient.name} = {recipe_line.quantity}')
                    self.recipes.append(recipe_line)
            print('')
        print('')

    def random_status(self):
        """
            Genereate random status for the orders
        """
        print('==> Create status')
        for status in range(4):
            status = Status(LANG_CODE)
            print(f'{status.name}')
            self.status.append(status)
        print('')

    def random_orders(self):
        """
            Create random orders for each customer
        """
        print('==> Create orders for customers')
        for customer in self.customers:
            print(f'==> Orders from {customer.first_name} {customer.last_name}:')
            for order in range(random.randrange(0, 4)):
                order = Order(LANG_CODE, customer, self.pizzeria, self.status)
                print(f'{order.date}')
                self.orders.append(order)
            print('')
        print('')

    def random_orders_lines(self):
        """
            Create random orders lines for each order
        """
        print('==> Create orders\' lines')
        for order in self.orders:
            for order_line in range(random.randrange(1, 6)):
                order_line = OrderLine(LANG_CODE, order, self.pizzas, self.sizes)
                print(f'{order_line.pizza.name} => {order_line.size.name} => {order_line.quantity}')
                self.orders_lines.append(order_line)
        print('')

    def random_status_history(self):
        """
            Create random history for status
        """
        print('==> Create random hitory for status')
        for i, order in enumerate(self.orders):
            print(f'==> Orders from {order.customer.first_name} {order.customer.last_name}')
            for status_history in range(random.randrange(1, 3)):
                status_history = StatusHistory(order)
                print(f'{status_history.status.name} => {status_history.date}')
                self.status_history.append(status_history)
                self.orders[i].random_date()
                self.orders[i].random_status(self.status)
            print('')
        print('')

    def random_payment(self):
        """
            Create random payment types
        """
        print('==> Create payment types')
        for payment in range(2):
            payment = Payment(LANG_CODE)
            print(f'{payment.type}')
            self.payment.append(payment)
        print('')


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
