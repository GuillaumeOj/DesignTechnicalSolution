"""
    Module for generate fake addresses
"""
import faker


class Address: # pylint: disable=too-few-public-methods
    """
        Create an address for filling the database
        Attributes:
            - street_number
            - street_name
            - city
            - postal_code
        Optionnal attribute:
            - additional_details
    """

    def __init__(self, lang_code, optional_address=False, additional_details=False):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        self.street_number = str()
        self.street_name = str()
        self.city = str()
        self.postal_code = str()
        self.additional_details = str()

        if (optional_address and self.fake.pybool()) or not optional_address:
            self.street_number = self.fake.building_number()
            self.street_name = self.fake.street_name()
            self.city = self.fake.city()
            self.postal_code = self.fake.postcode()

        if additional_details and self.fake.pybool():
            self.additional_details = self.fake.paragraph(nb_sentences=2)


if __name__ == '__main__':
    print('Please don\'nt load me alone!')
