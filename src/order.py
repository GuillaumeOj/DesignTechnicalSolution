"""
    Module for creating a fake order
"""
import faker

from src.address import Address


class Order: # pylint: disable=too-few-public-methods
    """
        Create an order
        Attributes:
            - date
            - address
            - customer
            - pizzeria
    """
    def __init__(self, lang_code, customer, pizzeria):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The order date time
        self.date = self.fake.date_time_between(start_date='-5y',
                                                end_date='now')

        # The customer who order
        self.customer = customer

        # The pizzeria which prepare the order
        self.pizzeria = pizzeria

        # The delivery address
        if self.customer.address.street_number and self.fake.pybool():
            self.address = self.customer.address
        else:
            self.address = Address(lang_code)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
