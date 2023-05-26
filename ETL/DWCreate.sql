use uniLearn
go

DROP TABLE Fact_Teachings;
DROP TABLE Fact_Enrollment;
DROP TABLE Dim_Course;
DROP TABLE Dim_Faculty;
DROP TABLE Dim_Tutor;
DROP TABLE Dim_Date;
DROP TABLE Dim_Time;
DROP TABLE Dim_Student;
DROP TABLE Dim_Survey;

DELETE FROM Fact_Teachings;
DELETE FROM Fact_Enrollment;
DELETE FROM Dim_Course;
DELETE FROM Dim_Faculty;
DELETE FROM Dim_Tutor;
DELETE FROM Dim_Date;
DELETE FROM Dim_Time;
DELETE FROM Dim_Student;
DELETE FROM Dim_Survey;

CREATE TABLE Dim_Survey (
  ID_Survey  NUMERIC IDENTITY(1,1) PRIMARY KEY,
  Status VARCHAR(14)
);

CREATE TABLE Dim_Student (
  ID_Student NUMERIC IDENTITY(1,1) PRIMARY KEY,
  LastName VARCHAR(55),
  FirstName VARCHAR(55),
  Email VARCHAR(60),
  IsCurrent BIT,
  StartTime DateTime,
  EndTime DateTime,
  Student_Index NUMERIC
);
ALTER TABLE Dim_Student ADD CONSTRAINT UC_Dim_Student UNIQUE (LastName, FirstName, Email,Student_Index);
CREATE TABLE Dim_Time (
  ID_Time NUMERIC IDENTITY(1,1) PRIMARY KEY,
  Hour NUMERIC,
  TimeOfDay VARCHAR(20)
);

CREATE TABLE Dim_Date (
  ID_Date NUMERIC IDENTITY(1,1) PRIMARY KEY,
  Date datetime unique,
  Year NUMERIC(4),
  Month VARCHAR(10),
  MonthNo NUMERIC,
  DayOfWeek VARCHAR(10) ,
  DayOfWeekNo NUMERIC
);

CREATE TABLE Dim_Tutor (
  ID_Tutor NUMERIC IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50)
);
CREATE TABLE Dim_Faculty (
  ID_Faculty NUMERIC IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(55)
  CONSTRAINT unique_name UNIQUE (Name)
);
CREATE TABLE Dim_Course (
  ID_Course NUMERIC IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(55),
  NumOfHours VARCHAR(20),
  ID_Faculty NUMERIC REFERENCES Dim_Faculty(ID_Faculty)
);
CREATE TABLE Fact_Enrollment (
  Grade DECIMAL(2,1) CHECK (Grade >= 2 AND Grade <= 5),
  ID_StartDate NUMERIC REFERENCES Dim_Date(ID_Date),
  ID_FinishDate NUMERIC REFERENCES Dim_Date(ID_Date),
  ID_Time NUMERIC REFERENCES Dim_Time(ID_Time),
  ID_Course NUMERIC REFERENCES Dim_Course(ID_Course),
  ID_Student NUMERIC REFERENCES Dim_Student(ID_Student),
  ID_Survey NUMERIC REFERENCES Dim_Survey(ID_Survey),
  CompletitionPercentage NUMERIC CHECK (CompletitionPercentage >= 0 AND CompletitionPercentage <= 100),
  ContentRate NUMERIC CHECK (ContentRate >= 0 AND ContentRate <= 10),
  TimeRate NUMERIC CHECK (TimeRate >= 0 AND TimeRate <= 10),
  HardnessRate NUMERIC CHECK (HardnessRate >= 0 AND HardnessRate <= 10),
  ToutorRate NUMERIC CHECK (ToutorRate >= 0 AND ToutorRate <= 10),
  CONSTRAINT composite_pk PRIMARY KEY (
		ID_Course,
		ID_Student, 
		ID_StartDate,		
		ID_FinishDate,
		ID_Time,
		ID_Survey
		)
);

CREATE TABLE Fact_Teachings (
  ID_Tutor NUMERIC REFERENCES Dim_Tutor(ID_Tutor),
  ID_Course NUMERIC REFERENCES Dim_Course(ID_Course)
  CONSTRAINT Teachings_PK PRIMARY KEY (ID_Tutor, ID_Course)
);
