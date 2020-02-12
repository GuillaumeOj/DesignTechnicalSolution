"""
    Module for creating a fake pizza
"""

import faker



class Size: # pylint: disable=too-few-public-methods
    """
        Create a size for the pizza
        Attributes:
            - name
            - ingredient_factor
    """
    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The size name
        self.name = self.fake.word()

        # The ingredient factor
        self.ingredient_factor = self.fake.pyfloat(right_digits=1,
                                                   positive=True,
                                                   min_value=1,
                                                   max_value=3)


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
