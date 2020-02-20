"""
    Module for generate a random password
"""
import faker
import bcrypt


class Password: # pylint: disable=too-few-public-methods
    """
        This class generate a random password
        Attributes:
            - password
            - hashed_password
    """

    def __init__(self):
        # Initialize the faker generator
        self.fake = faker.Faker()

        # Generate a random password
        self.password = self.fake.password(length=15).encode('utf-8')

        # Hash the password
        self.hashed_password = bcrypt.hashpw(self.password, bcrypt.gensalt())

if __name__ == '__main__':
    print('Please don\'nt load me alone!')
