declare @AddressBook table(ID int, FullName nvarchar(50), FullAddress nvarchar(100), Postcode nvarchar(10), PhoneNumber nvarchar(50), Relation nvarchar(50))

/*
** created by Alex Newsham
** created on 14/10/2024
** purpose: to provide a means in SQL Server to split strings into a readable wide table of columns
** FullName values are fictional - they are the names of characters in William Faulkner's novel 'As I Lay Dying'
*/

INSERT INTO @AddressBook(ID, FullName, FullAddress, Postcode, PhoneNumber, Relation)
VALUES (1, 'Addie, M, Bundren, Sr', '24 Accacia Avenue, Sometown, WestSomewhere, XM22 1PA','XM22 1PA', '01202-555-118', 'Mother')
     , (2, 'Anse, S, Bundren, Sr', '34 Accacia Avenue, Sometown, WestSomewhere, XM22 1PA','XM22 1PA', '01202-555-195', 'Father')
     , (3, 'Cash, L, Bundren', '61 Accacia Avenue, Sometown, WestSomewhere, XM22 1PA','XM22 1PA', '01202-555-192', 'Son') 
     , (4, 'Darl, R, Bundren, Esq', '24 Eglantine Avenue, Sometown, WestSomewhere, XM22 1PB','XM22 1PB', '01202-555-141', 'Son')
     , (5, 'Jewel, D, Bundren, Jr','29 Eglantine Avenue, Sometown, WestSomewhere, XM22 1PB','XM22 1PB', '01202-555-137', 'Son')
	 , (5, 'Dewey, Dell, Bundren, Jr', '24 Rosemary Place, Sometown, WestSomewhere, XM22 0LK','XM22 0LK', '01202-555-137', 'Daughter')

/*
** sense check data
*/
select * 
from @AddressBook

/*
** Split strings into columns
*/
SELECT 
   ID
   -- The following section breaks down the "FullName" column into three columns.
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullName), ',', '.'), 1)) AS FirstName
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullName), ',', '.'), 2)) AS MiddleName
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullName), ',', '.'), 3)) AS LastName
   -- The following section breaks down the "FullAddress" column into four columns.
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullAddress), ',', '.'), 1)) AS Street
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullAddress), ',', '.'), 2)) AS City
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullAddress), ',', '.'), 3)) AS State
   , REVERSE(PARSENAME(REPLACE(REVERSE(FullAddress), ',', '.'), 4)) AS Postcode
   -- The following section breaks down the "empPhone" column into three columns
   , REVERSE(PARSENAME(REPLACE(REVERSE(PhoneNumber), '-', '.'), 1)) AS AreaCode
   , REVERSE(PARSENAME(REPLACE(REVERSE(PhoneNumber), '-', '.'), 2)) AS FirstThree
   , REVERSE(PARSENAME(REPLACE(REVERSE(PhoneNumber), '-', '.'), 3)) AS LastFour
   , Relation
FROM @AddressBook

