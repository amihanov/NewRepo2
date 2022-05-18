SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[alar_sql_dyn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[alar_sql_dyn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[alar_sql_dyn]
@p_sql  varchar(4000),
	@p_nro  int output,
	@p_stat varchar(10) output,
	@p_msg  varchar(100) output
as
declare
  @sql     nvarchar(4000),
  @sql_dyn int,
  @verror  nvarchar(4000)
begin
  begin
    set @p_stat = 'S'
    set @p_msg  = NULL

		if(upper(substring(@p_sql,1,1)) = 'S')
		begin
			SELECT  @sql     = N'SELECT @p_nro = (' + @p_sql + ')'
	    execute @sql_dyn = sp_executesql @sql, N'@p_nro int output', @p_nro output
	    set     @verror  = convert(varchar, @@ERROR);
		end
		else
		begin
			SELECT  @sql     = @p_sql
			set @sql = @sql+' set @p_nro = @@rowcount'
	    execute @sql_dyn = sp_executesql @sql, N'@p_nro int output', @p_nro output
	    set     @verror  = convert(varchar, @@ERROR);
		end

  end
  if @verror <> 0 or @sql_dyn = 1
  begin
    set @p_stat = 'N'
    set @p_msg  = 'Error:' + @verror
  end
end
GO
