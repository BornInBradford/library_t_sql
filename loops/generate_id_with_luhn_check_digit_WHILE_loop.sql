use Utils
go

/*
** author: Alex Newsham
** created: 13/08/2021
** purpose: to auto-generate a table that generates, step by step, a alphanumeric study ID with a Luhn check digit
** warning: this procedure needs to work in tandem with the utils.get_luhn function - a create script for this function is bundled in the loops folder
*/

declare @IndexID int, @maxIndexID int, @iCount int

declare @index table (index_id int, id int, id_With_luhn_check_digit int, study_id char(10))

set @maxIndexID = 899999 -- 99999
set @iCount = 1

while @iCount <= @maxIndexID
begin
	insert into @index(index_id)
	select @iCount

	set @iCount = @iCount + 1
end

set @iCount = null

--select @iCount

/* create a set of identifiers from the index id */
update @Index
set Id = 100000 + index_id

/* add a check digit */
update @Index
set id_With_luhn_check_digit = [utils].[get_luhn](id)

/* add a prefix to creat an alphanumeric id*/
update @Index
set study_id = cast('P'+cast(id_With_luhn_check_digit as char) as Char(10))


/*
** display result
*/
select index_id, 
       id,
	   id_With_luhn_check_digit,
	   study_id
from @Index order by 1

/*
** sense check for duplicates!
*/
select study_id, count(*) as total
from @Index
group by study_id
having count(*) >1

