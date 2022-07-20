
GO
--SqlScripter----[dbo].[_time].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[_time]') IS NULL EXEC('CREATE FUNCTION [dbo].[_time] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo._time    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER FUNCTION [dbo].[_time]
(@num int)  
RETURNS varchar(20) AS  
BEGIN
 	RETURN LEFT(convert(varchar(20), dateadd(second, @num, '01/01/70'), 8), 5)
END
GO

GO
--SqlScripter----[dbo].[bit_and].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[bit_and]') IS NULL EXEC('CREATE FUNCTION [dbo].[bit_and] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.bit_and    Script Date: 12/1/2005 11:50:33 PM ******/


ALTER FUNCTION [dbo].[bit_and]
(@num binary(8000), @num2 binary(8000) )  
RETURNS varbinary(8000) AS  
BEGIN
 	RETURN convert(varbinary(8000), (convert(int, @num) & convert(int, @num2)))
END
GO

GO
--SqlScripter----[dbo].[byte].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[byte]') IS NULL EXEC('CREATE FUNCTION [dbo].[byte] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.byte    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER FUNCTION [dbo].[byte]
(@num sql_variant)  
RETURNS varbinary(8000) AS  
BEGIN
	RETURN CONVERT(varbinary(8000), @num)
END
GO

GO
--SqlScripter----[dbo].[date].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[date]') IS NULL EXEC('CREATE FUNCTION [dbo].[date] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.date    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER FUNCTION [dbo].[date]
(@component varchar(30) )  
RETURNS datetime AS  
BEGIN
 	RETURN CONVERT(datetime, @component)
END
GO

GO
--SqlScripter----[dbo].[date_part].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[date_part]') IS NULL EXEC('CREATE FUNCTION [dbo].[date_part] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.date_part    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER FUNCTION [dbo].[date_part]
(@component varchar(20) ,@fDate datetime)  
RETURNS int AS  
BEGIN
	--execute invalid_func 'date_part'
	DECLARE @ans int
	SET @ans = 
 		CASE
			WHEN @component IN('year' , 'years' , 'yr', 'yrs')
				THEN  DATEPART(year, @fDate)
			WHEN @component IN ('quarter' , 'quarters' , 'qtr', 'qtrs')
				THEN DATEPART(quarter, @fDate)
			WHEN @component IN ('month' ,'months' , 'mo', 'mos')
				THEN DATEPART(month, @fDate)
			WHEN @component IN ('week' , 'weeks' , 'wk', 'wks')
				THEN DATEPART(week, @fDate)
			WHEN @component IN ('day', 'days')
				THEN DATEPART(day, @fDate)
			WHEN @component IN ('hour' , 'hours', 'hr', 'hrs')
				THEN DATEPART(hour, @fDate)
			WHEN @component IN ('minute' ,'minutes' , 'min', 'mins')
				THEN DATEPART(minute, @fDate)
			WHEN @component IN ('second' , 'seconds', 'sec', 'secs')
				THEN DATEPART(second, @fDate)
			ELSE -1
			END
	RETURN @ans
END
GO

