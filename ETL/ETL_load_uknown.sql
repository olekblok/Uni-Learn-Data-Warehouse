use uniLearn
go

SET IDENTITY_INSERT dbo.Dim_Survey ON;  
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (-1, 'unknown');
SET IDENTITY_INSERT dbo.Dim_Survey OFF; 

--- execute after loading all dimensions
SET IDENTITY_INSERT dbo.Dim_Date ON; 
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo) VALUES (-1, null, null, 'unknown', NULL, 'unknown', NULL);
SET IDENTITY_INSERT dbo.Dim_Date OFF; 

SET IDENTITY_INSERT dbo.Dim_Student ON; 
INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email,IsCurrent,StartTime, EndTime) VALUES (-1, 'unknown', 'unknown', 'unknown',NULL, NULL, NULL);
SET IDENTITY_INSERT dbo.Dim_Student OFF; 

SET IDENTITY_INSERT dbo.Dim_Tutor ON; 
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (-1, 'unknown', 'unknown');
SET IDENTITY_INSERT dbo.Dim_Tutor OFF; 

SET IDENTITY_INSERT dbo.Dim_Faculty ON; 
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (-1, 'unknown');
SET IDENTITY_INSERT dbo.Dim_Faculty OFF; 

SET IDENTITY_INSERT dbo.Dim_Course ON; 
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (-1,'unknown', 'unknown', NULL);
SET IDENTITY_INSERT dbo.Dim_Course OFF; 

SET IDENTITY_INSERT dbo.Dim_Time ON;  
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (-1, NULL, 'unknown');
SET IDENTITY_INSERT dbo.Dim_Time OFF; 