use uniLearn;
go

If (object_id('TEMP') is not null) Drop table TEMP;
go
CREATE  TABLE TEMP(
  action varchar(20),
  LastName VARCHAR(55),
  FirstName VARCHAR(55),
  Email VARCHAR(60),
  Stundent_Index Integer
);


If (object_id('vETLDimStudentData') is not null) Drop View vETLDimStudentData;
go
CREATE VIEW vETLDimStudentData
AS
SELECT
	LastName as [c1],
	FirstName as [c2],
	Email as [c3],
	1 AS [c4], 
	'2015-01-01' as [c5],
	NULL as[c6],
	Student_Index as [c7]
FROM uniLearnDB.dbo.Students;
GO

MERGE INTO Dim_Student as TT
USING vETLDimStudentData as ST
	ON  TT.Student_Index = ST.[c7]
	WHEN NOT MATCHED  THEN
		INSERT (LastName, FirstName, Email, IsCurrent, StartTime, EndTime, Student_Index)
		VALUES (ST.[c1], ST.[c2], ST.[c3], 1, '2015-01-01', NULL, ST.[c7])
	WHEN MATCHED AND TT.Email <> ST.[c3] AND TT.isCurrent !=0   THEN
		UPDATE SET IsCurrent = 0, EndTime = CAST(GETDATE() AS DATE)
	WHEN Not Matched BY Source AND TT.Student_Index != '-1' THEN
	UPDATE SET IsCurrent = 0, EndTime = CAST(GETDATE() AS DATE);


 DECLARE @today DATE = CAST(GETDATE() AS DATE);

INSERT INTO Dim_Student(
  LastName,
  FirstName,
  Email,
  IsCurrent,
  StartTime,
  EndTime,
  Student_Index
	)
		SELECT 
		c1,
		c2,
		c3,
		1,
		@today,
		NULL,
		c7
		FROM vETLDimStudentData
				EXCEPT
				SELECT 
				LastName,
				FirstName,
				Email,
				1,
				@today,
				NULL,
				Student_Index
					FROM Dim_Student;




DROP VIEW vETLDimStudentData;
