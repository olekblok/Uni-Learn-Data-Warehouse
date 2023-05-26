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