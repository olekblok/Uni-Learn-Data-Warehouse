USE uniLearn;
GO

IF OBJECT_ID('vETLDimCourseData') IS NOT NULL
DROP VIEW vETLDimCourseData;
GO

CREATE VIEW vETLDimCourseData
AS
SELECT
C.Course_ID AS Course_ID,
C.Name AS course_name,
CASE
    WHEN C.Number_of_hours BETWEEN 15 AND 30 THEN '15-30'
    WHEN C.Number_of_hours BETWEEN 31 AND 45 THEN '31-45'
    WHEN C.Number_of_hours BETWEEN 46 AND 60 THEN '46-60'
    WHEN C.Number_of_hours BETWEEN 61 AND 75 THEN '61-75'
    WHEN C.Number_of_hours BETWEEN 76 AND 90 THEN '76-90'
    WHEN C.Number_of_hours BETWEEN 91 AND 105 THEN '91-105'
    WHEN C.Number_of_hours BETWEEN 106 AND 120 THEN '106-120'
END AS NumOfHours,
C.Faculty_ID
FROM uniLearnDB.dbo.Courses AS C;
GO

SET IDENTITY_INSERT dbo.Dim_Course ON; 
MERGE INTO Dim_Course AS T
USING (
    SELECT Course_ID, course_name, NumOfHours, Faculty_ID
    FROM vETLDimCourseData
    JOIN unilearn.dbo.Dim_Faculty AS F ON vETLDimCourseData.Faculty_ID = F.ID_Faculty
) AS S
ON T.ID_Course = S.Course_ID
    AND T.Name = S.course_name 
    AND T.NumOfHours = S.NumOfHours 
    AND T.ID_Faculty = S.Faculty_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_Course, Name, NumOfHours, ID_Faculty)
VALUES (S.Course_ID, S.course_name, S.NumOfHours, S.Faculty_ID);
SET IDENTITY_INSERT dbo.Dim_Course OFF; 
DROP VIEW vETLDimCourseData;