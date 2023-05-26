SELECT * FROM Dim_Student order by Dim_Student.Student_Index

UPDATE Dim_Student
SET EndTime = NULL, IsCurrent =1
WHERE ID_Student = 10001

SELECT * FROM vETLDimStudentData
--new insert 
INSERT INTO uniLearnDB.dbo.Students VALUES(10002,'Rorewbert','Rodrifsdguez', 'laeura2g57@example.net',100001)

INSERT INTO uniLearnDB.dbo.Enrollments VALUES(5000001,'2015-10-23 00:09:04.000',3, 100,'2016-02-09 00:09:04.000',10001,12)

SELECt * from uniLearnDB.dbo.Enrollments
order by Student_ID
--update 
UPDATE uniLearnDB.dbo.Students 
SET Email = 'fsdfdsf@gmail.com'
WHERE Student_Index = 9999



SELECT * FROM uniLearnDB.dbo.Students order by Student_Index

DELETE FROM uniLearnDB.dbo.Students WHERE  Student_ID > 10000;