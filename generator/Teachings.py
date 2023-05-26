import csv
import random

# Generate a list of tutor IDs
tutor_ids = [str(i) for i in range(1, 1001)]

# Generate a list of course numbers from 1 to 1000
course_numbers = list(range(1, 1001))

# Shuffle the list of tutor IDs
random.shuffle(tutor_ids)

# Create a list to store the data
data = []

# Assign tutors to courses
for course_number in course_numbers:
    tutors_assigned = random.sample(tutor_ids, random.randint(1, 5))
    for tutor_id in tutors_assigned:
        data.append([tutor_id, course_number])

# Write the data to a CSV file
with open('tutor_course_assignments.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Tutor ID', 'Course Number'])
    writer.writerows(data)