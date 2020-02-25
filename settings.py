"""
    Settings file
"""

# MySQL informations
DB_NAME = 'ocpizza'
DB_USER = 'ocpizza'
DB_HOST = 'localhost'
DB_PWD = 'ocpizza'

# Language code for data
LANG_CODE = 'fr_FR'

# File for generating the SQL structure
SQL_STRUCTURE = 'OCPizza-structure.sql'

# Instance count for each object
CUSTOMERS_COUNT = 67
RESTAURANTS_COUNT = 4
ROLES = ['responsable', 'pizzaiolo', 'livreur']
EMPLOYEES_COUNT_MIN = 3
EMPLOYEES_COUNT_MAX = 5
INGREDIENTS_COUNT = 15
INGREDIENTS_UNITS = ['kg', 'g', 'l', 'cl', 'l', 'u', 'ml']
SIZES_COUNT = 3
CATEGORIES_COUNT = 15
PIZZA_COUNT = 20
STATUS = ['attente', 'préparation', 'prête', 'livraison', 'livrée']
PAYMENTS_TYPE_COUNT = 2
PAYMENTS_STATUS_COUNT = 2
ORDERS_COUNT_MIN = 0
ORDERS_COUNT_MAX = 4
ORDERS_LINES_COUNT_MIN = 1
ORDERS_LINES_COUNT_MAX = 6
