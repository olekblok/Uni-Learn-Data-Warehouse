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



INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (1, 'fulfilled');
INSERT INTO Dim_Survey (ID_Survey, Status) VALUES (2, 'not fulfilled');



INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email) VALUES (1, 'Smith', 'John', 'john.smith@example.com',1);
INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email) VALUES (2, 'Garcia', 'Maria', 'maria.garcia@example.com',1);
INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email) VALUES (3, 'Kim', 'Ji-Hyun', 'ji-hyun.kim@example.com',1);
INSERT INTO Dim_Student (ID_Student, LastName, FirstName, Email) VALUES (4, 'Singh', 'Raj', 'raj.singh@example.com',1);


INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo, WorkingDay) VALUES (1, '2022-01-01', 2022, 'January', 1, 'Saturday', 6, 'day off');
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo, WorkingDay) VALUES (2, '2022-01-02', 2022, 'January', 1, 'Sunday', 7, 'day off');
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo, WorkingDay) VALUES (3, '2022-01-03', 2022, 'January', 1, 'Monday', 1, 'working day');
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo, WorkingDay) VALUES (4, '2022-01-04', 2022, 'January', 1, 'Tuesday', 2, 'working day');
INSERT INTO Dim_Date (ID_Date, Date, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo, WorkingDay) VALUES (5, '2022-01-05', 2022, 'January', 1, 'Wednesday', 3, 'working day');

INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (1, 'John', 'Doe');
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (2, 'Jane', 'Doe');
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (3, 'Bob', 'Smith');
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (4, 'Alice', 'Johnson');
INSERT INTO Dim_Tutor (ID_Tutor, FirstName, LastName) VALUES (5, 'Mike', 'Williams');



INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (1, 'Faculty of Science');
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (2, 'Faculty of Arts');
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (3, 'Faculty of Engineering');
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (4, 'Faculty of Medicine');
INSERT INTO Dim_Faculty (ID_Faculty, Name) VALUES (5, 'Faculty of Law');


INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (1,'Mathematics', '61-75', 1);
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (2,'Physics', '46-60', 1);
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (3,'History', '31-45', 2);
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (4,'Biology', '91-105', 3);
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (5,'Chemistry', '76-90', 3);
INSERT INTO Dim_Course (ID_Course, Name, NumOfHours, ID_Faculty) VALUES (6,'Literature', '15-30', 2);

INSERT INTO Fact_Enrollment (Grade, ID_StartDate, ID_FinishDate, ID_Course, ID_Student, ID_Survey, ID_TIME, CompletitionPercentage, ContentRate, TimeRate, HardnessRate, ToutorRate) VALUES
( 4.5, 1, 2, 1, 1, 1, 1, 80, 9, 8, 7, 9),
( 3.5, 3, 4, 2, 2, 2, 2, 60, 6, 7, 5, 6),
( 2.0, 2, 5, 3, 3, 3, 3, 75, 7, 8, 6, 7),
( 4.0, 1, 3, 4, 4, 4, 4, 90, 9, 9, 8, 9);

INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (1, 2);
INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (2, 1);
INSERT INTO Fact_Teachings (ID_Tutor, ID_Course) VALUES (3, 3);
