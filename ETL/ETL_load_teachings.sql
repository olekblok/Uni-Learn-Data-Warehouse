USE uniLearn;
GO

IF (OBJECT_ID('vETLTeachingsData') IS NOT NULL)
    DROP VIEW vETLTeachingsData;
GO

CREATE VIEW vETLTeachingsData
AS
SELECT
    TC.Tutor_ID,
    TC.Course_ID
FROM uniLearnDB.dbo.Teachings AS TC




GO
SELECT * FROM  unilearn.dbo.Dim_Course
SELECT * FROM   uniLearn.dbo.Dim_Tutor
MERGE INTO Fact_Teachings AS FT
	USING (SELECT * FROM  vETLTeachingsData 
	JOIN  unilearn.dbo.Dim_Course AS C ON C.ID_Course = vETLTeachingsData.Course_ID
	JOIN  uniLearn.dbo.Dim_Tutor AS T ON T.ID_Tutor= vETLTeachingsData.Tutor_ID) 
	AS ET
		ON FT.ID_Tutor = ET.Tutor_ID AND FT.ID_Course = ET.Course_ID
	WHEN NOT MATCHED THEN
		INSERT (ID_Tutor, ID_Course)
		VALUES (ET.Tutor_ID, ET.Course_ID)
		;

DROP VIEW vETLTeachingsData;

