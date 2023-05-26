use uniLearn
go
SELECT COUnt(*) FROM Fact_Teachings;
SELECT * FROM Fact_Enrollment
order by ID_Student
SELECT * FROM Dim_Course
ORDER BY ID_Course;
SELECT * FROM Dim_Faculty
ORDER BY ID_Faculty;
SELECT * FROM Dim_Tutor
ORDER BY ID_Tutor;
SELECT * FROM Dim_Date
ORDER BY ID_Date;
SELECT * FROM Dim_Time
ORDER BY ID_Time;
SELECT * FROM Dim_Student
ORDER BY Student_Index ;
SELECT * FROM Dim_Survey
ORDER BY ID_Survey;