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
            - phone_number
            - hashed_password
        Optionnal attributes:
            - address
    """
    customers = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The customer's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The customer's mail address
        customers_emails = [customer.email for customer in Customer.customers]
        while True:
            self.email = Email(lang_code, self.first_name, self.last_name).email
            if self.email not in customers_emails:
                break

        # The customer's phone number
        self.phone_number = self.fake.phone_number()

        # The customer's postal address
        self.address = Address(lang_code, optional_address=True, additional_details=True)

        # The customer's password
        self.password = Password(lang_code)

        Customer.customers.append(self)


class Employee: # pylint: disable=too-few-public-methods
    """
        Create an employee
        Attributes:
            - first_name
            - last_name
            - email
            - password
            - restaurant
    """
    employees = list()

    def __init__(self, lang_code, restaurant, *args):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        roles = args

        # The employee's role
        self.role = self.fake.random_element(elements=roles)

        # The employee's name
        self.first_name = self.fake.first_name()
        self.last_name = self.fake.last_name()

        # The employee's mail address
        employees_emails = [employee.email for employee in Employee.employees]
        while True:
            self.email = Email(lang_code, self.first_name, self.last_name).email
            if self.email not in employees_emails:
                break

        # The employee's password
        self.password = Password(lang_code)

        # The employee's shop
        self.restaurant = restaurant

        Employee.employees.append(self)


class Role: # pylint: disable=too-few-public-methods
    """
        Create a role used for employees
        Attribute:
            - name
    """
    roles = list()

    def __init__(self, lang_code, *args):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        given_roles = args

        # The role's name
        roles_names = [role.name for role in Role.roles]
        while True:
            self.name = self.fake.random_element(elements=given_roles)
            if self.name not in roles_names:
                break

        Role.roles.append(self)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
