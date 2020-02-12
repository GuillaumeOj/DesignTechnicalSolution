"""
    Module for creating a fake shop
"""
import faker

from src.address import Address

class Shop: # pylint: disable=too-few-public-methods
    """
        Create a shop
        Attributes:
            - name
            - address
    """
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The shop name
        self.name = self.fake.company()

        # The shop address
        self.address = Address(lang_code)



if __name__ == '__main__':
    print('Please don\'nt load me alone!')
