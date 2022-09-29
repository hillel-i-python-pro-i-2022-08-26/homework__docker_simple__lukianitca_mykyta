from faker import Faker

fake_core = Faker()


def generate_full_message():
    print(
        f"""
User: {generate_user()} ({generate_email()})
Says: {generate_text()}
"""
    )


def generate_user() -> str:
    return fake_core.name()


def generate_email() -> str:
    return fake_core.email()


def generate_text() -> str:
    return fake_core.text()
