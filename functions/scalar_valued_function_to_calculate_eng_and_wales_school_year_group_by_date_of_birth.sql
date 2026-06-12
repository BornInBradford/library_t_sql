use Util
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================================================================================================================================
-- Created by: Alex Newsham
-- Create on: 12/06/2026
-- Purpose:	To calculate the academic year group for a given data of birth on the basis of the current year, where the age is disqualified as 
--          pre-school or post-school where out of scope i.e. <4 or >18 years of age
-- ====================================================================================================================================================================================
CREATE FUNCTION dbo.get_school_year_group
(
	-- function parameter(s)
	@DoB date = null
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare internal variables
	DECLARE @curYear char(4), @YearGroup int, @YearGroupResult varchar(50)

	set @curYear = year(getdate())

	-- get school year group
	set @YearGroup = (select case when MONTH(@DoB) <= 8 then @curYear - YEAR(@DoB) -5
     							  else @curYear - YEAR(@DoB) -6
							  end 
					  )
	-- get the result to return
	set @YearGroupResult = cast((select case when @YearGroup <= -1 then 'Pre-School age'
										when @YearGroup > 13 then 'Post-school age'
										when @YearGroup = 0 then 'Reception'
										else cast(@YearGroup as varchar(20))
										end)
								 as varchar(20))


	-- Return the result of the function
	RETURN @YearGroupResult

END
GO

