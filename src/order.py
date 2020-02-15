"""
    Module for creating a fake order
"""
from random import randrange

import faker

from src.address import Address


class Order: # pylint: disable=too-many-instance-attributes
    """
        Create an order
        Attributes:
            - date
            - address
            - customer
            - pizzeria
            - status
            - payment
            - payment_status
    """
    def __init__(self, lang_code, orders, customer, pizzeria, statutes, payments, payment_status):
        # pylint: disable=too-many-arguments
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The order date time
        orders_dates = [order.date for order in orders if order.customer == customer]
        while True:
            self.date = None
            self.random_date()
            if self.date not in orders_dates:
                break

        # The order status
        self.status = None
        self.random_status(statutes)

        # The customer who order
        self.customer = customer

        # The pizzeria which prepare the order
        self.pizzeria = pizzeria

        # The delivery address
        if self.customer.address.street_number and self.fake.pybool():
            self.address = self.customer.address
        else:
            self.address = Address(lang_code)

        # The type of payment
        self.payment = payments[randrange(len(payments))]

        # The status of the payment
        self.payment_status = payment_status[randrange(len(payment_status))]

    def random_date(self):
        """
            Create a random date for the order
        """
        if self.date:
            self.date = self.fake.date_time_between(start_date=self.date)
        else:
            self.date = self.fake.date_time_between(start_date='-5y',
                                                    end_date='-2y')

    def random_status(self, statutes):
        """
            Create a random status for the order
        """
        if self.status:
            while True:
                new_status = statutes[randrange(len(statutes))]
                if self.status != new_status:
                    self.status = new_status
                    break
        else:
            self.status = statutes[randrange(len(statutes))]


class OrderLine: # pylint: disable=too-few-public-methods
    """
        Create an order line
        Attributes:
            - quantity
            - order
            - pizza
            - size
    """
    def __init__(self, lang_code, order, pizzas, sizes):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The customer selected quantity
        self.quantity = self.fake.pyint(min_value=1, max_value=6)

        # The order associated with the line
        self.order = order

        # The customer selected pizza
        self.pizza = pizzas[randrange(len(pizzas))]

        # The customer selected size
        self.size = sizes[randrange(len(sizes))]


class Status: # pylint: disable=too-few-public-methods
    """
        Create status
        Attribute:
            - name
    """
    def __init__(self, lang_code, statutes):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The name of the status
        statutes_names = [status.name for status in statutes]
        while True:
            self.name = self.fake.word()
            if self.name not in statutes_names:
                break


class StatusHistory: # pylint: disable=too-few-public-methods
    """
        Create a status history
        Attributes:
            - date
            - order
            - status
    """
    def __init__(self, order):
        # Initialize the faker generator
        self.fake = faker.Faker()

        # The order
        self.order = order

        # The status of the order
        self.status = self.order.status

        # The date time of the status' order
        self.date = self.order.date


class Payment: # pylint: disable=too-few-public-methods
    """
        Create payment
        Attribute:
            - type
    """
    def __init__(self, lang_code, payments):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The type of payment
        payments_types = [payment.type for payment in payments]

        while True:
            self.type = self.fake.word()
            if self.type not in payments_types:
                break


class PaymentStatus: # pylint: disable=too-few-public-methods
    """
        Create payment status
        Attribute:
            - name
    """
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The name of the payment status
        self.name = self.fake.word()


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
