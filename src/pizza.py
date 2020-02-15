"""
    Module for creating a fake pizza
"""
import random

import faker


class Pizza: # pylint: disable=too-few-public-methods
    """
        Create a pizza
        Attributes:
            - name
            - tax_free_unit_price
            - category
    """
    def __init__(self, lang_code, categories, vat_rates):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The size name
        self.name = self.fake.word()

        # The unit price without taxes
        self.tax_free_unit_price = self.fake.pyfloat(left_digits=2,
                                                     right_digits=2,
                                                     positive=True,
                                                     min_value=10,
                                                     max_value=20)

        # Select a category for the pizza
        self.category = categories[random.randrange(len(categories))]

        # Add a vat rate for the pizza
        self.vat_rate = vat_rates[random.randrange(len(vat_rates))]


class Category: # pylint: disable=too-few-public-methods
    """
        Create a category for the pizza
        Attribute:
            - name
        Optional attribute:
            - parent_category
    """
    def __init__(self, lang_code, categories):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The category name
        categories_names = [category.name for category in categories]
        while True:
            self.name = self.fake.word()
            if self.name not in categories_names:
                break

        self.parent_category = None
        # Add randomly a parent category
        if categories and self.fake.pybool():
            self.parent_category = categories[random.randrange(len(categories))]


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


class Recipe: # pylint: disable=too-few-public-methods
    """
        Create a recipe line for the pizza
        Attributes:
            - pizza
            - ingredient
            - quantity
    """
    def __init__(self, pizza, ingredient):
        # Initialize the faker generator
        self.fake = faker.Faker()

        # The pizza
        self.pizza = pizza

        # The ingredient
        self.ingredient = ingredient

        # A random quantity
        self.quantity = self.fake.pyfloat(right_digits=2,
                                          positive=True,
                                          min_value=1,
                                          max_value=3)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
