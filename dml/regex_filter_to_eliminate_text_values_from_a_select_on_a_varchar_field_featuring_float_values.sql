declare @t1 table (id int identity(1,1), string_val varchar(100))

insert into @t1(string_val)
values('10.1'),('a booking error'), ('10.265'),('10.5'),('error')

select *
from @t1 
where string_val NOT LIKE '%[A-Z]%'
