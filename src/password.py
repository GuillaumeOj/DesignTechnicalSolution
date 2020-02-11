"""
    Module for generate a random password
"""
import hashlib
import uuid

import faker


class Password: # pylint: disable=too-few-public-methods
    """
        This class generate a random password
        Attributes:
            - password
            - hashed_password
    """

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # Generate a random password
        self.password = self.fake.password(length=15).encode('utf-8')
        salt = uuid.uuid4().hex.encode('utf-8')

        # Hash the password
        self.hashed_password = hashlib.sha256(self.password + salt).hexdigest()

if __name__ == '__main__':
    print('Please don\'nt load me alone!')
