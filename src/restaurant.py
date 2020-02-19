"""
    Module for creating a fake shop
"""
import faker

from src.address import Address


class Restaurant: # pylint: disable=too-few-public-methods
    """
        Create a restaurant
        Attributes:
            - name
            - address
    """
    restaurants = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The restaurant name
        restaurants_names = [restaurant.name for restaurant in Restaurant.restaurants]
        while True:
            self.name = self.fake.company()
            if self.name not in restaurants_names:
                break

        # The restaurant address
        self.address = Address(lang_code)

        Restaurant.restaurants.append(self)


class Stock: # pylint: disable=too-few-public-methods
    """
        Create a stock_line for a restaurant
        Attributes:
            - restaurant
            - ingredient
            - quantity
    """
    stocks = list()

    def __init__(self, restaurant, ingredient):
        # Initialize the faker generator
        self.fake = faker.Faker()

        self.restaurant = restaurant
        self.ingredient = ingredient

        # The ingredient quantity
        self.quantity = self.fake.pydecimal(left_digits=5, right_digits=2, positive=True)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
