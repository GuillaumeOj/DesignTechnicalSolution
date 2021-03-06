"""
    Module for filling and testing the database
"""
import argparse
from random import randrange, choice

from progress.bar import FillingCirclesBar

from settings import * # pylint: disable=wildcard-import
from src.database import Database
from src.person import Customer, Employee, Role
from src.restaurant import Restaurant, Stock
from src.pizza import Ingredient, Size, Category, Pizza, Recipe
from src.order import Order, OrderLine, Status, StatusHistory, Payment, PaymentStatus


class App:
    """
        Application for filling and testing the database
    """
    def __init__(self):
        # Connect to the database
        self.database = Database(DB_NAME, DB_USER, DB_HOST, DB_PWD)
        self.database.connect_database()
        self.database.select_database()

        # Attributes for generating data
        self.vat_rates = VAT_RATES
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
        self.database.insert_customers(Customer.customers)
        self.database.insert_restaurants(Restaurant.restaurants)
        self.database.insert_roles(Role.roles)
        self.database.insert_employees(Employee.employees)
        self.database.insert_ingredients(Ingredient.ingredients)
        self.database.insert_sizes(Size.sizes)
        self.database.insert_categories(Category.categories)
        self.database.insert_vat_rates(self.vat_rates)
        self.database.insert_pizzas(Pizza.pizzas)
        self.database.insert_stock(Stock.stocks)
        self.database.insert_recipes(Recipe.recipes_lines)
        self.database.insert_status(Status.status)
        self.database.insert_payments(Payment.payments)
        self.database.insert_payments_status(PaymentStatus.payments_status)
        self.database.insert_orders(Order.orders)
        self.database.insert_orders_lines(OrderLine.orders_lines)
        self.database.insert_status_history(StatusHistory.status_history)

    def random_data(self):
        """
            Create random data for the database
        """
        self.generate_simple('customers', CUSTOMERS_COUNT, Customer)
        self.generate_simple('pizzeria', RESTAURANTS_COUNT, Restaurant)
        self.generate_simple('roles', len(ROLES), Role, ROLES)
        self.generate_complex_while('employees for each restaurant',
                                    (EMPLOYEES_COUNT_MIN, EMPLOYEES_COUNT_MAX),
                                    Restaurant.restaurants,
                                    Employee,
                                    Role.roles)
        self.generate_simple('ingredients', INGREDIENTS_COUNT, Ingredient, INGREDIENTS_UNITS)
        self.generate_simple('sizes', SIZES_COUNT, Size)
        self.generate_simple('categories', CATEGORIES_COUNT, Category)
        self.generate_simple('pizzas', PIZZA_COUNT, Pizza, Category.categories, self.vat_rates)
        self.generate_complex('stock for each restaurant',
                              (Restaurant.restaurants, Ingredient.ingredients),
                              Stock)
        self.generate_complex('recipes for each pizza',
                              (Pizza.pizzas, Ingredient.ingredients),
                              Recipe,
                              random_choice=True)
        self.generate_simple('status for the orders', len(STATUS), Status, STATUS)
        self.generate_simple('payments types', PAYMENTS_TYPE_COUNT, Payment)
        self.generate_simple('payments status', PAYMENTS_STATUS_COUNT, PaymentStatus)
        self.generate_complex_while('order for each customer',
                                    (ORDERS_COUNT_MIN, ORDERS_COUNT_MAX),
                                    Customer.customers,
                                    Order,
                                    Restaurant.restaurants,
                                    Status.status,
                                    Payment.payments,
                                    PaymentStatus.payments_status)
        self.random_status_history()
        self.generate_complex_while('orders lines for each order',
                                    (ORDERS_LINES_COUNT_MIN, ORDERS_LINES_COUNT_MAX),
                                    Order.orders,
                                    OrderLine,
                                    Pizza.pizzas,
                                    Size.sizes)

    @staticmethod
    def generate_simple(data_name, count, klass, *args):
        """
            Generate data with a simple loop
        """
        progress_bar = f'Create {data_name}'
        progress_bar = FillingCirclesBar(progress_bar, max=count)
        i = 0
        while i < count:
            i += 1
            klass(LANG_CODE, *args)
            progress_bar.next()
        progress_bar.finish()

    @staticmethod
    def generate_complex(data_name, lists, klass, *args, random_choice=False):
        """
            Generate data with a double for loop
        """
        parents, children = lists
        progress_bar = f'Create {data_name}'
        progress_bar = FillingCirclesBar(progress_bar, max=len(parents))
        for parent in parents:
            for child in children:
                if random_choice:
                    if choice([True, False]):
                        klass(parent, child, *args)
                else:
                    klass(parent, child, *args)
            progress_bar.next()
        progress_bar.finish()

    @staticmethod
    def generate_complex_while(data_name, count, parents, klass, *args):
        """
            Generate data with a for and a while loops
        """
        count_min, count_max = count
        progress_bar = f'Create {data_name}'
        progress_bar = FillingCirclesBar(progress_bar, max=len(parents))
        for parent in parents:
            child_count = randrange(count_min, count_max)
            i = 0
            while i < child_count:
                i += 1
                klass(LANG_CODE, parent, *args)
            progress_bar.next()
        progress_bar.finish()

    @staticmethod
    def random_status_history():
        """
            Create random history for status
        """
        progress_bar = 'Create status histories for the orders'
        progress_bar = FillingCirclesBar(progress_bar, max=len(Order.orders))
        for i, order in enumerate(Order.orders):
            history_count = randrange(0, (len(STATUS) - 1))
            j = 0
            while j < history_count:
                j += 1
                StatusHistory(order)
                Order.orders[i].random_date()
                Order.orders[i].random_status(Status.status)
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
