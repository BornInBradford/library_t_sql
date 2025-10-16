/* PRELIMINARY DETAILS */
/**
 *  Title:		<procedure name>
 *	Schema:		<schema name>
 *  Author:		Alex Newsham
 *  Created:	03/01/2019
 *  Updated:	
 *	Purpose:	This procedure does x, y and z
 *
 *	Input Parameters:	Name					 | Data Type	 | Default
 *						-------------------------+---------------+---------
 *						@Parameter               | Typed XML     | 
 *												 |				 |
 *
 *  Output Parameters:	Name				     | Data Type     | Default
 *						-------------------------+---------------+---------
 *						@Message			     |	VARCHAR(255) | NULL
 *						@Error				     |	VARCHAR(255) | NULL
 *
 *  XML Schema:	<Schema Collection Name>
 *
 **/
 
/* PROCEDURE */
CREATE PROCEDURE [schema_name].[procedure_object]
	 @XMLSchemaCollectionParameter  XML		    (DOCUMENT [schemaname].[CollectionName])
	,@Parameter1			    VARCHAR(100)    = NULL
	,@Parameter2				VARCHAR(100)    = NULL
	,@Message					VARCHAR(255)	= NULL	OUTPUT
	,@Error						VARCHAR(255)	= NULL	OUTPUT

AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @TranCount INT;
	SET @TranCount = @@TRANCOUNT;
	
	DECLARE @XState INT;
	DECLARE @ErrorNumber INT
	
	BEGIN TRY
			
		IF @TranCount = 0
		BEGIN
			BEGIN TRANSACTION;
		END
		ELSE
		BEGIN
			SAVE TRANSACTION SaveProcedureName
		END

		/*
		
			ENTER TRANSACTION CONTENT HERE
		
		*/

		IF @TranCount = 0
			BEGIN
				COMMIT TRANSACTION;
			END
	END TRY
	BEGIN CATCH
		
		SET @ErrorNumber = ERROR_NUMBER();
		SET @Error = ERROR_MESSAGE();
		GOTO PROBLEM
		
	END CATCH
	
	SET @Message = 'X was done for ''' + @Parameter1 + ''', PersonID: ''' + @Parameter2 + '''';
	
	RETURN
	
	PROBLEM:
		
		SET @XState = XACT_STATE();
		
		IF @XState = -1
		BEGIN
			ROLLBACK TRANSACTION;
		END
		
		IF @XState = 1 AND @TranCount = 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		
		IF @XState = 1 AND @TranCount > 0
		BEGIN
			ROLLBACK TRANSACTION SaveProcedureName;
		END
		
		IF @ErrorNumber IS NOT NULL
			RAISERROR ('Schema.ProcedureName: %d: %s', 16, 1, @ErrorNumber, @Error);
		
	RETURN
	
END


GO