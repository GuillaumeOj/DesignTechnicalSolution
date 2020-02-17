"""
    Module for creating a fake customer or employee
"""
import faker

from src.address import Address
from src.password import Password
from src.email import Email


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
    def __init__(self, lang_code, customers):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The customer's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The customer's mail address
        customers_emails = [customer.email for customer in customers]
        while True:
            self.email = Email(lang_code, self.first_name, self.last_name).email
            if self.email not in customers_emails:
                break

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
            - email
            - password
            - shop
    """
    def __init__(self, lang_code, shop, employees):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The employee's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The employee's mail address
        employees_emails = [employee.email for employee in employees]
        while True:
            self.email = Email(lang_code, self.first_name, self.last_name).email
            if self.email not in employees_emails:
                break

        # The employee's password
        self.password = Password(lang_code)

        # The employee's shop
        self.shop = shop


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
