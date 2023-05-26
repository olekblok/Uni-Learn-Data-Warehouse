import csv

# Define the file name and headers
file_name = "quizes.csv"
headers = ["Quiz_ID", "Course_ID"]

# Open the file for writing and write the headers
with open(file_name, "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(headers)

    # Loop through the courses and tasks, writing each row to the CSV
    for course_id in range(1, 1001):
        for quiz_num in range(1, 5):
            quiz_id = ((course_id - 1) * 4) + quiz_num
            row = [quiz_id, course_id]
            writer.writerow(row)
