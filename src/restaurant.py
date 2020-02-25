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
            - phone_number
            - address
    """
    restaurants = list()

    def __init__(self, lang_code):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        # The restaurant's name
        restaurants_names = [restaurant.name for restaurant in Restaurant.restaurants]
        while True:
            self.name = self.fake.company()
            if self.name not in restaurants_names:
                break

        # The restaurant's phone number
        self.phone_number = self.fake.phone_number()

        # The restaurant's address
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

        Stock.stocks.append(self)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