GO
--SqlScripter----[dbo].[date_trunc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[date_trunc]') IS NULL EXEC('CREATE FUNCTION [dbo].[date_trunc] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.date_trunc    Script Date: 12/1/2005 11:50:35 PM ******/

ALTER FUNCTION [dbo].[date_trunc]
(@component varchar(10) ,@fDate datetime)  
RETURNS datetime AS  
BEGIN
--DECLARE @temp varchar(120)
IF @component IN('year','years', 'yr', 'yrs')
	RETURN CONVERT(datetime, CONVERT(varchar(35), DATEPART(year, @fDate)))
IF @component IN('month', 'months', 'mo', 'mos')
	RETURN CONVERT(datetime,  DATENAME(month, @fDate) + ' ' + DATENAME(year, @fDate))	
IF @component IN('day', 'days')
	RETURN CONVERT(datetime, CONVERT(varchar(35), @fDate, 10))
IF @component IN('hour', 'hours', 'hr', 'hrs')
	RETURN DATEADD(hour, DATEPART(hour, @fDate), CONVERT(datetime, CONVERT(varchar(35), @fDate, 10)))
IF @component IN('minute', 'minutes', 'min', 'mins')
	RETURN DATEADD(second, 0 - DATEPART(second, @fDate), CONVERT(datetime, CONVERT(varchar(35), @fDate, 120)))
IF @component IN('second', 'seconds', 'sec', 'secs')
	RETURN CONVERT(datetime, CONVERT(varchar(35), @fDate, 120))
IF @component IN('week', 'weeks', 'wk', 'wks')
	RETURN CONVERT(datetime, CONVERT(varchar(20), DATEADD(day, 1 - DATEPART(dw, @fDate), @fDate), 1))
IF @component IN('iso-week', 'iso-wk')
	BEGIN
		DECLARE @num_days int, @firstDay datetime
		SET @firstDay = dbo.isoyear(@fDate)
		SET @num_days = DATEDIFF(day, @firstDay, @fDate)
		RETURN DATEADD(week, FLOOR(@num_days/7), @firstDay)
	END
IF @component IN('quarter', 'quarters', 'qtr', 'qtrs')
	RETURN DATEADD(quarter, DATEPART(quarter, @fDate) -1 , CONVERT(datetime, CONVERT(varchar(35), DATEPART(year, @fDate))))
RETURN  @fDate
END
GO

GO
--SqlScripter----[dbo].[decimal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[decimal]') IS NULL EXEC('CREATE FUNCTION [dbo].[decimal] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.decimal    Script Date: 12/1/2005 11:50:33 PM ******/



ALTER FUNCTION [dbo].[decimal]
(@num float(53), @num2 int=0, @num3 int=0 )  
RETURNS float(53) AS  
BEGIN
	RETURN convert(float(53), round(@num, 0, 1)) + convert(float(53), left(convert(varchar, abs(round(@num, 0, 1) - @num)), 2 + @num3))
END
GO

GO
--SqlScripter----[dbo].[dow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dow]') IS NULL EXEC('CREATE FUNCTION [dbo].[dow] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.dow    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER FUNCTION [dbo].[dow]
(@fDate datetime)  
RETURNS varchar(3) AS  
BEGIN
 	RETURN convert(varchar(3), datename(dw, @fDate))
END
GO

GO
--SqlScripter----[dbo].[float8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[float8]') IS NULL EXEC('CREATE FUNCTION [dbo].[float8] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.float8    Script Date: 12/1/2005 11:50:34 PM ******/

ALTER FUNCTION [dbo].[float8]
(@input sql_variant )  
RETURNS float(53) AS  
BEGIN
	DECLARE	@type nvarchar(30)
	SET @type = CONVERT(nvarchar(30), SQL_VARIANT_PROPERTY(@input, 'BaseType'))
	--SET @type = SQL_VARIANT_PROPERTY(@input, 'BaseType')
	IF( (@type = 'varbinary') OR (@type = 'binary') OR
		(@type = 'timestamp') OR (@type = 'uniqueidentifier') OR
		(@type = 'image') OR (@type = 'ntext') OR (@type = 'text'))
		RETURN 0
	RETURN CONVERT(float(53), @input)
END
GO

GO
--SqlScripter----[dbo].[hex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[hex]') IS NULL EXEC('CREATE FUNCTION [dbo].[hex] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.hex    Script Date: 12/1/2005 11:50:34 PM ******/




/* Star 14401595 USP DASHBOARD DDL CHANGE */
-------------
--- hex ---
-------------
ALTER FUNCTION [dbo].[hex]
(@s varbinary(16))
RETURNS varchar(64) as
BEGIN
	DECLARE @out varchar(64)
	DECLARE @verNum varchar(4)
	SELECT @verNum = CAST(SERVERPROPERTY('productversion') as VARCHAR)
	IF LEFT(@verNum,1) = '8'
		EXEC master..xp_varbintohexstr @s, @out OUTPUT
	ELSE
		SET @out = master.dbo.fn_varbintohexstr(@s)
	SELECT @out = right(@out,32)
	RETURN @out
END
GO

GO
--SqlScripter----[dbo].[ifnull].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ifnull]') IS NULL EXEC('CREATE FUNCTION [dbo].[ifnull] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.ifnull    Script Date: 12/1/2005 11:50:34 PM ******/

ALTER FUNCTION [dbo].[ifnull]
(@expression sql_variant, @alternative sql_variant )  
RETURNS sql_variant AS  
BEGIN
	IF (@expression IS NULL)
		RETURN @alternative
	RETURN @expression
END
GO

GO
--SqlScripter----[dbo].[int4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[int4]') IS NULL EXEC('CREATE FUNCTION [dbo].[int4] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.int4    Script Date: 12/1/2005 11:50:34 PM ******/

ALTER FUNCTION [dbo].[int4]
(@num sql_variant )  
RETURNS int AS  
BEGIN
 	RETURN convert(int, convert(float, @num))
END
GO

GO
--SqlScripter----[dbo].[ip2hex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ip2hex]') IS NULL EXEC('CREATE FUNCTION [dbo].[ip2hex] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/* ************************** 11535 begin **************/



ALTER FUNCTION [dbo].[ip2hex]
(@ipaddr_str char(15) )  
RETURNS binary(4) 
AS  
BEGIN 
	declare @ipaddr_hex binary(4)
	declare @ipaddr float, @ipbyte int, @temp char(25), @ch char(1), @ipaddr_int int

	if (@ipaddr_str = NULL)
	begin
		select @ipaddr_hex = NULL
		return @ipaddr_hex
	end
	select @ipaddr = 0, @ipbyte = 0, @temp = ltrim(@ipaddr_str)

	while  @ipaddr >= 0
	begin
		select @ch = substring( @temp, 1, 1 )
		if @ch = '.'
		begin
			select @ipaddr = (@ipaddr + @ipbyte) * 256
			select @ipbyte = 0
		end
		else if @ch between '0' and '9'
			select @ipbyte = (@ipbyte * 10) + (ASCII( @ch ) - ASCII( '0' ))
		else
		begin
			select @ipaddr = @ipaddr + @ipbyte
			if @ipaddr > 2147483647.0
			begin
				select @ipaddr = - (4294967295.0 - @ipaddr + 1)
			end
			select @ipaddr_int = convert(int, @ipaddr)
			select @ipaddr_hex = convert(binary(4), @ipaddr_int)
			return @ipaddr_hex
		end
		select @temp = stuff( @temp, 1, 1, ' ' )
		select @temp = ltrim(@temp)
	end

return @ipaddr_hex
END
GO

GO
--SqlScripter----[dbo].[isoyear].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[isoyear]') IS NULL EXEC('CREATE FUNCTION [dbo].[isoyear] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.isoyear    Script Date: 12/1/2005 11:50:34 PM ******/
/**
 * returns the first day of the iso-calendar for a given date
 */
ALTER FUNCTION [dbo].[isoyear]
(@date datetime)
RETURNS datetime as
BEGIN
	DECLARE @month int, @day int, @year int, @dw_num int, @result datetime
	SET @month = DATEPART(m, @date)
	SET @day = DATEPART(d, @date)
	SET @year = DATEPART(year, @date)
	SET @dw_num = DATEPART(dw, @date)
	--if at the end of decemeber make sure input date not in first week of next year
	IF((@month = 12) AND (@day >= 28))
	BEGIN
		--if the 31st of dec is on a monday through wednesday, then its a part of the first week
		IF( ((@day=29) AND (@dw_num IN (2))) OR
			((@day=30) AND (@dw_num IN (2, 3))) OR
			((@day=31) AND (@dw_num IN (2, 3, 4))))
		BEGIN
			DECLARE @lastDay datetime, @lastDw int			
			SET @lastDay  = CONVERT(datetime, '12/31/' + CONVERT(varchar(4), @year))
			SET @lastDw = DATEPART(dw, @lastDay)
			IF((1 < @lastDw) and (@lastDw < 5))
			BEGIN
				--then we are in the first week of the year
				SET @result = DATEADD(d, (2- @lastDw), @lastDay)
				RETURN @result
			END
		END
	END
	--start search for beginning of the year in january
	--if input date falls in jan and is part of last year, recall function w/dec date
	IF((@month = 1) and (@day <=3))
	BEGIN
		IF( ((@day=1) AND (@dw_num IN (6, 7, 1))) OR
			((@day=2) AND (@dw_num IN (7, 1))) OR
			((@day=3) AND (@dw_num IN (1))))
		BEGIN
			RETURN dbo.isoyear(CONVERT(datetime, '12/31/' + CONVERT(varchar(4), @year -1)))
		END
	END
	DECLARE @firstDay datetime, @firstDw int, @diff int
	SET @firstDay = CONVERT(datetime, '01/01/' + CONVERT(varchar(4), @year))
	SET @firstDw = DATEPART(dw, @firstDay)
	-- if the 1st is a friday or later then it is apart of last year
	IF(@firstDw =1)
	BEGIN
		SET @firstDw =8
	END
	IF(@firstDw > 5)
	BEGIN
		SET @diff = (7 - @firstDw +2)
	END
	ELSE --otherwise it's apart of the first week
	BEGIN
		SET @diff = (2 - @firstDw)
	END
	SET @result = DATEADD(d, @diff, @firstDay)
	return @result
END
GO

GO
--SqlScripter----[dbo].[mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[mod]') IS NULL EXEC('CREATE FUNCTION [dbo].[mod] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.mod    Script Date: 12/1/2005 11:50:34 PM ******/

ALTER FUNCTION [dbo].[mod]
(@num int, @num2 int )  
RETURNS int AS  
BEGIN
	RETURN ROUND(@num, 0, 1) % ROUND(@num2, 0, 1)
END
GO

GO
--SqlScripter----[dbo].[ols_fn_getAreaAceByUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_fn_getAreaAceByUser]') IS NULL EXEC('CREATE FUNCTION [dbo].[ols_fn_getAreaAceByUser] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/*
 ****************************************
 calculate area_ace for a user.
 take care that a user can be a memebr of one
 or more security profiles
*/
ALTER FUNCTION [dbo].[ols_fn_getAreaAceByUser]
( @_uri		nvarchar(255)
)
returns  integer
begin

	-- calculate the area code
	declare @_pac			integer;			-- present area code temp. valud of a single security profile
	declare @_cumAreaCode	integer;			-- cumulative area code
	declare @_pae			integer;			-- present area enabled temp. valud of a single security profile

	--- check if user is set
	if ( @_uri is null )
	begin
		select @_cumAreaCode = (select set_val_lng from ca_settings where set_id = 900);
		return @_cumAreaCode;
	end;

	-- open cursor to search all security profile
	-- where the user is a member of and pick up the area_ace
	declare @_found  integer;
	set @_found = 0;
	declare cur_pace cursor for select  area_ace
						from ca_security_profile sp,
							ca_link_dis_user_sec_profile usp,
							ca_discovered_user u
						where  u.uri = @_uri
							and u.user_uuid = usp.user_uuid
							and usp.security_profile_uuid = sp.security_profile_uuid
							and sp.type <> 1;		-- exclude everyone profile


	open cur_pace;
	fetch from cur_pace into @_pac;	-- get first
	set @_cumAreaCode = 0;
	while @@fetch_status = 0
	begin

			set @_cumAreaCode = @_cumAreaCode | @_pac;	-- ORing all aces
			set @_found = 1;
			fetch from cur_pace into @_pac;		--fetch next

	end;
	close cur_pace;
	deallocate cur_pace;

	-- use the config value if a user is not linked to any security profile
	if(@_found = 0)
	begin
		select @_cumAreaCode = (select set_val_lng from ca_settings where set_id = 900);
		return @_cumAreaCode;
	end


	return @_cumAreaCode;
end
GO

GO
--SqlScripter----[dbo].[ols_fn_getAreaAceByUserUuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_fn_getAreaAceByUserUuid]') IS NULL EXEC('CREATE FUNCTION [dbo].[ols_fn_getAreaAceByUserUuid] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/*
 ****************************************
 calculate area_ace for a user.
 take care that a user can be a member of one
 or more security profiles
*/
ALTER FUNCTION [dbo].[ols_fn_getAreaAceByUserUuid]
( @_user_uuid		binary(16)
)
returns  integer
begin

	-- calculate the area code
	declare @_pac			integer;			-- present area code temp. valud of a single security profile
	declare @_cumAreaCode	integer;			-- cumulative area code
	declare @_pae			integer;			-- present area enabled temp. valud of a single security profile

	--- check if user is set
	if ( @_user_uuid is null )
	begin
		select @_cumAreaCode = (select set_val_lng from ca_settings where set_id = 900);
		return @_cumAreaCode;
	end;

	-- open cursor to search all security profile
	-- where the user is a member of and pick up the area_ace
	declare @_found  integer;
	set @_found = 0;
	declare cur_pace cursor for select  area_ace
						from ca_security_profile sp,
							ca_link_dis_user_sec_profile usp,
							ca_discovered_user u
						where  u.user_uuid = @_user_uuid
							and u.user_uuid = usp.user_uuid
							and usp.security_profile_uuid = sp.security_profile_uuid
							and sp.type <> 1;


	open cur_pace;
	fetch from cur_pace into @_pac;	-- get first
	set @_cumAreaCode = 0;
	while @@fetch_status = 0
	begin

			set @_cumAreaCode = @_cumAreaCode | @_pac;	-- ORing all aces
			set @_found = 1;
			fetch from cur_pace into @_pac;		--fetch next

	end;
	close cur_pace;
	deallocate cur_pace;

	-- use the config value if a user is not linked to any security profile
	if(@_found = 0)
	begin
		select @_cumAreaCode = (select set_val_lng from ca_settings where set_id = 900);
		return @_cumAreaCode;
	end


	return @_cumAreaCode;
end
GO

GO
--SqlScripter----[dbo].[ols_fn_getAreaSecLevelByUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_fn_getAreaSecLevelByUser]') IS NULL EXEC('CREATE FUNCTION [dbo].[ols_fn_getAreaSecLevelByUser] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/*
 ****************************************
 calculate security level
 if a user is null then we have to use
 security level = defaullt value
 if a user is linked to a profile then  we have to
 use the creation user level
*/
ALTER FUNCTION [dbo].[ols_fn_getAreaSecLevelByUser]
( @_uri		nvarchar(255)
)
returns  integer
begin

	declare @linkCnt int;

	--- check if user is set
	if ( @_uri is null )
	begin
		-- have to use the config value
		return 4;
	end;

	set @linkCnt = ( select  count(*)
						from ca_security_profile sp,
							ca_link_dis_user_sec_profile usp,
							ca_discovered_user u
						where  u.uri = @_uri
							and u.user_uuid = usp.user_uuid
							and usp.security_profile_uuid = sp.security_profile_uuid
					);


	-- test of the user is linked to any profile
	if(@linkCnt = 0)
	begin
		-- have to use the config value
		return 4;
	end

	-- user is linke to (at least one security profile)

	return 0;
end
GO

GO
--SqlScripter----[dbo].[ols_fn_getGroupAreaPerm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_fn_getGroupAreaPerm]') IS NULL EXEC('CREATE FUNCTION [dbo].[ols_fn_getGroupAreaPerm] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/* End of lines added to convert to online lock */

/*
 *****************************************************
 procedure for calcuating the area permission 

	@param	@object_uuid uuid of the objects to be updated
	@param	@_object_type	object type
	
	@return	 NULL in case it is not a member of a group 
		    otherwise area permission based on the memberships
 */

ALTER FUNCTION [dbo].[ols_fn_getGroupAreaPerm]
(
			@object_uuid	binary(16),	   /* old.object_def_uuid */
			@_object_type 	integer		   /* old.object_type */

)
returns integer			-- area permission
as
begin
	
	declare @gcnt integer;

	
	set @gcnt = 0;
	select @gcnt = ( select count(*) cnt from ca_group_member m, ca_group_def g
							where m.member_uuid = @object_uuid
							and m.group_uuid = g.group_uuid
							and g.security_group = 1);
	if( @gcnt > 0 )
	begin
		-- the object is a member of a group, we need to calculate the area_ace
		declare @object_ace integer;
		declare @parent_ace integer;
			
		set @parent_ace = 0;	-- set default value
		set @object_ace = 0;	-- set default value

		declare parent_ace_list cursor local for
		select area_ace
		from ols_area_ace
		where object_def_uuid in
		(select g.group_uuid from ca_group_member m , ca_group_def g
		where m.member_uuid = @object_uuid
				and m.group_uuid = g.group_uuid
				and g.security_group = 1)

		
		open parent_ace_list
		fetch from parent_ace_list into @parent_ace --get first ace
		while @@fetch_status = 0
		begin
			
			select @object_ace = (@object_ace | @parent_ace)
			
			fetch from parent_ace_list into @parent_ace  --get next ace
		end
		close parent_ace_list
		deallocate parent_ace_list
		return @object_ace;		
		
	end;
	
	-- the object is NOT member of a group
	return NULL;
	
end
GO

GO
--SqlScripter----[dbo].[ServerAddrToStr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ServerAddrToStr]') IS NULL EXEC('CREATE FUNCTION [dbo].[ServerAddrToStr] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.ServerAddrToStr    Script Date: 12/1/2005 11:50:35 PM ******/
ALTER FUNCTION [dbo].[ServerAddrToStr]
(@address varchar(32))
returns varchar(128)
AS
BEGIN
	/* input address has format of 8a2a9911 */
	DECLARE @result varchar(128)
		,@inputSize int
		,@i int
	SET @inputSize = len(@address)
	SET @result = ''
	SET @i = 1
	WHILE (@i < @inputSize) BEGIN
		SELECT @result = @result + 
			convert(varchar(5), 1000+convert(int,intValue))
			FROM Hex2Decimal
			WHERE substring(@address, @i,2) = hexValue
		SET @i = @i + 2
		if (@i < @inputSize) BEGIN
			SET @result = @result + '.'
		END
	END
	WHILE (@i < 20) BEGIN
		SET @result = '1000.'+@result
		SET @i = @i + 2
	END
return @result
END
GO

GO
--SqlScripter----[dbo].[StrToIP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[StrToIP]') IS NULL EXEC('CREATE FUNCTION [dbo].[StrToIP] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.StrToIP    Script Date: 12/1/2005 11:50:35 PM ******/
ALTER FUNCTION [dbo].[StrToIP]
(@address varchar(32))
returns varchar(32)
AS
BEGIN
	/* input address has format of 8a 2a 99 11 */
	DECLARE @result varchar(32)
		,@inputSize int
		,@i int
	SET @inputSize = len(@address)
	SET @result = ''
	if (@inputSize <> 11) return @address
	SET @i = 1
	WHILE (@i < @inputSize) BEGIN
		SELECT @result = @result + 
			intValue
			FROM Hex2Decimal
			WHERE substring(@address, @i,2) = hexValue
		SET @i = @i + 3
		if (@i < @inputSize) BEGIN
			SET @result = @result + '.'
		END
	END
return @result
END
GO

GO
--SqlScripter----[dbo].[trim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[trim]') IS NULL EXEC('CREATE FUNCTION [dbo].[trim] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.trim    Script Date: 12/1/2005 11:50:34 PM ******/

ALTER FUNCTION [dbo].[trim]
(@string varchar(8000))  
RETURNS varchar(8000) AS  
BEGIN
	RETURN RTRIM(@string)
END
GO

GO
--SqlScripter----[dbo].[unhex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[unhex]') IS NULL EXEC('CREATE FUNCTION [dbo].[unhex] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.unhex    Script Date: 12/1/2005 11:50:34 PM ******/


/* Star 14401610 USD DASHBOARD DDL ADD UNHEX */
-----------------
--- unhex ---
-----------------

ALTER FUNCTION [dbo].[unhex]
(@input varchar(64))
RETURNS varbinary(16) as
begin 
  declare @result varbinary(16), @i int, @l int 
  set @result = 0x 
  set @l = len(@input)/2 
  set @i = 1 

  while @i <= @l 
  begin 
    set @result = @result + 
      cast(cast(case lower(substring(@input, @i*2-1, 1)) 
        when '0' then 0x00 
        when '1' then 0x10 
        when '2' then 0x20 
        when '3' then 0x30 
        when '4' then 0x40 
        when '5' then 0x50 
        when '6' then 0x60 
        when '7' then 0x70 
        when '8' then 0x80 
        when '9' then 0x90 
        when 'a' then 0xa0 
        when 'b' then 0xb0 
        when 'c' then 0xc0 
        when 'd' then 0xd0 
        when 'e' then 0xe0 
        when 'f' then 0xf0 
      end as tinyint) | 
      cast(case lower(substring(@input, @i*2, 1)) 
        when '0' then 0x00 
        when '1' then 0x01 
        when '2' then 0x02 
        when '3' then 0x03 
        when '4' then 0x04 
        when '5' then 0x05 
        when '6' then 0x06 
        when '7' then 0x07 
        when '8' then 0x08 
        when '9' then 0x09 
        when 'a' then 0x0a 
        when 'b' then 0x0b 
        when 'c' then 0x0c 
        when 'd' then 0x0d 
        when 'e' then 0x0e 
        when 'f' then 0x0f 
      end as tinyint) as binary(1)) 
    set @i = @i + 1 
  end 
  return @result 
end
GO

GO
--SqlScripter----[dbo].[uuid_from_char].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[uuid_from_char]') IS NULL EXEC('CREATE FUNCTION [dbo].[uuid_from_char] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.uuid_from_char    Script Date: 12/1/2005 11:50:34 PM ******/



/* Star 14448560 ADD FUNCTION UUID_FROM_CHAR */
ALTER FUNCTION [dbo].[uuid_from_char]
( @uuid varchar(36) )
returns uniqueidentifier
as
begin
    return convert(uniqueidentifier,@uuid)
end
GO

GO
--SqlScripter----[dbo].[uuid_to_char].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[uuid_to_char]') IS NULL EXEC('CREATE FUNCTION [dbo].[uuid_to_char] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.uuid_to_char    Script Date: 12/1/2005 11:50:35 PM ******/

ALTER FUNCTION [dbo].[uuid_to_char]
(@string uniqueidentifier )  
RETURNS varchar(36) AS  
BEGIN
 	RETURN CONVERT(varchar(36), @string)
END
GO

GO
--SqlScripter----[dbo].[varchar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[varchar]') IS NULL EXEC('CREATE FUNCTION [dbo].[varchar] () RETURNS int AS BEGIN /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ RETURN 0 END')
GO
/****** Object:  User Defined Function dbo.varchar    Script Date: 12/1/2005 11:50:35 PM ******/

ALTER FUNCTION [dbo].[varchar]
(@string sql_variant )  
RETURNS nvarchar(4000) AS  
BEGIN
	DECLARE @ans nvarchar(4000)
 	SET @ans = CONVERT(nvarchar(4000), @string)
	RETURN @ans
END
GO
