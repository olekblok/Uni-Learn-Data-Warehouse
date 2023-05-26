from faker import Faker
import csv

fake = Faker()

# Generate 100000 rows of data
num_rows = 10000
data = []
for i in range(1, num_rows+1):
    name = fake.first_name()
    surname = fake.last_name()
    email = fake.email()
    data.append([i, name, surname, email, i])

# Write the data to a CSV file
filename = "Students.csv"
with open(filename, "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["ID", "Name", "Surname", "Email","Index"])
    writer.writerows(data)
