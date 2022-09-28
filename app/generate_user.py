from faker import Faker

fake_core = Faker()


def generate_full_message():
    return f"""
User: {generate_user()} ({generate_email()})
Says: {generate_text()}
"""


def generate_user():
    return fake_core.name()


def generate_email():
    return fake_core.email()


def generate_text():
    return fake_core.text()
