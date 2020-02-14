"""
    Module for creating a fake order
"""
from random import randrange

import faker

from src.address import Address


class Order:
    """
        Create an order
        Attributes:
            - date
            - address
            - customer
            - pizzeria
            - status
    """
    def __init__(self, lang_code, customer, pizzeria, status):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The order date time
        self.date = None
        self.random_date()

        # The order status
        self.status = None
        self.random_status(status)

        # The customer who order
        self.customer = customer

        # The pizzeria which prepare the order
        self.pizzeria = pizzeria

        # The delivery address
        if self.customer.address.street_number and self.fake.pybool():
            self.address = self.customer.address
        else:
            self.address = Address(lang_code)

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
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The name of the status
        self.name = self.fake.word()


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
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The type of payment
        self.type = self.fake.word()


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
