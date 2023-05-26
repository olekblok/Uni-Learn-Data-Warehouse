BULK INSERT dbo.Courses
	FROM   'D:\WarehouseCp\generator\courses.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=10000);	
BULK INSERT dbo.Enrollments
	FROM   'D:\WarehouseCp\generator\Enrollments.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=5000000);	
BULK INSERT dbo.Quiz_Result
	FROM   'D:\WarehouseCp\generator\Quiz_results.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=2000001);	
BULK INSERT dbo.Tasks_result
	FROM   'D:\WarehouseCp\generator\Task_results.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=2000001);	
BULK INSERT dbo.Tasks
	FROM  'D:\WarehouseCp\generator\tasks.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=4001);	
BULK INSERT dbo.Teachings
	FROM   'D:\WarehouseCp\generator\tutor_course_assignments.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=3000);	
BULK INSERT dbo.Faculties
	FROM   'D:\WarehouseCp\generator\faculties.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=11);	
BULK INSERT dbo.Quizzes
	FROM   'D:\WarehouseCp\generator\quizes.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=4000);	
BULK INSERT dbo.Tutors
	FROM   'D:\WarehouseCp\generator\Tutors.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=1000);
BULK INSERT dbo.Students
	FROM   'D:\WarehouseCp\generator\Students.csv'
	WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=10000);	

