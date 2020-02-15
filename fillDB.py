"""
    Module for filling and testing the database
"""
import argparse
from random import randrange, choice

from progress.bar import FillingCirclesBar

from settings import * # pylint: disable=wildcard-import
from src.database import Database
from src.person import Customer, Employee
from src.shop import Shop, Stock
from src.pizza import Ingredient, Size, Category, Pizza, Recipe
from src.order import Order, OrderLine, Status, StatusHistory, Payment, PaymentStatus


class App:  # pylint: disable=too-many-instance-attributes
    """
        Application for filling and testing the database
    """
    def __init__(self):
        # Connect to the database
        self.database = Database(DB_NAME, DB_USER, DB_HOST, DB_PWD)
        self.database.connect_database()
        self.database.select_database()

        # Attributes for generating data
        self.customers = list()
        self.pizzeria = list()
        self.employees = list()
        self.ingredients = list()
        self.sizes = list()
        self.vat_rates = [0.055]
        self.categories = list()
        self.pizzas = list()
        self.stock = list()
        self.recipes = list()
        self.statutes = list()
        self.payments = list()
        self.payments_statutes = list()
        self.orders = list()
        self.orders_lines = list()
        self.statutes_history = list()

    def init_db_structure(self, sql_file):
        """
            Reset or create the DB structure based on an SQL file
        """
        self.database.read_sql_file(sql_file)

    def insert_data_db(self):
        """
            Insert the random data in the database
        """
        self.database.insert_customers(self.customers)
        self.database.insert_pizzeria(self.pizzeria)
        self.database.insert_employees(self.employees)
        self.database.insert_ingredients(self.ingredients)
        self.database.insert_sizes(self.sizes)
        self.database.insert_categories(self.categories)
        self.database.insert_vat_rates(self.vat_rates)
        self.database.insert_pizzas(self.pizzas)
        self.database.insert_stock(self.stock)
        self.database.insert_recipes(self.recipes)
        self.database.insert_statutes(self.statutes)
        self.database.insert_payments(self.payments)
        self.database.insert_payments_statutes(self.payments_statutes)
        self.database.insert_orders(self.orders)
        self.database.insert_orders_lines(self.orders_lines)

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
        self.random_statutes()
        self.random_payments()
        self.random_payments_statutes()
        self.random_orders()
        self.random_orders_lines()
        self.random_statutes_history()

    def random_customers(self):
        """
            Create random customers
        """
        progress_bar = 'Create customers'
        progress_bar = FillingCirclesBar(progress_bar, max=CUSTOMERS_COUNT)
        for customer in range(CUSTOMERS_COUNT):
            customer = Customer(LANG_CODE)
            self.customers.append(customer)
            progress_bar.next()
        progress_bar.finish()

    def random_pizzeria(self):
        """
            Create random pizzeria
        """
        progress_bar = 'Create pizzeria'
        progress_bar = FillingCirclesBar(progress_bar, max=PIZZERIA_COUNT)
        for shop in range(PIZZERIA_COUNT):
            shop = Shop(LANG_CODE, self.pizzeria)
            self.pizzeria.append(shop)
            progress_bar.next()
        progress_bar.finish()

    def random_employees(self):
        """
            Create random employees for each pizzeria
        """
        progress_bar = 'Create employees'
        progress_bar = FillingCirclesBar(progress_bar, max=len(self.pizzeria))
        for shop in self.pizzeria:
            for employee in range(randrange(EMPLOYEES_COUNT_MIN, EMPLOYEES_COUNT_MAX)):
                employee = Employee(LANG_CODE, shop)
                self.employees.append(employee)
            progress_bar.next()
        progress_bar.finish()

    def random_ingredients(self):
        """
            Create random ingredients
        """
        progress_bar = 'Create ingredients'
        progress_bar = FillingCirclesBar(progress_bar, max=INGREDIENTS_COUNT)
        for ingredient in range(INGREDIENTS_COUNT):
            ingredient = Ingredient(LANG_CODE)
            self.ingredients.append(ingredient)
            progress_bar.next()
        progress_bar.finish()

    def random_sizes(self):
        """
            Create random sizes
        """
        progress_bar = 'Create sizes'
        progress_bar = FillingCirclesBar(progress_bar, max=SIZES_COUNT)
        for size in range(SIZES_COUNT):
            size = Size(LANG_CODE)
            self.sizes.append(size)
            progress_bar.next()
        progress_bar.finish()

    def random_categories(self):
        """
            Create random categories
        """
        progress_bar = 'Create categories'
        progress_bar = FillingCirclesBar(progress_bar, max=CATEGORIES_COUNT)
        for category in range(CATEGORIES_COUNT):
            category = Category(LANG_CODE, self.categories)
            self.categories.append(category)
            progress_bar.next()
        progress_bar.finish()

    def random_pizzas(self):
        """
            Create random pizzas
        """
        progress_bar = 'Create pizzas'
        progress_bar = FillingCirclesBar(progress_bar, max=PIZZA_COUNT)
        for pizza in range(PIZZA_COUNT):
            pizza = Pizza(LANG_CODE, self.pizzas, self.categories, self.vat_rates)
            self.pizzas.append(pizza)
            progress_bar.next()
        progress_bar.finish()

    def random_stock(self):
        """
            Create a random stock for each pizzeria
        """
        progress_bar = 'Create stock for each pizzeria'
        progress_bar_count = len(self.pizzeria) * len(self.ingredients)
        progress_bar = FillingCirclesBar(progress_bar, max=progress_bar_count)
        for shop in self.pizzeria:
            for ingredient in self.ingredients:
                stock_line = Stock(shop, ingredient)
                self.stock.append(stock_line)
                progress_bar.next()
        progress_bar.finish()

    def random_recipes(self):
        """
            Create a random recipe for each pizza
        """
        progress_bar = 'Create a recipe for each pizza'
        progress_bar_count = len(self.pizzas)
        progress_bar = FillingCirclesBar(progress_bar, max=progress_bar_count)
        for pizza in self.pizzas:
            for ingredient in self.ingredients:
                if choice([True, False]):
                    recipe_line = Recipe(pizza, ingredient)
                    self.recipes.append(recipe_line)
            progress_bar.next()
        progress_bar.finish()

    def random_statutes(self):
        """
            Genereate random statutes for the orders
        """
        progress_bar = 'Create statutes for the orders'
        progress_bar = FillingCirclesBar(progress_bar, max=STATUTES_COUNT)
        for status in range(STATUTES_COUNT):
            status = Status(LANG_CODE, self.statutes)
            self.statutes.append(status)
            progress_bar.next()
        progress_bar.finish()

    def random_payments(self):
        """
            Create random payments types
        """
        progress_bar = 'Create payments types'
        progress_bar = FillingCirclesBar(progress_bar, max=PAYMENTS_TYPE_COUNT)
        for payment in range(PAYMENTS_TYPE_COUNT):
            payment = Payment(LANG_CODE, self.payments)
            self.payments.append(payment)
            progress_bar.next()
        progress_bar.finish()

    def random_payments_statutes(self):
        """
            Create random payment statutes
        """
        progress_bar = 'Create payments statutes'
        progress_bar = FillingCirclesBar(progress_bar, max=PAYMENTS_STATUTES_COUNT)
        for payment_status in range(PAYMENTS_STATUTES_COUNT):
            payment_status = PaymentStatus(LANG_CODE, self.payments_statutes)
            self.payments_statutes.append(payment_status)
            progress_bar.next()
        progress_bar.finish()

    def random_orders(self):
        """
            Create random orders for each customer
        """
        progress_bar = 'Create orders for each customer'
        progress_bar = FillingCirclesBar(progress_bar, max=len(self.customers))
        for customer in self.customers:
            for order in range(randrange(ORDERS_COUNT_MIN, ORDERS_COUNT_MAX)):
                order = Order(LANG_CODE,
                              self.orders,
                              customer,
                              self.pizzeria,
                              self.statutes,
                              self.payments,
                              self.payments_statutes)
                self.orders.append(order)
            progress_bar.next()
        progress_bar.finish()

    def random_orders_lines(self):
        """
            Create random orders lines for each order
        """
        progress_bar = 'Create lines of each order'
        progress_bar = FillingCirclesBar(progress_bar, max=len(self.orders))
        for order in self.orders:
            for order_line in range(randrange(ORDERS_LINES_COUNT_MIN, ORDERS_LINES_COUNT_MAX)):
                order_line = OrderLine(LANG_CODE, self.orders_lines, order, self.pizzas, self.sizes)
                self.orders_lines.append(order_line)
            progress_bar.next()
        progress_bar.finish()

    def random_statutes_history(self):
        """
            Create random history for status
        """
        progress_bar = 'Create statutes history for the orders'
        progress_bar = FillingCirclesBar(progress_bar, max=len(self.orders))
        for i, order in enumerate(self.orders):
            for status_history in range(randrange(STATUTES_HISTORY_MIN, STATUTES_HISTORY_MAX)):
                status_history = StatusHistory(order)
                self.statutes_history.append(status_history)
                self.orders[i].random_date()
                self.orders[i].random_status(self.statutes)
            progress_bar.next()
        progress_bar.finish()


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
        APP.insert_data_db()
    else:
        raise Exception('Please specify an argument')
