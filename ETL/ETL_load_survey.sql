USE uniLearn;
GO

SET IDENTITY_INSERT dbo.Dim_Survey ON;  
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (1, 'fulfilled');
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (2, 'not fulfilled');
SET IDENTITY_INSERT dbo.Dim_Survey OFF; 