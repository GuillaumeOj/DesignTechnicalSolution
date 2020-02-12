"""
    Module for creating a fake customer or employee
"""
import faker
import unidecode

from src.address import Address
from src.password import Password

class Customer: # pylint: disable=too-few-public-methods
    """
        Create a customer
        Attributes:
            - first_name
            - last_name
            - email
            - hashed_password
        Optionnal attributes:
            - address
    """
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The customer's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The customer's mail address
        email_domain = self.fake.domain_name()
        unaccented_first_name = unidecode.unidecode(self.first_name).lower()
        unaccented_last_name = unidecode.unidecode(self.last_name).lower()
        self.email = f'{unaccented_first_name}.{unaccented_last_name}@{email_domain}'

        # The customer's postal address
        self.address = Address(lang_code, optional_address=True, additional_details=True)

        # The customer's password
        self.password = Password(lang_code)

class Employee: # pylint: disable=too-few-public-methods
    """
        Create an employee
        Attributes:
            - first_name
            - last_name
            - hashed_password
            - shop
    """
    def __init__(self, lang_code, shop):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The employee's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The employee's password
        self.password = Password(lang_code)

        # The employee's shop
        self.shop = shop



if __name__ == '__main__':
    print('Please don\'nt load me alone!')
