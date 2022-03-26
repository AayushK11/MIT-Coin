from .models import User, StudentProfile

def make_students():


    for i in range(30):

        user = User.objects.create_user(
            email=f"email{i}@mit.com",
            password="password",
            role="student",
            wallet_balance=100.0,
            transaction_pin="1234",
        )

        StudentProfile.objects.create(
            owner=user,
            first_name=f"f_name_{i}",
            last_name=f"l_name_{i}",
        )

    # manual users
    user = User.objects.create_user(
        email=f"tejas@mit.com",
        password="password",
        role="student",
        wallet_balance=100.0,
        transaction_pin="1234",
    )

    StudentProfile.objects.create(
        owner=user,
        first_name=f"Tejas",
        last_name=f"Mandre",
    )

    # manual user
    user = User.objects.create_user(
        email=f"anant@mit.com",
        password="password",
        role="student",
        wallet_balance=100.0,
        transaction_pin="1234",
    )

    StudentProfile.objects.create(
        owner=user,
        first_name=f"Anant",
        last_name=f"Mokashi",
    )
    user = User.objects.create_user(
        email=f"shantanu@mit.com",
        password="password",
        role="student",
        wallet_balance=100.0,
        transaction_pin="1234",
    )

    StudentProfile.objects.create(
        owner=user,
        first_name=f"Shantanu",
        last_name=f"Patil",
    )

    user = User.objects.create_user(
        email=f"aayush@mit.com",
        password="password",
        role="student",
        wallet_balance=100.0,
        transaction_pin="1234",
    )

    StudentProfile.objects.create(
        owner=user,
        first_name=f"Aayush",
        last_name=f"Kumaria",
    )