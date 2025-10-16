use [database name here]
go

/* ADD EXTENDED PROPERTY */

-- COMMENT IN TO BEGIN THE TRANSACTION AND TEST THE RESULT BEFORE SEPARATELY ROLLING BACK OR COMMITTING
----begin transaction; 

------SENSE CHECK THE EXTENDED PROPERTIES PRIOR TO ADDING YOUR EXTENDED PROPERTY
select p.class as Class,p.class_desc as ClassDesc ,p.major_id as MajorID, p.name as ExtPropertyName, p.value as ExtPropertyDescription, 
       t.schema_id as SchemaID, scm.name as SchemaName, t.name as TableName, t.object_id as ObjectID
from sys.extended_properties p
inner join sys.tables t on p.major_id = t.object_id
inner join sys.schemas scm on t.schema_id = scm.schema_id
where class = 1
and scm.name = 'Reference'  -- filter on the schema name of the table your adding the extended property too

------ COMMENT IN TO RUN
---- EXEC sp_addextendedproperty @name = N'Table data source', -- ADD THE NAME OF THE PROPERTY - E.G. A TAG 
----    @value = 'ADD HERE THE INFORMATION YOU WANT TO STORE AGAINST THE OBJECT - I.E. THE SOURCE OF THE DATA, THE PURPOSE OF THE OBJECT ETC.',
----    @level0type = 'SCHEMA', @level0name = N'Reference',  -- SPECIFY THE SCHEMA NAME
----    @level1type = 'TABLE', @level1name = N'DfE_School_Census_Ethnicity_Codes' -- SPECIFY THE TABLE NAME

------SENSE CHECK THE EXTENDED PROPERTIES AFTER ADDING YOUR EXTENDED PROPERTY
select p.class as Class,p.class_desc as ClassDesc ,p.major_id as MajorID, p.name as ExtPropertyName, p.value as ExtPropertyDescription, 
       t.schema_id as SchemaID, scm.name as SchemaName, t.name as TableName, t.object_id as ObjectID
from sys.extended_properties p
inner join sys.tables t on p.major_id = t.object_id
inner join sys.schemas scm on t.schema_id = scm.schema_id
where class = 1
and scm.name = 'Reference'

/********************************************
-- HIGHLIGHT THE RELEVANT TRANSACTION TO RUN
********************************************/
-- rollback transaction;
-- commit transaction;