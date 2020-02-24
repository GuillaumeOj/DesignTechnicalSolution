"""
    Module for creating a fake pizza
"""
import random

import faker
import faker_starship


class Pizza: # pylint: disable=too-few-public-methods
    """
        Create a pizza
        Attributes:
            - name
            - tax_free_unit_price
            - category
    """
    pizzas = list()

    def __init__(self, lang_code, *args):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)
        self.fake.add_provider(faker_starship.Provider)

        categories, vat_rates = args

        # The size name
        pizzas_names = [pizza.name for pizza in Pizza.pizzas]
        while True:
            self.name = self.fake.starship_name()
            if self.name not in pizzas_names:
                break

        # The unit price without taxes
        self.tax_free_unit_price = self.fake.pyfloat(left_digits=2,
                                                     right_digits=2,
                                                     positive=True,
                                                     min_value=7,
                                                     max_value=10)

        # Select a category for the pizza
        self.category = categories[random.randrange(len(categories))]

        # Add a vat rate for the pizza
        self.vat_rate = vat_rates[random.randrange(len(vat_rates))]

        Pizza.pizzas.append(self)


class Category: # pylint: disable=too-few-public-methods
    """
        Create a category for the pizza
        Attribute:
            - name
        Optional attribute:
            - parent_category
    """
    categories = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The category name
        categories_names = [category.name for category in Category.categories]
        while True:
            self.name = self.fake.word()
            if self.name not in categories_names:
                break

        self.parent_category = None
        # Add randomly a parent category
        if Category.categories and self.fake.pybool():
            self.parent_category = Category.categories[random.randrange(len(Category.categories))]

        Category.categories.append(self)


class Size: # pylint: disable=too-few-public-methods
    """
        Create a size for the pizza
        Attributes:
            - name
            - ingredient_factor
    """
    sizes = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)
        self.fake.add_provider(faker_starship.Provider)

        # The size name
        self.name = self.fake.starship_class()

        # The ingredient factor
        self.ingredient_factor = self.fake.pyfloat(right_digits=1,
                                                   positive=True,
                                                   min_value=1,
                                                   max_value=3)

        # The extra price
        self.extra_price = round(self.ingredient_factor * 2)

        Size.sizes.append(self)


class Ingredient: # pylint: disable=too-few-public-methods
    """
        Create an ingredient
        Attributes:
            - name
            - unit
    """
    ingredients = list()

    def __init__(self, lang_code, *args):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)
        self.fake.add_provider(faker_starship.Provider)

        units = args

        # The ingredient name
        self.name = self.fake.starship_registry()

        # The ingredient unit
        self.unit = self.fake.random_element(elements=units)

        Ingredient.ingredients.append(self)


class Recipe: # pylint: disable=too-few-public-methods
    """
        Create a recipe line for the pizza
        Attributes:
            - pizza
            - ingredient
            - quantity
    """
    recipes_lines = list()

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

        Recipe.recipes_lines.append(self)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
