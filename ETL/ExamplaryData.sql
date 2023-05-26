
use uniLearn
go

Declare @StartDate date;
Declare @EndDate date;

SELECT @StartDate = '2015-01-01', @EndDate = '2017-12-31';

Declare @DateInProcess datetime = @StartDate;
While @DateInProcess <= @EndDate
	Begin
	Insert Into [dbo].[Dim_Date]
	([Date]
		, [Year]
		, [Month]
		, [MonthNo]
		, [DayOfWeek]
		, [DayOfWeekNo]
	)
	Values (
	@DateInProcess -- [Date]
		  , Cast( Year(@DateInProcess) as varchar(4)) -- [Year]
		  , Cast( DATENAME(month, @DateInProcess) as varchar(10)) -- [Month]
		  , Cast( Month(@DateInProcess) as int) -- [MonthNo]
		  , Cast( DATENAME(dw,@DateInProcess) as varchar(15)) -- [DayOfWeek]
		  , Cast( DATEPART(dw, @DateInProcess) as int) -- [DayOfWeekNo]
		  );
		Set @DateInProcess = DateAdd(d, 1, @DateInProcess);
	End
go

SET IDENTITY_INSERT dbo.Dim_Time ON;  

insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (-1, NULL, 'unknown');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (1, 0, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (2, 1, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (3, 2, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (4, 3, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (5, 4, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (6, 5, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (7, 6, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (8, 7, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (9, 8, 'from 0 to 8');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (10, 9, 'from 9 to 12');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (11, 10, 'from 9 to 12');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (12, 11, 'from 9 to 12');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (13, 12, 'from 9 to 12');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (14, 13, 'from 13 to 15');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (15, 14, 'from 13 to 15');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (16, 15, 'from 13 to 15');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (17, 16, 'from 16 to 20');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (18, 17, 'from 16 to 20');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (19, 18, 'from 16 to 20');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (20, 19, 'from 16 to 20');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (21, 20, 'from 16 to 20');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (22, 21, 'from 21 to 23');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (23, 22, 'from 21 to 23');
insert into Dim_Time (ID_Time, Hour, TimeOfDay) values (24, 23, 'from 21 to 23');
SET IDENTITY_INSERT dbo.Dim_Time OFF; 

SET IDENTITY_INSERT dbo.Dim_Survey ON;  
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (-1, 'unknown');
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (1, 'fulfilled');
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (2, 'not fulfilled');
SET IDENTITY_INSERT dbo.Dim_Survey OFF; 

SET IDENTITY_INSERT dbo.Dim_Student ON; 
INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email,IsCurrent,StartTime, EndTime) VALUES (-1, 'unknown', 'unknown', 'unknown',NULL, NULL, NULL);
SET IDENTITY_INSERT dbo.Dim_Student OFF; 

SET IDENTITY_INSERT dbo.Dim_Date ON; 
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo) VALUES (-1, null, null, 'unknown', NULL, 'unknown', NULL);
SET IDENTITY_INSERT dbo.Dim_Date OFF; 


SET IDENTITY_INSERT dbo.Dim_Tutor ON; 
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (-1, 'unknown', 'unknown');
SET IDENTITY_INSERT dbo.Dim_Tutor OFF; 

SET IDENTITY_INSERT dbo.Dim_Faculty ON; 
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (-1, 'unknown');
SET IDENTITY_INSERT dbo.Dim_Faculty OFF; 

SET IDENTITY_INSERT dbo.Dim_Course ON; 
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (-1,'unknown', 'unknown', NULL);
SET IDENTITY_INSERT dbo.Dim_Course OFF; 

y
INSERT INTO Fact_Enrollment (Grade, ID_StartDate, ID_FinishDate, ID_Course, ID_Student, ID_Survey, ID_TIME, CompletitionPercentage, ContentRate, TimeRate, HardnessRate, ToutorRate) VALUES
( 4.5, 1, 2, 1, 1, 1, 1, 80, 9, 8, 7, 9),
( 3.5, 3, 4, 2, 2, 2, 2, 60, 6, 7, 5, 6),
( 2.0, 2, 5, 3, 3, 3, 3, 75, 7, 8, 6, 7),
( 4.0, 1, 3, 4, 4, 4, 4, 90, 9, 9, 8, 9);

INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (1, 2);
INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (2, 1);
INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (3, 3);
