

/*
** Created by: Alex Newsham
** Created on: 03/03/2025
** Purpose: Examples of how to script the creation of an extended properties on database objects
** Notes: Principle examples given are for tables, views and procedures, however please consult the Microsoft Learn page for reference for other object types:
**        https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addextendedproperty-transact-sql?view=sql-server-ver16&viewFallbackFrom=sql-server-ver22
**
*/

/*
** tables
*/

EXEC sys.sp_addextendedproperty @name=N'<ADD SCHEMA.TABLENAME HERE>', 
                                @value=N'<ADD A DESCRIPTION OF A PROPERTY HERE - FOR EXAMPLE, THE PURPOSE OF THE TABLE>' , 
								@level0type=N'SCHEMA',
								@level0name=N'<ADD SCHEMA NAME HERE>', 
								@level1type=N'TABLE',
								@level1name=N'<ADD TABLE NAME HERE>'

/*
** table columns
*/
EXEC sys.sp_addextendedproperty @name=N'<ADD PROPERTY CATEGORY HERE>', 
								@value=N'<ADD DESCRIPTIOIN HERE>' , 
								@level0type=N'SCHEMA',
								@level0name=N'<ADD SCHEMA NAME HERE>', 
								@level1type=N'TABLE',
								@level1name=N'<ADD TABLE NAME HERE>', 
								@level2type=N'COLUMN',
								@level2name=N'<ADD COLUMN NAME HERE>'
GO

/*
** views
*/

EXEC sys.sp_addextendedproperty @name=N'<ADD SCHEMA.VIEWNAME HERE>', 
                                @value=N'<ADD A DESCRIPTION OF A PROPERTY HERE - FOR EXAMPLE, THE PURPOSE OF THE VIEW>' , 
								@level0type=N'SCHEMA',
								@level0name=N'<ADD SCHEMA NAME HERE>', 
								@level1type=N'VIEW',
								@level1name=N'<ADD VIEW NAME HERE>'

/*
** procedures
*/

EXEC sys.sp_addextendedproperty @name=N'<ADD SCHEMA.PROCEDURENAME HERE>', 
                                @value=N'<ADD A DESCRIPTION OF A PROPERTY HERE - FOR EXAMPLE, THE PURPOSE OF THE STORED PROCEDURE>' , 
								@level0type=N'SCHEMA',
								@level0name=N'<ADD SCHEMA NAME HERE>', 
								@level1type=N'PROCEDURE',
								@level1name=N'<ADD PROCEDURE NAME HERE>'

/*
** EXAMPLES *************************************************************************************************************************************************************
*/

/** e.g. the following command adds an extended property to the [Tabulate].[REDCap_Module_24_Offline_Survey_Events_Log] stored procedure  */

/**
use AOW_Reporting
go

EXEC sys.sp_addextendedproperty @name=N'Tabulate.REDCap_Module_24_Offline_Survey_Events_Log', 
                                @value=N'Provides the means to insert new logging records pertaining to the Module 24 Offline Survey (REDCap Project ID 193) into the the [AOW_Reporting].[REDCap].[Module_24_Offline_Survey_Events_Log] tableview of all study participants current addresses registered on the X database' , 
								@level0type=N'SCHEMA',
								@level0name=N'Tabulate', 
								@level1type=N'PROCEDURE',
								@level1name=N'REDCap_Module_24_Offline_Survey_Events_Log'

**/