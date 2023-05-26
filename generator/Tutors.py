from faker import Faker
import csv

fake = Faker()

# Generate 500 rows of data
num_rows = 1000
data = []
for i in range(1, num_rows+1):
    name = fake.first_name()
    surname = fake.last_name()
    email = fake.email()
    data.append([i, name, surname, email])

filename = "Tutors.csv"
with open(filename, "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["ID", "Name", "Surname", "Email"])
    writer.writerows(data)
