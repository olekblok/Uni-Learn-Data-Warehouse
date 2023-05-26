import random

import csv

# Define the file name and headers
file_name = "course_feedback.csv"
headers = ['EnrollmentID', 'HardnessRate', 'ContentRate', 'TutorRate', 'HourRate']

# Open the file for writing and write the headers
with open(file_name, "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(headers)

    # Loop through the courses and tasks, writing each row to the CSV
    for i in range(1, 100001):
        enrollment_id = i * 5
        course_difficulty = random.randint(1, 10)
        content_rating = random.randint(1, 10)
        tutor_cooperation = random.randint(1, 10)
        hours_rating = random.randint(1, 10)
        row = [enrollment_id, course_difficulty,content_rating,tutor_cooperation,hours_rating]
        writer.writerow(row)
