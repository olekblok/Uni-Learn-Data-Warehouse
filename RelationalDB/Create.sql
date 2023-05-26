CREATE TABLE Faculties (
	Faculty_ID int CHECK (Faculty_ID > 0) NOT NULL,
	[Name] varchar(50) NOT NULL,
	PRIMARY KEY (Faculty_ID)
	);
CREATE TABLE Tutors (
	Tutor_ID int CHECK(Tutor_ID > 0) NOT NULL,
	LastName varchar(255) CHECK(LastName NOT LIKE '%[^A-Z]%') NOT NULL,
    FirstName varchar(255) CHECK(FirstName NOT LIKE '%[^A-Z]%') NOT NULL,
	Email varchar(255),
	PRIMARY KEY (Tutor_ID)
	);
CREATE TABLE Students (
	Student_ID int CHECK(Student_ID > 0) NOT NULL,
	LastName varchar(255) CHECK(LastName NOT LIKE '%[^A-Z]%') NOT NULL,
    FirstName varchar(255) CHECK(FirstName NOT LIKE '%[^A-Z]%') NOT NULL,
	Email varchar(255),
	Student_Index int
	PRIMARY KEY (Student_ID)
	);
	ALTER TABLE uniLearnDB.dbo.Students ADD CONSTRAINT UC_Students UNIQUE (LastName, FirstName, Email, Student_Index);
CREATE TABLE Courses (
	Course_ID int CHECK(Course_ID > 0) NOT NULL,
	[Name] varchar(50) NOT NULL,
	Number_of_hours int CHECK (Number_of_hours > 0),
	Faculty_ID int NOT NULL,
	PRIMARY KEY (Course_ID),
	FOREIGN KEY (Faculty_ID) REFERENCES FacultIes(Faculty_ID),
	);
CREATE TABLE Teachings (
	Tutor_ID int CHECK(Tutor_ID > 0) NOT NULL,
	Course_ID int CHECK(Course_ID > 0) NOT NULL,
	PRIMARY KEY (Tutor_ID,Course_ID),
	FOREIGN KEY (Tutor_ID) REFERENCES Tutors(Tutor_ID),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
	);
	
CREATE TABLE Enrollments (
	Enrollment_ID int CHECK(Enrollment_ID > 0) NOT NULL,
	Date_of_Start datetime,
	Grade float CHECK(Grade >= 2.0 AND Grade <=5.0) NOT NULL,
	Percentage_of_Complitness float CHECK(Percentage_of_Complitness >= 0  and Percentage_of_Complitness <= 100),
	Date_of_Complitness datetime,
	Student_ID int CHECK(Student_ID > 0) NOT NULL,
	Course_ID int CHECK(Course_ID > 0) NOT NULL,
	PRIMARY KEY (Enrollment_ID),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
	FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
	);
CREATE TABLE Quizzes (
	Quiz_ID int CHECK(Quiz_ID > 0) NOT NULL,
	Course_ID  int CHECK(Course_ID > 0) NOT NULL,
	PRIMARY KEY (Quiz_ID),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
	);
CREATE TABLE Tasks (
	Task_ID int CHECK (Task_ID > 0) NOT NULL,
	Course_ID  int CHECK(Course_ID > 0) NOT NULL,
	PRIMARY KEY (Task_ID),
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
	);
CREATE TABLE Quiz_result (
	Quiz_result_ID int CHECK(Quiz_result_ID > 0) NOT NULL,
	Date_of_Submission date CHECK (Date_of_Submission < GETDATE()),
	Score float CHECK(Score >= 2.0 AND Score <=5.0) NOT NULL,
	Quiz_ID int CHECK(Quiz_ID > 0) NOT NULL,
	Enrollment_ID int CHECK(Enrollment_ID > 0) NOT NULL,
	PRIMARY KEY (Quiz_result_ID),
	FOREIGN KEY (Enrollment_ID) REFERENCES Enrollments(Enrollment_ID),
	FOREIGN KEY (Quiz_ID) REFERENCES Quizzes(Quiz_ID)
	);
CREATE TABLE Tasks_result (
	Tasks_result_ID int CHECK(Tasks_result_ID > 0) NOT NULL,
	Date_of_Submission date CHECK (Date_of_Submission < GETDATE()),
	Score float CHECK(Score >= 2.0 AND Score <=5.0) NOT NULL,
	Task_ID int CHECK(Task_ID > 0) NOT NULL,
	Enrollment_ID int CHECK(Enrollment_ID > 0) NOT NULL,
	PRIMARY KEY (Tasks_result_ID),
	FOREIGN KEY (Enrollment_ID) REFERENCES Enrollments(Enrollment_ID),
	FOREIGN KEY (Task_ID) REFERENCES Quizzes(Quiz_ID)
	);