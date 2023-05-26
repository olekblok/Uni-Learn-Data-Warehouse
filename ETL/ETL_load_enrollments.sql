USE uniLearn;
GO

IF (object_id('dbo.SurveyTemp') is not null) DROP TABLE dbo.SurveyTemp;
CREATE TABLE dbo.SurveyTemp(
	ID_Enrollment int NOT NULL,
	ContentRate NUMERIC CHECK (ContentRate >= 0 AND ContentRate <= 10),
	TimeRate NUMERIC CHECK (TimeRate >= 0 AND TimeRate <= 10),
	HardnessRate NUMERIC CHECK (HardnessRate >= 0 AND HardnessRate <= 10),
	TutorRate NUMERIC CHECK (TutorRate >= 0 AND TutorRate <= 10)
	PRIMARY KEY(ID_Enrollment)
	);
go

BULK INSERT dbo.SurveyTemp
	FROM   'D:\WarehouseCp\generator\course_feedback.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n'
);	

If (object_id('vETLFEnrollments') is not null) Drop view vETLFEnrollments;
go
CREATE VIEW vETLFEnrollments
AS
SELECT 
	Grade
	, ID_StartDate
	, ID_FinishDate
	, ID_Time
	, ID_Course
	, ID_Student
	, ID_Survey
	, CompletitionPercentage
	, ContentRate
	, TimeRate
	, HardnessRate
	, TutorRate
FROM 
	(SELECT 
		Grade =  EN1.Grade
		, ID_StartDate = SD.ID_Date
		, ID_FinishDate = CASE WHEN FD.ID_Date  IS NOT NULL THEN FD.ID_Date ELSE -1 END
		, ID_Time = dbo.Dim_Time.ID_Time
		, ID_Course = EN1.Course_ID
		, ID_Student = EN1.Student_ID
		, ID_Survey = CASE WHEN SurTemp.ID_Enrollment IS NOT NULL THEN 1 ELSE 2 END
		, CompletitionPercentage = EN1.Percentage_of_Complitness
		, ContentRate = CASE WHEN SurTemp.ContentRate  IS NOT NULL THEN SurTemp.ContentRate ELSE 0 END
		, TimeRate = CASE WHEN SurTemp.TimeRate  IS NOT NULL THEN SurTemp.TimeRate ELSE 0 END
		, HardnessRate = CASE WHEN SurTemp.HardnessRate  IS NOT NULL THEN SurTemp.HardnessRate ELSE 0 END
		, TutorRate = CASE WHEN SurTemp.TutorRate  IS NOT NULL THEN SurTemp.TutorRate ELSE 0 END
	FROM uniLearnDB.dbo.Enrollments as EN1
	JOIN  unilearn.dbo.Dim_Student AS S ON S.ID_Student = EN1.Student_ID
	JOIN  unilearn.dbo.Dim_Course AS C ON C.ID_Course = EN1.Course_ID
	FULL  JOIN dbo.SurveyTemp AS SurTemp ON SurTemp.ID_Enrollment = EN1.Enrollment_ID
	JOIN dbo.Dim_Date AS SD ON CONVERT(VARCHAR(10), SD.Date, 111) = CONVERT(VARCHAR(10), EN1.Date_of_Start, 111)
	FULL JOIN dbo.Dim_Date as FD ON CONVERT(VARCHAR(10), FD.Date, 111) = CONVERT(VARCHAR(10), EN1.Date_of_Complitness, 111)
	JOIN dbo.Dim_Time ON dbo.Dim_Time.Hour = DATEPART(Hour, EN1.Date_of_Start)
	) AS E

GO


MERGE INTO Fact_Enrollment as TT
	USING vETLFEnrollments as ST
		ON 	
			TT.Grade = ST.Grade
		AND TT.ID_StartDate = ST.ID_StartDate
		AND TT.ID_FinishDate = ST.ID_FinishDate
		AND TT.ID_Time = ST.ID_Time
		AND TT.ID_Course = ST.ID_Course
		AND TT.ID_Student = ST.ID_Student
		AND TT.ID_Survey = ST.ID_Survey
		AND TT.CompletitionPercentage = ST.CompletitionPercentage
		AND TT.ContentRate = ST.ContentRate
		AND TT.TimeRate = ST.TimeRate
		AND TT.HardnessRate = ST.HardnessRate
		AND TT.ToutorRate = ST.TutorRate
		WHEN NOT MATCHED THEN
			INSERT VALUES (
				ST.Grade
				, ST.ID_StartDate
				, ST.ID_FinishDate
				, ST.ID_Time
				, ST.ID_Course
				, ST.ID_Student
				, ST.ID_Survey
				, ST.CompletitionPercentage
				, ST.ContentRate
				, ST.TimeRate
				, ST.HardnessRate
				, ST.TutorRate
			);

Drop view vETLFEnrollments;

Select * From Fact_Enrollment ORDER by ID_Student