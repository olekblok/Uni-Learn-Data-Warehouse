import csv
import random
from datetime import datetime, timedelta

# Set up the CSV file and field names
filename_enrol = "Enrollments.csv"
fieldnames_enrol = ["ID", "Date of start", "Grade", "Percentage of completion", "Completion date", "StudentID", "CourseID"]

task_res = "Task_results.csv"
fieldnames_task_res = ["ID", "Date of submission", "Grade", "Task_ID","Enrollment_ID"]

filename_quiz_res = "Quiz_results.csv"
fieldnames_quiz_res = ["ID", "Date of submission", "Grade", "Quiz_ID", "Enrollment_ID"]

# Generate 500000 rows of data
enrollments_rows = 500000
start_date = datetime(2015, 1, 1, 0, 0, 0)
end_date = datetime(2016, 12, 31, 23, 59, 59)
with open(filename_enrol, "w", newline="") as csvfile,open(task_res, "w", newline="") as task_csv,open(filename_quiz_res, "w", newline="") as quiz_csv:
    writer_enr = csv.DictWriter(csvfile, fieldnames=fieldnames_enrol)
    writer_enr.writeheader()
    writer_task = csv.DictWriter(task_csv, fieldnames=fieldnames_task_res)
    writer_task.writeheader()
    writer_quiz = csv.DictWriter(quiz_csv, fieldnames=fieldnames_quiz_res)
    writer_quiz.writeheader()

    for i in range(1, enrollments_rows+1):
        sum = 0
        if i > 250000:
            start_date = datetime(2016, 1, 1, 0, 0, 0)
            end_date = datetime(2017, 12, 31, 23, 59, 59)
        # Generate random data for each row
        date_start = start_date + timedelta(days=random.randint(0, 365), hours=random.randint(0, 23), minutes=random.randint(0, 59), seconds=random.randint(0, 59))
        grade = random.randint(2, 5)

        percent_complete = random.randint(0, 100)
        if random.random() < 0.5:
            percent_complete = 100

        student_id = random.randint(1, 10000)
        course_id = random.randint(1, 1000)

        # Write the row to the CSV file
        date_complete = date_start + timedelta(days=random.randint(103, 200), hours=random.randint(0, 23), minutes=random.randint(0, 59), seconds=random.randint(0, 59))
        for j in range(1, 5):
            grade = random.randint(2, 5)
            sum+=grade
            ass_submission_date = date_start + timedelta(days=random.randint(0, 100), hours=random.randint(0, 23), minutes=random.randint(0, 59), seconds=random.randint(0, 59))
            while True:
                ass_submission_date = date_start + timedelta(days=random.randint(0, 100), hours=random.randint(0, 23), minutes=random.randint(0, 59), seconds=random.randint(0, 59))
                if ass_submission_date < date_complete:
                    break
            assigment_id = ((i - 1) * 4) + j
            task_id = ((course_id - 1) * 4) + j
            writer_task.writerow({
                "ID": assigment_id,
                "Date of submission": ass_submission_date.strftime("%Y-%m-%d"),
                "Grade": grade,
                "Enrollment_ID": i,
                "Task_ID": task_id

            })
            task_submission_date = date_start + timedelta(days=random.randint(0, 100))
            while True:
                task_submission_date = date_start + timedelta(days=random.randint(0, 100))
                if task_submission_date < date_complete:
                    break
            grade = random.randint(2, 5)
            sum+=grade
            writer_quiz.writerow({
                "ID": assigment_id,
                "Date of submission": task_submission_date.strftime("%Y-%m-%d"),
                "Grade": grade,
                "Enrollment_ID": i,
                "Quiz_ID": task_id

            })
        date_complete = date_start + timedelta(days=random.randint(103, 200))
        if round((sum / 8) * 2) / 2 < 3:

            date_complete =None
        writer_enr.writerow({
            "ID": i,
            "Date of start": date_start.strftime("%Y-%m-%d %H:%M:%S"),
            "Grade": round((sum / 8) * 2) / 2,
            "Percentage of completion": percent_complete,
            "Completion date": date_complete.strftime("%Y-%m-%d %H:%M:%S") if date_complete else "",
            "StudentID": student_id,
            "CourseID": course_id
        })




