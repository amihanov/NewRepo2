SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ik_delete_TBL_GENERIC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ik_delete_TBL_GENERIC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ik_delete_TBL_GENERIC]
(@RecordId int, @TableName nvarchar(200), @UserId int, @UserName nvarchar(50))
AS
/*
SINGLE RECORD DELETION

Parameters:
	@RecordId = Value of CODIGO for the record to delete
	@TableName = Name of the table where the record is located
	@UserId = IS-KEY User Id of the user attempting to delete the record
			  This parameter is automatically sent by
	          from IS-KEY Relational Tables maintenance utility
	@UserName = IS-KEY User Name of the user attempting to delete the record
	            This parameter is automatically sent by
	            from IS-KEY Relational Tables maintenance utility
	  
You may insert your own authentication routines to validate the user
*/
DECLARE @SQLCommand nvarchar(300)
SET @SQLCommand = 'DELETE FROM ' + @TableName + ' WHERE CODIGO=' + ltrim(str(@RecordId))
EXEC(@SQLCommand)
IF @@ERROR <> 0
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Cannot delete the specified record',16,1)
	RETURN(-1)
END

RETURN (0)
GO
