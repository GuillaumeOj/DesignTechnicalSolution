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
            - restaurant
            - status
            - payment
            - payment_status
    """
    orders = list()

    def __init__(self, lang_code, customer, *args):
        # pylint: disable=too-many-arguments
        # Initialize the faker generator
        restaurants, status, payments, payment_status = args
        self.fake = faker.Faker(lang_code)

        # The order date time
        orders_dates = [order.date for order in Order.orders if order.customer == customer]
        while True:
            self.date = None
            self.random_date()
            if self.date not in orders_dates:
                break

        # The order status
        self.status = None
        self.random_status(status)

        # The customer who order
        self.customer = customer

        # The restaurant which prepare the order
        self.restaurants = restaurants[randrange(len(restaurants))]

        # The delivery address
        if self.customer.address.street_number and self.fake.pybool():
            self.address = self.customer.address
        else:
            self.address = Address(lang_code)

        # The type of payment
        self.payment = payments[randrange(len(payments))]

        # The status of the payment
        self.payment_status = payment_status[randrange(len(payment_status))]

        Order.orders.append(self)

    def random_date(self):
        """
            Create a random date for the order
        """
        if self.date:
            self.date = self.fake.date_time_between(start_date=self.date)
        else:
            self.date = self.fake.date_time_between(start_date='-5y',
                                                    end_date='-2y')

    def random_status(self, status):
        """
            Create a random status for the order
        """
        if self.status:
            while True:
                new_status = status[randrange(len(status))]
                if self.status != new_status:
                    self.status = new_status
                    break
        else:
            self.status = status[randrange(len(status))]


class OrderLine: # pylint: disable=too-few-public-methods
    """
        Create an order line
        Attributes:
            - quantity
            - order
            - pizza
            - size
    """
    def __init__(self, lang_code, orders_lines, order, pizzas, sizes):
        # pylint: disable=too-many-arguments
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The customer selected quantity
        self.quantity = self.fake.pyint(min_value=1, max_value=6)

        # The order associated with the line
        self.order = order

        # The customer selected pizza
        pizzas_in_order = [order_line.pizza
                           for order_line in orders_lines
                           if order_line.order == self.order]
        while True:
            self.pizza = pizzas[randrange(len(pizzas))]
            if self.pizza not in pizzas_in_order:
                break

        # The customer selected size
        self.size = sizes[randrange(len(sizes))]


class Status: # pylint: disable=too-few-public-methods
    """
        Create status
        Attribute:
            - name
    """
    status = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The name of the status
        statutes_names = [status.name for status in Status.status]
        while True:
            self.name = self.fake.word()
            if self.name not in statutes_names:
                break

        Status.status.append(self)


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
    payments = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The type of payment
        payments_types = [payment.type for payment in Payment.payments]

        while True:
            self.type = self.fake.word()
            if self.type not in payments_types:
                break

        Payment.payments.append(self)


class PaymentStatus: # pylint: disable=too-few-public-methods
    """
        Create payment status
        Attribute:
            - name
    """
    payments_status = list()
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The name of the payment status
        payments_statutes_names = [payment_status.name
                                   for payment_status
                                   in PaymentStatus.payments_status]
        while True:
            self.name = self.fake.word()
            if self.name not in payments_statutes_names:
                break

        PaymentStatus.payments_status.append(self)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
