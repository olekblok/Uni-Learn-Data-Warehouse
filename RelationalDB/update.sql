INSERT INTO Enrollments VALUES(500001,'2016-07-22',4.0,100,'2016-11-09',9397,31)
INSERT INTO Enrollments VALUES(500002,'2015-07-22',4.5,50,'2016-02-02',6327,911)
INSERT INTO Enrollments VALUES(500003,'2016-06-22',2.0,100,'2016-12-04',537,231)
INSERT INTO Enrollments VALUES(500004,'2016-03-20',5.0,35,'2016-09-02',2397,918)
INSERT INTO Enrollments VALUES(500005,'2016-04-06',3.5,62,'2016-10-01',5397,353)


UPDATE Students SET Email = 'john.doe@gmail.com' WHERE Student_ID = 1;
UPDATE Students SET LastName = 'Smith' WHERE Student_ID = 2;
UPDATE Students SET FirstName = 'Emily' WHERE Student_ID = 3;
UPDATE Students SET Email = 'newemail@example.com' WHERE Student_ID = 5;
UPDATE Students SET FirstName = 'Jessica' WHERE  Student_ID = 8;
UPDATE Students SET LastName = 'Brown', Email = 'newemail@example.com' WHERE Student_ID = 4;
UPDATE Students SET Email = 'newemail@example.com' WHERE  Student_ID = 9;

UPDATE Enrollments
SET Date_of_Complitness = '2015-03-22',
Grade = 4
WHERE Enrollment_ID = 1;

UPDATE Enrollments
SET Completion_Percentage = 80
WHERE Enrollment_ID = 1;

UPDATE Enrollments
SET Date_of_Complitness = '2015-03-22',
Grade = 3
WHERE Enrollment_ID = 1;


UPDATE Enrollments
SET Grade = 3.5, Completion_Percentage = 70,
Date_of_Complitness = '2016-03-21'
WHERE Enrollment_ID = 2;


UPDATE Enrollments
SET Grade = 3.5, Completion_Percentage = 50,
Date_of_Complitness = '2015-03-20'
WHERE Enrollment_ID = 6;
