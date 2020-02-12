"""
    Module for creating a fake ingredient
"""
import faker

class Ingredient: # pylint: disable=too-few-public-methods
    """
        Create an ingredient
        Attributes:
            - name
            - unit
    """
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The ingredient name
        self.name = self.fake.word()

        # The ingredient unit
        letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        self.unit = self.fake.bothify(text='??', letters=letters)



if __name__ == '__main__':
    print('Please don\'nt load me alone!')
