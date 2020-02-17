"""
    Module for generate a random email
"""
import faker
import unidecode


class Email: # pylint: disable=too-few-public-methods
    """
        Create a random email
        Attribute:
            - email
    """

    def __init__(self, lang_code, first_name, last_name):
        # Initialize the faker generator
        self.fake = faker.Faker(lang_code)

        email_domain = self.fake.domain_name()

        unaccented_first_name = unidecode.unidecode(first_name).lower()
        unaccented_last_name = unidecode.unidecode(last_name).lower()

        self.email = f'{unaccented_first_name}.{unaccented_last_name}@{email_domain}'

if __name__ == '__main__':
    print('Please don\'nt load me alone!')
