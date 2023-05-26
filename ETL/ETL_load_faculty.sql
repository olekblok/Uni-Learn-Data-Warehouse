USE uniLearn;
GO


IF OBJECT_ID('vETLDimFacultyData') IS NOT NULL
    DROP VIEW vETLDimFacultyData;
GO

CREATE VIEW vETLDimFacultyData
AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY Faculty_ID) AS ID_Faculty,
    [Name]
FROM uniLearnDB.dbo.Faculties;
GO

SET IDENTITY_INSERT dbo.Dim_Faculty ON; 


MERGE INTO Dim_Faculty AS TT
USING vETLDimFacultyData AS ST
    ON TT.Name = ST.Name
WHEN NOT MATCHED
    THEN
        INSERT (ID_Faculty,Name)
        VALUES (ST.ID_Faculty,ST.Name);
DROP VIEW vETLDimFacultyData;
SET IDENTITY_INSERT dbo.Dim_Faculty OFF; 

