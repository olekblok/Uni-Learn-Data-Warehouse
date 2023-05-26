import random
import csv

adjectives = ["Advanced", "Introduction to", "Principles of", "Computational", "Topics in", "Stochastic", "Numerical",
              "Mathematical", "Real", "Information", "Combinatorics", "Deep", "Applied", "Modern", "Foundations of",
              "Statistical", "Algebraic", "Geometric", "Complex", "Differential"]
nouns = ["Calculus", "Algebra", "Geometry", "Mechanics", "Data Science", "Linear Programming", "Neuroscience",
         "Modeling", "Probability Theory", "Methods", "Equations", "Number Theory", "Optimization", "Machine Learning",
         "Topology", "Physics", "Graph Theory", "Processes", "Inference", "Regression Analysis","Programming", "Statistics",
         "Databases", "Physics", "Informatics"]

faculties = range(1, 12)  # range 1-11

course_names = []
ind = 0
for i in range(20):
    for j in range(25):
        faculty = random.choice(faculties)
        for k in range(1,3):
            ind+=1
            name = adjectives[i] + " " + nouns[j] + f" {k}"
            hours = random.randint(15, 120)

            course_names.append({"id": ind, "name": name, "hours": hours, "faculty": faculty})

with open('courses.csv', mode='w', newline='') as courses_file:
    fieldnames = ['id', 'name', 'hours', 'faculty']
    writer = csv.DictWriter(courses_file, fieldnames=fieldnames)

    writer.writeheader()
    for course in course_names:
        writer.writerow(course)