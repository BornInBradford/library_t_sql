USE master
GO


declare @msg nvarchar(200), @nrows varchar(20)

declare @t1 table (id int identity(1,1), colourname varchar(20))
insert into @t1(colourname)
values('Red'),('Orange'),('Yellow'),('Green'),('Blue'),('Indigo'),('Violet')

set @nrows = (select @@rowcount as rowsinserted)

set @msg = N'You have just inserted ' + @nrows + ' rows of data!'

select * from @t1
select @msg as result



