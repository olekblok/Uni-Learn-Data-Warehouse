import random
import csv


faculties = ["Faculty of Arts", "Faculty of Science", "Faculty of Business Administration",
             "Faculty of Education", "Faculty of Engineering", "Faculty of Law", "Faculty of Medicine",
             "Faculty of Pharmacy", "Faculty of Social Sciences", "Faculty of Fine Arts", "Faculty of Environmental Studies"]



faculty_names = []

for i in range(11):
    name = faculties[i]
    faculty_names.append({"id": i + 1, "name": name})

with open('faculties.csv', mode='w', newline='') as faculties_file:
    fieldnames = ['id', 'name']
    writer = csv.DictWriter(faculties_file, fieldnames=fieldnames)

    writer.writeheader()
    for faculty in faculty_names:
        writer.writerow(faculty)