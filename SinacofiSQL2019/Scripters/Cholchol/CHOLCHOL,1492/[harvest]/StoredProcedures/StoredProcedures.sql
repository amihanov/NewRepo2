
GO
--SqlScripter----[dbo].[ADD_UND_ERROR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ADD_UND_ERROR]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ADD_UND_ERROR] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ADD_UND_ERROR    Script Date: 12/1/2005 11:49:11 PM ******/
/****** Object:  Stored Procedure ADD_UND_ERROR    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[ADD_UND_ERROR]
(@probe_id_1 	[bigint],
	 @task_id_2 	[bigint],
	 @error_message_3 	[nvarchar](500))

AS INSERT INTO [srdb].[und_error] 
	 ( [probe_id],
	 [task_id],
	 [error_message],
	[dt_created]) 
 
VALUES 
	( @probe_id_1,
	 @task_id_2,
	 @error_message_3,
	getdate())
GO

GO
--SqlScripter----[dbo].[ADD_UND_JOB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ADD_UND_JOB]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ADD_UND_JOB] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ADD_UND_JOB    Script Date: 12/1/2005 11:49:11 PM ******/

/****** Object:  Stored Procedure ADD_UND_JOB    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[ADD_UND_JOB]
(@user_id_1 	[bigint],
	 @name_2 	[nvarchar](75),
	 @description_3 	[nvarchar](200),
	 @reoccurring_interval_4 	[int])

AS INSERT INTO [srdb].[und_job] 
	 ( [user_id],
	 [name],
	 [description],
	[status],
	 [reoccurring_interval],
	[dt_created], 
	[dt_last_modified]) 
 
VALUES 
	( @user_id_1,
	 @name_2,
	 @description_3,
	'Created',
	 @reoccurring_interval_4,
	getdate(),
	getdate())
GO

GO
--SqlScripter----[dbo].[ADD_UND_PROBE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ADD_UND_PROBE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ADD_UND_PROBE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ADD_UND_PROBE    Script Date: 12/1/2005 11:49:11 PM ******/

/****** Object:  Stored Procedure ADD_UND_PROBE    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[ADD_UND_PROBE]
(@name_1 	[nvarchar](50),
	 @nic_card_2 	[nvarchar](50),
	 @description_3 	[nvarchar](50),
	 @address_4 	[nvarchar](50),
	 @status_5 	[nvarchar](20))

AS INSERT INTO [srdb].[und_probe] 
	 ( [name],
	 [nic_card],
	 [description],
	 [address],
	 [status],
	[dt_created]) 
 
VALUES 
	( @name_1,
	 @nic_card_2,
	 @description_3,
	 @address_4,
	 @status_5,
	getdate())
GO

GO
--SqlScripter----[dbo].[ADD_UND_USER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ADD_UND_USER]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ADD_UND_USER] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ADD_UND_USER    Script Date: 12/1/2005 11:49:11 PM ******/

/****** Object:  Stored Procedure ADD_UND_USER    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[ADD_UND_USER]
(@user_name_1 	[nvarchar](75),
	 @password_2 	[nvarchar](75),
	 @role_3 	[nvarchar](75),
	 @created_by_4 	[bigint])

AS INSERT INTO [srdb].[und_user] 
	 ( [user_name],
	 [password],
	 [role],
	 [created_by],
	[modified_by],
	[dt_created],
	[dt_last_modified]) 
 
VALUES 
	( @user_name_1,
	 @password_2,
	 @role_3,
	 @created_by_4,
	@created_by_4,
	getdate(),
	getdate() )
GO

GO
--SqlScripter----[dbo].[am_proc_delete_unit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[am_proc_delete_unit]') IS NULL EXEC('CREATE PROCEDURE [dbo].[am_proc_delete_unit] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[am_proc_delete_unit]
(
            @del_object_uuid binary(16),            /* Object uuid */
            @object_type int,            /* Object type 1=Computer,2=User,3=Engine,0=Group,etc */
	    @unit_id integer,
	    @domain_id integer
            )
as
begin

  delete from ca_discovered_software where asset_source_uuid = @del_object_uuid;
  delete from inv_generalinventory_item where object_uuid = @del_object_uuid;
  delete from inv_generalinventory_tree where object_uuid = @del_object_uuid;
  delete from inv_performance_item where object_uuid = @del_object_uuid;
  delete from inv_performance_tree where object_uuid = @del_object_uuid;
  delete from inv_root_map where object_uuid = @del_object_uuid;
	DELETE FROM BCKFILE WHERE object_uuid = @del_object_uuid;
	DELETE FROM FILEMGR WHERE object_uuid = @del_object_uuid;
	DELETE FROM STATJOB WHERE object_uuid = @del_object_uuid;
	DELETE FROM STATJOBM WHERE object_uuid = @del_object_uuid;
	DELETE FROM STATMOD WHERE object_uuid = @del_object_uuid;
	DELETE FROM STATMODM WHERE object_uuid = @del_object_uuid;
	DELETE FROM appuknow WHERE object_uuid = @del_object_uuid;
	DELETE FROM ca_query_result WHERE member_uuid=@del_object_uuid;
	DELETE FROM LOCKUNIT WHERE UNITID=@unit_id AND DOMAINID=@domain_id;
	DELETE FROM LINKJOB WHERE object_uuid = @del_object_uuid;
	DELETE FROM LINKMOD WHERE object_uuid = @del_object_uuid;
	DELETE FROM LINKBCK WHERE object_uuid = @del_object_uuid;
	DELETE FROM POLILOG WHERE object_uuid = @del_object_uuid;
	DELETE FROM JOBORDER WHERE UNITID=@unit_id AND UDOMID=@domain_id;
	DELETE FROM SNAPMAIN WHERE object_uuid = @del_object_uuid;
	DELETE FROM SNAPMEMO WHERE object_uuid = @del_object_uuid;
	DELETE FROM CONFMEMO WHERE UNITID=@unit_id AND DOMAINID=@domain_id;
	DELETE FROM inv_root_map WHERE object_uuid = @del_object_uuid;

 /* if unit_id and domain_id not null do other things */
end;
GO

GO
--SqlScripter----[dbo].[backup_p_del_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_del_agent]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_del_agent] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.backup_p_del_agent    Script Date: 12/1/2005 11:49:14 PM ******/
/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Comments                                                    */
/*  =========== ==========  ========                                                    */
/*  07-Nov-2005 mulwi01     Star 14480811 NEW SQL PROCEDURES FOR BABLD                  */
/*                                                                                      */
/*                                                                                      */
/****************************************************************************************/



/* ============================================================== */
/* procedure to control deleting objects when backup_user exists  */
/* ============================================================== */

ALTER PROCEDURE [dbo].[backup_p_del_agent]
@_object_uuid binary(16)
	as
	begin
		declare @_cnt integer;
		select @_cnt = (select count(*) from backup_user
				where  user_uuid = @_object_uuid or
				   dis_hw_uuid = @_object_uuid or
				   link_dis_hw_user_uuid = @_object_uuid);
		if (@_cnt != 0)
		begin
			raiserror ('Error 9013: deletion denied, backup_user object still exists',16,1); 
		end; 
	end;
GO

GO
--SqlScripter----[dbo].[backup_p_del_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_del_job]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_del_job] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.backup_p_del_job    Script Date: 12/1/2005 11:49:11 PM ******/


/* ============================================================== */
/* procedure to control deleting jobs when active		  */
/* ============================================================== */

ALTER PROCEDURE [dbo].[backup_p_del_job]
@_job_status integer
	as
	begin
		if (@_job_status < 3)
		begin
			raiserror ('Error 9014: deletion denied, backup_job still active',16,1); 
		end; 
	end;
GO

GO
--SqlScripter----[dbo].[backup_p_job_seq_number].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_job_seq_number]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_job_seq_number] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* =========================================================================== */
/* procedure to set last sequential number for jobs in backup_server table     */
/* =========================================================================== */

ALTER PROCEDURE [dbo].[backup_p_job_seq_number]
@_server_id binary(16) 
as 
begin
	declare @_last_seq_number integer;
	declare @_max_seq_number integer;
	declare @_manager_id binary(16);
	
	select @_last_seq_number = 
		(select bmgr.job_last_seq_number
			 from	backup_server bsrv,
				backup_manager bmgr 
			 where	((bsrv.server_id = @_server_id) and
				 (bsrv.manager_id = bmgr.manager_id)));

	select @_max_seq_number = 
		(select bmgr.job_max_seq_number
			 from	backup_server bsrv,
				backup_manager bmgr 
			 where	((bsrv.server_id = @_server_id) and
				 (bsrv.manager_id = bmgr.manager_id)));
 
	select @_manager_id = 
		(select manager_id
			 from	backup_server  
			 where	(server_id = @_server_id));

	if ((@_max_seq_number = 0) or 
		(@_last_seq_number < @_max_seq_number)) 
		begin 
			set @_last_seq_number = @_last_seq_number + 1;
		end;	
	else 
		begin
			set @_last_seq_number = 0;
		end;	
	  
	update backup_manager
  		set job_last_seq_number = @_last_seq_number
  		where manager_id = @_manager_id;
end;
GO

GO
--SqlScripter----[dbo].[backup_p_reset_agent_backup_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_reset_agent_backup_stat]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_reset_agent_backup_stat] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.backup_p_reset_agent_backup_stat    Script Date: 12/1/2005 11:50:15 PM ******/


/* ============================================================== */
/* procedure to update backup status in ca agent table            */
/* ============================================================== */

ALTER PROCEDURE [dbo].[backup_p_reset_agent_backup_stat]
@_user_uuid binary(16),
	@_dis_hw_uuid binary(16), 
	@_link_dis_hw_user_uuid binary(16)
	as
	begin
		declare @_agentCompCnt integer;
		declare @_usrCnt integer;
		declare @_hwCnt integer;
	
	select @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_user_uuid and
					      agent_comp_id = 140); 

	if (@_agentCompCnt > 0)
	begin
	
		select @_usrCnt = (select count(*) from backup_user where user_uuid = @_user_uuid);
		if (@_usrCnt = 0) 
		begin
			update ca_agent set derived_status_babld = 0
				where object_uuid = @_user_uuid;
		end;
	end;

	select @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_dis_hw_uuid and
					      agent_comp_id = 140); 

	if (@_agentCompCnt > 0)
	begin

		select @_hwCnt = (select count(*) from backup_user where dis_hw_uuid = @_dis_hw_uuid);
		if (@_hwCnt = 0) 
		begin
			update ca_agent set derived_status_babld = 0
				where object_uuid = @_dis_hw_uuid;
		end;
	end;

	select @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_link_dis_hw_user_uuid and
					      agent_comp_id = 140); 

	if (@_agentCompCnt > 0)
	begin

		update ca_agent set derived_status_babld = 0
			where object_uuid = @_link_dis_hw_user_uuid;

	end; 
end;
GO

GO
--SqlScripter----[dbo].[backup_p_set_agent_backup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_set_agent_backup_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_set_agent_backup_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.backup_p_set_agent_backup_status    Script Date: 12/1/2005 11:50:16 PM ******/





/***** This is for testing only  */
/* drop procedure  backup_p_set_agent_backup_status  */
/* go */
/* drop trigger rule_set_agent_backup_status */
/* go */
/* drop procedure  backup_p_set_backup_status  */
/* go */
/* drop trigger rule_set_backup_status */
/* go */
/* drop procedure  backup_p_reset_agent_backup_stat */
/* go */
/* drop trigger rule_reset_agent_backup_status */
/* go */

/* ============================================================== */
/* procedure to update backup status in ca agent table            */
/* ============================================================== */

ALTER PROCEDURE [dbo].[backup_p_set_agent_backup_status]
@_user_uuid binary(16),
	@_dis_hw_uuid binary(16),
	@_link_dis_hw_user_uuid binary(16)
	as
	begin

	declare @_agentCompCnt integer;

	select  @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_user_uuid and
						agent_comp_id = 140);
 	if (@_agentCompCnt > 0)
	begin	
		update ca_agent set derived_status_babld = 1
			where object_uuid = @_user_uuid;
	end;

	select  @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_dis_hw_uuid and
						agent_comp_id = 140);
	if (@_agentCompCnt > 0)
	begin
		update ca_agent set derived_status_babld = 1
			where object_uuid = @_dis_hw_uuid;
	end;  

	select  @_agentCompCnt = (select count(*) from ca_agent_component
	 				where object_uuid = @_link_dis_hw_user_uuid and
						agent_comp_id = 140);
 	if (@_agentCompCnt > 0) 
	begin	
		update ca_agent set derived_status_babld = 1
			where object_uuid = @_link_dis_hw_user_uuid;

	end; 
end;
GO

GO
--SqlScripter----[dbo].[backup_p_set_backup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_p_set_backup_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[backup_p_set_backup_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[backup_p_set_backup_status]
@_object_uuid binary(16)
	as
	begin

		declare @_agentCnt integer;
 		select @_agentCnt = (select count(*) from backup_user
	 					where (user_uuid = @_object_uuid or
							dis_hw_uuid = @_object_uuid or
							link_dis_hw_user_uuid = @_object_uuid) and
							(last_login_date > 0));
 		if (@_agentCnt > 0)
		begin 
			update ca_agent set derived_status_babld = 1
				where object_uuid = @_object_uuid;
		end;
	
	end;
GO

GO
--SqlScripter----[dbo].[bckdef_server_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[bckdef_server_version]') IS NULL EXEC('CREATE PROCEDURE [dbo].[bckdef_server_version] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.bckdef_server_version    Script Date: 12/1/2005 11:49:14 PM ******/


/*
 ************************************
 *
 */

ALTER PROCEDURE [dbo].[bckdef_server_version]
(@domain_id int, @bck_id int)
as 
begin
     update bckdef set auto_server_version=auto_server_version+1 
         where domainid=@domain_id 
            and bckid=@bck_id 
end
GO

GO
--SqlScripter----[dbo].[ca_agent_server_version_by_unit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_agent_server_version_by_unit]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ca_agent_server_version_by_unit] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ca_agent_server_version_by_unit    Script Date: 12/1/2005 11:50:16 PM ******/


/*
 ************************************
 *
 */


ALTER PROCEDURE [dbo].[ca_agent_server_version_by_unit]
(@domainid int,@unitid int) 
as 
begin
    update ca_agent 
        set auto_server_version=auto_server_version+1 
        where domain_id=@domainid and unit_id=@unitid
end
GO

GO
--SqlScripter----[dbo].[ca_agent_server_version_by_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_agent_server_version_by_uuid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ca_agent_server_version_by_uuid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ca_agent_server_version_by_uuid    Script Date: 12/1/2005 11:50:16 PM ******/
/* ****************************** begin 9153 ********************************** */



/************************************************************************************************/
/*	Change Control										                */
/*												                        */
/*	Change Date	Changes By	Comment							            */
/*	===========	==========	=======							            */
/*	07-Sep-2004	mulwi01		Star 13664799 ITRM VIEWS,TRIGGERS,PROC,ETC	*/
/*	21-Oct-2004	jaere01		iTrack 1587, execpet the alter tabel 	    */
/*  15-sep-2005 hopst01     Added Star 14387183 Unicenter DSM triggers and procedures */
/* 	23-Sep-2005 hopst01 	Script drop view ca_am_asset_derived_status before creation 			*/
/* 	20-oct-2005 mulwi01 	Star 14450968 DSM: MSSQL: TRIGGER+SCHEMA AM			*/
/*												                        */
/************************************************************************************************/



/*
 ************************************
 *
 */

ALTER PROCEDURE [dbo].[ca_agent_server_version_by_uuid]
(@OBJECTUUID binary(16)) 
as
begin
    update ca_agent set auto_server_version=auto_server_version+1 
    where object_uuid=@OBJECTUUID
end;
GO

GO
--SqlScripter----[dbo].[ca_am_update_agent_derived].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_am_update_agent_derived]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ca_am_update_agent_derived] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ca_am_update_agent_derived    Script Date: 12/1/2005 11:50:16 PM ******/



/*
 ************************************
 *
 */

ALTER PROCEDURE [dbo].[ca_am_update_agent_derived]
(@OBJECTUUID binary(16)) 
as
begin
  update ca_agent
     set derived_status_am = object_status
    from ca_am_asset_derived_status
    WHERE ca_agent.object_uuid = ca_am_asset_derived_status.object_uuid 
	and ca_am_asset_derived_status.object_uuid=@OBJECTUUID 
end
GO

GO
--SqlScripter----[dbo].[ca_insert_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_insert_class]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ca_insert_class] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ca_insert_class    Script Date: 12/1/2005 11:50:15 PM ******/

ALTER PROCEDURE [dbo].[ca_insert_class]
( 
	@logical_asset_uuid binary(16),
	@new_class_id integer,
	@new_hierarchy_id integer,
	@override_weight integer,
	@current_time_stamp integer
)
AS
DECLARE @oldclass integer,
        @oldhierarchy integer,
        @overrideclass integer,
        @oldoverrideweight integer,
        @lasttimestamp integer,
	@rowcount integer,
        @old_uuid binary(16),
        @oldclasspath varchar(100),
        @oldlevel integer,
        @overridepath varchar(100),
        @overridelevel integer,
        @newclasspath varchar(100),
        @newlevel integer,
        @levelstocompare integer,
        @reclass integer,
        @tmppath1 varchar(100),
        @tmppath2 varchar(100),
        @x integer,
        @y integer,
        @tmp1 varchar(100),
        @tmp2 varchar(100),
        @emessage  char(255)
BEGIN
/* emessage = 'logical_asset_uuid='+text(@logical_asset_uuid)+', new_class_id='+text(@new_class_id)+
', new_hierarchy_id='+text(@new_hierarchy_id)+', override_weight='+text(override_weight)+
', current_time_stamp='+text(@current_time_stamp);
message @emessage; */

	SELECT @rowcount=COUNT(*) FROM ca_asset_class
	WHERE logical_asset_uuid = @logical_asset_uuid AND
    	hierarchy_id = @new_hierarchy_id;

IF (@rowcount > 0) 
BEGIN
/* test for update. */

  SELECT @old_uuid=logical_asset_uuid, @oldhierarchy=hierarchy_id, 
         @oldoverrideweight=override_weight, @oldclass=class_id, 
         @overrideclass=overridden_class_id,
         @lasttimestamp=last_update_date 
  FROM ca_asset_class WHERE logical_asset_uuid=@logical_asset_uuid;

  SELECT @oldclasspath=hierarchy_path, @oldlevel=level FROM ca_class_hierarchy
  WHERE child_class_id=@oldclass;

  SELECT @newclasspath=hierarchy_path, @newlevel=level FROM ca_class_hierarchy
  WHERE child_class_id=@new_class_id;

  SELECT @overridepath=hierarchy_path, @overridelevel=level FROM ca_class_hierarchy
  WHERE child_class_id=@overrideclass;
  
  IF (@oldclass = @new_class_id) 
  BEGIN
    /* update time stamp */
        UPDATE ca_asset_class
        SET last_update_date = @current_time_stamp
        WHERE logical_asset_uuid=@logical_asset_uuid 
              AND class_id=@oldclass
              AND last_update_date < @current_time_stamp;


        set @emessage = 'ca_asset_class updated. class_id = old_class_id';
/*        MESSAGE @emessage; */
        RETURN 0;
  END
   
  --ELSEIF (@override_weight>0)
 
  IF (@override_weight>0) 
  BEGIN
        IF (@lasttimestamp > @current_time_stamp) 
	BEGIN
            set @current_time_stamp = @lasttimestamp;
        END --IF  (lastt;
        IF (@overrideclass IS NULL) 
	BEGIN
            UPDATE ca_asset_class
            SET override_weight=@override_weight,
                overridden_class_id=@oldclass,
                class_id=@new_class_id,
                last_update_date=@current_time_stamp
            WHERE logical_asset_uuid=@logical_asset_uuid AND class_id=@oldclass;   
	END -- IF (overri
       
        ELSE
	BEGIN
            UPDATE ca_asset_class
            SET override_weight=@override_weight,
                class_id=@new_class_id,
                last_update_date=@current_time_stamp
            WHERE logical_asset_uuid=@logical_asset_uuid AND class_id=@oldclass;

        END --ELSE
        set @emessage = 'ca_asset_class updated. class_id overridden';    
/*        MESSAGE @emessage; */
        RETURN 0;

  END --ELSEIF (over
  ELSE 
  BEGIN
    /* complicated hierarchy checks */
    /* parse hierarchy paths */
        IF (@newlevel > @oldlevel) 
	BEGIN
           set @levelstocompare=@newlevel+1;
	END --IF (newlevel > oldlevel) 
        ELSE
	BEGIN
           set @levelstocompare=@oldlevel+1;
        END --ELSE
        set @reclass=0;
        set @tmppath1 = @newclasspath;
        set @tmppath2 = @oldclasspath;
    
        WHILE (@levelstocompare>=0) 
	BEGIN
           set @x=CHARINDEX('.',@tmppath1)
           set @y=CHARINDEX('.',@tmppath2)
           set @tmp1=LEFT(@tmppath1,@x-1);
           set @tmp2=LEFT(@tmppath2,@y-1);
           IF (@tmp1=@tmp2)
	   BEGIN
               set @levelstocompare=@levelstocompare-1;
               set @tmppath1 = SUBSTRING(@tmppath1,@x+1,len(@tmppath1))
      	       set @tmppath2 = SUBSTRING(@tmppath2,@y+1,len(@tmppath1))
	   END --IF (tmp1=tmp2)
           ELSE
	   BEGIN
               set @reclass=1;
               set @levelstocompare=-1;
           END --ELSE
    	END --WHILE;

        IF (@reclass=0) 
	BEGIN 
           /* different classes update */
            IF (@newlevel > @oldlevel) 
	    BEGIN
               /* more specific class may need reclass check overrideclass first*/
                set @reclass=1;         
            END --IF (newlevel > oldlevel;
        END --IF(reclass=0);
    
        /* If (new_class_id is higher in hierarchy than old class id) //less specific */ 
        IF (@reclass=0) 
	BEGIN
            IF (@current_time_stamp > @lasttimestamp) 
	    BEGIN
                UPDATE ca_asset_class
                SET last_update_date=@current_time_stamp
                WHERE logical_asset_uuid=@logical_asset_uuid AND class_id=@oldclass;
                set @emessage = 'ca_asset_class last_update_date updated';
	    END --(current_time_stam
            ELSE
	    BEGIN
                set @emessage = 'ca_asset_class class_id is higher than existing class_id. no change';
            END --ELSE;
/*            MESSAGE @emessage; */
            RETURN 0;
	END --(reclass=0) 
        --ELSEIF (NOT (@overrideclass IS NULL)) 
	IF (NOT (@overrideclass IS NULL)) 
	BEGIN
            /* Else if class was previously overridden */
    	    IF (@newlevel > @overridelevel) 
	    BEGIN
       		set @levelstocompare=@newlevel+1;
	    END
    	    ELSE
	    BEGIN
       		set @levelstocompare=@overridelevel+1;
            END --ELSE
    	    set @reclass=0;
    	    set @tmppath1 = @newclasspath;
    	    set @tmppath2 = @overridepath;
    
    	    WHILE (@levelstocompare>=0) 
            BEGIN
    	        set @x=CHARINDEX('.',@tmppath1)
                set @y=CHARINDEX('.',@tmppath2)
    	        set @tmp1=LEFT(@tmppath1,@x-1);
    	        set @tmp2=LEFT(@tmppath2,@y-1);
    	        IF (@tmp1=@tmp2) 
		BEGIN
      		    set @levelstocompare=@levelstocompare-1;
      		    set @tmppath1 = SUBSTRING(@tmppath1,@x+1,len(@tmppath1))
      	            set @tmppath2 = SUBSTRING(@tmppath2,@y+1,len(@tmppath1))
		END
    	        ELSE
		BEGIN
    		    set @reclass=1;
    		    set @levelstocompare=-1;
    	        END --ELSE
            END --WHILE;
            IF ((@reclass=0) AND (@newlevel > @overridelevel)) 
	    BEGIN
                 set @reclass=1;
            END --IF;
            IF (@reclass>0) 
	    BEGIN
             /* if newclass is lower in hierarchy than overrideclass, update overrideclass*/
                UPDATE ca_asset_class
                SET overridden_class_id=@new_class_id,
                    last_update_date=@current_time_stamp
                WHERE logical_asset_uuid=@logical_asset_uuid AND class_id=@oldclass;
                set @emessage ='ca_asset_class overridden_class_id updated';
	    END
            ELSE
	    BEGIN
		                /* else no change */
                set @emessage ='ca_asset_class new class_id is higher in hierarchy than overridden_class_id. no change';
            END --ELSe
/*            MESSAGE @emessage;  */
            RETURN 0;
	END --ELSEIF
        ELSE
	BEGIN
    /* Else If last_update_date < current_time_stamp */
            IF (@current_time_stamp > @lasttimestamp) 
	    BEGIN
                UPDATE ca_asset_class
                SET class_id=@new_class_id,
                    last_update_date=@current_time_stamp
                WHERE logical_asset_uuid=@logical_asset_uuid AND class_id=@oldclass;

                set @emessage ='ca_asset_class class_id updated';
	    END
            ELSE
	    BEGIN
             /* else no change */
                set @emessage ='ca_asset_class no change';
            END --ELSE

/*            MESSAGE @emessage; */
            RETURN 0;
     
        END --else
  END --ELSE
END --IF

ELSE
BEGIN
	INSERT INTO ca_asset_class (logical_asset_uuid, hierarchy_id, class_id, override_weight,
                            overridden_class_id, last_update_date)
	VALUES (@logical_asset_uuid, @new_hierarchy_id, @new_class_id, NULL, NULL, @current_time_stamp);
	set @emessage = 'ca_asset_class record added';
	/*    MESSAGE @emessage;  */
	RETURN 0;
END --ELSE


END --BEGIN
GO

GO
--SqlScripter----[dbo].[ca_merge_class_for_logical_asset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_merge_class_for_logical_asset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ca_merge_class_for_logical_asset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ca_merge_class_for_logical_asset    Script Date: 12/1/2005 11:50:15 PM ******/

ALTER PROCEDURE [dbo].[ca_merge_class_for_logical_asset]
(
	@old_logical_asset_uuid binary(16),
	@new_logical_asset_uuid binary(16)
)
AS
DECLARE @override_weight integer,
        @new_class_id integer,
        @new_hierarchy_id integer,
        @current_time_stamp integer,
        @emessage  char(255)
BEGIN
	DECLARE tmp_cursor CURSOR
	FOR SELECT override_weight, class_id, hierarchy_id, last_update_date
		FROM ca_asset_class 
		WHERE logical_asset_uuid = @old_logical_asset_uuid
	OPEN tmp_cursor
	FETCH NEXT FROM tmp_cursor INTO  @override_weight, @new_class_id, @new_hierarchy_id, @current_time_stamp
	WHILE @@fetch_status = 0
	BEGIN

		EXECUTE  ca_insert_class @new_logical_asset_uuid, @new_class_id, @new_hierarchy_id, @override_weight, @current_time_stamp
 		set @emessage ='ca_insert_class called for class_id='+ CAST(@new_class_id as varchar)
		FETCH NEXT FROM tmp_cursor INTO  @override_weight, @new_class_id, @new_hierarchy_id, @current_time_stamp
		/*message emessage;*/
	END -- WHILE; 
	CLOSE tmp_cursor
	DEALLOCATE tmp_cursor
 
END;
GO

GO
--SqlScripter----[dbo].[DELETE_UND_ERROR].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DELETE_UND_ERROR]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DELETE_UND_ERROR] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.DELETE_UND_ERROR    Script Date: 12/1/2005 11:49:12 PM ******/

/****** Object:  Stored Procedure DELETE_UND_ERROR    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[DELETE_UND_ERROR]
(@error_id_1 	[bigint])

AS DELETE [srdb].[und_error] 

WHERE 
	( [error_id]	 = @error_id_1)
GO

GO
--SqlScripter----[dbo].[DELETE_UND_JOB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DELETE_UND_JOB]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DELETE_UND_JOB] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.DELETE_UND_JOB    Script Date: 12/1/2005 11:49:12 PM ******/

/****** Object:  Stored Procedure DELETE_UND_JOB    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[DELETE_UND_JOB]
(@job_id_1 	[bigint])

AS 

UPDATE [srdb].[und_job] 

SET [status] = 'deleted', [dt_last_modified] = getdate()

WHERE 
	( [job_id]	 = @job_id_1)

UPDATE  [srdb].[und_task] 

SET [status] = 'deleted', [dt_last_modified] = getdate()

WHERE 
	( [job_id]	 = @job_id_1)
GO

GO
--SqlScripter----[dbo].[DELETE_UND_PROBE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DELETE_UND_PROBE]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DELETE_UND_PROBE] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.DELETE_UND_PROBE    Script Date: 12/1/2005 11:50:13 PM ******/

/****** Object:  Stored Procedure DELETE_UND_PROBE    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[DELETE_UND_PROBE]
(@probe_id_1 	[bigint])



AS 

DECLARE @liRecCount integer

SET @liRecCount = 0

SELECT @liRecCount  = ( SELECT count(*)  from und_task where probe_id = @probe_id_1 )

IF @liRecCount > 0 
BEGIN
	-- Need to update the job and task table as well
	-- Handle this as a transactional unit.
	UPDATE [srdb].[und_probe]
	SET [status] = 'deleted'
	WHERE ( [probe_id]	 = @probe_id_1)

END
ELSE
	BEGIN
	DELETE [srdb].[und_probe] 
	WHERE 
		( [probe_id]	 = @probe_id_1)
	END
GO

GO
--SqlScripter----[dbo].[DELETE_UND_USER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[DELETE_UND_USER]') IS NULL EXEC('CREATE PROCEDURE [dbo].[DELETE_UND_USER] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.DELETE_UND_USER    Script Date: 12/1/2005 11:50:08 PM ******/

/****** Object:  Stored Procedure DELETE_UND_USER    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[DELETE_UND_USER]
(@user_id_1 	[bigint],
	 @modified_by_2 	[bigint])

AS 

DECLARE @liRecCount integer

SELECT @liRecCount  = ( SELECT count(*)  from und_job where [user_id] = @user_id_1 )

IF @liRecCount > 0 
BEGIN
	-- Need to update the task table
	-- Need to add the status column to the und_user table
	-- Need to handle this as a transactional unit
	UPDATE und_job
	SET [status] = 'deleted', dt_last_modified = getdate()
	WHERE
		( [user_id]	 = @user_id_1 )
END
ELSE
BEGIN
	DELETE [srdb].[und_user] 

	WHERE 
		( [user_id]	 = @user_id_1 AND
	 	[modified_by]	 = @modified_by_2)
END
GO

GO
--SqlScripter----[dbo].[dscv_add_class_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_class_rule]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_class_rule] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_class_rule    Script Date: 12/1/2005 11:50:08 PM ******/

ALTER PROCEDURE [dbo].[dscv_add_class_rule]
(
	@hierarchy varchar(100),
	@class_name varchar(100),
	@wv_name varchar(30),
	@priority int,
	@enabled tinyint,
	@classify_id varchar(32) OUTPUT)
AS
	DECLARE @class_id int,
		@hierarchy_id int,
	        @tmp_id varchar(32),
		@num int,
		@key varchar(3),
		@len1 int,
		@len2 int,
       		@emessage  char(255),
        	@ROWCOUNT int
BEGIN
	SELECT @class_id=class_id FROM ca_class_def WHERE class_name=@class_name;
	IF (@class_id IS NULL) 
	BEGIN
		set @emessage = @class_name + ' Not Found!'
		RAISERROR(@emessage, 1, 1)
	END

	SELECT @hierarchy_id=hierarchy_id FROM ca_hierarchy WHERE hierarchy_name=@hierarchy;
	IF (@hierarchy_id IS NULL)
	BEGIN
		set @emessage = @hierarchy + ' Not Found!';	
		RAISERROR(@emessage, 2, 1)
	END 

	SELECT @ROWCOUNT=COUNT(*) FROM ca_class_hierarchy
	WHERE hierarchy_id=@hierarchy_id AND (@class_id = child_class_id OR @class_id=parent_class_id);
	IF (@ROWCOUNT <= 0) 
	BEGIN
		set @emessage = 'Class is not in Hierarchy';
		RAISERROR(@emessage, 3, 1)
	END
	/* create classify_id : cls name & zeropadded number */
	/* create method_id : method type + zero pad number (3 digits) */
	SELECT @tmp_id=max(classify_id) FROM ca_dscv_class_rules WHERE class_id=@class_id;
	IF (@tmp_id IS NULL) 
	BEGIN
		SELECT @classify_id=LEFT(@class_name,28)+'001';
		SELECT @num=1;
	END
	ELSE
	BEGIN
		/* get length of class_name, find substring, increment number and add for new method_id*/
		SELECT @len1 = LEN(@class_name), @len2=LEN(@tmp_id);
		SELECT @num  = CAST(RIGHT(@tmp_id,3) as tinyint)+1;
		/*zeropad*/
		SELECT @key=RIGHT(('000'+CAST(@num as varchar)),3);
		SELECT @classify_id=left(@class_name,28)+@key;
	END

	INSERT INTO ca_dscv_class_rules (classify_id,class_id,hierarchy_id,priority,enabled,wv_name)
	VALUES (@classify_id,@class_id,@hierarchy_id,@priority,@enabled,@wv_name);
	return @num;
END
GO

GO
--SqlScripter----[dbo].[dscv_add_combo_class_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_combo_class_rule]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_combo_class_rule] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_combo_class_rule    Script Date: 12/1/2005 11:50:13 PM ******/
ALTER PROCEDURE [dbo].[dscv_add_combo_class_rule]
(
	@combination_id varchar(32),
	@class_name varchar(100),
	@hierarchy varchar(100),
	@required_result tinyint
)
AS
DECLARE @class_id int,
        @hierarchy_id int,
        @emessage  char(255),
	@ROWCOUNT int
BEGIN
	/* get common db ids */
	SELECT @class_id=class_id FROM ca_class_def WHERE class_name=@class_name;
	IF (@class_id IS NULL) 
	BEGIN
		set @emessage = @class_name + ' Class is not in Database';
		RAISERROR(@emessage,1,1)
	END

	SELECT @hierarchy_id=hierarchy_id FROM ca_hierarchy WHERE hierarchy_name=@hierarchy;
	IF (@hierarchy_id IS NULL) 
	BEGIN
		set @emessage = @hierarchy + ' Hierarchy is not in Database';
		RAISERROR(@emessage,2,1)
	END

	SELECT @ROWCOUNT=COUNT(*) FROM ca_class_hierarchy
	WHERE hierarchy_id=@hierarchy_id AND (@class_id = child_class_id OR @class_id=parent_class_id);
	IF (@ROWCOUNT <= 0)
	BEGIN
		set @emessage = @class_name + ' Class is not in Hierarchy';	
		RAISERROR(@emessage,3,1)
	END

	SELECT @ROWCOUNT = COUNT(*) FROM ca_dscv_class_rules 
	WHERE classify_id=@combination_id;
	IF (@ROWCOUNT <=0) 
	BEGIN
		set @emessage = @combination_id + ' Rule Id not found in Class Rules';
		RAISERROR(@emessage,4,1)	
	END

	INSERT INTO ca_dscv_class_combo_rules (combination_id, class_id, hierarchy_id, required_result)
	VALUES (@combination_id, @class_id, @hierarchy_id, @required_result);
END
GO

GO
--SqlScripter----[dbo].[dscv_add_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_method]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_method] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_method    Script Date: 12/1/2005 11:49:14 PM ******/
ALTER PROCEDURE [dbo].[dscv_add_method]
(
	@method_name varchar(32),
	@default_method varchar(32),
	@method_type varchar(20),
	@priority int,
	@method_id varchar(32) OUTPUT
)
AS	
DECLARE @default_id varchar(32),
        @tmp_id varchar(32),
        @num int,
        @key varchar(3),
        @len1 int,
        @len2 int,
        @emessage  char(255),
        @tmp_methodid varchar(32)
BEGIN
	/* create method_id @ method name + zero pad number (3 digits) */
	IF (@default_method ='-99')
	BEGIN
		set @default_method=NULL;
	END
	IF (@default_method IS NOT NULL)
	BEGIN
	        SELECT @default_id=min(method_id) FROM ca_dscv_class_methods WHERE method_name=@default_method;
	END
	SELECT @tmp_id=max(method_id) FROM ca_dscv_class_methods WHERE method_name=@method_name;
	IF (@tmp_id IS NULL)
	BEGIN
		SELECT @tmp_methodid=left(@method_name,29)+'001';
		SELECT @num=1;
	END
	ELSE
	BEGIN
		/* get length of method_type, find substring, increment number and add for new method_id*/
		SELECT @len1=LEN(@method_name), @len2=LEN(@tmp_id);
		SELECT @num=CAST(RIGHT(@tmp_id,3) as smallint)+1;
		/*zeropad*/
		SELECT @key=RIGHT('000'+ CAST(@num as varchar),3);
		SELECT @tmp_methodid=left(@method_name,29) + @key;
	END

	/* insert method */
	INSERT INTO ca_dscv_class_methods (method_id, method_name, default_method_id, method_type, priority)
	VALUES (@tmp_methodid, @method_name, @default_id, @method_type, @priority);
	SET @method_id = @tmp_methodid
	return @num
END
GO

GO
--SqlScripter----[dbo].[dscv_add_method_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_method_instance]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_method_instance] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_method_instance    Script Date: 12/1/2005 11:50:14 PM ******/
ALTER PROCEDURE [dbo].[dscv_add_method_instance]
(
	@classify_id varchar(32),
	@method_name varchar(32),
	@filter varchar(1024),
	@filter_type varchar(32),
	@filter_len int,
	@filter_startbyte int,
	@required_result tinyint,
	@override_parameter int ,
	@method_id varchar(32) OUTPUT 
)
AS
DECLARE @default_method_id varchar(32),
        @method_type varchar(20),
        @num int 
BEGIN
	/* need to add new method and get new method_id */
	IF (@override_parameter > 0) 
	BEGIN
		SELECT @method_type=method_type FROM ca_dscv_class_methods 
		WHERE method_name=@method_name

		EXEC @num  = dscv_add_method  @method_name, @method_name, @method_type, NULL, @method_id = @method_id OUTPUT

	
	END
	ELSE
	BEGIN
		SELECT @method_id=min(method_id) FROM ca_dscv_class_methods 
		WHERE method_name=@method_name
	END

	INSERT INTO ca_dscv_method_instances (classify_id, method_id, filter, filter_type, filter_len, filter_startbyte, required_result)
	VALUES (@classify_id, @method_id, @filter, @filter_type, @filter_len, @filter_startbyte, @required_result)

	set @num = CAST(RIGHT(@method_id,3) as smallint)
	return @num
END
GO

GO
--SqlScripter----[dbo].[dscv_add_method_param].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_method_param]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_method_param] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_method_param    Script Date: 12/1/2005 11:50:09 PM ******/
ALTER PROCEDURE [dbo].[dscv_add_method_param]
(
	@method_id varchar(32),
	@param_name varchar(32),
	@param_type varchar(20),
	@param_value varchar(256),
	@param_value_length int
)
AS
DECLARE @ROWCOUNT int,	
        @emessage  char(255)
BEGIN
	SELECT @ROWCOUNT = COUNT(*) FROM ca_dscv_class_methods WHERE method_id=@method_id;
	IF (@ROWCOUNT <=0) 
	BEGIN
		set @emessage = @method_id + ' Method Not Found!'
	 	RAISERROR(@emessage,1,1)	
	END

	INSERT INTO ca_dscv_class_method_params (method_id, param_name, param_value_type, param_value, param_value_length)
	VALUES (@method_id, @param_name, @param_type, @param_value, @param_value_length)
END
GO

GO
--SqlScripter----[dbo].[dscv_add_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dscv_add_relationship]') IS NULL EXEC('CREATE PROCEDURE [dbo].[dscv_add_relationship] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.dscv_add_relationship    Script Date: 12/1/2005 11:50:09 PM ******/
ALTER PROCEDURE [dbo].[dscv_add_relationship]
(
	@src_class varchar(100),
	@src_hierarchy varchar(100),
	@dst_class varchar(100),
	@dst_hierarchy varchar(100),
	@type varchar(32)
)
AS
DECLARE @src_class_id int,
        @dst_class_id int,
        @src_hierarchy_id int,
        @dst_hierarchy_id int,
        @ROWCOUNT int,
        @emessage  char(255)
BEGIN        
	/* get common db ids */
	SELECT @src_class_id=class_id FROM ca_class_def WHERE class_name=@src_class;
	IF (@src_class_id IS NULL)
	BEGIN
		set @emessage = 'Source Class is not found in Database';
		RAISERROR(@emessage,1,1)
	END

	SELECT @src_hierarchy_id=hierarchy_id FROM ca_hierarchy WHERE hierarchy_name=@src_hierarchy;
	IF (@src_hierarchy_id IS NULL) 
	BEGIN
		set @emessage = 'Source Hierarchy is not found in Database';
		RAISERROR(@emessage,2,1)
	END

	SELECT @ROWCOUNT=COUNT(*) FROM ca_class_hierarchy
	WHERE hierarchy_id=@src_hierarchy_id AND (@src_class_id = child_class_id OR @src_class_id=parent_class_id);
	IF (@ROWCOUNT <= 0) 
	BEGIN
		set @emessage = 'Source Class is not in Source Hierarchy';
		RAISERROR(@emessage,3,1)
	END

	SELECT @dst_class_id=class_id FROM ca_class_def WHERE class_name=@dst_class;
	IF (@dst_class_id IS NULL)
	BEGIN
		set @emessage = 'Destination Class is not in Database';
		RAISERROR(@emessage,4,1)	
	END

	SELECT @dst_hierarchy_id=hierarchy_id FROM ca_hierarchy WHERE hierarchy_name=@dst_hierarchy;
	IF (@dst_hierarchy_id IS NULL) 
	BEGIN
		set @emessage = 'Destination Hierarchy is not in Database';
		RAISERROR(@emessage,5,1)
	END

	SELECT @ROWCOUNT = COUNT(*) FROM ca_class_hierarchy
	WHERE hierarchy_id=@dst_hierarchy_id AND (@dst_class_id = child_class_id OR @dst_class_id=parent_class_id);
	IF (@ROWCOUNT <= 0) 
	BEGIN
		set @emessage = 'Destination Class is not in Destination Hierarchy';
		RAISERROR(@emessage,6,1)
	END

	INSERT INTO ca_dscv_class_relationships (src_class_id, dst_class_id, src_hierarchy_id, dst_hierarchy_id, type)
	VALUES (@src_class_id, @dst_class_id, @src_hierarchy_id, @dst_hierarchy_id, @type);
END
GO

GO
--SqlScripter----[dbo].[e2e_wrm_sum_request_bytime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[e2e_wrm_sum_request_bytime]') IS NULL EXEC('CREATE PROCEDURE [dbo].[e2e_wrm_sum_request_bytime] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.e2e_wrm_sum_request_bytime    Script Date: 12/1/2005 11:50:09 PM ******/
/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Version                                                     */
/*  =========== ==========  =======                                                     */
/*  21-mar-2005 mulwi01     Star 13980121 MS SQL SERVER DDL FOR ADT                     */
/*  22-sep-2005 mulwi01     removed duplicated from adt.sql			                    */
/*                                                                                      */
/****************************************************************************************/




/*buim proc*/
ALTER PROCEDURE [dbo].[e2e_wrm_sum_request_bytime]
@timefactor int
AS
DECLARE @sourceid int, @identifierid int, @typeid int, @urlid int
DECLARE @year int, @month int, @week datetime, @day int, @hour int
DECLARE @cursor_request CURSOR
DECLARE @loopcount int

IF @timefactor = 1 -- by hour
BEGIN
    SET @cursor_request = CURSOR LOCAL STATIC FOR
        SELECT sourceid, identifierid, typeid, urlid, y, m, d, h
        FROM e2e_wrm_wrmreportinotrollv
    OPEN @cursor_request
    FETCH NEXT FROM @cursor_request 
        INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month, @day, @hour
END
ELSE IF @timefactor = 2 -- by day
BEGIN
    SET @cursor_request = CURSOR LOCAL STATIC FOR
        SELECT sourceid, identifierid, typeid, urlid, y, m, d
        FROM e2e_wrm_wrmreporthnotrollv
    OPEN @cursor_request
    FETCH NEXT FROM @cursor_request 
        INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month, @day
END
ELSE IF @timefactor = 3 -- by week
BEGIN
    SET @cursor_request = CURSOR LOCAL STATIC FOR
        SELECT sourceid, identifierid, typeid, urlid, w
        FROM e2e_wrm_wrmreportwnotrollv
    OPEN @cursor_request
    FETCH NEXT FROM @cursor_request 
        INTO @sourceid, @identifierid, @typeid, @urlid, @week
END
ELSE IF @timefactor = 4  -- by month
BEGIN
    SET @cursor_request = CURSOR LOCAL STATIC FOR
        SELECT sourceid, identifierid, typeid, urlid, y, m
        FROM e2e_wrm_wrmreportdnotrollv
    OPEN @cursor_request
    FETCH NEXT FROM @cursor_request 
        INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month
END
ELSE IF @timefactor = 5 -- by year
BEGIN
    SET @cursor_request = CURSOR LOCAL STATIC FOR
        SELECT sourceid, identifierid, typeid, urlid, y
        FROM e2e_wrm_wrmreportmnotrollv
    OPEN @cursor_request
    FETCH NEXT FROM @cursor_request 
        INTO @sourceid, @identifierid, @typeid, @urlid, @year
END
ELSE -- invalid timefactor
    RETURN(1) 

-- loop transaction result set
SET @loopcount = 0
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @start datetime, @end datetime
    DECLARE @resptime int
    DECLARE @critthres int, @warnthres int
    DECLARE @newsumstatid int
    DECLARE @firstbytems int
    DECLARE @newrespstatid int
    DECLARE @newaccuracystatid int
    DECLARE @statuscode int, @statusmessageid int
    DECLARE @bytesrec int, @retrycount int
    DECLARE @connecttimems int, @pingtimems int
    DECLARE @groupid int
    DECLARE @minresptime int, @maxresptime int, @pctresptime int
    DECLARE @cursor_entry CURSOR, @cursor_pctentry CURSOR
    
    -- use style 20 (yyyy-mm-dd hh:mi:ss(24h))
    IF @timefactor = 1 -- by hour
    BEGIN 
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar)+' '+CAST(@hour AS varchar)+':00', 20)
        SET @end = DATEADD(Hour, 1, @start)
    END
    ELSE IF @timefactor = 2 -- by day
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar), 20)
        SET @end = DATEADD(Day, 1, @start)
    END
    ELSE IF @timefactor = 3 -- by week
    BEGIN
        SET @start = @week
        SET @end = DATEADD(Week, 1, @start)
    END
    ELSE IF @timefactor = 4  -- by month
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Month, 1, @start)
    END
    ELSE IF @timefactor = 5 -- by year
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(1 AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Year, 1, @start)
    END

    -- averaging data for each unique transaction given timefactor
    -- the date to be summarized is one leval down from timefactor (use @timefactor -1)
    IF @timefactor = 4 -- by month, use "by day" entries
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            MAX(newrespstatid) AS newrespstatid,
            MAX(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND 
                identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                timestart >= @start AND timestart < @end AND
                timefactor = 2
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND 
                    identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                    timestart >= @start AND timestart < @end AND
                    timefactor = 2
                 ORDER BY resptime ASC) t
    END
    ELSE
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            AVG(newrespstatid) AS newrespstatid,
            AVG(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND 
                identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                timestart >= @start AND timestart < @end AND
                timefactor = @timefactor-1
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND 
                    identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                    timestart >= @start AND timestart < @end AND
                    timefactor = @timefactor-1
                 ORDER BY resptime ASC) t
    END

    OPEN @cursor_entry
    FETCH NEXT FROM @cursor_entry INTO @resptime, @critthres, @warnthres,
        @newsumstatid,
        @firstbytems, @newrespstatid,
        @newaccuracystatid, @statuscode, @statusmessageid,
        @bytesrec, @retrycount, @connecttimems, @pingtimems, @groupid,
        @minresptime, @maxresptime
        
    OPEN @cursor_pctentry
    FETCH NEXT FROM @cursor_pctentry INTO @pctresptime
    
    IF @@FETCH_STATUS = 0
    BEGIN
        SET @loopcount = @loopcount + 1
        PRINT 'Averaging '+CAST(@start AS varchar) + ' ' + CAST(@end AS varchar) + ' '+CAST(@timefactor AS varchar)
        PRINT CAST(@sourceid AS varchar)+' '+CAST(@identifierid AS varchar)+' '+CAST(@typeid AS varchar)
        PRINT CAST(@resptime AS varchar)
        PRINT 'loop count ' + CAST(@loopcount AS varchar)
        -- set the notsent ones to sent
        IF @timefactor = 4 -- by month, update "by day" entries
            UPDATE e2e_wrm_wrmreport SET issent = 1
                WHERE sourceid = @sourceid AND 
                identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                timestart >= @start AND timestart < @end AND 
                timefactor = 2 AND
                (issent = 0 OR issent IS NULL)
        ELSE IF @timefactor <> 3 -- when summarize by week, we don't update the "by day" entries
            UPDATE e2e_wrm_wrmreport SET issent = 1
                WHERE sourceid = @sourceid AND 
                identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
                timestart >= @start AND timestart < @end AND 
                timefactor = @timefactor-1 AND
                (issent = 0 OR issent IS NULL)            
        -- update summarized entry
        UPDATE e2e_wrm_wrmreport SET resptime = @resptime,
            critthres = @critthres, warnthres = @warnthres,
            newsumstatid = @newsumstatid,
            firstbytems = @firstbytems,
            newrespstatid = @newrespstatid,
            newaccuracystatid = @newaccuracystatid,
            statuscode = @statuscode, statusmessageid = @statusmessageid, 
            bytesrec = @bytesrec, retrycount = @retrycount,
            connecttimems = @connecttimems, pingtimems = @pingtimems, groupid = @groupid,
            minresptime = @minresptime, maxresptime = @maxresptime, 
            pctresptime = @pctresptime,
            issent = 0
            WHERE sourceid = @sourceid AND 
            identifierid = @identifierid AND typeid = @typeid AND urlid = @urlid AND
            timestart = @start AND timeend = @end AND
            timefactor = @timefactor
        -- update summarized entry failed, insert it
        IF @@ROWCOUNT <> 1
            INSERT INTO e2e_wrm_wrmreport (sourceid, identifierid, typeid, urlid, timefactor, timestart, timeend, 
                resptime, critthres, warnthres, newsumstatid, firstbytems, 
                newrespstatid, newaccuracystatid,
                statuscode, statusmessageid, bytesrec, retrycount, 
                connecttimems, pingtimems, groupid, 
                minresptime, maxresptime, 
                pctresptime, issent)
                VALUES (@sourceid, @identifierid, @typeid, @urlid, @timefactor, @start, @end, 
                        @resptime, @critthres, @warnthres, 
                        @newsumstatid, @firstbytems,  
                        @newrespstatid, @newaccuracystatid,
                        @statuscode, @statusmessageid, @bytesrec, @retrycount,
                        @connecttimems, @pingtimems, @groupid, 
                        @minresptime, @maxresptime, 
                        @pctresptime, 0)
    END
    CLOSE @cursor_entry
    DEALLOCATE @cursor_entry
    CLOSE @cursor_pctentry
    DEALLOCATE @cursor_pctentry

    -- get next transaction 
    IF @timefactor = 1 -- by hour
        FETCH NEXT FROM @cursor_request 
            INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month, @day, @hour
    ELSE IF @timefactor = 2 -- by day
        FETCH NEXT FROM @cursor_request 
            INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month, @day
    ELSE IF @timefactor = 3 -- by week
        FETCH NEXT FROM @cursor_request 
            INTO @sourceid, @identifierid, @typeid, @urlid, @week
    ELSE IF @timefactor = 4  -- by month
        FETCH NEXT FROM @cursor_request 
            INTO @sourceid, @identifierid, @typeid, @urlid, @year, @month
    ELSE IF @timefactor = 5 -- by year
        FETCH NEXT FROM @cursor_request 
            INTO @sourceid, @identifierid, @typeid, @urlid, @year

END
CLOSE @cursor_request
DEALLOCATE @cursor_request
GO

GO
--SqlScripter----[dbo].[e2e_wrm_sum_tran_bytime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[e2e_wrm_sum_tran_bytime]') IS NULL EXEC('CREATE PROCEDURE [dbo].[e2e_wrm_sum_tran_bytime] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.e2e_wrm_sum_tran_bytime    Script Date: 12/1/2005 11:50:09 PM ******/
 
ALTER PROCEDURE [dbo].[e2e_wrm_sum_tran_bytime]
@timefactor int
AS

DECLARE @sourceid int, @transactionid int, @identifierid int, @typeid int
DECLARE @year int, @month int, @week datetime, @day int, @hour int
DECLARE @cursor_transaction CURSOR
DECLARE @loopcount int

IF @timefactor = 1 -- by hour
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, identifierid, typeid, y, m, d, h
        FROM e2e_wrm_wrmreporttraninotrollv
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month, @day, @hour
END
ELSE IF @timefactor = 2 -- by day
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, identifierid, typeid, y, m, d
        FROM e2e_wrm_wrmreporttranhnotrollv
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month, @day
END
ELSE IF @timefactor = 3 -- by week
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, identifierid, typeid, w
        FROM e2e_wrm_wrmreporttranwnotrollv
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @identifierid, @typeid, @week
END
ELSE IF @timefactor = 4  -- by month
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, identifierid, typeid, y, m
        FROM e2e_wrm_wrmreporttrandnotrollv
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month
END
ELSE IF @timefactor = 5 -- by year
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, identifierid, typeid, y
        FROM e2e_wrm_wrmreporttranmnotrollv
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @identifierid, @typeid, @year
END
ELSE -- invalid timefactor
    RETURN(1) 

-- loop transaction result set
SET @loopcount = 0
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @start datetime, @end datetime
    DECLARE @resptime int
    DECLARE @critthres int, @warnthres int
    DECLARE @newsumstatid int
    DECLARE @firstbytems int
    DECLARE @newrespstatid int
    DECLARE @newaccuracystatid int
    DECLARE @statuscode int, @statusmessageid int
    DECLARE @bytesrec int, @retrycount int
    DECLARE @connecttimems int, @pingtimems int
    DECLARE @urlid int, @groupid int
    DECLARE @minresptime int, @maxresptime int, @pctresptime int
    DECLARE @cursor_entry CURSOR, @cursor_pctentry CURSOR
    
    -- use style 20 (yyyy-mm-dd hh:mi:ss(24h))
    IF @timefactor = 1 -- by hour
    BEGIN 
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar)+' '+CAST(@hour AS varchar)+':00', 20)
        SET @end = DATEADD(Hour, 1, @start)
    END
    ELSE IF @timefactor = 2 -- by day
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar), 20)
        SET @end = DATEADD(Day, 1, @start)
    END
    ELSE IF @timefactor = 3 -- by week
    BEGIN
        SET @start = @week
        SET @end = DATEADD(Week, 1, @start)
    END
    ELSE IF @timefactor = 4  -- by month
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Month, 1, @start)
    END
    ELSE IF @timefactor = 5 -- by year
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(1 AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Year, 1, @start)
    END

    -- averaging data for each unique transaction given timefactor
    -- the date to be summarized is one leval down from timefactor (use @timefactor -1)
    IF @timefactor = 4 -- by month, use "by day" entries
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            AVG(newrespstatid) AS newrespstatid,
            AVG(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(urlid) AS urlid, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                identifierid = @identifierid AND typeid = @typeid AND 
                timestart >= @start AND timestart < @end AND
                timefactor = 2
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                    identifierid = @identifierid AND typeid = @typeid AND 
                    timestart >= @start AND timestart < @end AND
                    timefactor = 2
                 ORDER BY resptime ASC) t
    END
    ELSE
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            AVG(newrespstatid) AS newrespstatid,
            AVG(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(urlid) AS urlid, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                identifierid = @identifierid AND typeid = @typeid AND 
                timestart >= @start AND timestart < @end AND
                timefactor = @timefactor-1
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                    identifierid = @identifierid AND typeid = @typeid AND 
                    timestart >= @start AND timestart < @end AND
                    timefactor = @timefactor-1
                 ORDER BY resptime ASC) t
    END

    OPEN @cursor_entry
    FETCH NEXT FROM @cursor_entry INTO @resptime, @critthres, @warnthres,
        @newsumstatid,
        @firstbytems, @newrespstatid,
        @newaccuracystatid, @statuscode, @statusmessageid,
        @bytesrec, @retrycount, @connecttimems, @pingtimems, @urlid, @groupid,
        @minresptime, @maxresptime
        
    OPEN @cursor_pctentry
    FETCH NEXT FROM @cursor_pctentry INTO @pctresptime
   
    IF @@FETCH_STATUS = 0
    BEGIN
        SET @loopcount = @loopcount + 1
        PRINT 'Averaging '+CAST(@start AS varchar) + ' ' + CAST(@end AS varchar) + ' '+CAST(@timefactor AS varchar)
        PRINT CAST(@sourceid AS varchar)+' '+CAST(@transactionid AS varchar)+' '+CAST(@identifierid AS varchar)+' '+CAST(@typeid AS varchar)
        PRINT CAST(@resptime AS varchar)
        PRINT 'loop count ' + CAST(@loopcount AS varchar)
        -- set the notsent ones to sent
        IF @timefactor = 4 -- by month, update "by day" entries
            UPDATE e2e_wrm_wrmreport SET issent = 1
                WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                identifierid = @identifierid AND typeid = @typeid AND 
                timestart >= @start AND timestart < @end AND 
                timefactor = 2 AND
                (issent = 0 OR issent IS NULL)
        ELSE IF @timefactor <> 3 -- when summarize by week, we don't update the "by day" entries
            UPDATE e2e_wrm_wrmreport SET issent = 1
                WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                identifierid = @identifierid AND typeid = @typeid AND 
                timestart >= @start AND timestart < @end AND 
                timefactor = @timefactor-1 AND
                (issent = 0 OR issent IS NULL)            
        -- update summarized entry
        UPDATE e2e_wrm_wrmreport SET resptime = @resptime,
            critthres = @critthres, warnthres = @warnthres,
            newsumstatid = @newsumstatid,
            firstbytems = @firstbytems,
            newrespstatid = @newrespstatid,
            newaccuracystatid = @newaccuracystatid,
            statuscode = @statuscode, statusmessageid = @statusmessageid, 
            bytesrec = @bytesrec, retrycount = @retrycount,
            connecttimems = @connecttimems, pingtimems = @pingtimems, urlid = @urlid, groupid = @groupid,
            minresptime = @minresptime, maxresptime = @maxresptime, 
            pctresptime = @pctresptime,
            IsSent = 0
            WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
            identifierid = @identifierid AND typeid = @typeid AND 
            timestart = @start AND timeend = @end AND
            timefactor = @timefactor
        -- update summarized entry failed, insert it
        IF @@ROWCOUNT <> 1
            INSERT INTO e2e_wrm_wrmreport (sourceid, transactionid, identifierid, typeid, timefactor, timestart, timeend, resptime,
                critthres, warnthres, newsumstatid, firstbytems,
                newrespstatid, newaccuracystatid,
                statuscode, statusmessageid, bytesrec, retrycount, 
                connecttimems, pingtimems, urlid, groupid, 
                minresptime, maxresptime,
                pctresptime, issent)
                VALUES (@sourceid, @transactionid, @identifierid, @typeid, @timefactor, @start, @end, 
                        @resptime, @critthres, @warnthres, @newsumstatid, 
                        @firstbytems,
                        @newrespstatid, @newaccuracystatid,
                        @statuscode, @statusmessageid, @bytesrec, @retrycount,
                        @connecttimems, @pingtimems, @urlid, @groupid, 
                        @minresptime, @maxresptime,
                        @pctresptime, 0)
    END
    CLOSE @cursor_entry
    DEALLOCATE @cursor_entry
    CLOSE @cursor_pctentry
    DEALLOCATE @cursor_pctentry

    -- get next transaction 
    IF @timefactor = 1 -- by hour
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month, @day, @hour
    ELSE IF @timefactor = 2 -- by day
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month, @day
    ELSE IF @timefactor = 3 -- by week
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @identifierid, @typeid, @week
    ELSE IF @timefactor = 4  -- by month
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @identifierid, @typeid, @year, @month
    ELSE IF @timefactor = 5 -- by year
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @identifierid, @typeid, @year


END
CLOSE @cursor_transaction
DEALLOCATE @cursor_transaction
GO

GO
--SqlScripter----[dbo].[e2e_wrm_sum_tran_req_bytime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[e2e_wrm_sum_tran_req_bytime]') IS NULL EXEC('CREATE PROCEDURE [dbo].[e2e_wrm_sum_tran_req_bytime] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.e2e_wrm_sum_tran_req_bytime    Script Date: 12/1/2005 11:50:09 PM ******/

ALTER PROCEDURE [dbo].[e2e_wrm_sum_tran_req_bytime]
@timefactor int
AS

DECLARE @sourceid int, @transactionid int, @requestnameid int
DECLARE @year int, @month int, @week datetime, @day int, @hour int
DECLARE @cursor_transaction CURSOR
DECLARE @loopcount int

-- transaction entries group by requestname
IF @timefactor = 1 -- by hour
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, requestnameid, y, m, d, h
        FROM e2e_wrm_wrmreporttranreqinotroll
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @requestnameid, @year, @month, @day, @hour
END
ELSE IF @timefactor = 2 -- by day
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, requestnameid, y, m, d
        FROM e2e_wrm_wrmreporttranreqhnotroll
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @requestnameid, @year, @month, @day
END
ELSE IF @timefactor = 3 -- by week
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, requestnameid, w
        FROM e2e_wrm_wrmreporttranreqwnotroll
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @requestnameid, @week
END
ELSE IF @timefactor = 4  -- by month
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, requestnameid, y, m
        FROM e2e_wrm_wrmreporttranreqdnotroll
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @requestnameid, @year, @month
END
ELSE IF @timefactor = 5 -- by year
BEGIN
    SET @cursor_transaction = CURSOR LOCAL STATIC FOR
        SELECT sourceid, transactionid, requestnameid, y
        FROM e2e_wrm_wrmreporttranreqmnotroll
    OPEN @cursor_transaction
    FETCH NEXT FROM @cursor_transaction 
        INTO @sourceid, @transactionid, @requestnameid, @year
END

-- loop transaction result set
SET @loopcount = 0
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @start datetime, @end datetime
    DECLARE @resptime int
    DECLARE @critthres int, @warnthres int
    DECLARE @newsumstatid int
    DECLARE @firstbytems int
    DECLARE @newrespstatid int
    DECLARE @newaccuracystatid int
    DECLARE @statuscode int, @statusmessageid int
    DECLARE @bytesrec int, @retrycount int
    DECLARE @connecttimems int, @pingtimems int
    DECLARE @groupid int
    DECLARE @minresptime int, @maxresptime int, @pctresptime int
    DECLARE @cursor_entry CURSOR, @cursor_pctentry CURSOR

    -- use style 20 (yyyy-mm-dd hh:mi:ss(24h))
    IF @timefactor = 1 -- by hour
    BEGIN 
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar)+' '+CAST(@hour AS varchar)+':00', 20)
        SET @end = DATEADD(Hour, 1, @start)
    END
    ELSE IF @timefactor = 2 -- by day
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(@day AS varchar), 20)
        SET @end = DATEADD(Day, 1, @start)
    END
    ELSE IF @timefactor = 3 -- by week
    BEGIN
        SET @start = @week
        SET @end = DATEADD(Week, 1, @start)
    END
    ELSE IF @timefactor = 4  -- by month
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(@month AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Month, 1, @start)
    END
    ELSE IF @timefactor = 5 -- by year
    BEGIN
        SET @start = CONVERT(datetime, CAST(@year AS varchar)+'-'+CAST(1 AS varchar)+'-'+CAST(1 AS varchar), 20)
        SET @end = DATEADD(Year, 1, @start)
    END

    -- averaging data for each unique transaction given timefactor
    -- the date to be summarized is one leval down from timefactor (use @timefactor -1)
    IF @timefactor = 4 -- by month, use "by day" entries
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            AVG(newrespstatid) AS newrespstatid,
            AVG(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                requestnameid = @requestnameid AND typeid = 4 AND 
                timestart >= @start AND timestart < @end AND
                timefactor = 2
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE SourceID = @sourceid AND TransactionID = @transactionid AND 
                    requestnameid = @requestnameid AND typeid = 4 AND 
                    timestart >= @start AND timestart < @end AND
                    timefactor = 2
                 ORDER BY resptime ASC) t
    END
    ELSE
    BEGIN
        SET @cursor_entry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS resptime,
            AVG(critthres) AS critthres, AVG(warnthres) AS warnthres, 
            MAX(newsumstatid) AS newsumstatid,
            AVG(firstbytems) AS firstbytems,
            AVG(newrespstatid) AS newrespstatid,
            AVG(newaccuracystatid) AS newaccuracystatid,
            MAX(statuscode) AS statuscode, MAX(statusmessageid) AS statusmessageid, 
            AVG(bytesrec) AS bytesrec, AVG(retrycount) AS retrycount, AVG(connecttimems) AS connecttimems, 
            AVG(pingtimems) AS pingtimems, MAX(groupid) AS groupid,
            MIN(resptime) AS minresptime, MAX(resptime) AS maxresptime
            FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                requestnameid = @requestnameid AND typeid = 4 AND
                timestart >= @start AND timestart < @end AND
                timefactor = @timefactor-1
        SET @cursor_pctentry = CURSOR LOCAL FOR
            SELECT AVG(resptime) AS pctresptime FROM 
                (SELECT TOP 95 PERCENT resptime
                 FROM e2e_wrm_wrmreport WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                    requestnameid = @requestnameid AND typeid = 4 AND
                    timestart >= @start AND timestart < @end AND
                    timefactor = @timefactor-1
                 ORDER BY resptime ASC) t
    END

    OPEN @cursor_entry
    FETCH NEXT FROM @cursor_entry INTO @resptime, @critthres, @warnthres,
        @newsumstatid,
        @firstbytems, @newrespstatid,
        @newaccuracystatid, @statuscode, @statusmessageid,
        @bytesrec, @retrycount, @connecttimems, @pingtimems, @groupid,
        @minresptime, @maxresptime
        
    OPEN @cursor_pctentry
    FETCH NEXT FROM @cursor_pctentry INTO @pctresptime

    IF @@FETCH_STATUS = 0
    BEGIN
        SET @loopcount = @loopcount + 1
        PRINT 'Averaging '+CAST(@start AS varchar) + ' ' + CAST(@end AS varchar) + ' '+CAST(@timefactor AS varchar)
        PRINT CAST(@sourceid AS varchar)+' '+CAST(@transactionid AS varchar)+' '+CAST(@requestnameid AS varchar)
        PRINT CAST(@resptime AS varchar)
        PRINT 'loop count ' + CAST(@loopcount AS varchar)
        -- in other stored procedure, we set the notsent ones to sent for all time factor
        -- but in this one we only set it for non interval ones
        -- set the notsent ones to sent
        IF @timefactor <> 1 
            UPDATE e2e_wrm_wrmreport SET issent = 1
                WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
                requestnameid = @requestnameid AND 
                timestart >= @start AND timestart < @end AND 
                timefactor = @timefactor-1 AND
                (issent = 0 OR issent IS NULL)            

        -- update summarized entry
        UPDATE e2e_wrm_wrmreport SET resptime = @resptime,
            critthres = @critthres, warnthres = @warnthres,
            newsumstatid = @newsumstatid,
            firstbytems = @firstbytems,
            newrespstatid = @newrespstatid,
            newaccuracystatid = @newaccuracystatid,
            statuscode = @statuscode, statusmessageid = @statusmessageid, 
            bytesrec = @bytesrec, retrycount = @retrycount,
            connecttimems = @connecttimems, pingtimems = @pingtimems, groupid = @groupid,
            minresptime = @minresptime, maxresptime = @maxresptime, 
            pctresptime = @pctresptime,
            issent = 0
            WHERE sourceid = @sourceid AND transactionid = @transactionid AND 
            requestnameid = @requestnameid AND 
            timestart = @start AND timeend = @end AND
            timefactor = @timefactor
        -- update summarized entry failed, insert it
        IF @@ROWCOUNT <> 1
            INSERT INTO e2e_wrm_wrmreport (sourceid, transactionid, requestnameid, timefactor, timestart, timeend, resptime,
                critthres, warnthres, newsumstatid, firstbytems,
                newrespstatid, newaccuracystatid,
                statuscode, statusmessageid, bytesrec, retrycount, 
                connecttimems, pingtimems, groupid, 
                minresptime, maxresptime,
                pctresptime, issent)
                VALUES (@sourceid, @transactionid, @requestnameid, @timefactor, @start, @end, 
                        @resptime, @critthres, @warnthres, @newsumstatid, 
                        @firstbytems,
                        @newrespstatid, @newaccuracystatid,
                        @statuscode, @statusmessageid, @bytesrec, @retrycount,
                        @connecttimems, @pingtimems, @groupid, 
                        @minresptime, @maxresptime,
                        @pctresptime, 0)
    END
    CLOSE @cursor_entry
    DEALLOCATE @cursor_entry
    CLOSE @cursor_pctentry
    DEALLOCATE @cursor_pctentry

    -- get next transaction 
    IF @timefactor = 1 -- by hour
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @requestnameid, @year, @month, @day, @hour
    ELSE IF @timefactor = 2 -- by day
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @requestnameid, @year, @month, @day
    ELSE IF @timefactor = 3 -- by week
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @requestnameid, @week
    ELSE IF @timefactor = 4  -- by month
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @requestnameid, @year, @month
    ELSE IF @timefactor = 5 -- by year
        FETCH NEXT FROM @cursor_transaction 
            INTO @sourceid, @transactionid, @requestnameid, @year
    
END
CLOSE @cursor_transaction
DEALLOCATE @cursor_transaction
GO

GO
--SqlScripter----[dbo].[e2e_wrm_summarize_wrm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[e2e_wrm_summarize_wrm]') IS NULL EXEC('CREATE PROCEDURE [dbo].[e2e_wrm_summarize_wrm] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.e2e_wrm_summarize_wrm    Script Date: 12/1/2005 11:50:14 PM ******/
 
 ALTER PROCEDURE [dbo].[e2e_wrm_summarize_wrm]
AS
BEGIN
PRINT 'Start e2e_wrm_summarize_wrm Summarization at ' + CONVERT(varchar, GETDATE(), 20)
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 1
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 1
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 2
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 3
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 4
EXECUTE e2e_wrm_sum_request_bytime @timefactor = 5

EXECUTE e2e_wrm_sum_tran_req_bytime @timefactor = 1
EXECUTE e2e_wrm_sum_tran_req_bytime @timefactor = 2
EXECUTE e2e_wrm_sum_tran_req_bytime @timefactor = 3
EXECUTE e2e_wrm_sum_tran_req_bytime @timefactor = 4
EXECUTE e2e_wrm_sum_tran_req_bytime @timefactor = 5

EXECUTE e2e_wrm_sum_tran_bytime @timefactor = 1
EXECUTE e2e_wrm_sum_tran_bytime @timefactor = 2
EXECUTE e2e_wrm_sum_tran_bytime @timefactor = 3
EXECUTE e2e_wrm_sum_tran_bytime @timefactor = 4
EXECUTE e2e_wrm_sum_tran_bytime @timefactor = 5
PRINT 'End e2e_wrm_summarize_wrm Summarization at ' + CONVERT(varchar, GETDATE(), 20)
END
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARAUDITEVENTSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARAUDITEVENTSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARAUDITEVENTSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARAUDITEVENTSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARAUDITEVENTSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARBRANCHSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARBRANCHSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARBRANCHSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARBRANCHSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARBRANCHSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARENVIRONMENTSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARENVIRONMENTSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARENVIRONMENTSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARENVIRONMENTSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARENVIRONMENTSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARFORMATTACHMENTSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARFORMATTACHMENTSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARFORMATTACHMENTSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARFORMATTACHMENTSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARFORMATTACHMENTSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARFORMSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARFORMSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARFORMSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARFORMSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARFORMSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARITEMNAMESEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARITEMNAMESEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARITEMNAMESEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARITEMNAMESEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARITEMNAMESEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARITEMSSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARITEMSSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARITEMSSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARITEMSSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARITEMSSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARPACKAGEGROUPSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARPACKAGEGROUPSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARPACKAGEGROUPSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARPACKAGEGROUPSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARPACKAGEGROUPSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARPACKAGESEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARPACKAGESEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARPACKAGESEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARPACKAGESEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARPACKAGESEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARPROCESSSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARPROCESSSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARPROCESSSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARPROCESSSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARPROCESSSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARREPOSITORYSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARREPOSITORYSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARREPOSITORYSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARREPOSITORYSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARREPOSITORYSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARSTATESEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARSTATESEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARSTATESEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARSTATESEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARSTATESEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARUSERGROUPSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARUSERGROUPSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARUSERGROUPSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARUSERGROUPSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARUSERGROUPSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARUSERSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARUSERSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARUSERSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARUSERSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARUSERSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARVERSIONDATASEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARVERSIONDATASEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARVERSIONDATASEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARVERSIONDATASEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARVERSIONDATASEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARVERSIONSSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARVERSIONSSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARVERSIONSSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARVERSIONSSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARVERSIONSSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[GetNewSeqVal_HARVIEWSEQ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[GetNewSeqVal_HARVIEWSEQ]') IS NULL EXEC('CREATE PROCEDURE [dbo].[GetNewSeqVal_HARVIEWSEQ] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[GetNewSeqVal_HARVIEWSEQ]
AS begin declare @NewSeqValue int set NOCOUNT ON begin tran save tran seq insert into HARVIEWSEQ default values set @NewSeqValue = scope_identity() rollback tran seq commit return @NewSeqValue end
GO

GO
--SqlScripter----[dbo].[invalid_func].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[invalid_func]') IS NULL EXEC('CREATE PROCEDURE [dbo].[invalid_func] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.invalid_func    Script Date: 12/1/2005 11:49:12 PM ******/




/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Version                                                     */
/*  =========== ==========  =======                                                     */
/*  22-sep-2005 mulwi01     Star 14401610 USD DASHBOARD DDL ADD UNHEX					*/
/*  22-sep-2005 mulwi01     Star 14401595 USP DASHBOARD DDL CHANGE						*/
/*  18-oct-2005 mulwi01     Star 14448560 ADD FUNCTION UUID_FROM_CHAR					*/
/*  18-oct-2005 hopst01     Correct ISO-WEEK result 									*/
/*  21-nov-2005 hopst01     Star 14493707 Dashboard Grant 								*/
/*  29-nov-2005 mulwi01     Star 14516558 DSM: MSSQL SCHEMA UPDATES		                */
/*  29-nov-2005 mulwi01     Star 14522103 UPM: PERMISSIONS FOR FUNCS	                */
/*   1-dec-2005 mulwi01     Star 14527225 SDESK HEX FN DOESN'T WORK 2K5	                */
/*                                                                                      */
/****************************************************************************************/


ALTER PROCEDURE [dbo].[invalid_func]
( @fname varchar )  AS
BEGIN
	print 'Undefined MDB function: ' + @fname
	rollback
END
GO

GO
--SqlScripter----[dbo].[JMO_GBL_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GBL_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GBL_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GBL_Del    Script Date: 12/1/2005 11:49:14 PM ******/

ALTER PROCEDURE [dbo].[JMO_GBL_Del]
(
   @k_gbl_name      char(8)
)
as
begin
   Delete From jmo_gbl
   Where
       gbl_name         = @k_gbl_name

end
GO

GO
--SqlScripter----[dbo].[JMO_GBL_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GBL_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GBL_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GBL_Ins    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GBL_Ins]
(
   @gbl_name         char(8),
   @gbl_adate        int,
   @gbl_atime        int,
   @gbl_ldate        int,
   @gbl_ltime        int,
   @gbl_ndate        int,
   @gbl_ntime        int,
   @gbl_fdate        int,
   @gbl_ftime        int,
   @next_rpt         char(3),
   @gbl_ltype        binary(1),
   @gbl_flag1        binary(1),
   @act_trkset 	     char (1),
   @prescan_min      int,
   @prescan_max      int,
   @prescan_total    int,
   @prescan_cnt      int
)
as
begin
   Insert into jmo_gbl (
      gbl_name,
      gbl_adate,
      gbl_atime,
      gbl_ldate,
      gbl_ltime,
      gbl_ndate,
      gbl_ntime,
      gbl_fdate,
      gbl_ftime,
      next_rpt,
      gbl_ltype,
      gbl_flag1,
      act_trkset,
      prescan_min,
      prescan_max,
      prescan_total,
      prescan_cnt            
)
   Values (
      @gbl_name,
      @gbl_adate,
      @gbl_atime,
      @gbl_ldate,
      @gbl_ltime,
      @gbl_ndate,
      @gbl_ntime,
      @gbl_fdate,
      @gbl_ftime,
      @next_rpt,
      @gbl_ltype,
      @gbl_flag1,
      @act_trkset,
      @prescan_min,
      @prescan_max,
      @prescan_total,
      @prescan_cnt                      
)
end
GO

GO
--SqlScripter----[dbo].[JMO_GBL_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GBL_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GBL_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GBL_Self    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GBL_Self]
(
   @k_gbl_name      char(8)
)
as
begin
   Select
      gbl_name,
      gbl_adate,
      gbl_atime,
      gbl_ldate,
      gbl_ltime,
      gbl_ndate,
      gbl_ntime,
      gbl_fdate,
      gbl_ftime,
      next_rpt,
      gbl_ltype,
      gbl_flag1,
      act_trkset,
      prescan_min,
      prescan_max,
      prescan_total,
      prescan_cnt
   From jmo_gbl
   Where
       gbl_name         = @k_gbl_name
   Order by
       gbl_name
end
GO

GO
--SqlScripter----[dbo].[JMO_GBL_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GBL_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GBL_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GBL_Selp    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GBL_Selp]
(
   @k_gbl_name      char(8)
)
as
begin
   Select
      gbl_name,
      gbl_adate,
      gbl_atime,
      gbl_ldate,
      gbl_ltime,
      gbl_ndate,
      gbl_ntime,
      gbl_fdate,
      gbl_ftime,
      next_rpt,
      gbl_ltype,
      gbl_flag1,
      act_trkset,
      prescan_min,
      prescan_max,
      prescan_total,
      prescan_cnt                        
   From jmo_gbl
   Where
       gbl_name         >= @k_gbl_name
   Order by
       gbl_name
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_GBL_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GBL_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GBL_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GBL_Upd    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GBL_Upd]
(
   @gbl_name         char(8),
   @gbl_adate        int,
   @gbl_atime        int,
   @gbl_ldate        int,
   @gbl_ltime        int,
   @gbl_ndate        int,
   @gbl_ntime        int,
   @gbl_fdate        int,
   @gbl_ftime        int,
   @next_rpt         char(3),
   @gbl_ltype        binary(1),
   @gbl_flag1        binary(1),
   @act_trkset 	     char (1),
   @prescan_min      int,
   @prescan_max      int,
   @prescan_total    int,
   @prescan_cnt      int,            
   @k_gbl_name       char(8)
)
as
begin
   Update jmo_gbl
   Set
      gbl_name         = @gbl_name,
      gbl_adate        = @gbl_adate,
      gbl_atime        = @gbl_atime,
      gbl_ldate        = @gbl_ldate,
      gbl_ltime        = @gbl_ltime,
      gbl_ndate        = @gbl_ndate,
      gbl_ntime        = @gbl_ntime,
      gbl_fdate        = @gbl_fdate,
      gbl_ftime        = @gbl_ftime,
      next_rpt         = @next_rpt,
      gbl_ltype        = @gbl_ltype,
      gbl_flag1        = @gbl_flag1,
      act_trkset       = @act_trkset,
      prescan_min      = @prescan_min,
      prescan_max      = @prescan_max,
      prescan_total    = @prescan_total,
      prescan_cnt      = @prescan_cnt                                    
   From  jmo_gbl WITH (index=1)
   Where
      gbl_name         = @k_gbl_name
end
GO

GO
--SqlScripter----[dbo].[JMO_GEN_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GEN_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GEN_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GEN_Del    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GEN_Del]
(
   @k_scp_key       char(8)
)
as
begin
   Delete From jmo_gen
   Where
       scp_key          = @k_scp_key

end
GO

GO
--SqlScripter----[dbo].[JMO_GEN_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GEN_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GEN_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GEN_Ins    Script Date: 12/1/2005 11:49:15 PM ******/

ALTER PROCEDURE [dbo].[JMO_GEN_Ins]
(
   @scp_key          char(8),
   @scj_prty         char(2),
   @scg_en1          binary(1),
   @scg_en2          binary(1),
   @scg_en6          char(1),
   @sca_utotm        int,
   @sca_utoit        smallint,
   @scw_s            varchar(21),
   @scd_tab          varchar(8),
   @sch_istc         smallint,
   @scm_xaudt        smallint,
   @scq_name         varchar(32),
   @scm_axpsr        smallint,
   @scm_axinp        smallint,
   @scm_axres        smallint
)
as
begin
   Insert into jmo_gen (
      scp_key,
      scj_prty,
      scg_en1,
      scg_en2,
      scg_en6,
      sca_utotm,
      sca_utoit,
      scw_s,
      scd_tab,
      sch_istc,
      scm_xaudt,
      scq_name,
      scm_axpsr,
      scm_axinp,
      scm_axres
)
   Values (
      @scp_key,
      @scj_prty,
      @scg_en1,
      @scg_en2,
      @scg_en6,
      @sca_utotm,
      @sca_utoit,
      @scw_s,
      @scd_tab,
      @sch_istc,
      @scm_xaudt,
      @scq_name,
      @scm_axpsr,
      @scm_axinp,
      @scm_axres
)
end
GO

GO
--SqlScripter----[dbo].[JMO_GEN_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GEN_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GEN_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GEN_Self    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_GEN_Self]
(
   @k_scp_key       char(8)
)
as
begin
   Select
      scp_key,
      scj_prty,
      scg_en1,
      scg_en2,
      scg_en6,
      sca_utotm,
      sca_utoit,
      scw_s,
      scd_tab,
      sch_istc,
      scm_xaudt,
      scq_name,
      scm_axpsr,
      scm_axinp,
      scm_axres
   From jmo_gen
   Where
       scp_key          = @k_scp_key
   Order by
       scp_key
end
GO

GO
--SqlScripter----[dbo].[JMO_GEN_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GEN_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GEN_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GEN_Selp    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_GEN_Selp]
(
   @k_scp_key       char(8)
)
as
begin
   Select
      scp_key,
      scj_prty,
      scg_en1,
      scg_en2,
      scg_en6,
      sca_utotm,
      sca_utoit,
      scw_s,
      scd_tab,
      sch_istc,
      scm_xaudt,
      scq_name,
      scm_axpsr,
      scm_axinp,
      scm_axres
   From jmo_gen
   Where
       scp_key          >= @k_scp_key
   Order by
       scp_key
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_GEN_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_GEN_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_GEN_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_GEN_Upd    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_GEN_Upd]
(
   @scp_key          char(8),
   @scj_prty         char(2),
   @scg_en1          binary(1),
   @scg_en2          binary(1),
   @scg_en6          char(1),
   @sca_utotm        int,
   @sca_utoit        smallint,
   @scw_s            varchar(20),
   @scd_tab          varchar(8),
   @sch_istc         smallint,
   @scm_xaudt        smallint,
   @scq_name         varchar(32),
   @scm_axpsr        smallint,
   @scm_axinp        smallint,
   @scm_axres        smallint,
   @k_scp_key        char(8)
)
as
begin
   Update jmo_gen
   Set
      scp_key          = @scp_key,
      scj_prty         = @scj_prty,
      scg_en1          = @scg_en1,
      scg_en2          = @scg_en2,
      scg_en6          = @scg_en6,
      sca_utotm        = @sca_utotm,
      sca_utoit        = @sca_utoit,
      scw_s            = @scw_s,
      scd_tab          = @scd_tab,
      sch_istc         = @sch_istc,
      scm_xaudt        = @scm_xaudt,
      scq_name         = @scq_name,
      scm_axpsr        = @scm_axpsr,
      scm_axinp        = @scm_axinp,
      scm_axres        = @scm_axres
   From  jmo_gen WITH (index=1)
   Where
      scp_key          = @k_scp_key
end
GO

GO
--SqlScripter----[dbo].[JMO_HSTU_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_HSTU_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_HSTU_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_HSTU_Del    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_HSTU_Del]
(
   @k_hst_scdn      char(65),
   @k_hst_name      char(65),
   @k_hst_jno       char(5)
)
as
begin
   Delete From jmo_hstu
   Where
       hst_scdn         = @k_hst_scdn	and
       hst_name         = @k_hst_name	and
       hst_jno          = @k_hst_jno

end
GO

GO
--SqlScripter----[dbo].[JMO_HSTU_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_HSTU_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_HSTU_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_HSTU_Ins    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_HSTU_Ins]
(
   @hst_scdn         char(65),
   @hst_name         char(65),
   @hst_jno          char(5)   
)

as
begin
   Insert into jmo_hstu (
      hst_scdn,
      hst_name,
      hst_jno      
)
   Values (
      @hst_scdn,
      @hst_name,
      @hst_jno      
)
end
GO

GO
--SqlScripter----[dbo].[JMO_HSTU_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_HSTU_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_HSTU_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_HSTU_Self    Script Date: 12/1/2005 11:49:16 PM ******/

ALTER PROCEDURE [dbo].[JMO_HSTU_Self]
(
   @k_hst_scdn      char(65),
   @k_hst_name      char(65),
   @k_hst_jno       char(5)
)
as
begin
   Select
      hst_scdn,
      hst_name,
      hst_jno      
   From jmo_hstu
   Where
       hst_scdn         = @k_hst_scdn      and
       hst_name         = @k_hst_name      and
       hst_jno          = @k_hst_jno       
   Order by
       hst_scdn,
       hst_name,
       hst_jno
end
GO

GO
--SqlScripter----[dbo].[JMO_HSTU_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_HSTU_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_HSTU_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_HSTU_Selp    Script Date: 12/1/2005 11:49:17 PM ******/

ALTER PROCEDURE [dbo].[JMO_HSTU_Selp]
(
   @k_hst_scdn      char(65),
   @k_hst_name      char(65),
   @k_hst_jno       char(5)
)
as
begin
   Select
      hst_scdn,
      hst_name,
      hst_jno         
   From jmo_hstu
   Where
       hst_scdn         >= @k_hst_scdn      and
       hst_name         >= @k_hst_name      and
       hst_jno          >= @k_hst_jno              
   Order by
       hst_scdn,
       hst_name,
       hst_jno
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_HSTU_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_HSTU_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_HSTU_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_HSTU_Upd    Script Date: 12/1/2005 11:49:17 PM ******/

ALTER PROCEDURE [dbo].[JMO_HSTU_Upd]
(
   @hst_scdn         char(65),
   @hst_name         char(65),
   @hst_jno          char(5),
   @k_hst_scdn       char(65),
   @k_hst_name       char(65),
   @k_hst_jno        char(5)   
)
as
begin
   Update jmo_hstu
   Set
      hst_scdn         = @hst_scdn,
      hst_name         = @hst_name,
      hst_jno          = @hst_jno      
   From  jmo_hstu WITH (index=1)
   Where
      hst_scdn         = @k_hst_scdn	and
      hst_name         = @k_hst_name	and
      hst_jno          = @k_hst_jno      
end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_Del    Script Date: 12/1/2005 11:49:17 PM ******/

ALTER PROCEDURE [dbo].[JMO_JBR_Del]
(
   @k_jbr_scdn      char(65),
   @k_jbr_name      char(65),
   @k_jbr_jno       char(5)
   
)
as
begin
   Delete From jmo_jbr
   Where
       jbr_name         = @k_jbr_name      and
       jbr_jno          = @k_jbr_jno       and
       jbr_scdn         = @k_jbr_scdn

   Delete From jmo_jwb
   Where
       jwb_name         = @k_jbr_name      and
       jwb_jno          = @k_jbr_jno       and
       jwb_scdn         = @k_jbr_scdn

   Delete From jmo_prb
   Where
       prb_name         = @k_jbr_name      and
       prb_jno          = @k_jbr_jno       and
       prb_scdn         = @k_jbr_scdn

/* drop PSRM where base key is equal to jbr   */

   Delete From jmo_psrm
   Where
       psr_name         = @k_jbr_name      and
       psr_jno          = @k_jbr_jno       and
       psr_scdn         = @k_jbr_scdn


/* drop PSRM where predecessor is equal to jbr   */

   Delete From jmo_psrm
   Where
       psr_pjob         = @k_jbr_name      and
       psr_pjno         = @k_jbr_jno       and
       psr_pscd         = @k_jbr_scdn

end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_DelT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_DelT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_DelT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_DelT    Script Date: 12/1/2005 11:49:17 PM ******/






ALTER PROCEDURE [dbo].[JMO_JBR_DelT]
(
   @k_jbr_scdn      char(65),
   @k_jbr_name      char(65),
   @k_jbr_jno       char(5)
   
)
as
begin
   Delete From jmo_jbr
   Where
       jbr_name         = @k_jbr_name      and
       jbr_jno          = @k_jbr_jno       and
       jbr_scdn         = @k_jbr_scdn

end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_DelY].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_DelY]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_DelY] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_DelY    Script Date: 12/1/2005 11:49:17 PM ******/


ALTER PROCEDURE [dbo].[JMO_JBR_DelY]
(
   @k_jbr_scdn      char(65),
   @k_jbr_name      char(65),
   @k_jbr_jno       char(5)
   
)
as
begin
   Delete From jmo_jbr
   Where
       jbr_name         = @k_jbr_name      and
       jbr_jno          = @k_jbr_jno       and
       jbr_scdn         = @k_jbr_scdn

   Delete From jmo_jwb
   Where
       jwb_name         = @k_jbr_name      and
       jwb_jno          = @k_jbr_jno       and
       jwb_scdn         = @k_jbr_scdn

   Delete From jmo_prb
   Where
       prb_name         = @k_jbr_name      and
       prb_jno          = @k_jbr_jno       and
       prb_scdn         = @k_jbr_scdn

/* drop PSRM where base key is equal to jbr   */

   Delete From jmo_psrm
   Where
       psr_name         = @k_jbr_name      and
       psr_jno          = @k_jbr_jno       and
       psr_scdn         = @k_jbr_scdn


end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_Ins    Script Date: 12/1/2005 11:49:17 PM ******/

ALTER PROCEDURE [dbo].[JMO_JBR_Ins]
(
   @jbr_scdn         char(65),
   @jbr_name         char(65),
   @jbr_jno          char(5),
   @jbr_ws           varchar(21),
   @jbr_jobtyp       char(1),
   @jbr_any          binary(1),
   @jbr_subu         varchar(33),
   @jbr_abscd        varchar(65),
   @jbr_jprty        char(2),
   @jbr_abct         int,
   @jbr_cal          varchar(8),
   @jbr_erly         int,
   @jbr_must         int,
   @jbr_dedln        int,
   @jbr_mxtim        int,
   @jbr_avg          int,
   @jbr_effdt        int,
   @jbr_expdt        int,
   @jbr_histc        smallint,
   @jbr_flg1         binary(1),
   @jbr_bklog        binary(1),
   @jbr_recs1        char(1),
   @jbr_desc         varchar(255),
   @jbr_subfile        varchar(255),
   @jbr_creus        varchar(33),
   @jbr_credt        int,
   @jbr_cretm        int,
   @jbr_lusdt        int,
   @jbr_lustm        int,
   @jbr_user         varchar(33),
   @jbr_skip         int,
   @jbr_faill        int,
   @jbr_failh        int,
   @jbr_subp         varchar(15),
   @jbr_domain       varchar(16),
   @jbr_cycle        char(1),
   @jbr_freq         int,
   @jbr_count        int,
   @jbr_ccal         varchar(9),
   @jbr_cri          varchar(255),   
   @jbr_hact         char(2),
   @jbr_nwact        char(2),
   @jbr_cadj         varchar(5),
   @jbr_sutyp        binary(1),
   @jbr_qname        char(1)

)
as
begin
   Insert into jmo_jbr (
      jbr_scdn,
      jbr_name,
      jbr_jno,
      jbr_ws,
      jbr_jobtyp,
      jbr_any,
      jbr_subu,
      jbr_abscd,
      jbr_jprty,
      jbr_abct,
      jbr_cal,
      jbr_erly,
      jbr_must,
      jbr_dedln,
      jbr_mxtim,
      jbr_avg,
      jbr_effdt,
      jbr_expdt,
      jbr_histc,
      jbr_flg1,
      jbr_bklog,
      jbr_recs1,
      jbr_desc,
      jbr_subfile,
      jbr_creus,
      jbr_credt,
      jbr_cretm,
      jbr_lusdt,
      jbr_lustm,
      jbr_user,
      jbr_skip,
      jbr_faill,
      jbr_failh,
      jbr_subp,
      jbr_domain,
      jbr_cycle,
      jbr_freq,
      jbr_count,
      jbr_ccal,
      jbr_cri,
      jbr_hact,
      jbr_nwact,
      jbr_cadj,
      jbr_sutyp,
      jbr_qname
)
   Values (
      @jbr_scdn,
      @jbr_name,
      @jbr_jno,
      @jbr_ws,
      @jbr_jobtyp,
      @jbr_any,
      @jbr_subu,
      @jbr_abscd,
      @jbr_jprty,
      @jbr_abct,
      @jbr_cal,
      @jbr_erly,
      @jbr_must,
      @jbr_dedln,
      @jbr_mxtim,
      @jbr_avg,
      @jbr_effdt,
      @jbr_expdt,
      @jbr_histc,
      @jbr_flg1,
      @jbr_bklog,
      @jbr_recs1,
      @jbr_desc,
      @jbr_subfile,
      @jbr_creus,
      @jbr_credt,
      @jbr_cretm,
      @jbr_lusdt,
      @jbr_lustm,
      @jbr_user,
      @jbr_skip,
      @jbr_faill,
      @jbr_failh,
      @jbr_subp,
      @jbr_domain,
      @jbr_cycle,
      @jbr_freq,
      @jbr_count,
      @jbr_ccal,
      @jbr_cri,   
      @jbr_hact,
      @jbr_nwact,
      @jbr_cadj,
      @jbr_sutyp,
      @jbr_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_Self    Script Date: 12/1/2005 11:49:17 PM ******/

ALTER PROCEDURE [dbo].[JMO_JBR_Self]
(
   @k_jbr_scdn      char(65),
   @k_jbr_name      char(65),
   @k_jbr_jno       char(5) 
   )
as
begin
   Select
      jbr_scdn,
      jbr_name,
      jbr_jno,
      jbr_ws,
      jbr_jobtyp,
      jbr_any,
      jbr_subu,
      jbr_abscd,
      jbr_jprty,
      jbr_abct,
      jbr_cal,
      jbr_erly,
      jbr_must,
      jbr_dedln,
      jbr_mxtim,
      jbr_avg,
      jbr_effdt,
      jbr_expdt,
      jbr_histc,
      jbr_flg1,
      jbr_bklog,
      jbr_recs1,
      jbr_desc,
      jbr_subfile,
      jbr_creus,
      jbr_credt,
      jbr_cretm,
      jbr_lusdt,
      jbr_lustm,
      jbr_user,
      jbr_skip,
      jbr_faill,
      jbr_failh,
      jbr_subp,
      jbr_domain,
      jbr_cycle,
      jbr_freq,
      jbr_count,
      jbr_ccal,
      jbr_cri,
      jbr_hact,
      jbr_nwact,
      jbr_cadj,
      jbr_sutyp,
      jbr_qname
   From jmo_jbr
   Where
       jbr_name         = @k_jbr_name      and
       jbr_jno          = @k_jbr_jno       and
       jbr_scdn         = @k_jbr_scdn
   Order by
       jbr_scdn,
       jbr_name,
       jbr_jno
end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_Selp    Script Date: 12/1/2005 11:49:18 PM ******/

ALTER PROCEDURE [dbo].[JMO_JBR_Selp]
(
   @k_jbr_scdn      char(65),
   @k_jbr_name      char(65),
   @k_jbr_jno       char(5)
)
as
begin
   Select
      jbr_scdn,
      jbr_name,
      jbr_jno,
      jbr_ws,
      jbr_jobtyp,
      jbr_any,
      jbr_subu,
      jbr_abscd,
      jbr_jprty,
      jbr_abct,
      jbr_cal,
      jbr_erly,
      jbr_must,
      jbr_dedln,
      jbr_mxtim,
      jbr_avg,
      jbr_effdt,
      jbr_expdt,
      jbr_histc,
      jbr_flg1,
      jbr_bklog,
      jbr_recs1,
      jbr_desc,
      jbr_subfile,
      jbr_creus,
      jbr_credt,
      jbr_cretm,
      jbr_lusdt,
      jbr_lustm,
      jbr_user,
      jbr_skip,
      jbr_faill,
      jbr_failh,
      jbr_subp,
      jbr_domain,
      jbr_cycle,
      jbr_freq,
      jbr_count,
      jbr_ccal,
      jbr_cri,
      jbr_hact,
      jbr_nwact,
      jbr_cadj,
      jbr_sutyp,
      jbr_qname
   From jmo_jbr
   Where
       jbr_scdn         >= @k_jbr_scdn      and
       jbr_name         >= @k_jbr_name      and
       jbr_jno          >= @k_jbr_jno       
   Order by
       jbr_scdn,
       jbr_name,
       jbr_jno
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_JBR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JBR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JBR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JBR_Upd    Script Date: 12/1/2005 11:49:18 PM ******/


ALTER PROCEDURE [dbo].[JMO_JBR_Upd]
(
   @jbr_scdn         char(65),
   @jbr_name         char(65),
   @jbr_jno          char(5),
   @jbr_ws           varchar(21),
   @jbr_jobtyp       char(1),
   @jbr_any          binary(1),
   @jbr_subu         varchar(33),
   @jbr_abscd        varchar(65),
   @jbr_jprty        char(2),
   @jbr_abct         int,
   @jbr_cal          varchar(9),
   @jbr_erly         int,
   @jbr_must         int,
   @jbr_dedln        int,
   @jbr_mxtim        int,
   @jbr_avg          int,
   @jbr_effdt        int,
   @jbr_expdt        int,
   @jbr_histc        smallint,
   @jbr_flg1         binary(1),
   @jbr_bklog        binary(1),
   @jbr_recs1        char(1),
   @jbr_desc         varchar(255),
   @jbr_subfile        varchar(255),
   @jbr_creus        varchar(33),
   @jbr_credt        int,
   @jbr_cretm        int,
   @jbr_lusdt        int,
   @jbr_lustm        int,
   @jbr_user         varchar(33),
   @jbr_skip         int,
   @jbr_faill        int,
   @jbr_failh        int,
   @jbr_subp         varchar(15),
   @jbr_domain       varchar(16),
   @jbr_cycle        char(1),
   @jbr_freq         int,
   @jbr_count        int, 
   @jbr_ccal         varchar(9),
   @jbr_cri          varchar(255),   
   @jbr_hact         char(2),
   @jbr_nwact        char(2),
   @jbr_cadj         varchar(5),
   @jbr_sutyp        binary(1),
   @jbr_qname        char(1),
   @k_jbr_scdn       char(65),
   @k_jbr_name       char(65),
   @k_jbr_jno        char(5)
)
as
begin
   Update jmo_jbr
   Set
      jbr_scdn         = @jbr_scdn,
      jbr_name         = @jbr_name,
      jbr_jno          = @jbr_jno,
      jbr_ws           = @jbr_ws,
      jbr_jobtyp       = @jbr_jobtyp,
      jbr_any          = @jbr_any,
      jbr_subu         = @jbr_subu,
      jbr_abscd        = @jbr_abscd,
      jbr_jprty        = @jbr_jprty,
      jbr_abct         = @jbr_abct,
      jbr_cal          = @jbr_cal,
      jbr_erly         = @jbr_erly,
      jbr_must         = @jbr_must,
      jbr_dedln        = @jbr_dedln,
      jbr_mxtim        = @jbr_mxtim,
      jbr_avg          = @jbr_avg,
      jbr_effdt        = @jbr_effdt,
      jbr_expdt        = @jbr_expdt,
      jbr_histc        = @jbr_histc,
      jbr_flg1         = @jbr_flg1,
      jbr_bklog        = @jbr_bklog,
      jbr_recs1        = @jbr_recs1,
      jbr_desc         = @jbr_desc,
      jbr_subfile        = @jbr_subfile,
      jbr_creus        = @jbr_creus,
      jbr_credt        = @jbr_credt,
      jbr_cretm        = @jbr_cretm,
      jbr_lusdt        = @jbr_lusdt,
      jbr_lustm        = @jbr_lustm,
      jbr_user         = @jbr_user,
      jbr_skip         = @jbr_skip,
      jbr_faill        = @jbr_faill,
      jbr_failh        = @jbr_failh,
      jbr_subp         = @jbr_subp,
      jbr_domain       = @jbr_domain,
      jbr_cycle        = @jbr_cycle,
      jbr_freq         = @jbr_freq,
      jbr_count        = @jbr_count,
      jbr_ccal         = @jbr_ccal,
      jbr_cri          = @jbr_cri,
      jbr_hact         = @jbr_hact,
      jbr_nwact        = @jbr_nwact,
      jbr_cadj         = @jbr_cadj,
      jbr_sutyp        = @jbr_sutyp,
      jbr_qname        = @jbr_qname
   From  jmo_jbr WITH (index=1)
   Where
      jbr_scdn         = @k_jbr_scdn      and
      jbr_name         = @k_jbr_name      and
      jbr_jno          = @k_jbr_jno       
end
GO

GO
--SqlScripter----[dbo].[JMO_JHR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JHR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JHR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JHR_Del    Script Date: 12/1/2005 11:49:18 PM ******/


ALTER PROCEDURE [dbo].[JMO_JHR_Del]
(
   @k_jhr_jschd     char(65),
   @k_jhr_name      char(65),
   @k_jhr_jno       char(5),
   @k_jhr_key       char(12)
)
as
begin
   Delete From jmo_jhr
   Where
       jhr_jschd        = @k_jhr_jschd     and
       jhr_name         = @k_jhr_name      and
       jhr_jno          = @k_jhr_jno       and
       jhr_key          = @k_jhr_key

end
GO

GO
--SqlScripter----[dbo].[JMO_JHR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JHR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JHR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JHR_Ins    Script Date: 12/1/2005 11:49:18 PM ******/


ALTER PROCEDURE [dbo].[JMO_JHR_Ins]
(
   @jhr_jschd        char(65),
   @jhr_name         char(65),
   @jhr_jno          char(5),
   @jhr_key          char(12),
   @jhr_ws           varchar(21),
   @jhr_avcpu        int,
   @jhr_hcnt         smallint,
   @jhr_erdt         int,
   @jhr_msdt         int,
   @jhr_deddt        int,
   @jhr_adate        int,
   @jhr_vdate        int,
   @jhr_sdate        int,
   @jhr_edate        int,
   @jhr_ertm         int,
   @jhr_mstm         int,
   @jhr_dedtm        int,
   @jhr_atime        int,
   @jhr_vtime        int,
   @jhr_stime        int,
   @jhr_etime        int,
   @jhr_relpt        int,
   @jhr_rcput        int,
   @jhr_code         int,
   @jhr_qual         char(4),
   @jhr_stat         binary(1),
   @jhr_late         char(1),
   @jhr_cmrun        varchar(33),
   @jhr_cmhld        varchar(33),
   @jhr_cmrls        varchar(33),
   @jhr_cmcnc        varchar(33),
   @jhr_cmfrc        varchar(33),
   @jhr_cmstr        varchar(33),
   @jhr_cmcmp        varchar(33),
   @jhr_pid          int,
   @jhr_uxjno        int,
   @jhr_sysid        varchar(65),
   @jhr_avelp        int,
   @jhr_qname        char(1)
)

as
begin
   Insert into jmo_jhr (
      jhr_jschd,
      jhr_name,
      jhr_jno,
      jhr_key,
      jhr_ws,
      jhr_avcpu,
      jhr_hcnt,
      jhr_erdt,
      jhr_msdt,
      jhr_deddt,
      jhr_adate,
      jhr_vdate,
      jhr_sdate,
      jhr_edate,
      jhr_ertm,
      jhr_mstm,
      jhr_dedtm,
      jhr_atime,
      jhr_vtime,
      jhr_stime,
      jhr_etime,
      jhr_relpt,
      jhr_rcput,
      jhr_code,
      jhr_qual,
      jhr_stat,
      jhr_late,
      jhr_cmrun,
      jhr_cmhld,
      jhr_cmrls,
      jhr_cmcnc,
      jhr_cmfrc,
      jhr_cmstr,
      jhr_cmcmp,
      jhr_pid,
      jhr_uxjno,
      jhr_sysid,
      jhr_avelp,
      jhr_qname
)
   Values (
      @jhr_jschd,
      @jhr_name,
      @jhr_jno,
      @jhr_key,
      @jhr_ws,
      @jhr_avcpu,
      @jhr_hcnt,
      @jhr_erdt,
      @jhr_msdt,
      @jhr_deddt,
      @jhr_adate,
      @jhr_vdate,
      @jhr_sdate,
      @jhr_edate,
      @jhr_ertm,
      @jhr_mstm,
      @jhr_dedtm,
      @jhr_atime,
      @jhr_vtime,
      @jhr_stime,
      @jhr_etime,
      @jhr_relpt,
      @jhr_rcput,
      @jhr_code,
      @jhr_qual,
      @jhr_stat,
      @jhr_late,
      @jhr_cmrun,
      @jhr_cmhld,
      @jhr_cmrls,
      @jhr_cmcnc,
      @jhr_cmfrc,
      @jhr_cmstr,
      @jhr_cmcmp,
      @jhr_pid,
      @jhr_uxjno,
      @jhr_sysid,
      @jhr_avelp,
      @jhr_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_JHR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JHR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JHR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JHR_Self    Script Date: 12/1/2005 11:49:18 PM ******/


ALTER PROCEDURE [dbo].[JMO_JHR_Self]
(
   @k_jhr_jschd     char(65),
   @k_jhr_name      char(65),
   @k_jhr_jno       char(5),
   @k_jhr_key       char(12)
)
as
begin
   Select
      jhr_jschd,
      jhr_name,
      jhr_jno,
      jhr_key,
      jhr_ws,
      jhr_avcpu,
      jhr_hcnt,
      jhr_erdt,
      jhr_msdt,
      jhr_deddt,
      jhr_adate,
      jhr_vdate,
      jhr_sdate,
      jhr_edate,
      jhr_ertm,
      jhr_mstm,
      jhr_dedtm,
      jhr_atime,
      jhr_vtime,
      jhr_stime,
      jhr_etime,
      jhr_relpt,
      jhr_rcput,
      jhr_code,
      jhr_qual,
      jhr_stat,
      jhr_late,
      jhr_cmrun,
      jhr_cmhld,
      jhr_cmrls,
      jhr_cmcnc,
      jhr_cmfrc,
      jhr_cmstr,
      jhr_cmcmp,
      jhr_pid,
      jhr_uxjno,
      jhr_sysid,
      jhr_avelp,
      jhr_qname
   From jmo_jhr
   Where
       jhr_jschd        = @k_jhr_jschd     and
       jhr_name         = @k_jhr_name      and
       jhr_jno          = @k_jhr_jno       and
       jhr_key          = @k_jhr_key
   Order by
       jhr_jschd,
       jhr_name,
       jhr_jno,
       jhr_key
end
GO

GO
--SqlScripter----[dbo].[JMO_JHR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JHR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JHR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JHR_Selp    Script Date: 12/1/2005 11:49:18 PM ******/


ALTER PROCEDURE [dbo].[JMO_JHR_Selp]
(
   @k_jhr_jschd     char(65),
   @k_jhr_name      char(65),
   @k_jhr_jno       char(5),
   @k_jhr_key       char(12)
)
as
begin
   Select
      jhr_jschd,
      jhr_name,
      jhr_jno,
      jhr_key,
      jhr_ws,
      jhr_avcpu,
      jhr_hcnt,
      jhr_erdt,
      jhr_msdt,
      jhr_deddt,
      jhr_adate,
      jhr_vdate,
      jhr_sdate,
      jhr_edate,
      jhr_ertm,
      jhr_mstm,
      jhr_dedtm,
      jhr_atime,
      jhr_vtime,
      jhr_stime,
      jhr_etime,
      jhr_relpt,
      jhr_rcput,
      jhr_code,
      jhr_qual,
      jhr_stat,
      jhr_late,
      jhr_cmrun,
      jhr_cmhld,
      jhr_cmrls,
      jhr_cmcnc,
      jhr_cmfrc,
      jhr_cmstr,
      jhr_cmcmp,
      jhr_pid,
      jhr_uxjno,
      jhr_sysid,
      jhr_avelp,
      jhr_qname
   From jmo_jhr
   Where
       jhr_jschd        >= @k_jhr_jschd     and
       jhr_name         >= @k_jhr_name      and
       jhr_jno          >= @k_jhr_jno       and
       jhr_key          >= @k_jhr_key
   Order by
       jhr_jschd,
       jhr_name,
       jhr_jno,
       jhr_key
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_JHR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JHR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JHR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JHR_Upd    Script Date: 12/1/2005 11:49:19 PM ******/


ALTER PROCEDURE [dbo].[JMO_JHR_Upd]
(
   @jhr_jschd        char(65),
   @jhr_name         char(65),
   @jhr_jno          char(5),
   @jhr_key          char(12),
   @jhr_ws           varchar(21),
   @jhr_avcpu        int,
   @jhr_hcnt         smallint,
   @jhr_erdt         int,
   @jhr_msdt         int,
   @jhr_deddt        int,
   @jhr_adate        int,
   @jhr_vdate        int,
   @jhr_sdate        int,
   @jhr_edate        int,
   @jhr_ertm         int,
   @jhr_mstm         int,
   @jhr_dedtm        int,
   @jhr_atime        int,
   @jhr_vtime        int,
   @jhr_stime        int,
   @jhr_etime        int,
   @jhr_relpt        int,
   @jhr_rcput        int,
   @jhr_code         int,
   @jhr_qual         char(4),
   @jhr_stat         binary(1),
   @jhr_late         char(1),
   @jhr_cmrun        varchar(33),
   @jhr_cmhld        varchar(33),
   @jhr_cmrls        varchar(33),
   @jhr_cmcnc        varchar(33),
   @jhr_cmfrc        varchar(33),
   @jhr_cmstr        varchar(33),
   @jhr_cmcmp        varchar(33),
   @jhr_pid          int,
   @jhr_uxjno        int,
   @jhr_sysid        varchar(16),
   @jhr_avelp        int,
   @jhr_qname        char(1),
   @k_jhr_jschd      varchar(65),
   @k_jhr_name       char(65),
   @k_jhr_jno        char(5),
   @k_jhr_key        char(12)
)
as
begin
   Update jmo_jhr
   Set
      jhr_jschd        = @jhr_jschd,
      jhr_name         = @jhr_name,
      jhr_jno          = @jhr_jno,
      jhr_key          = @jhr_key,
      jhr_ws           = @jhr_ws,
      jhr_avcpu        = @jhr_avcpu,
      jhr_hcnt         = @jhr_hcnt,
      jhr_erdt         = @jhr_erdt,
      jhr_msdt         = @jhr_msdt,
      jhr_deddt        = @jhr_deddt,
      jhr_adate        = @jhr_adate,
      jhr_vdate        = @jhr_vdate,
      jhr_sdate        = @jhr_sdate,
      jhr_edate        = @jhr_edate,
      jhr_ertm         = @jhr_ertm,
      jhr_mstm         = @jhr_mstm,
      jhr_dedtm        = @jhr_dedtm,
      jhr_atime        = @jhr_atime,
      jhr_vtime        = @jhr_vtime,
      jhr_stime        = @jhr_stime,
      jhr_etime        = @jhr_etime,
      jhr_relpt        = @jhr_relpt,
      jhr_rcput        = @jhr_rcput,
      jhr_code         = @jhr_code,
      jhr_qual         = @jhr_qual,
      jhr_stat         = @jhr_stat,
      jhr_late         = @jhr_late,
      jhr_cmrun        = @jhr_cmrun,
      jhr_cmhld        = @jhr_cmhld,
      jhr_cmrls        = @jhr_cmrls,
      jhr_cmcnc        = @jhr_cmcnc,
      jhr_cmfrc        = @jhr_cmfrc,
      jhr_cmstr        = @jhr_cmstr,
      jhr_cmcmp        = @jhr_cmcmp,
      jhr_pid          = @jhr_pid,
      jhr_uxjno        = @jhr_uxjno,
      jhr_sysid        = @jhr_sysid,
      jhr_avelp        = @jhr_avelp,
      jhr_qname        = @jhr_qname
   From  jmo_jhr WITH (index=1)
   Where
      jhr_jschd        = @k_jhr_jschd     and
      jhr_name         = @k_jhr_name      and
      jhr_jno          = @k_jhr_jno       and
      jhr_key          = @k_jhr_key
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_Del    Script Date: 12/1/2005 11:49:19 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR_Del]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Delete From jmo_jtr
   Where
       jtr_scdn         = @k_jtr_scdn      and
       jtr_name         = @k_jtr_name      and
       jtr_jno          = @k_jtr_jno       and
       jtr_qual         = @k_jtr_qual

   Delete From jmo_prt
   Where
       prt_scdn         = @k_jtr_scdn      and
       prt_name         = @k_jtr_name      and
       prt_jno          = @k_jtr_jno       and
       prt_qual         = @k_jtr_qual

   Delete From jmo_psrt
   Where
       psr_scdn         = @k_jtr_scdn      and
       psr_name         = @k_jtr_name      and
       psr_jno          = @k_jtr_jno       and
       psr_qual         = @k_jtr_qual

   Delete From jmo_psrt
   Where
       psr_pscd         = @k_jtr_scdn      and
       psr_pjob         = @k_jtr_name      and
       psr_pjno         = @k_jtr_jno       and
       psr_pqua         = @k_jtr_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_DelA    Script Date: 12/1/2005 11:49:19 PM ******/

ALTER PROCEDURE [dbo].[JMO_JTR_DelA]
AS
begin
   Delete From jmo_jtr   
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_Ins    Script Date: 12/1/2005 11:49:19 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR_Ins]
(
   @jtr_scdn         char(65),
   @jtr_name         char(65),
   @jtr_jno          char(5),
   @jtr_qual         char(5),
   @jtr_ows          varchar(21),
   @jtr_ws           varchar(21),
   @jtr_subu         varchar(33),
   @jtr_subfile      varchar(255),
   @jtr_abscd        varchar(65),
   @jtr_avgtb        int,
   @jtr_any          binary(1),
   @jtr_uxjno        int,
   @jtr_erly         int,
   @jtr_must         int,
   @jtr_dedln        int,
   @jtr_mxtim        int,
   @jtr_avgt         int,
   @jtr_flg1         binary(1),
   @jtr_bklog        binary(1),
   @jtr_sutyp        binary(1),
   @jtr_wstyp        char(1),
   @jtr_desc         varchar(255),
   @jtr_newpr        char(2) ,
   @jtr_histc        smallint,
   @jtr_fordate      int,
   @jtr_erdt         int,
   @jtr_mudt         int,
   @jtr_dedt         int,
   @jtr_mxdt         int,
   @jtr_adate        int,
   @jtr_vdate        int,
   @jtr_sdate        int,
   @jtr_edate        int,
   @jtr_pdate        int,
   @jtr_atime        int,
   @jtr_vtime        int,
   @jtr_stime        int,
   @jtr_etime        int,
   @jtr_ptime        int,
   @jtr_dprty        int,
   @jtr_comp         int,
   @jtr_cput         int,
   @jtr_pid          int,
   @jtr_cc           varchar(9),
   @jtr_hstat        binary(1),
   @jtr_rstat        binary(1),
   @jtr_flg3         binary(1),
   @jtr_flg4         binary(1),
   @jtr_flg5         binary(1),
   @jtr_cmrun        varchar(33),
   @jtr_cmhld        varchar(33),
   @jtr_cmrls        varchar(33),
   @jtr_cmcnc        varchar(33),
   @jtr_cmfrc        varchar(33),
   @jtr_cmstr        varchar(33),
   @jtr_cmcmp        varchar(33),
   @jtr_luser        varchar(33),
   @jtr_cal          varchar(9),
   @jtr_cmsub        varchar(16),
   @jtr_abcnt        int,
   @jtr_alias        varchar(65),
   @jtr_nodea        varchar(65),
   @jtr_emsg         char(4),
   @jtr_faill        int,
   @jtr_failh        int,
   @jtr_subp         varchar(15),
   @jtr_domain       varchar(16),
   @jtr_cycle        varchar(1),
   @jtr_freq         int,
   @jtr_count        int,
   @jtr_qname        char(1),
   @jtr_can          char(1)
)
as
begin
   Insert into jmo_jtr (
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
)
   Values (
      @jtr_scdn,
      @jtr_name,
      @jtr_jno,
      @jtr_qual,
      @jtr_ows,
      @jtr_ws,
      @jtr_subu,
      @jtr_subfile,
      @jtr_abscd,
      @jtr_avgtb,
      @jtr_any,
      @jtr_uxjno,
      @jtr_erly,
      @jtr_must,
      @jtr_dedln,
      @jtr_mxtim,
      @jtr_avgt,
      @jtr_flg1,
      @jtr_bklog,
      @jtr_sutyp,
      @jtr_wstyp,
      @jtr_desc,
      @jtr_newpr,
      @jtr_histc,
      @jtr_fordate,
      @jtr_erdt,
      @jtr_mudt,
      @jtr_dedt,
      @jtr_mxdt,
      @jtr_adate,
      @jtr_vdate,
      @jtr_sdate,
      @jtr_edate,
      @jtr_pdate,
      @jtr_atime,
      @jtr_vtime,
      @jtr_stime,
      @jtr_etime,
      @jtr_ptime,
      @jtr_dprty,
      @jtr_comp,
      @jtr_cput,
      @jtr_pid,
      @jtr_cc,
      @jtr_hstat,
      @jtr_rstat,
      @jtr_flg3,
      @jtr_flg4,
      @jtr_flg5,
      @jtr_cmrun,
      @jtr_cmhld,
      @jtr_cmrls,
      @jtr_cmcnc,
      @jtr_cmfrc,
      @jtr_cmstr,
      @jtr_cmcmp,
      @jtr_luser,
      @jtr_cal,
      @jtr_cmsub,
      @jtr_abcnt,
      @jtr_alias,
      @jtr_nodea,
      @jtr_emsg,
      @jtr_faill,
      @jtr_failh,
      @jtr_subp,
      @jtr_domain,
      @jtr_cycle,
      @jtr_freq,
      @jtr_count,
      @jtr_qname,
      @jtr_can
)
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_Self    Script Date: 12/1/2005 11:49:19 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR_Self]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Select
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
   From jmo_jtr
   Where
       jtr_scdn         = @k_jtr_scdn      and
       jtr_name         = @k_jtr_name      and
       jtr_jno          = @k_jtr_jno       and
       jtr_qual         = @k_jtr_qual
   Order by
       jtr_scdn,
       jtr_name,
       jtr_jno,
       jtr_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_Selp    Script Date: 12/1/2005 11:49:19 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR_Selp]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Select
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
   From jmo_jtr
   Where
       jtr_scdn         >= @k_jtr_scdn      and
       jtr_name         >= @k_jtr_name      and
       jtr_jno          >= @k_jtr_jno       and
       jtr_qual         >= @k_jtr_qual
   Order by
       jtr_scdn,
       jtr_name,
       jtr_jno,
       jtr_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR_Upd    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR_Upd]
(
   @jtr_scdn         char(65),
   @jtr_name         char(65),
   @jtr_jno          char(5),
   @jtr_qual         char(5),
   @jtr_ows          varchar(21),
   @jtr_ws           varchar(21),
   @jtr_subu         varchar(33),
   @jtr_subfile      varchar(255),
   @jtr_abscd        varchar(65),
   @jtr_avgtb        int,
   @jtr_any          binary(1),
   @jtr_uxjno        int,
   @jtr_erly         int,
   @jtr_must         int,
   @jtr_dedln        int,
   @jtr_mxtim        int,
   @jtr_avgt         int,
   @jtr_flg1         binary(1),
   @jtr_bklog        binary(1),
   @jtr_sutyp        binary(1),
   @jtr_wstyp        char(1),
   @jtr_desc         varchar(255),
   @jtr_newpr        char(2),
   @jtr_histc        smallint,
   @jtr_fordate      int,
   @jtr_erdt         int,
   @jtr_mudt         int,
   @jtr_dedt         int,
   @jtr_mxdt         int,
   @jtr_adate        int,
   @jtr_vdate        int,
   @jtr_sdate        int,
   @jtr_edate        int,
   @jtr_pdate        int,
   @jtr_atime        int,
   @jtr_vtime        int,
   @jtr_stime        int,
   @jtr_etime        int,
   @jtr_ptime        int,
   @jtr_dprty        int,
   @jtr_comp         int,
   @jtr_cput         int,
   @jtr_pid          int,
   @jtr_cc           varchar(9),
   @jtr_hstat        binary(1),
   @jtr_rstat        binary(1),
   @jtr_flg3         binary(1),
   @jtr_flg4         binary(1),
   @jtr_flg5         binary(1),
   @jtr_cmrun        varchar(33),
   @jtr_cmhld        varchar(33),
   @jtr_cmrls        varchar(33),
   @jtr_cmcnc        varchar(33),
   @jtr_cmfrc        varchar(33),
   @jtr_cmstr        varchar(33),
   @jtr_cmcmp        varchar(33),
   @jtr_luser        varchar(33),
   @jtr_cal          varchar(9),
   @jtr_cmsub        varchar(33),
   @jtr_abcnt        int,
   @jtr_alias        varchar(65),
   @jtr_nodea        varchar(65),
   @jtr_emsg         char(4),
   @jtr_faill        int,
   @jtr_failh        int,
   @jtr_subp         varchar(15),
   @jtr_domain       varchar(16),
   @jtr_cycle        varchar(1),
   @jtr_freq         int,
   @jtr_count        int,
   @jtr_qname        char(1),
   @jtr_can          char(1),
   @k_jtr_scdn       char(65),
   @k_jtr_name       char(65),
   @k_jtr_jno        char(5),
   @k_jtr_qual       char(5) 
)
as
begin
   Update jmo_jtr
   Set
      jtr_scdn         = @jtr_scdn,
      jtr_name         = @jtr_name,
      jtr_jno          = @jtr_jno,
      jtr_qual         = @jtr_qual,
      jtr_ows          = @jtr_ows,
      jtr_ws           = @jtr_ws,
      jtr_subu         = @jtr_subu,
      jtr_subfile      = @jtr_subfile,
      jtr_abscd        = @jtr_abscd,
      jtr_avgtb        = @jtr_avgtb,
      jtr_any          = @jtr_any,
      jtr_uxjno        = @jtr_uxjno,
      jtr_erly         = @jtr_erly,
      jtr_must         = @jtr_must,
      jtr_dedln        = @jtr_dedln,
      jtr_mxtim        = @jtr_mxtim,
      jtr_avgt         = @jtr_avgt,
      jtr_flg1         = @jtr_flg1,
      jtr_bklog        = @jtr_bklog,
      jtr_sutyp        = @jtr_sutyp,
      jtr_wstyp        = @jtr_wstyp,
      jtr_desc         = @jtr_desc,
      jtr_newpr        = @jtr_newpr,
      jtr_histc        = @jtr_histc,
      jtr_fordate      = @jtr_fordate,
      jtr_erdt         = @jtr_erdt,
      jtr_mudt         = @jtr_mudt,
      jtr_dedt         = @jtr_dedt,
      jtr_mxdt         = @jtr_mxdt,
      jtr_adate        = @jtr_adate,
      jtr_vdate        = @jtr_vdate,
      jtr_sdate        = @jtr_sdate,
      jtr_edate        = @jtr_edate,
      jtr_pdate        = @jtr_pdate,
      jtr_atime        = @jtr_atime,
      jtr_vtime        = @jtr_vtime,
      jtr_stime        = @jtr_stime,
      jtr_etime        = @jtr_etime,
      jtr_ptime        = @jtr_ptime,
      jtr_dprty        = @jtr_dprty,
      jtr_comp         = @jtr_comp,
      jtr_cput         = @jtr_cput,
      jtr_pid          = @jtr_pid,
      jtr_cc           = @jtr_cc,
      jtr_hstat        = @jtr_hstat,
      jtr_rstat        = @jtr_rstat,
      jtr_flg3         = @jtr_flg3,
      jtr_flg4         = @jtr_flg4,
      jtr_flg5         = @jtr_flg5,
      jtr_cmrun        = @jtr_cmrun,
      jtr_cmhld        = @jtr_cmhld,
      jtr_cmrls        = @jtr_cmrls,
      jtr_cmcnc        = @jtr_cmcnc,
      jtr_cmfrc        = @jtr_cmfrc,
      jtr_cmstr        = @jtr_cmstr,
      jtr_cmcmp        = @jtr_cmcmp,
      jtr_luser        = @jtr_luser,
      jtr_cal          = @jtr_cal,
      jtr_cmsub        = @jtr_cmsub,
      jtr_abcnt        = @jtr_abcnt,
      jtr_alias        = @jtr_alias,
      jtr_nodea        = @jtr_nodea,
      jtr_emsg         = @jtr_emsg,
      jtr_faill        = @jtr_faill,
      jtr_failh        = @jtr_failh,
      jtr_subp         = @jtr_subp,
      jtr_domain       = @jtr_domain,
      jtr_cycle        = @jtr_cycle,
      jtr_freq         = @jtr_freq,
      jtr_count        = @jtr_count,
      jtr_qname        = @jtr_qname,
      jtr_can          = @jtr_can
   From  jmo_jtr WITH (index=1)
   Where
      jtr_scdn         = @k_jtr_scdn      and
      jtr_name         = @k_jtr_name      and
      jtr_jno          = @k_jtr_jno       and
      jtr_qual         = @k_jtr_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_Del    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_Del]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Delete From jmo_jtr1
   Where
       jtr_scdn         = @k_jtr_scdn      and
       jtr_name         = @k_jtr_name      and
       jtr_jno          = @k_jtr_jno       and
       jtr_qual         = @k_jtr_qual

   Delete From jmo_prt1
   Where
       prt_scdn         = @k_jtr_scdn      and
       prt_name         = @k_jtr_name      and
       prt_jno          = @k_jtr_jno       and
       prt_qual         = @k_jtr_qual

   Delete From jmo_psr1
   Where
       psr_scdn         = @k_jtr_scdn      and
       psr_name         = @k_jtr_name      and
       psr_jno          = @k_jtr_jno       and
       psr_qual         = @k_jtr_qual

   Delete From jmo_psr1
   Where
       psr_pscd         = @k_jtr_scdn      and
       psr_pjob         = @k_jtr_name      and
       psr_pjno         = @k_jtr_jno       and
       psr_pqua         = @k_jtr_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_DelA    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_DelA]
AS
begin
   Delete From jmo_jtr1   
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_Ins    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_Ins]
(
   @jtr_scdn         char(65),
   @jtr_name         char(65),
   @jtr_jno          char(5),
   @jtr_qual         char(5),
   @jtr_ows          varchar(21),
   @jtr_ws           varchar(21),
   @jtr_subu         varchar(33),
   @jtr_subfile      varchar(255),
   @jtr_abscd        varchar(65),
   @jtr_avgtb        int,
   @jtr_any          binary(1),
   @jtr_uxjno        int,
   @jtr_erly         int,
   @jtr_must         int,
   @jtr_dedln        int,
   @jtr_mxtim        int,
   @jtr_avgt         int,
   @jtr_flg1         binary(1),
   @jtr_bklog        binary(1),
   @jtr_sutyp        binary(1),
   @jtr_wstyp        char(1),
   @jtr_desc         varchar(255),
   @jtr_newpr        char(2) ,
   @jtr_histc        smallint,
   @jtr_fordate      int,
   @jtr_erdt         int,
   @jtr_mudt         int,
   @jtr_dedt         int,
   @jtr_mxdt         int,
   @jtr_adate        int,
   @jtr_vdate        int,
   @jtr_sdate        int,
   @jtr_edate        int,
   @jtr_pdate        int,
   @jtr_atime        int,
   @jtr_vtime        int,
   @jtr_stime        int,
   @jtr_etime        int,
   @jtr_ptime        int,
   @jtr_dprty        int,
   @jtr_comp         int,
   @jtr_cput         int,
   @jtr_pid          int,
   @jtr_cc           varchar(9),
   @jtr_hstat        binary(1),
   @jtr_rstat        binary(1),
   @jtr_flg3         binary(1),
   @jtr_flg4         binary(1),
   @jtr_flg5         binary(1),
   @jtr_cmrun        varchar(33),
   @jtr_cmhld        varchar(33),
   @jtr_cmrls        varchar(33),
   @jtr_cmcnc        varchar(33),
   @jtr_cmfrc        varchar(33),
   @jtr_cmstr        varchar(33),
   @jtr_cmcmp        varchar(33),
   @jtr_luser        varchar(33),
   @jtr_cal          varchar(9),
   @jtr_cmsub        varchar(16),
   @jtr_abcnt        int,
   @jtr_alias        varchar(65),
   @jtr_nodea        varchar(65),
   @jtr_emsg         char(4),
   @jtr_faill        int,
   @jtr_failh        int,
   @jtr_subp         varchar(15),
   @jtr_domain       varchar(16),
   @jtr_cycle        varchar(1),
   @jtr_freq         int,
   @jtr_count        int,
   @jtr_qname        char(1),
   @jtr_can          char(1)
)
as
begin
   Insert into jmo_jtr1 (
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
)
   Values (
      @jtr_scdn,
      @jtr_name,
      @jtr_jno,
      @jtr_qual,
      @jtr_ows,
      @jtr_ws,
      @jtr_subu,
      @jtr_subfile,
      @jtr_abscd,
      @jtr_avgtb,
      @jtr_any,
      @jtr_uxjno,
      @jtr_erly,
      @jtr_must,
      @jtr_dedln,
      @jtr_mxtim,
      @jtr_avgt,
      @jtr_flg1,
      @jtr_bklog,
      @jtr_sutyp,
      @jtr_wstyp,
      @jtr_desc,
      @jtr_newpr,
      @jtr_histc,
      @jtr_fordate,
      @jtr_erdt,
      @jtr_mudt,
      @jtr_dedt,
      @jtr_mxdt,
      @jtr_adate,
      @jtr_vdate,
      @jtr_sdate,
      @jtr_edate,
      @jtr_pdate,
      @jtr_atime,
      @jtr_vtime,
      @jtr_stime,
      @jtr_etime,
      @jtr_ptime,
      @jtr_dprty,
      @jtr_comp,
      @jtr_cput,
      @jtr_pid,
      @jtr_cc,
      @jtr_hstat,
      @jtr_rstat,
      @jtr_flg3,
      @jtr_flg4,
      @jtr_flg5,
      @jtr_cmrun,
      @jtr_cmhld,
      @jtr_cmrls,
      @jtr_cmcnc,
      @jtr_cmfrc,
      @jtr_cmstr,
      @jtr_cmcmp,
      @jtr_luser,
      @jtr_cal,
      @jtr_cmsub,
      @jtr_abcnt,
      @jtr_alias,
      @jtr_nodea,
      @jtr_emsg,
      @jtr_faill,
      @jtr_failh,
      @jtr_subp,
      @jtr_domain,
      @jtr_cycle,
      @jtr_freq,
      @jtr_count,
      @jtr_qname,
      @jtr_can
)
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_Self    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_Self]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Select
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
   From jmo_jtr1
   Where
       jtr_scdn         = @k_jtr_scdn      and
       jtr_name         = @k_jtr_name      and
       jtr_jno          = @k_jtr_jno       and
       jtr_qual         = @k_jtr_qual
   Order by
       jtr_scdn,
       jtr_name,
       jtr_jno,
       jtr_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_Selp    Script Date: 12/1/2005 11:49:20 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_Selp]
(
   @k_jtr_scdn      char(65),
   @k_jtr_name      char(65),
   @k_jtr_jno       char(5),
   @k_jtr_qual      char(5)
)
as
begin
   Select
      jtr_scdn,
      jtr_name,
      jtr_jno,
      jtr_qual,
      jtr_ows,
      jtr_ws,
      jtr_subu,
      jtr_subfile,
      jtr_abscd,
      jtr_avgtb,
      jtr_any,
      jtr_uxjno,
      jtr_erly,
      jtr_must,
      jtr_dedln,
      jtr_mxtim,
      jtr_avgt,
      jtr_flg1,
      jtr_bklog,
      jtr_sutyp,
      jtr_wstyp,
      jtr_desc,
      jtr_newpr,
      jtr_histc,
      jtr_fordate,
      jtr_erdt,
      jtr_mudt,
      jtr_dedt,
      jtr_mxdt,
      jtr_adate,
      jtr_vdate,
      jtr_sdate,
      jtr_edate,
      jtr_pdate,
      jtr_atime,
      jtr_vtime,
      jtr_stime,
      jtr_etime,
      jtr_ptime,
      jtr_dprty,
      jtr_comp,
      jtr_cput,
      jtr_pid,
      jtr_cc,
      jtr_hstat,
      jtr_rstat,
      jtr_flg3,
      jtr_flg4,
      jtr_flg5,
      jtr_cmrun,
      jtr_cmhld,
      jtr_cmrls,
      jtr_cmcnc,
      jtr_cmfrc,
      jtr_cmstr,
      jtr_cmcmp,
      jtr_luser,
      jtr_cal,
      jtr_cmsub,
      jtr_abcnt,
      jtr_alias,
      jtr_nodea,
      jtr_emsg,
      jtr_faill,
      jtr_failh,
      jtr_subp,
      jtr_domain,
      jtr_cycle,
      jtr_freq,
      jtr_count,
      jtr_qname,
      jtr_can
   From jmo_jtr1
   Where
       jtr_scdn         >= @k_jtr_scdn      and
       jtr_name         >= @k_jtr_name      and
       jtr_jno          >= @k_jtr_jno       and
       jtr_qual         >= @k_jtr_qual
   Order by
       jtr_scdn,
       jtr_name,
       jtr_jno,
       jtr_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_JTR1_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JTR1_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JTR1_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JTR1_Upd    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JTR1_Upd]
(
   @jtr_scdn         char(65),
   @jtr_name         char(65),
   @jtr_jno          char(5),
   @jtr_qual         char(5),
   @jtr_ows          varchar(21),
   @jtr_ws           varchar(21),
   @jtr_subu         varchar(33),
   @jtr_subfile      varchar(255),
   @jtr_abscd        varchar(65),
   @jtr_avgtb        int,
   @jtr_any          binary(1),
   @jtr_uxjno        int,
   @jtr_erly         int,
   @jtr_must         int,
   @jtr_dedln        int,
   @jtr_mxtim        int,
   @jtr_avgt         int,
   @jtr_flg1         binary(1),
   @jtr_bklog        binary(1),
   @jtr_sutyp        binary(1),
   @jtr_wstyp        char(1),
   @jtr_desc         varchar(255),
   @jtr_newpr        char(2),
   @jtr_histc        smallint,
   @jtr_fordate      int,
   @jtr_erdt         int,
   @jtr_mudt         int,
   @jtr_dedt         int,
   @jtr_mxdt         int,
   @jtr_adate        int,
   @jtr_vdate        int,
   @jtr_sdate        int,
   @jtr_edate        int,
   @jtr_pdate        int,
   @jtr_atime        int,
   @jtr_vtime        int,
   @jtr_stime        int,
   @jtr_etime        int,
   @jtr_ptime        int,
   @jtr_dprty        int,
   @jtr_comp         int,
   @jtr_cput         int,
   @jtr_pid          int,
   @jtr_cc           varchar(9),
   @jtr_hstat        binary(1),
   @jtr_rstat        binary(1),
   @jtr_flg3         binary(1),
   @jtr_flg4         binary(1),
   @jtr_flg5         binary(1),
   @jtr_cmrun        varchar(33),
   @jtr_cmhld        varchar(33),
   @jtr_cmrls        varchar(33),
   @jtr_cmcnc        varchar(33),
   @jtr_cmfrc        varchar(33),
   @jtr_cmstr        varchar(33),
   @jtr_cmcmp        varchar(33),
   @jtr_luser        varchar(33),
   @jtr_cal          varchar(9),
   @jtr_cmsub        varchar(33),
   @jtr_abcnt        int,
   @jtr_alias        varchar(65),
   @jtr_nodea        varchar(65),
   @jtr_emsg         char(4),
   @jtr_faill        int,
   @jtr_failh        int,
   @jtr_subp         varchar(15),
   @jtr_domain       varchar(16),
   @jtr_cycle        varchar(1),
   @jtr_freq         int,
   @jtr_count        int,
   @jtr_qname        char(1),
   @jtr_can          char(1),
   @k_jtr_scdn       char(65),
   @k_jtr_name       char(65),
   @k_jtr_jno        char(5),
   @k_jtr_qual       char(5) 
)
as
begin
   Update jmo_jtr1
   Set
      jtr_scdn         = @jtr_scdn,
      jtr_name         = @jtr_name,
      jtr_jno          = @jtr_jno,
      jtr_qual         = @jtr_qual,
      jtr_ows          = @jtr_ows,
      jtr_ws           = @jtr_ws,
      jtr_subu         = @jtr_subu,
      jtr_subfile      = @jtr_subfile,
      jtr_abscd        = @jtr_abscd,
      jtr_avgtb        = @jtr_avgtb,
      jtr_any          = @jtr_any,
      jtr_uxjno        = @jtr_uxjno,
      jtr_erly         = @jtr_erly,
      jtr_must         = @jtr_must,
      jtr_dedln        = @jtr_dedln,
      jtr_mxtim        = @jtr_mxtim,
      jtr_avgt         = @jtr_avgt,
      jtr_flg1         = @jtr_flg1,
      jtr_bklog        = @jtr_bklog,
      jtr_sutyp        = @jtr_sutyp,
      jtr_wstyp        = @jtr_wstyp,
      jtr_desc         = @jtr_desc,
      jtr_newpr        = @jtr_newpr,
      jtr_histc        = @jtr_histc,
      jtr_fordate      = @jtr_fordate,
      jtr_erdt         = @jtr_erdt,
      jtr_mudt         = @jtr_mudt,
      jtr_dedt         = @jtr_dedt,
      jtr_mxdt         = @jtr_mxdt,
      jtr_adate        = @jtr_adate,
      jtr_vdate        = @jtr_vdate,
      jtr_sdate        = @jtr_sdate,
      jtr_edate        = @jtr_edate,
      jtr_pdate        = @jtr_pdate,
      jtr_atime        = @jtr_atime,
      jtr_vtime        = @jtr_vtime,
      jtr_stime        = @jtr_stime,
      jtr_etime        = @jtr_etime,
      jtr_ptime        = @jtr_ptime,
      jtr_dprty        = @jtr_dprty,
      jtr_comp         = @jtr_comp,
      jtr_cput         = @jtr_cput,
      jtr_pid          = @jtr_pid,
      jtr_cc           = @jtr_cc,
      jtr_hstat        = @jtr_hstat,
      jtr_rstat        = @jtr_rstat,
      jtr_flg3         = @jtr_flg3,
      jtr_flg4         = @jtr_flg4,
      jtr_flg5         = @jtr_flg5,
      jtr_cmrun        = @jtr_cmrun,
      jtr_cmhld        = @jtr_cmhld,
      jtr_cmrls        = @jtr_cmrls,
      jtr_cmcnc        = @jtr_cmcnc,
      jtr_cmfrc        = @jtr_cmfrc,
      jtr_cmstr        = @jtr_cmstr,
      jtr_cmcmp        = @jtr_cmcmp,
      jtr_luser        = @jtr_luser,
      jtr_cal          = @jtr_cal,
      jtr_cmsub        = @jtr_cmsub,
      jtr_abcnt        = @jtr_abcnt,
      jtr_alias        = @jtr_alias,
      jtr_nodea        = @jtr_nodea,
      jtr_emsg         = @jtr_emsg,
      jtr_faill        = @jtr_faill,
      jtr_failh        = @jtr_failh,
      jtr_subp         = @jtr_subp,
      jtr_domain       = @jtr_domain,
      jtr_cycle        = @jtr_cycle,
      jtr_freq         = @jtr_freq,
      jtr_count        = @jtr_count,
      jtr_qname        = @jtr_qname,
      jtr_can          = @jtr_can
   From  jmo_jtr1 WITH (index=1)
   Where
      jtr_scdn         = @k_jtr_scdn      and
      jtr_name         = @k_jtr_name      and
      jtr_jno          = @k_jtr_jno       and
      jtr_qual         = @k_jtr_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_JWB_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JWB_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JWB_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JWB_Del    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JWB_Del]
(
   @k_jwb_scdn      char(65),
   @k_jwb_name      char(65),
   @k_jwb_jno       char(5),
   @k_jwb_resn      char(17)
)
as
begin
   Delete From jmo_jwb
   Where
       jwb_scdn         = @k_jwb_scdn      and
       jwb_name         = @k_jwb_name      and
       jwb_jno          = @k_jwb_jno       and
       jwb_resn         = @k_jwb_resn

end
GO

GO
--SqlScripter----[dbo].[JMO_JWB_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JWB_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JWB_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JWB_Ins    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JWB_Ins]
(
   @jwb_scdn         char(65),
   @jwb_name         char(65),
   @jwb_jno          char(5),
   @jwb_resn         char(17),
   @jwb_srt          int,
   @jwb_srv          smallint,
   @jwb_flag         binary(1),
   @jwb_desc         varchar(255)
)
as
begin
   Insert into jmo_jwb (
      jwb_scdn,
      jwb_name,
      jwb_jno,
      jwb_resn,
      jwb_srt,
      jwb_srv,
      jwb_flag,
      jwb_desc
)
   Values (
      @jwb_scdn,
      @jwb_name,
      @jwb_jno,
      @jwb_resn,
      @jwb_srt,
      @jwb_srv,
      @jwb_flag,
      @jwb_desc
)
end
GO

GO
--SqlScripter----[dbo].[JMO_JWB_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JWB_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JWB_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JWB_Self    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JWB_Self]
(
   @k_jwb_scdn      char(65),
   @k_jwb_name      char(65),
   @k_jwb_jno       char(5),
   @k_jwb_resn      char(17)
)
as
begin
   Select
      jwb_scdn,
      jwb_name,
      jwb_jno,
      jwb_resn,
      jwb_srt,
      jwb_srv,
      jwb_flag,
      jwb_desc
   From jmo_jwb
   Where
       jwb_scdn         = @k_jwb_scdn      and
       jwb_name         = @k_jwb_name      and
       jwb_jno          = @k_jwb_jno       and
       jwb_resn         = @k_jwb_resn
   Order by
       jwb_scdn,
       jwb_name,
       jwb_jno,
       jwb_resn
end
GO

GO
--SqlScripter----[dbo].[JMO_JWB_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JWB_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JWB_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JWB_Selp    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JWB_Selp]
(
   @k_jwb_scdn      char(65),
   @k_jwb_name      char(65),
   @k_jwb_jno       char(5),
   @k_jwb_resn      char(17)
)
as
begin
   Select
      jwb_scdn,
      jwb_name,
      jwb_jno,
      jwb_resn,
      jwb_srt,
      jwb_srv,
      jwb_flag,
      jwb_desc
   From jmo_jwb
   Where
       jwb_scdn         >= @k_jwb_scdn      and
       jwb_name         >= @k_jwb_name      and
       jwb_jno          >= @k_jwb_jno       and
       jwb_resn         >= @k_jwb_resn
   Order by
       jwb_scdn,
       jwb_name,
       jwb_jno,
       jwb_resn
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_JWB_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_JWB_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_JWB_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_JWB_Upd    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_JWB_Upd]
(
   @jwb_scdn         char(65),
   @jwb_name         char(65),
   @jwb_jno          char(5),
   @jwb_resn         char(17),
   @jwb_srt          int,
   @jwb_srv          smallint,
   @jwb_flag         binary(1),
   @jwb_desc         varchar(255),
   @k_jwb_scdn       char(65),
   @k_jwb_name       char(65),
   @k_jwb_jno        char(5),
   @k_jwb_resn       char(17)
)
as
begin
   Update jmo_jwb
   Set
      jwb_scdn         = @jwb_scdn,
      jwb_name         = @jwb_name,
      jwb_jno          = @jwb_jno,
      jwb_resn         = @jwb_resn,
      jwb_srt          = @jwb_srt,
      jwb_srv          = @jwb_srv,
      jwb_flag         = @jwb_flag,
      jwb_desc         = @jwb_desc
   From  jmo_jwb WITH (index=1)
   Where
      jwb_scdn         = @k_jwb_scdn      and
      jwb_name         = @k_jwb_name      and
      jwb_jno          = @k_jwb_jno       and
      jwb_resn         = @k_jwb_resn
end
GO

GO
--SqlScripter----[dbo].[JMO_MWC_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_MWC_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_MWC_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_MWC_Del    Script Date: 12/1/2005 11:49:21 PM ******/


ALTER PROCEDURE [dbo].[JMO_MWC_Del]
(
   @k_mwc_clus      char(21),
   @k_mwc_name      char(17)
)
as
begin
   Delete From jmo_mwc
   Where
       mwc_clus         = @k_mwc_clus      and
       mwc_name         = @k_mwc_name

end
GO

GO
--SqlScripter----[dbo].[JMO_MWC_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_MWC_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_MWC_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_MWC_Ins    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_MWC_Ins]
(
   @mwc_clus         char(21),
   @mwc_name         char(17),
   @mwc_brt          int,
   @mwc_brv          smallint,
   @mwc_desc         varchar(255)
)
as
begin
   Insert into jmo_mwc (
      mwc_clus,
      mwc_name,
      mwc_brt,
      mwc_brv,
      mwc_desc
)
   Values (
      @mwc_clus,
      @mwc_name,
      @mwc_brt,
      @mwc_brv,
      @mwc_desc
)
end
GO

GO
--SqlScripter----[dbo].[JMO_MWC_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_MWC_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_MWC_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_MWC_Self    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_MWC_Self]
(
   @k_mwc_clus      char(21),
   @k_mwc_name      char(17)
)
as
begin
   Select
      mwc_clus,
      mwc_name,
      mwc_brt,
      mwc_brv,
      mwc_desc
   From jmo_mwc
   Where
       mwc_clus         = @k_mwc_clus      and
       mwc_name         = @k_mwc_name
   Order by
       mwc_clus,
       mwc_name
end
GO

GO
--SqlScripter----[dbo].[JMO_MWC_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_MWC_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_MWC_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_MWC_Selp    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_MWC_Selp]
(
   @k_mwc_clus      char(21),
   @k_mwc_name      char(17)
)
as
begin
   Select
      mwc_clus,
      mwc_name,
      mwc_brt,
      mwc_brv,
      mwc_desc
   From jmo_mwc
   Where
       mwc_clus         >= @k_mwc_clus      and
       mwc_name         >= @k_mwc_name
   Order by
       mwc_clus,
       mwc_name
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_MWC_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_MWC_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_MWC_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_MWC_Upd    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_MWC_Upd]
(
   @mwc_clus         char(21),
   @mwc_name         char(17),
   @mwc_brt          int,
   @mwc_brv          smallint,
   @mwc_desc         varchar(255),
   @k_mwc_clus       char(21),
   @k_mwc_name       char(17)
)
as
begin
   Update jmo_mwc
   Set
      mwc_clus         = @mwc_clus,
      mwc_name         = @mwc_name,
      mwc_brt          = @mwc_brt,
      mwc_brv          = @mwc_brv,
      mwc_desc         = @mwc_desc
   From  jmo_mwc WITH (index=1)
   Where
      mwc_clus         = @k_mwc_clus      and
      mwc_name         = @k_mwc_name
end
GO

GO
--SqlScripter----[dbo].[JMO_NOD_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_NOD_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_NOD_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_NOD_Del    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_NOD_Del]
(
   @k_nod_name      char(65)
)
as
begin
   Delete From jmo_nod
   Where
       nod_name         = @k_nod_name

end
GO

GO
--SqlScripter----[dbo].[JMO_NOD_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_NOD_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_NOD_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_NOD_Ins    Script Date: 12/1/2005 11:49:22 PM ******/


ALTER PROCEDURE [dbo].[JMO_NOD_Ins]
(
   @nod_name         char(65),
   @nod_ckpt         char(16),
   @nod_boot         char(16)
)
as
begin
   Insert into jmo_nod (
      nod_name,
      nod_ckpt,
      nod_boot
)
   Values (
      @nod_name,
      @nod_ckpt,
      @nod_boot
)
end
GO

GO
--SqlScripter----[dbo].[JMO_NOD_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_NOD_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_NOD_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_NOD_Self    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_NOD_Self]
(
   @k_nod_name      char(65)
)
as
begin
   Select
      nod_name,
      nod_ckpt,
      nod_boot
   From jmo_nod
   Where
       nod_name         = @k_nod_name
   Order by
       nod_name
end
GO

GO
--SqlScripter----[dbo].[JMO_NOD_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_NOD_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_NOD_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_NOD_Selp    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_NOD_Selp]
(
   @k_nod_name      char(65)
)
as
begin
   Select
      nod_name,
      nod_ckpt,
      nod_boot
   From jmo_nod
   Where
       nod_name         >= @k_nod_name
   Order by
       nod_name
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_NOD_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_NOD_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_NOD_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_NOD_Upd    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_NOD_Upd]
(
   @nod_name         char(65),
   @nod_ckpt         char(16),
   @nod_boot         char(16),
   @k_nod_name       char(65)
)
as
begin
   Update jmo_nod
   Set
      nod_name         = @nod_name,
      nod_ckpt         = @nod_ckpt,
      nod_boot         = @nod_boot
   From  jmo_nod WITH (index=1)
   Where
      nod_name         = @k_nod_name
end
GO

GO
--SqlScripter----[dbo].[JMO_PRB_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRB_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRB_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRB_Del    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRB_Del]
(
   @k_prb_scdn      char(65),
   @k_prb_name      char(65),
   @k_prb_jno       char(5),
   @k_prb_seq       char(5)
)
as
begin
   Delete From jmo_prb
   Where
       prb_scdn         = @k_prb_scdn      and
       prb_name         = @k_prb_name      and
       prb_jno          = @k_prb_jno       

end
GO

GO
--SqlScripter----[dbo].[JMO_PRB_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRB_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRB_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRB_Ins    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRB_Ins]
(
   @prb_scdn         char(65),
   @prb_name         char(65),
   @prb_jno          char(5),
   @prb_seq          char(5),
   @prb_parm1        varchar(255),
   @prb_parm2        varchar(255),
   @prb_parm3        varchar(255),
   @prb_parm4        varchar(255)
   
)
as
begin
   Insert into jmo_prb (
      prb_scdn,
      prb_name,
      prb_jno,
      prb_seq,
      prb_parm1,
      prb_parm2,
      prb_parm3,
      prb_parm4
)
   Values (
      @prb_scdn,
      @prb_name,
      @prb_jno,
      @prb_seq,
      @prb_parm1,
      @prb_parm2,
      @prb_parm3,
      @prb_parm4
)
end
GO

GO
--SqlScripter----[dbo].[JMO_PRB_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRB_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRB_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRB_Self    Script Date: 12/1/2005 11:49:23 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRB_Self]
(
   @k_prb_scdn      char(65),
   @k_prb_name      char(65),
   @k_prb_jno       char(5),
   @k_prb_seq       char(5)
)
as
begin
   Select
      prb_scdn,
      prb_name,
      prb_jno,
      prb_seq,
      prb_parm1,
      prb_parm2,
      prb_parm3,
      prb_parm4
   From jmo_prb
   Where
       prb_scdn         = @k_prb_scdn      and
       prb_name         = @k_prb_name      and
       prb_jno          = @k_prb_jno       and
	   prb_seq         >= @k_prb_seq
   Order by
       prb_scdn,
       prb_name,
       prb_jno,
       prb_seq
   For Browse 
end
GO

GO
--SqlScripter----[dbo].[JMO_PRB_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRB_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRB_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRB_Selp    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRB_Selp]
(
   @k_prb_scdn      char(65),
   @k_prb_name      char(65),
   @k_prb_jno       char(5),
   @k_prb_seq       char(5)
)
as
begin
   Select
      prb_scdn,
      prb_name,
      prb_jno,
      prb_seq,
      prb_parm1,
      prb_parm2,
      prb_parm3,
      prb_parm4

   From jmo_prb
   Where
       prb_scdn         >= @k_prb_scdn      and
       prb_name         >= @k_prb_name      and
       prb_jno          >= @k_prb_jno       and
       prb_seq          >= @k_prb_seq	   
   Order by
       prb_scdn,
       prb_name,
       prb_jno,
       prb_seq
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PRB_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRB_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRB_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRB_Upd    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRB_Upd]
(
   @prb_scdn         char(65),
   @prb_name         char(65),
   @prb_jno          char(5),
   @prb_seq          char(5), 
   @prb_parm1        varchar(255),
   @prb_parm2        varchar(255),
   @prb_parm3        varchar(255),
   @prb_parm4        varchar(255),
   @k_prb_scdn       char(65),
   @k_prb_name       char(65),
   @k_prb_jno        char(5),
   @k_prb_seq        char(5) 
)
as
begin
   Update jmo_prb
   Set
      prb_scdn         = @prb_scdn,
      prb_name         = @prb_name,
      prb_jno          = @prb_jno,
      prb_seq          = @prb_seq,
      prb_parm1        = @prb_parm1,
      prb_parm2        = @prb_parm2,
      prb_parm3        = @prb_parm3,
      prb_parm4        = @prb_parm4
   From  jmo_prb WITH (index=1)
   Where
      prb_scdn         = @k_prb_scdn      and
      prb_name         = @k_prb_name      and
      prb_jno          = @k_prb_jno       and
      prb_seq          = @k_prb_seq
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_Del    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_Del]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Delete From jmo_prt
   Where
       prt_scdn         = @k_prt_scdn      and
       prt_name         = @k_prt_name      and
       prt_jno          = @k_prt_jno       and
       prt_qual         = @k_prt_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_DelA    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_DelA]
AS
begin
   Delete From jmo_prt   
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_Ins    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_Ins]
(
   @prt_scdn         char(65),
   @prt_name         char(65),
   @prt_jno          char(5),
   @prt_qual         char(5),
   @prt_seq          char(5),
   @prt_parm1        varchar(255),
   @prt_parm2        varchar(255),
   @prt_parm3        varchar(255),
   @prt_parm4        varchar(255)
)
as
begin
   Insert into jmo_prt (
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
)
   Values (
      @prt_scdn,
      @prt_name,
      @prt_jno,
      @prt_qual,
      @prt_seq,
      @prt_parm1,
      @prt_parm2,
      @prt_parm3,
      @prt_parm4
)
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_Self    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_Self]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Select
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
   From jmo_prt
   Where
       prt_scdn         = @k_prt_scdn      and
       prt_name         = @k_prt_name      and
       prt_jno          = @k_prt_jno       and
       prt_qual         = @k_prt_qual      and
       prt_seq         >= @k_prt_seq
   Order by
       prt_scdn,
       prt_name,
       prt_jno,
       prt_qual,
       prt_seq
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_Selp    Script Date: 12/1/2005 11:49:24 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_Selp]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Select
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
   From jmo_prt
   Where
       prt_scdn         >= @k_prt_scdn      and
       prt_name         >= @k_prt_name      and
       prt_jno          >= @k_prt_jno       and
       prt_qual         >= @k_prt_qual      and
       prt_seq          >= @k_prt_seq
   Order by
       prt_scdn,
       prt_name,
       prt_jno,
       prt_qual,
       prt_seq
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT_Upd    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT_Upd]
(
   @prt_scdn         char(65),
   @prt_name         char(65),
   @prt_jno          char(5),
   @prt_qual         char(5),
   @prt_seq          char(5),
   @prt_parm1        varchar(255),
   @prt_parm2        varchar(255),
   @prt_parm3        varchar(255),
   @prt_parm4        varchar(255),
   @k_prt_scdn       char(65),
   @k_prt_name       char(65),
   @k_prt_jno        char(5),
   @k_prt_qual       char(5),
   @k_prt_seq        char(5)
)
as
begin
   Update jmo_prt
   Set
      prt_scdn         = @prt_scdn,
      prt_name         = @prt_name,
      prt_jno          = @prt_jno,
      prt_qual         = @prt_qual,
      prt_seq          = @prt_seq,
      prt_parm1        = @prt_parm1,
      prt_parm2        = @prt_parm2,
      prt_parm3        = @prt_parm3,
      prt_parm4        = @prt_parm4
   From  jmo_prt WITH (index=1)
   Where
      prt_scdn         = @k_prt_scdn      and
      prt_name         = @k_prt_name      and
      prt_jno          = @k_prt_jno       and
      prt_qual         = @k_prt_qual      and
      prt_seq          = @k_prt_seq
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_Del    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_Del]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Delete From jmo_prt1
   Where
       prt_scdn         = @k_prt_scdn      and
       prt_name         = @k_prt_name      and
       prt_jno          = @k_prt_jno       and
       prt_qual         = @k_prt_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_DelA    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_DelA]
AS
begin
   Delete From jmo_prt1   
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_Ins    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_Ins]
(
   @prt_scdn         char(65),
   @prt_name         char(65),
   @prt_jno          char(5),
   @prt_qual         char(5),
   @prt_seq          char(5),
   @prt_parm1        varchar(255),
   @prt_parm2        varchar(255),
   @prt_parm3        varchar(255),
   @prt_parm4        varchar(255)
)
as
begin
   Insert into jmo_prt1 (
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
)
   Values (
      @prt_scdn,
      @prt_name,
      @prt_jno,
      @prt_qual,
      @prt_seq,
      @prt_parm1,
      @prt_parm2,
      @prt_parm3,
      @prt_parm4
)
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_Self    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_Self]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Select
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
   From jmo_prt1
   Where
       prt_scdn         = @k_prt_scdn      and
       prt_name         = @k_prt_name      and
       prt_jno          = @k_prt_jno       and
       prt_qual         = @k_prt_qual      and
       prt_seq         >= @k_prt_seq
   Order by
       prt_scdn,
       prt_name,
       prt_jno,
       prt_qual,
       prt_seq
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_Selp    Script Date: 12/1/2005 11:49:25 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_Selp]
(
   @k_prt_scdn      char(65),
   @k_prt_name      char(65),
   @k_prt_jno       char(5),
   @k_prt_qual      char(5),
   @k_prt_seq       char(5)
)
as
begin
   Select
      prt_scdn,
      prt_name,
      prt_jno,
      prt_qual,
      prt_seq,
      prt_parm1,
      prt_parm2,
      prt_parm3,
      prt_parm4
   From jmo_prt1
   Where
       prt_scdn         >= @k_prt_scdn      and
       prt_name         >= @k_prt_name      and
       prt_jno          >= @k_prt_jno       and
       prt_qual         >= @k_prt_qual      and
       prt_seq          >= @k_prt_seq
   Order by
       prt_scdn,
       prt_name,
       prt_jno,
       prt_qual,
       prt_seq
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PRT1_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PRT1_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PRT1_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PRT1_Upd    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PRT1_Upd]
(
   @prt_scdn         char(65),
   @prt_name         char(65),
   @prt_jno          char(5),
   @prt_qual         char(5),
   @prt_seq          char(5),
   @prt_parm1        varchar(255),
   @prt_parm2        varchar(255),
   @prt_parm3        varchar(255),
   @prt_parm4        varchar(255),
   @k_prt_scdn       char(65),
   @k_prt_name       char(65),
   @k_prt_jno        char(5),
   @k_prt_qual       char(5),
   @k_prt_seq        char(5)
)
as
begin
   Update jmo_prt1
   Set
      prt_scdn         = @prt_scdn,
      prt_name         = @prt_name,
      prt_jno          = @prt_jno,
      prt_qual         = @prt_qual,
      prt_seq          = @prt_seq,
      prt_parm1        = @prt_parm1,
      prt_parm2        = @prt_parm2,
      prt_parm3        = @prt_parm3,
      prt_parm4        = @prt_parm4
   From  jmo_prt1 WITH (index=1)
   Where
      prt_scdn         = @k_prt_scdn      and
      prt_name         = @k_prt_name      and
      prt_jno          = @k_prt_jno       and
      prt_qual         = @k_prt_qual      and
      prt_seq          = @k_prt_seq
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Del    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Del]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65), 
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)
   
)
as
begin
   Delete From jmo_psr1
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_qual         = @k_psr_qual      and
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua 
       

end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_DelA    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_DelA]
AS
begin
   Delete From jmo_psr1
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Ins    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Ins]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_qual         char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_pqua         char(5), 
   @psr_flag         binary(1)
)
as
begin
    IF ( EXISTS
            ( SELECT top 1 1 FROM jmo_psr1   
	        WHERE psr_scdn  = @psr_scdn      and
                      psr_name  = @psr_name      and
                      psr_jno   = @psr_jno       and
                      psr_qual  = @psr_qual      and
                      psr_pscd  = @psr_pscd      and
                      psr_pjob  = @psr_pjob      and
                      psr_pjno  = @psr_pjno      and
                      psr_pqua  = @psr_pqua
           ))
        RETURN 2601
    ELSE 
        BEGIN
            Insert into jmo_psr1 (
                psr_scdn,
                psr_name,
                psr_jno,
                psr_qual,
                psr_pscd,
                psr_pjob,
                psr_pjno,
                psr_pqua,
                psr_flag
            )
            Values (
                @psr_scdn,
                @psr_name,
                @psr_jno,
                @psr_qual,
                @psr_pscd,
                @psr_pjob,
                @psr_pjno,
                @psr_pqua,
                @psr_flag
            )
        END
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Self    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Self]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psr1
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_qual         = @k_psr_qual      and
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua
       
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual,
       psr_pscd,
       psr_pjob,
       psr_pjno,
       psr_pqua
       
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Selj].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Selj]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Selj] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Selj    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Selj]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psr1
   Where
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual
       
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Selp    Script Date: 12/1/2005 11:49:26 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Selp]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psr1
   Where
       psr_scdn         >= @k_psr_scdn      and
       psr_name         >= @k_psr_name      and
       psr_jno          >= @k_psr_jno       and
       psr_qual         >= @k_psr_qual      and 
       psr_pscd         >= @k_psr_pscd      and
       psr_pjob         >= @k_psr_pjob      and
       psr_pjno         >= @k_psr_pjno      and
       psr_pqua         >= @k_psr_pqua  
       
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual,
       psr_pscd,
       psr_pjob,
       psr_pjno,
       psr_pqua
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Sels].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Sels]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Sels] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Sels    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Sels]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psr1
   Where
       psr_pscd          = @k_psr_pscd      and
       psr_pjob         >= @k_psr_pjob      and
       psr_pjno         >= @k_psr_pjno      
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual
       
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSR1_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSR1_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSR1_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSR1_Upd    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSR1_Upd]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_qual         char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_pqua         char(5),
   @psr_flag         binary(1),
   @k_psr_scdn       char(65),
   @k_psr_name       char(65),
   @k_psr_jno        char(5),
   @k_psr_qual       char(5),
   @k_psr_pscd       char(65),
   @k_psr_pjob       char(65),
   @k_psr_pjno       char(5),
   @k_psr_pqua       char(5)
)
as
begin
   Update jmo_psr1
   Set
      psr_scdn         = @psr_scdn,
      psr_name         = @psr_name,
      psr_jno          = @psr_jno,
      psr_qual         = @psr_qual,
      psr_pscd         = @psr_pscd,
      psr_pjob         = @psr_pjob,
      psr_pjno         = @psr_pjno,
      psr_pqua         = @psr_pqua,
      psr_flag         = @psr_flag
   From  jmo_psr1
   Where
      psr_scdn         = @k_psr_scdn      and
      psr_name         = @k_psr_name      and
      psr_jno          = @k_psr_jno       and
      psr_qual         = @k_psr_qual      and
      psr_pscd         = @k_psr_pscd      and
      psr_pjob         = @k_psr_pjob      and
      psr_pjno         = @k_psr_pjno      and
      psr_pqua         = @k_psr_pqua 
      
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Del    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Del]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_pscd      char(65),  
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5)
)
as
begin
   Delete From jmo_psrm
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      

end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Ins    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Ins]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_flag         binary(1)
)
as
DECLARE @status int
begin
   IF ( EXISTS
            ( SELECT top 1 1 FROM jmo_psrm   
	        WHERE     psr_scdn  = @psr_scdn      and
                      psr_name  = @psr_name      and
                      psr_jno   = @psr_jno       and
                      psr_pjob  = @psr_pjob      and
                      psr_pjno  = @psr_pjno      and
                      psr_pscd  = @psr_pscd
           ))
        RETURN 2601
   ELSE 
        BEGIN
     
            Insert into jmo_psrm (
                psr_scdn,
                psr_name,
                psr_jno,
                psr_pscd,
                psr_pjob,
                psr_pjno,
                psr_flag
            )
            Values (
                @psr_scdn,
                @psr_name,
                @psr_jno,
                @psr_pscd,
                @psr_pjob,
                @psr_pjno,
                @psr_flag
            )
        END 
   

end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Self    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Self]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_pscd      char(65),  
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5)
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_flag
   From jmo_psrm
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pscd         = @k_psr_pscd
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_pscd,
       psr_pjob,
       psr_pjno
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Selj].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Selj]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Selj] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Selj    Script Date: 12/1/2005 11:49:27 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Selj]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_pscd      char(65),  
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5)
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_flag
   From jmo_psrm
   Where
       psr_pjob         = @k_psr_pjob 
   Order by
       psr_scdn,
       psr_name,
       psr_jno
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Selp    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Selp]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_pscd      char(65),  
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5)
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_flag
   From jmo_psrm
   Where
       psr_scdn         >= @k_psr_scdn      and
       psr_name         >= @k_psr_name      and
       psr_jno          >= @k_psr_jno       and
       psr_pjob         >= @k_psr_pjob      and
       psr_pjno         >= @k_psr_pjno      and
       psr_pscd         >= @k_psr_pscd
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_pjob,
       psr_pjno,
       psr_pscd
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Sels].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Sels]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Sels] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Sels    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Sels]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_pscd      char(65),  
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5)
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_flag
   From jmo_psrm
   Where
       psr_pscd         >= @k_psr_pscd      and
       psr_pjob         >= @k_psr_pjob      
   Order by
       psr_scdn,
       psr_name,
       psr_jno
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRM_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRM_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRM_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRM_Upd    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRM_Upd]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_flag         binary(1),
   @k_psr_scdn       char(65),
   @k_psr_name       char(65),
   @k_psr_jno        char(5),
   @k_psr_pscd       char(65),
   @k_psr_pjob       char(65),
   @k_psr_pjno       char(5)
)
as
begin
   Update jmo_psrm
   Set
      psr_scdn         = @psr_scdn,
      psr_name         = @psr_name,
      psr_jno          = @psr_jno,
      psr_pscd         = @psr_pscd,
      psr_pjob         = @psr_pjob,
      psr_pjno         = @psr_pjno,
      psr_flag         = @psr_flag
   From  jmo_psrm
   Where
      psr_scdn         = @k_psr_scdn      and
      psr_name         = @k_psr_name      and
      psr_jno          = @k_psr_jno       and
      psr_pscd         = @k_psr_pscd      and
      psr_pjob         = @k_psr_pjob      and
      psr_pjno         = @k_psr_pjno      
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Del    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Del]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65), 
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)
   
)
as
begin
   Delete From jmo_psrt
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_qual         = @k_psr_qual      and
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua 
       

end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_DelA    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_DelA]
AS
begin
   Delete From jmo_psrt   
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Ins    Script Date: 12/1/2005 11:49:28 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Ins]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_qual         char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_pqua         char(5), 
   @psr_flag         binary(1)
)
as
begin
    IF ( EXISTS
            ( SELECT top 1 1 FROM jmo_psrt   
	        WHERE psr_scdn  = @psr_scdn      and
                      psr_name  = @psr_name      and
                      psr_jno   = @psr_jno       and
                      psr_qual  = @psr_qual      and
                      psr_pscd  = @psr_pscd      and
                      psr_pjob  = @psr_pjob      and
                      psr_pjno  = @psr_pjno      and
                      psr_pqua  = @psr_pqua
           ))
        RETURN 2601
    ELSE 
        BEGIN
            Insert into jmo_psrt (
                psr_scdn,
                psr_name,
                psr_jno,
                psr_qual,
                psr_pscd,
                psr_pjob,
                psr_pjno,
                psr_pqua,
                psr_flag
            )
            Values (
                @psr_scdn,
                @psr_name,
                @psr_jno,
                @psr_qual,
                @psr_pscd,
                @psr_pjob,
                @psr_pjno,
                @psr_pqua,
                @psr_flag
            )
        END
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Self    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Self]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psrt
   Where
       psr_scdn         = @k_psr_scdn      and
       psr_name         = @k_psr_name      and
       psr_jno          = @k_psr_jno       and
       psr_qual         = @k_psr_qual      and
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua
       
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual,
       psr_pscd,
       psr_pjob,
       psr_pjno,
       psr_pqua
       
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Selj].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Selj]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Selj] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Selj    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Selj]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psrt
   Where
       psr_pscd         = @k_psr_pscd      and
       psr_pjob         = @k_psr_pjob      and
       psr_pjno         = @k_psr_pjno      and
       psr_pqua         = @k_psr_pqua
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual
       
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Selp    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Selp]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psrt
   Where
       psr_scdn         >= @k_psr_scdn      and
       psr_name         >= @k_psr_name      and
       psr_jno          >= @k_psr_jno       and
       psr_qual         >= @k_psr_qual      and 
       psr_pscd         >= @k_psr_pscd      and
       psr_pjob         >= @k_psr_pjob      and
       psr_pjno         >= @k_psr_pjno      and
       psr_pqua         >= @k_psr_pqua  
       
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual,
       psr_pscd,
       psr_pjob,
       psr_pjno,
       psr_pqua
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Sels].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Sels]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Sels] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Sels    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Sels]
(
   @k_psr_scdn      char(65),
   @k_psr_name      char(65),
   @k_psr_jno       char(5),
   @k_psr_qual      char(5),
   @k_psr_pscd      char(65),
   @k_psr_pjob      char(65),
   @k_psr_pjno      char(5),
   @k_psr_pqua      char(5)   
)
as
begin
   Select
      psr_scdn,
      psr_name,
      psr_jno,
      psr_qual,
      psr_pscd,
      psr_pjob,
      psr_pjno,
      psr_pqua,
      psr_flag
   From jmo_psrt
   Where
       psr_pscd          = @k_psr_pscd      and
       psr_pjob         >= @k_psr_pjob      and
       psr_pjno         >= @k_psr_pjno      
   Order by
       psr_scdn,
       psr_name,
       psr_jno,
       psr_qual
       
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_PSRT_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_PSRT_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_PSRT_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_PSRT_Upd    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_PSRT_Upd]
(
   @psr_scdn         char(65),
   @psr_name         char(65),
   @psr_jno          char(5),
   @psr_qual         char(5),
   @psr_pscd         char(65),
   @psr_pjob         char(65),
   @psr_pjno         char(5),
   @psr_pqua         char(5),
   @psr_flag         binary(1),
   @k_psr_scdn       char(65),
   @k_psr_name       char(65),
   @k_psr_jno        char(5),
   @k_psr_qual       char(5),
   @k_psr_pscd       char(65),
   @k_psr_pjob       char(65),
   @k_psr_pjno       char(5),
   @k_psr_pqua       char(5)
)
as
begin
   Update jmo_psrt
   Set
      psr_scdn         = @psr_scdn,
      psr_name         = @psr_name,
      psr_jno          = @psr_jno,
      psr_qual         = @psr_qual,
      psr_pscd         = @psr_pscd,
      psr_pjob         = @psr_pjob,
      psr_pjno         = @psr_pjno,
      psr_pqua         = @psr_pqua,
      psr_flag         = @psr_flag
   From  jmo_psrt
   Where
      psr_scdn         = @k_psr_scdn      and
      psr_name         = @k_psr_name      and
      psr_jno          = @k_psr_jno       and
      psr_qual         = @k_psr_qual      and
      psr_pscd         = @k_psr_pscd      and
      psr_pjob         = @k_psr_pjob      and
      psr_pjno         = @k_psr_pjno      and
      psr_pqua         = @k_psr_pqua 
      
end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_Del    Script Date: 12/1/2005 11:49:29 PM ******/


ALTER PROCEDURE [dbo].[JMO_SBR_Del]
(
   @k_sbr_name      char(65)
)
as
begin
   Delete From jmo_sbr
   Where
       sbr_name         = @k_sbr_name

   Delete From jmo_swb
   Where
       swb_name         = @k_sbr_name

/* drop jbr and peripherals associated with set   */

   Delete From jmo_jbr
   Where
       jbr_scdn         = @k_sbr_name

   Delete From jmo_jwb
   Where
       jwb_scdn         = @k_sbr_name

   Delete From jmo_prb
   Where
       prb_scdn         = @k_sbr_name

/* drop PSRM where base key is equal to set   */

   Delete From jmo_psrm
   Where
       psr_scdn         = @k_sbr_name

/* drop psrm where pred set is equal to set    */

   Delete From jmo_psrm
   Where
       psr_pscd         = @k_sbr_name

end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_DelT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_DelT]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_DelT] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_DelT    Script Date: 12/1/2005 11:49:30 PM ******/



ALTER PROCEDURE [dbo].[JMO_SBR_DelT]
(
   @k_sbr_name      char(65)
)
as
begin
   Delete From jmo_sbr
   Where
       sbr_name         = @k_sbr_name

end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_DelY].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_DelY]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_DelY] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_DelY    Script Date: 12/1/2005 11:49:30 PM ******/



ALTER PROCEDURE [dbo].[JMO_SBR_DelY]
(
   @k_sbr_name      char(65)
)
as
begin
   Delete From jmo_sbr
   Where
       sbr_name         = @k_sbr_name

   Delete From jmo_swb
   Where
       swb_name         = @k_sbr_name

/* drop jbr and peripherals associated with set   */

   Delete From jmo_jbr
   Where
       jbr_scdn         = @k_sbr_name

   Delete From jmo_jwb
   Where
       jwb_scdn         = @k_sbr_name

   Delete From jmo_prb
   Where
       prb_scdn         = @k_sbr_name

/* drop PSRM where base key is equal to set   */

   Delete From jmo_psrm
   Where
       psr_scdn         = @k_sbr_name

end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_Ins    Script Date: 12/1/2005 11:49:30 PM ******/


ALTER PROCEDURE [dbo].[JMO_SBR_Ins]
(
   @sbr_name         char(65),
   @sbr_effdt        int,
   @sbr_expdt        int,
   @sbr_sprty        char(2),
   @sbr_stype        char(1),
   @sbr_any          binary(1),
   @sbr_ws           varchar(21),
   @sbr_cal          varchar(9),
   @sbr_erly         int,
   @sbr_must         int,
   @sbr_dedln        int,
   @sbr_mxtim        int,
   @sbr_avg          int,
   @sbr_flg1         binary(1),
   @sbr_bklog        binary(1),
   @sbr_recs1        char(1),
   @sbr_histc        smallint,
   @sbr_creus        varchar(33),
   @sbr_credt        int,
   @sbr_cretm        int,
   @sbr_lusdt        int,
   @sbr_lustm        int,
   @sbr_skip         int,
   @sbr_user         varchar(33),
   @sbr_desc         varchar(255),
   @sbr_faill        int,
   @sbr_failh        int,
   @sbr_subu         varchar(33),
   @sbr_subp         varchar(15),
   @sbr_domain       varchar(16),
   @sbr_ccal         varchar(9),
   @sbr_cri          varchar(255),   
   @sbr_hact         char(2),
   @sbr_nwact        char(2),
   @sbr_cadj         varchar(5),
   @sbr_sutyp        binary(1),
   @sbr_qname        char(1)
)
as
begin
   Insert into jmo_sbr (
      sbr_name,
      sbr_effdt,
      sbr_expdt,
      sbr_sprty,
      sbr_stype,
      sbr_any,
      sbr_ws,
      sbr_cal,
      sbr_erly,
      sbr_must,
      sbr_dedln,
      sbr_mxtim,
      sbr_avg,
      sbr_flg1,
      sbr_bklog,
      sbr_recs1,
      sbr_histc,
      sbr_creus,
      sbr_credt,
      sbr_cretm,
      sbr_lusdt,
      sbr_lustm,
      sbr_skip,
      sbr_user,
      sbr_desc,
      sbr_faill,
      sbr_failh,
      sbr_subu,
      sbr_subp,
      sbr_domain,
      sbr_ccal,
      sbr_cri,
      sbr_hact,
      sbr_nwact,
      sbr_cadj,
      sbr_sutyp,
      sbr_qname
)
   Values (
      @sbr_name,
      @sbr_effdt,
      @sbr_expdt,
      @sbr_sprty,
      @sbr_stype,
      @sbr_any,
      @sbr_ws,
      @sbr_cal,
      @sbr_erly,
      @sbr_must,
      @sbr_dedln,
      @sbr_mxtim,
      @sbr_avg,
      @sbr_flg1,
      @sbr_bklog,
      @sbr_recs1,
      @sbr_histc,
      @sbr_creus,
      @sbr_credt,
      @sbr_cretm,
      @sbr_lusdt,
      @sbr_lustm,
      @sbr_skip,
      @sbr_user,
      @sbr_desc,
      @sbr_faill,
      @sbr_failh,
      @sbr_subu,
      @sbr_subp,
      @sbr_domain,
      @sbr_ccal,
      @sbr_cri,
      @sbr_hact,
      @sbr_nwact,
      @sbr_cadj,
      @sbr_sutyp,
      @sbr_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_Self    Script Date: 12/1/2005 11:49:30 PM ******/


ALTER PROCEDURE [dbo].[JMO_SBR_Self]
(
   @k_sbr_name      char(65)
)
as
begin
   Select
      sbr_name,
      sbr_effdt,
      sbr_expdt,
      sbr_sprty,
      sbr_stype,
      sbr_any,
      sbr_ws,
      sbr_cal,
      sbr_erly,
      sbr_must,
      sbr_dedln,
      sbr_mxtim,
      sbr_avg,
      sbr_flg1,
      sbr_bklog,
      sbr_recs1,
      sbr_histc,
      sbr_creus,
      sbr_credt,
      sbr_cretm,
      sbr_lusdt,
      sbr_lustm,
      sbr_skip,
      sbr_user,
      sbr_desc,
      sbr_faill,
      sbr_failh,
      sbr_subu,
      sbr_subp,
      sbr_domain,
      sbr_ccal,
      sbr_cri,
      sbr_hact,
      sbr_nwact,
      sbr_cadj,
      sbr_sutyp,
      sbr_qname
   From jmo_sbr
   Where
       sbr_name         = @k_sbr_name
   Order by
       sbr_name
end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_Selp    Script Date: 12/1/2005 11:49:30 PM ******/


ALTER PROCEDURE [dbo].[JMO_SBR_Selp]
(
   @k_sbr_name      char(65)
)
as
begin
   Select
      sbr_name,
      sbr_effdt,
      sbr_expdt,
      sbr_sprty,
      sbr_stype,
      sbr_any,
      sbr_ws,
      sbr_cal,
      sbr_erly,
      sbr_must,
      sbr_dedln,
      sbr_mxtim,
      sbr_avg,
      sbr_flg1,
      sbr_bklog,
      sbr_recs1,
      sbr_histc,
      sbr_creus,
      sbr_credt,
      sbr_cretm,
      sbr_lusdt,
      sbr_lustm,
      sbr_skip,
      sbr_user,
      sbr_desc,
      sbr_faill,
      sbr_failh,
      sbr_subu,
      sbr_subp,
      sbr_domain,
      sbr_ccal,
      sbr_cri,
      sbr_hact,
      sbr_nwact,
      sbr_cadj,
      sbr_sutyp,
      sbr_qname
   From jmo_sbr
   Where
       sbr_name         >= @k_sbr_name
   Order by
       sbr_name
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_SBR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SBR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SBR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SBR_Upd    Script Date: 12/1/2005 11:49:30 PM ******/


ALTER PROCEDURE [dbo].[JMO_SBR_Upd]
(
   @sbr_name         char(65),
   @sbr_effdt        int,
   @sbr_expdt        int,
   @sbr_sprty        char(2),
   @sbr_stype        char(1),
   @sbr_any          binary(1),
   @sbr_ws           varchar(21),
   @sbr_cal          varchar(9),
   @sbr_erly         int,
   @sbr_must         int,
   @sbr_dedln        int,
   @sbr_mxtim        int,
   @sbr_avg          int,
   @sbr_flg1         binary(1),
   @sbr_bklog        binary(1),
   @sbr_recs1        char(1),
   @sbr_histc        smallint,
   @sbr_creus        varchar(33),
   @sbr_credt        int,
   @sbr_cretm        int,
   @sbr_lusdt        int,
   @sbr_lustm        int,
   @sbr_skip         int,
   @sbr_user         varchar(33),
   @sbr_desc         varchar(255),
   @sbr_faill        int,
   @sbr_failh        int,
   @sbr_subu         varchar(33),
   @sbr_subp         varchar(15),
   @sbr_domain       varchar(16),
   @sbr_ccal         varchar(9),
   @sbr_cri          varchar(255),   
   @sbr_hact         char(2),
   @sbr_nwact        char(2),
   @sbr_cadj         varchar(5),
   @sbr_sutyp        binary(1),
   @sbr_qname        char(1),
   @k_sbr_name       char(65)
)
as
begin
   Update jmo_sbr
   Set
      sbr_name         = @sbr_name,
      sbr_effdt        = @sbr_effdt,
      sbr_expdt        = @sbr_expdt,
      sbr_sprty        = @sbr_sprty,
      sbr_stype        = @sbr_stype,
      sbr_any          = @sbr_any,
      sbr_ws           = @sbr_ws,
      sbr_cal          = @sbr_cal,
      sbr_erly         = @sbr_erly,
      sbr_must         = @sbr_must,
      sbr_dedln        = @sbr_dedln,
      sbr_mxtim        = @sbr_mxtim,
      sbr_avg          = @sbr_avg,
      sbr_flg1         = @sbr_flg1,
      sbr_bklog        = @sbr_bklog,
      sbr_recs1        = @sbr_recs1,
      sbr_histc        = @sbr_histc,
      sbr_creus        = @sbr_creus,
      sbr_credt        = @sbr_credt,
      sbr_cretm        = @sbr_cretm,
      sbr_lusdt        = @sbr_lusdt,
      sbr_lustm        = @sbr_lustm,
      sbr_skip         = @sbr_skip,
      sbr_user         = @sbr_user,
      sbr_desc         = @sbr_desc,
      sbr_faill        = @sbr_faill,
      sbr_failh        = @sbr_failh,
      sbr_subu         = @sbr_subu,
      sbr_subp         = @sbr_subp,
      sbr_domain       = @sbr_domain,
      sbr_ccal         = @sbr_ccal,
      sbr_cri          = @sbr_cri,
      sbr_hact         = @sbr_hact,
      sbr_nwact        = @sbr_nwact,
      sbr_cadj         = @sbr_cadj,
      sbr_sutyp        = @sbr_sutyp,
      sbr_qname        = @sbr_qname
   From  jmo_sbr WITH (index=1)	   
   Where
      sbr_name         = @k_sbr_name
end
GO

GO
--SqlScripter----[dbo].[JMO_SHR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SHR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SHR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SHR_Del    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_SHR_Del]
(
   @k_shr_name      char(65),
   @k_shr_key       char(12)
)
as
begin
   Delete From jmo_shr
   Where
       shr_name         = @k_shr_name      and
       shr_key          = @k_shr_key

end
GO

GO
--SqlScripter----[dbo].[JMO_SHR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SHR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SHR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SHR_Ins    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_SHR_Ins]
(
   @shr_name         char(65),
   @shr_key          char(12),
   @shr_avelp        int,
   @shr_avcpu        int,
   @shr_hcnt         smallint,
   @shr_erdt         int,
   @shr_msdt         int,
   @shr_deddt        int,
   @shr_adate        int,
   @shr_vdate        int,
   @shr_sdate        int,
   @shr_edate        int,
   @shr_ertm         int,
   @shr_mstm         int,
   @shr_dedtm        int,
   @shr_atime        int,
   @shr_vtime        int,
   @shr_stime        int,
   @shr_etime        int,
   @shr_relpt        int,
   @shr_rcput        int,
   @shr_qual         char(5),
   @shr_cc           varchar(9),
   @shr_ws           varchar(21),
   @shr_stat         binary(1),
   @shr_late         char(1),
   @shr_cmrun        varchar(33),
   @shr_cmhld        varchar(33),
   @shr_cmrls        varchar(33),
   @shr_cmcnc        varchar(33),
   @shr_cmfrc        varchar(33),
   @shr_avgtb        int,
   @shr_qname        char(1)
)
as
begin
   Insert into jmo_shr (
      shr_name,
      shr_key,
      shr_avelp,
      shr_avcpu,
      shr_hcnt,
      shr_erdt,
      shr_msdt,
      shr_deddt,
      shr_adate,
      shr_vdate,
      shr_sdate,
      shr_edate,
      shr_ertm,
      shr_mstm,
      shr_dedtm,
      shr_atime,
      shr_vtime,
      shr_stime,
      shr_etime,
      shr_relpt,
      shr_rcput,
      shr_qual,
      shr_cc,
      shr_ws,
      shr_stat,
      shr_late,
      shr_cmrun,
      shr_cmhld,
      shr_cmrls,
      shr_cmcnc,
      shr_cmfrc,
      shr_avgtb,
      shr_qname
)
   Values (
      @shr_name,
      @shr_key,
      @shr_avelp,
      @shr_avcpu,
      @shr_hcnt,
      @shr_erdt,
      @shr_msdt,
      @shr_deddt,
      @shr_adate,
      @shr_vdate,
      @shr_sdate,
      @shr_edate,
      @shr_ertm,
      @shr_mstm,
      @shr_dedtm,
      @shr_atime,
      @shr_vtime,
      @shr_stime,
      @shr_etime,
      @shr_relpt,
      @shr_rcput,
      @shr_qual,
      @shr_cc,
      @shr_ws,
      @shr_stat,
      @shr_late,
      @shr_cmrun,
      @shr_cmhld,
      @shr_cmrls,
      @shr_cmcnc,
      @shr_cmfrc,
      @shr_avgtb,
      @shr_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_SHR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SHR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SHR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SHR_Self    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_SHR_Self]
(
   @k_shr_name      char(65),
   @k_shr_key       char(12)
)
as
begin
   Select
      shr_name,
      shr_key,
      shr_avelp,
      shr_avcpu,
      shr_hcnt,
      shr_erdt,
      shr_msdt,
      shr_deddt,
      shr_adate,
      shr_vdate,
      shr_sdate,
      shr_edate,
      shr_ertm,
      shr_mstm,
      shr_dedtm,
      shr_atime,
      shr_vtime,
      shr_stime,
      shr_etime,
      shr_relpt,
      shr_rcput,
      shr_qual,
      shr_cc,
      shr_ws,
      shr_stat,
      shr_late,
      shr_cmrun,
      shr_cmhld,
      shr_cmrls,
      shr_cmcnc,
      shr_cmfrc,
      shr_avgtb,
      shr_qname
   From jmo_shr
   Where
       shr_name         = @k_shr_name      and
       shr_key          = @k_shr_key
   Order by
       shr_name,
       shr_key
end
GO

GO
--SqlScripter----[dbo].[JMO_SHR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SHR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SHR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SHR_Selp    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_SHR_Selp]
(
   @k_shr_name      char(65),
   @k_shr_key       char(12)
)
as
begin
   Select
      shr_name,
      shr_key,
      shr_avelp,
      shr_avcpu,
      shr_hcnt,
      shr_erdt,
      shr_msdt,
      shr_deddt,
      shr_adate,
      shr_vdate,
      shr_sdate,
      shr_edate,
      shr_ertm,
      shr_mstm,
      shr_dedtm,
      shr_atime,
      shr_vtime,
      shr_stime,
      shr_etime,
      shr_relpt,
      shr_rcput,
      shr_qual,
      shr_cc,
      shr_ws,
      shr_stat,
      shr_late,
      shr_cmrun,
      shr_cmhld,
      shr_cmrls,
      shr_cmcnc,
      shr_cmfrc,
      shr_avgtb,
      shr_qname
   From jmo_shr
   Where
       shr_name         >= @k_shr_name      and
       shr_key          >= @k_shr_key
   Order by
       shr_name,
       shr_key
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_SHR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SHR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SHR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SHR_Upd    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_SHR_Upd]
(
   @shr_name         char(65),
   @shr_key          char(12),
   @shr_avelp        int,
   @shr_avcpu        int,
   @shr_hcnt         smallint,
   @shr_erdt         int,
   @shr_msdt         int,
   @shr_deddt        int,
   @shr_adate        int,
   @shr_vdate        int,
   @shr_sdate        int,
   @shr_edate        int,
   @shr_ertm         int,
   @shr_mstm         int,
   @shr_dedtm        int,
   @shr_atime        int,
   @shr_vtime        int,
   @shr_stime        int,
   @shr_etime        int,
   @shr_relpt        int,
   @shr_rcput        int,
   @shr_qual         char(5),
   @shr_cc           varchar(9),
   @shr_ws           varchar(21),
   @shr_stat         binary(1),
   @shr_late         char(1),
   @shr_cmrun        varchar(33),
   @shr_cmhld        varchar(33),
   @shr_cmrls        varchar(33),
   @shr_cmcnc        varchar(33),
   @shr_cmfrc        varchar(33),
   @shr_avgtb        int,
   @shr_qname        char(1),
   @k_shr_name       char(65),
   @k_shr_key        char(12)
)
as
begin
   Update jmo_shr
   Set
      shr_name         = @shr_name,
      shr_key          = @shr_key,
      shr_avelp        = @shr_avelp,
      shr_avcpu        = @shr_avcpu,
      shr_hcnt         = @shr_hcnt,
      shr_erdt         = @shr_erdt,
      shr_msdt         = @shr_msdt,
      shr_deddt        = @shr_deddt,
      shr_adate        = @shr_adate,
      shr_vdate        = @shr_vdate,
      shr_sdate        = @shr_sdate,
      shr_edate        = @shr_edate,
      shr_ertm         = @shr_ertm,
      shr_mstm         = @shr_mstm,
      shr_dedtm        = @shr_dedtm,
      shr_atime        = @shr_atime,
      shr_vtime        = @shr_vtime,
      shr_stime        = @shr_stime,
      shr_etime        = @shr_etime,
      shr_relpt        = @shr_relpt,
      shr_rcput        = @shr_rcput,
      shr_qual         = @shr_qual,
      shr_cc           = @shr_cc,
      shr_ws           = @shr_ws,
      shr_stat         = @shr_stat,
      shr_late         = @shr_late,
      shr_cmrun        = @shr_cmrun,
      shr_cmhld        = @shr_cmhld,
      shr_cmrls        = @shr_cmrls,
      shr_cmcnc        = @shr_cmcnc,
      shr_cmfrc        = @shr_cmfrc,
      shr_avgtb        = @shr_avgtb,
      shr_qname        = @shr_qname
   From  jmo_shr WITH (index=1)
   Where
      shr_name         = @k_shr_name      and
      shr_key          = @k_shr_key
end
GO

GO
--SqlScripter----[dbo].[JMO_STR_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_Del    Script Date: 12/1/2005 11:49:31 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_Del]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Delete From jmo_str
   Where
       str_name         = @k_str_name      and
       str_qual         = @k_str_qual

   Delete From jmo_jtr
   Where
       jtr_scdn         = @k_str_name      and
       jtr_qual         = @k_str_qual

   Delete From jmo_prt
   Where
       prt_scdn         = @k_str_name      and
       prt_qual         = @k_str_qual

   Delete From jmo_psrt
   Where
       psr_scdn         = @k_str_name      and
       psr_qual         = @k_str_qual

   Delete From jmo_psrt
   Where
       psr_pscd         = @k_str_name      and
       psr_pqua         = @k_str_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_STR_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_DelA    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_DelA]
AS
begin
   Delete From jmo_str
end
GO

GO
--SqlScripter----[dbo].[JMO_STR_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_Ins    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_Ins]
(
   @str_name         char(65),
   @str_qual         char(5),
   @str_avgtb        int,
   @str_ows          varchar(21),
   @str_ws           varchar(21),
   @str_wstyp        char(1),
   @str_any          binary(1),
   @str_erly         int,
   @str_must         int,
   @str_dedln        int,
   @str_mxtim        int,
   @str_avgt         int,
   @str_jcont        int,
   @str_flg1         binary(1),
   @str_flg3         binary(1),
   @str_bklog        binary(1),
   @str_histc        smallint,
   @str_desc         varchar(255),
   @str_newpr        char(2),
   @str_fordate      int,
   @str_erdt         int,
   @str_mudt         int,
   @str_dedt         int,
   @str_mxdt         int,
   @str_adate        int,
   @str_vdate        int,
   @str_sdate        int,
   @str_edate        int,
   @str_pdate        int,
   @str_atime        int,
   @str_vtime        int,
   @str_stime        int,
   @str_etime        int,
   @str_dprty        int,
   @str_cc           varchar(9),
   @str_hstat        binary(1),
   @str_rstat        binary(1),
   @str_flg5         binary(1),
   @str_cmrun        varchar(33),
   @str_cmhld        varchar(33),
   @str_cmrls        varchar(33),
   @str_cmcnc        varchar(33),
   @str_cmfrc        varchar(33),
   @str_cal          varchar(9),
   @str_faill        int,
   @str_failh        int,
   @str_subu         varchar(33),
   @str_subp         varchar(15),
   @str_domain       varchar(16),
   @str_flg4         binary(1),
   @str_sutyp        binary(1),
   @str_qname        char(1)
)
as
begin
   Insert into jmo_str (
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
)
   Values (
      @str_name,
      @str_qual,
      @str_avgtb,
      @str_ows,
      @str_ws,
      @str_wstyp,
      @str_any,
      @str_erly,
      @str_must,
      @str_dedln,
      @str_mxtim,
      @str_avgt,
      @str_jcont,
      @str_flg1,
      @str_flg3,
      @str_bklog,
      @str_histc,
      @str_desc,
      @str_newpr,
      @str_fordate,
      @str_erdt,
      @str_mudt,
      @str_dedt,
      @str_mxdt,
      @str_adate,
      @str_vdate,
      @str_sdate,
      @str_edate,
      @str_pdate,
      @str_atime,
      @str_vtime,
      @str_stime,
      @str_etime,
      @str_dprty,
      @str_cc,
      @str_hstat,
      @str_rstat,
      @str_flg5,
      @str_cmrun,
      @str_cmhld,
      @str_cmrls,
      @str_cmcnc,
      @str_cmfrc,
      @str_cal,
      @str_faill,
      @str_failh,
      @str_subu,
      @str_subp,
      @str_domain,
      @str_flg4,
      @str_sutyp,
      @str_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_STR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_Self    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_Self]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Select
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
   From jmo_str
   Where
       str_name         = @k_str_name      and
       str_qual         = @k_str_qual
   Order by
       str_name,
       str_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_STR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_Selp    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_Selp]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Select
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
   From jmo_str
   Where
       str_name         >= @k_str_name      and
       str_qual         >= @k_str_qual
   Order by
       str_name,
       str_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_STR_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR_Upd    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR_Upd]
(
   @str_name         char(65),
   @str_qual         char(5),
   @str_avgtb        int,
   @str_ows          varchar(21),
   @str_ws           varchar(21),
   @str_wstyp        char(1),
   @str_any          binary(1),
   @str_erly         int,
   @str_must         int,
   @str_dedln        int,
   @str_mxtim        int,
   @str_avgt         int,
   @str_jcont        int,
   @str_flg1         binary(1),
   @str_flg3         binary(1),
   @str_bklog        binary(1),
   @str_histc        smallint,
   @str_desc         varchar(255),
   @str_newpr        char(2),
   @str_fordate      int,
   @str_erdt         int,
   @str_mudt         int,
   @str_dedt         int,
   @str_mxdt         int,
   @str_adate        int,
   @str_vdate        int,
   @str_sdate        int,
   @str_edate        int,
   @str_pdate        int,
   @str_atime        int,
   @str_vtime        int,
   @str_stime        int,
   @str_etime        int,
   @str_dprty        int,
   @str_cc           varchar(9),
   @str_hstat        binary(1),
   @str_rstat        binary(1),
   @str_flg5         binary(1),
   @str_cmrun        varchar(33),
   @str_cmhld        varchar(33),
   @str_cmrls        varchar(33),
   @str_cmcnc        varchar(33),
   @str_cmfrc        varchar(33),
   @str_cal          varchar(9),
   @str_faill        int,
   @str_failh        int,
   @str_subu         varchar(33),
   @str_subp         varchar(15),
   @str_domain       varchar(16),
   @str_flg4         binary(1),
   @str_sutyp        binary(1),
   @str_qname        char(1),
   @k_str_name       char(65),
   @k_str_qual       char(5)
)
as
begin
   Update jmo_str
   Set
      str_name         = @str_name,
      str_qual         = @str_qual,
      str_avgtb        = @str_avgtb,
      str_ows          = @str_ows,
      str_ws           = @str_ws,
      str_wstyp        = @str_wstyp,
      str_any          = @str_any,
      str_erly         = @str_erly,
      str_must         = @str_must,
      str_dedln        = @str_dedln,
      str_mxtim        = @str_mxtim,
      str_avgt         = @str_avgt,
      str_jcont        = @str_jcont,
      str_flg1         = @str_flg1,
      str_flg3         = @str_flg3,
      str_bklog        = @str_bklog,
      str_histc        = @str_histc,
      str_desc         = @str_desc,
      str_newpr        = @str_newpr,
      str_fordate      = @str_fordate,
      str_erdt         = @str_erdt,
      str_mudt         = @str_mudt,
      str_dedt         = @str_dedt,
      str_mxdt         = @str_mxdt,
      str_adate        = @str_adate,
      str_vdate        = @str_vdate,
      str_sdate        = @str_sdate,
      str_edate        = @str_edate,
      str_pdate        = @str_pdate,
      str_atime        = @str_atime,
      str_vtime        = @str_vtime,
      str_stime        = @str_stime,
      str_etime        = @str_etime,
      str_dprty        = @str_dprty,
      str_cc           = @str_cc,
      str_hstat        = @str_hstat,
      str_rstat        = @str_rstat,
      str_flg5         = @str_flg5,
      str_cmrun        = @str_cmrun,
      str_cmhld        = @str_cmhld,
      str_cmrls        = @str_cmrls,
      str_cmcnc        = @str_cmcnc,
      str_cmfrc        = @str_cmfrc,
      str_cal          = @str_cal,
      str_faill        = @str_faill,
      str_failh        = @str_failh,
      str_subu         = @str_subu,
      str_subp         = @str_subp,
      str_domain       = @str_domain,
      str_flg4         = @str_flg4,
      str_sutyp        = @str_sutyp,
      str_qname        = @str_qname
   From  jmo_str WITH (index=1)
   Where
      str_name         = @k_str_name      and
      str_qual         = @k_str_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_Del    Script Date: 12/1/2005 11:49:32 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_Del]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Delete From jmo_str1
   Where
       str_name         = @k_str_name      and
       str_qual         = @k_str_qual

   Delete From jmo_jtr1
   Where
       jtr_scdn         = @k_str_name      and
       jtr_qual         = @k_str_qual

   Delete From jmo_prt1
   Where
       prt_scdn         = @k_str_name      and
       prt_qual         = @k_str_qual

   Delete From jmo_psr1
   Where
       psr_scdn         = @k_str_name      and
       psr_qual         = @k_str_qual

   Delete From jmo_psr1
   Where
       psr_pscd         = @k_str_name      and
       psr_pqua         = @k_str_qual

end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_DelA    Script Date: 12/1/2005 11:49:33 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_DelA]
AS
begin
   Delete From jmo_str1
end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_Ins    Script Date: 12/1/2005 11:49:33 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_Ins]
(
   @str_name         char(65),
   @str_qual         char(5),
   @str_avgtb        int,
   @str_ows          varchar(21),
   @str_ws           varchar(21),
   @str_wstyp        char(1),
   @str_any          binary(1),
   @str_erly         int,
   @str_must         int,
   @str_dedln        int,
   @str_mxtim        int,
   @str_avgt         int,
   @str_jcont        int,
   @str_flg1         binary(1),
   @str_flg3         binary(1),
   @str_bklog        binary(1),
   @str_histc        smallint,
   @str_desc         varchar(255),
   @str_newpr        char(2),
   @str_fordate      int,
   @str_erdt         int,
   @str_mudt         int,
   @str_dedt         int,
   @str_mxdt         int,
   @str_adate        int,
   @str_vdate        int,
   @str_sdate        int,
   @str_edate        int,
   @str_pdate        int,
   @str_atime        int,
   @str_vtime        int,
   @str_stime        int,
   @str_etime        int,
   @str_dprty        int,
   @str_cc           varchar(9),
   @str_hstat        binary(1),
   @str_rstat        binary(1),
   @str_flg5         binary(1),
   @str_cmrun        varchar(33),
   @str_cmhld        varchar(33),
   @str_cmrls        varchar(33),
   @str_cmcnc        varchar(33),
   @str_cmfrc        varchar(33),
   @str_cal          varchar(9),
   @str_faill        int,
   @str_failh        int,
   @str_subu         varchar(33),
   @str_subp         varchar(15),
   @str_domain       varchar(16),
   @str_flg4         binary(1),
   @str_sutyp        binary(1),
   @str_qname        char(1)
)
as
begin
   Insert into jmo_str1 (
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
)
   Values (
      @str_name,
      @str_qual,
      @str_avgtb,
      @str_ows,
      @str_ws,
      @str_wstyp,
      @str_any,
      @str_erly,
      @str_must,
      @str_dedln,
      @str_mxtim,
      @str_avgt,
      @str_jcont,
      @str_flg1,
      @str_flg3,
      @str_bklog,
      @str_histc,
      @str_desc,
      @str_newpr,
      @str_fordate,
      @str_erdt,
      @str_mudt,
      @str_dedt,
      @str_mxdt,
      @str_adate,
      @str_vdate,
      @str_sdate,
      @str_edate,
      @str_pdate,
      @str_atime,
      @str_vtime,
      @str_stime,
      @str_etime,
      @str_dprty,
      @str_cc,
      @str_hstat,
      @str_rstat,
      @str_flg5,
      @str_cmrun,
      @str_cmhld,
      @str_cmrls,
      @str_cmcnc,
      @str_cmfrc,
      @str_cal,
      @str_faill,
      @str_failh,
      @str_subu,
      @str_subp,
      @str_domain,
      @str_flg4,
      @str_sutyp,
      @str_qname
)
end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_Self    Script Date: 12/1/2005 11:49:33 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_Self]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Select
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
   From jmo_str1
   Where
       str_name         = @k_str_name      and
       str_qual         = @k_str_qual
   Order by
       str_name,
       str_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_Selp    Script Date: 12/1/2005 11:49:33 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_Selp]
(
   @k_str_name      char(65),
   @k_str_qual      char(5)
)
as
begin
   Select
      str_name,
      str_qual,
      str_avgtb,
      str_ows,
      str_ws,
      str_wstyp,
      str_any,
      str_erly,
      str_must,
      str_dedln,
      str_mxtim,
      str_avgt,
      str_jcont,
      str_flg1,
      str_flg3,
      str_bklog,
      str_histc,
      str_desc,
      str_newpr,
      str_fordate,
      str_erdt,
      str_mudt,
      str_dedt,
      str_mxdt,
      str_adate,
      str_vdate,
      str_sdate,
      str_edate,
      str_pdate,
      str_atime,
      str_vtime,
      str_stime,
      str_etime,
      str_dprty,
      str_cc,
      str_hstat,
      str_rstat,
      str_flg5,
      str_cmrun,
      str_cmhld,
      str_cmrls,
      str_cmcnc,
      str_cmfrc,
      str_cal,
      str_faill,
      str_failh,
      str_subu,
      str_subp,
      str_domain,
      str_flg4,
      str_sutyp,
      str_qname
   From jmo_str1
   Where
       str_name         >= @k_str_name      and
       str_qual         >= @k_str_qual
   Order by
       str_name,
       str_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_STR1_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_STR1_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_STR1_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_STR1_Upd    Script Date: 12/1/2005 11:49:33 PM ******/


ALTER PROCEDURE [dbo].[JMO_STR1_Upd]
(
   @str_name         char(65),
   @str_qual         char(5),
   @str_avgtb        int,
   @str_ows          varchar(21),
   @str_ws           varchar(21),
   @str_wstyp        char(1),
   @str_any          binary(1),
   @str_erly         int,
   @str_must         int,
   @str_dedln        int,
   @str_mxtim        int,
   @str_avgt         int,
   @str_jcont        int,
   @str_flg1         binary(1),
   @str_flg3         binary(1),
   @str_bklog        binary(1),
   @str_histc        smallint,
   @str_desc         varchar(255),
   @str_newpr        char(2),
   @str_fordate      int,
   @str_erdt         int,
   @str_mudt         int,
   @str_dedt         int,
   @str_mxdt         int,
   @str_adate        int,
   @str_vdate        int,
   @str_sdate        int,
   @str_edate        int,
   @str_pdate        int,
   @str_atime        int,
   @str_vtime        int,
   @str_stime        int,
   @str_etime        int,
   @str_dprty        int,
   @str_cc           varchar(9),
   @str_hstat        binary(1),
   @str_rstat        binary(1),
   @str_flg5         binary(1),
   @str_cmrun        varchar(33),
   @str_cmhld        varchar(33),
   @str_cmrls        varchar(33),
   @str_cmcnc        varchar(33),
   @str_cmfrc        varchar(33),
   @str_cal          varchar(9),
   @str_faill        int,
   @str_failh        int,
   @str_subu         varchar(33),
   @str_subp         varchar(15),
   @str_domain       varchar(16),
   @str_flg4         binary(1),
   @str_sutyp        binary(1),
   @str_qname        char(1),
   @k_str_name       char(65),
   @k_str_qual       char(5)
)
as
begin
   Update jmo_str1
   Set
      str_name         = @str_name,
      str_qual         = @str_qual,
      str_avgtb        = @str_avgtb,
      str_ows          = @str_ows,
      str_ws           = @str_ws,
      str_wstyp        = @str_wstyp,
      str_any          = @str_any,
      str_erly         = @str_erly,
      str_must         = @str_must,
      str_dedln        = @str_dedln,
      str_mxtim        = @str_mxtim,
      str_avgt         = @str_avgt,
      str_jcont        = @str_jcont,
      str_flg1         = @str_flg1,
      str_flg3         = @str_flg3,
      str_bklog        = @str_bklog,
      str_histc        = @str_histc,
      str_desc         = @str_desc,
      str_newpr        = @str_newpr,
      str_fordate      = @str_fordate,
      str_erdt         = @str_erdt,
      str_mudt         = @str_mudt,
      str_dedt         = @str_dedt,
      str_mxdt         = @str_mxdt,
      str_adate        = @str_adate,
      str_vdate        = @str_vdate,
      str_sdate        = @str_sdate,
      str_edate        = @str_edate,
      str_pdate        = @str_pdate,
      str_atime        = @str_atime,
      str_vtime        = @str_vtime,
      str_stime        = @str_stime,
      str_etime        = @str_etime,
      str_dprty        = @str_dprty,
      str_cc           = @str_cc,
      str_hstat        = @str_hstat,
      str_rstat        = @str_rstat,
      str_flg5         = @str_flg5,
      str_cmrun        = @str_cmrun,
      str_cmhld        = @str_cmhld,
      str_cmrls        = @str_cmrls,
      str_cmcnc        = @str_cmcnc,
      str_cmfrc        = @str_cmfrc,
      str_cal          = @str_cal,
      str_faill        = @str_faill,
      str_failh        = @str_failh,
      str_subu         = @str_subu,
      str_subp         = @str_subp,
      str_domain       = @str_domain,
      str_flg4         = @str_flg4,
      str_sutyp        = @str_sutyp,
      str_qname        = @str_qname
   From  jmo_str1 WITH (index=1)
   Where
      str_name         = @k_str_name      and
      str_qual         = @k_str_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_SWB_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SWB_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SWB_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SWB_Del    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_SWB_Del]
(
   @k_swb_name      char(65),
   @k_swb_resn      char(17)
)
as
begin
   Delete From jmo_swb
   Where
       swb_name         = @k_swb_name      and
       swb_resn         = @k_swb_resn

end
GO

GO
--SqlScripter----[dbo].[JMO_SWB_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SWB_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SWB_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SWB_Ins    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_SWB_Ins]
(
   @swb_name         char(65),
   @swb_resn         char(17),
   @swb_srt          int,
   @swb_srv          smallint,
   @swb_flag         binary(1),
   @swb_desc         varchar(255)
)
as
begin
   Insert into jmo_swb (
      swb_name,
      swb_resn,
      swb_srt,
      swb_srv,
      swb_flag,
      swb_desc
)
   Values (
      @swb_name,
      @swb_resn,
      @swb_srt,
      @swb_srv,
      @swb_flag,
      @swb_desc
)
end
GO

GO
--SqlScripter----[dbo].[JMO_SWB_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SWB_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SWB_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SWB_Self    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_SWB_Self]
(
   @k_swb_name      char(65),
   @k_swb_resn      char(17)
)
as
begin
   Select
      swb_name,
      swb_resn,
      swb_srt,
      swb_srv,
      swb_flag,
      swb_desc
   From jmo_swb
   Where
       swb_name         = @k_swb_name      and
       swb_resn         = @k_swb_resn
   Order by
       swb_name,
       swb_resn
end
GO

GO
--SqlScripter----[dbo].[JMO_SWB_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SWB_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SWB_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SWB_Selp    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_SWB_Selp]
(
   @k_swb_name      char(65),
   @k_swb_resn      char(17)
)
as
begin
   Select
      swb_name,
      swb_resn,
      swb_srt,
      swb_srv,
      swb_flag,
      swb_desc
   From jmo_swb
   Where
       swb_name         >= @k_swb_name      and
       swb_resn         >= @k_swb_resn
   Order by
       swb_name,
       swb_resn
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_SWB_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_SWB_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_SWB_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_SWB_Upd    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_SWB_Upd]
(
   @swb_name         char(65),
   @swb_resn         char(17),
   @swb_srt          int,
   @swb_srv          smallint,
   @swb_flag         binary(1),
   @swb_desc         varchar(255),
   @k_swb_name       char(65),
   @k_swb_resn       char(17)
)
as
begin
   Update jmo_swb
   Set
      swb_name         = @swb_name,
      swb_resn         = @swb_resn,
      swb_srt          = @swb_srt,
      swb_srv          = @swb_srv,
      swb_flag         = @swb_flag,
      swb_desc         = @swb_desc
   From  jmo_swb WITH (index=1)
   Where
      swb_name         = @k_swb_name      and
      swb_resn         = @k_swb_resn
end
GO

GO
--SqlScripter----[dbo].[JMO_TRG_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRG_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRG_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRG_Del    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRG_Del]
(
   @k_trg_trev      char(8),
   @k_trg_trid      char(64)
)
as
begin
   Delete From jmo_trg
   Where
       trg_trev         = @k_trg_trev      and
       trg_trid         = @k_trg_trid

end
GO

GO
--SqlScripter----[dbo].[JMO_TRG_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRG_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRG_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRG_Ins    Script Date: 12/1/2005 11:49:34 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRG_Ins]
(
   @trg_trev char    (  9 ) ,
   @trg_trid char    ( 65 ) ,
   @trg_apc7 varchar (  9 ) ,
   @trg_desc varchar (255 ) ,
   @trg_jnam varchar ( 65 ) ,
   @trg_usid varchar ( 33 ) ,
   @trg_stan varchar ( 21 ) ,
   @trg_faill int,
   @trg_failh int,
   @trg_file varchar (255 ) ,
   @trg_ustat char ( 2 ) ,
   @trg_skip  varchar ( 5 ) ,
   @trg_jobn varchar  ( 5 ) ,
   @trg_scdn varchar ( 65 ) ,
   @trg_estar varchar ( 8 ) ,
   @trg_efend varchar ( 8 ) ,
   @trg_qnam char  ( 2 ) ,
   @trg_bklog char ( 2 ) ,                     
   @trg_cal varchar   ( 9 ) ,                     
   @trg_auto varchar  ( 2 ) ,                            
   @trg_recs1 varchar ( 2 ) ,                  
   @trg_ccal varchar  ( 9 ) ,                 
   @trg_cri varchar   (255) ,                 
   @trg_hact char  ( 2 ) ,                    
   @trg_nwact char ( 2 ) ,                
   @trg_cadj varchar  ( 5 )
)
as
begin
   Insert into jmo_trg (
       trg_trev, 
       trg_trid, 
       trg_apc7,
       trg_desc,
       trg_jnam,
       trg_usid,
       trg_stan,
       trg_faill,
       trg_failh,
       trg_file,
       trg_ustat,
       trg_skip,
       trg_jobn,
       trg_scdn,
       trg_estar,
       trg_efend,
       trg_qnam,
       trg_bklog,                     
       trg_cal,                     
       trg_auto,                            
       trg_recs1,                  
       trg_ccal,                 
       trg_cri,                 
       trg_hact,                    
       trg_nwact,                
       trg_cadj 
)
   Values (
      @trg_trev, 
      @trg_trid, 
      @trg_apc7,
      @trg_desc,
      @trg_jnam,
      @trg_usid,
      @trg_stan,
      @trg_faill,
      @trg_failh,
      @trg_file,
      @trg_ustat,
      @trg_skip,
      @trg_jobn,
      @trg_scdn,
      @trg_estar,
      @trg_efend,
      @trg_qnam,
      @trg_bklog,                     
      @trg_cal,                     
      @trg_auto,                            
      @trg_recs1,                  
      @trg_ccal,                 
      @trg_cri,                 
      @trg_hact,                    
      @trg_nwact,                
      @trg_cadj
)
end
GO

GO
--SqlScripter----[dbo].[JMO_TRG_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRG_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRG_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRG_Self    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRG_Self]
(
   @k_trg_trev      char(9),
   @k_trg_trid      char(65)
)
as
begin
   Select
      trg_trev, 
       trg_trid, 
       trg_apc7,
       trg_desc,
       trg_jnam,
       trg_usid,
       trg_stan,
       trg_faill,
       trg_failh,
       trg_file,
       trg_ustat,
       trg_skip,
       trg_jobn,
       trg_scdn,
       trg_estar,
       trg_efend,
       trg_qnam,
       trg_bklog,                     
       trg_cal,                     
       trg_auto,                            
       trg_recs1,                  
       trg_ccal,                 
       trg_cri,                 
       trg_hact,                    
       trg_nwact,                
       trg_cadj
   From jmo_trg
   Where
       trg_trev         = @k_trg_trev      and
       trg_trid         = @k_trg_trid
   Order by
       trg_trev,
       trg_trid
end
GO

GO
--SqlScripter----[dbo].[JMO_TRG_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRG_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRG_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRG_Selp    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRG_Selp]
(
   @k_trg_trev      char(9),
   @k_trg_trid      char(65)
)
as
begin
   Select
      trg_trev, 
      trg_trid, 
      trg_apc7,
      trg_desc,
      trg_jnam,
      trg_usid,
      trg_stan,
      trg_faill,
      trg_failh,
      trg_file,
      trg_ustat,
      trg_skip,
      trg_jobn,
      trg_scdn,
      trg_estar,
      trg_efend,
      trg_qnam,
      trg_bklog,                     
      trg_cal,                     
      trg_auto,                            
      trg_recs1,                  
      trg_ccal,                 
      trg_cri,                 
      trg_hact,                    
      trg_nwact,                
      trg_cadj
   From jmo_trg
   Where
       trg_trev         >= @k_trg_trev      and
       trg_trid         >= @k_trg_trid
   Order by
       trg_trev,
       trg_trid
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_TRG_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRG_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRG_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRG_Upd    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRG_Upd]
(
   @trg_trev char    (  9 ) ,
   @trg_trid char    ( 65 ) ,
   @trg_apc7 varchar (  9 ) ,
   @trg_desc varchar (255 ) ,
   @trg_jnam varchar ( 65 ) ,
   @trg_usid varchar ( 33 ) ,
   @trg_stan varchar ( 21 ) ,
   @trg_faill int ,
   @trg_failh int ,
   @trg_file varchar (255 ) ,
   @trg_ustat char ( 2 ) ,
   @trg_skip  varchar ( 5 ) ,
   @trg_jobn varchar  ( 5 ) ,
   @trg_scdn varchar ( 65 ) ,
   @trg_estar varchar ( 8 ) ,
   @trg_efend varchar ( 8 ) ,
   @trg_qnam char  ( 2 ) ,
   @trg_bklog char ( 2 ) ,                     
   @trg_cal varchar   ( 9 ) ,                     
   @trg_auto varchar  ( 2 ) ,                            
   @trg_recs1 varchar ( 2 ) ,                  
   @trg_ccal varchar  ( 9 ) ,                 
   @trg_cri varchar   (255) ,                 
   @trg_hact char  ( 2 ) ,                    
   @trg_nwact char ( 2 ) ,                
   @trg_cadj varchar  ( 5 ) ,
   @k_trg_trev       char(9),
   @k_trg_trid       char(65)
)
as
begin
   Update jmo_trg
   Set
      trg_trev  = @trg_trev, 
      trg_trid  = @trg_trid, 
      trg_apc7  = @trg_apc7,
      trg_desc  = @trg_desc,
      trg_jnam  = @trg_jnam,
      trg_usid  = @trg_usid,
      trg_stan  = @trg_stan,
      trg_faill = @trg_faill,
      trg_failh = @trg_failh,
      trg_file  = @trg_file,
      trg_ustat = @trg_ustat,
      trg_skip  = @trg_skip,
      trg_jobn  = @trg_jobn,
      trg_scdn  = @trg_scdn,
      trg_estar = @trg_estar,
      trg_efend = @trg_efend,
      trg_qnam  = @trg_qnam,
      trg_bklog = @trg_bklog,                     
      trg_cal   = @trg_cal,                     
      trg_auto  = @trg_auto,                            
      trg_recs1 = @trg_recs1,                  
      trg_ccal  = @trg_ccal,                 
      trg_cri   = @trg_cri,                 
      trg_hact  = @trg_hact,                    
      trg_nwact = @trg_nwact,                
      trg_cadj  = @trg_cadj
   From  jmo_trg WITH (index=1)
   Where
      trg_trev         = @k_trg_trev      and
      trg_trid         = @k_trg_trid
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_Del    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_Del]
(
   @k_trt_trev      char(8),
   @k_trt_trid      char(64),
   @k_trt_qual      char(5)
)
as
begin
   Delete From jmo_trt
   Where
       trt_trev         = @k_trt_trev      and
       trt_trid         = @k_trt_trid      and
       trt_qual         = @k_trt_qual

   Delete From jmo_psrt
   Where
       psr_scdn         = @k_trt_trev      and
       psr_name         = @k_trt_trid      and
       psr_qual         = @k_trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_DelA    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_DelA]
AS
begin
   Delete From jmo_trt
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_Ins    Script Date: 12/1/2005 11:49:35 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_Ins]
(
   @trt_trev char    (  9 ) ,
   @trt_trid char    ( 65 ) ,
   @trt_qual char    (  5 ) ,
   @trt_apc7 varchar (  9 ) ,
   @trt_desc varchar (255 ) ,
   @trt_jnam varchar ( 65 ) ,
   @trt_usid varchar ( 33 ) ,
   @trt_stan varchar ( 21 ) ,
   @trt_faill int ,
   @trt_failh int ,
   @trt_file varchar (255 ) ,
   @trt_ustat char ( 2 ) ,
   @trt_jobn varchar  ( 5 ) ,
   @trt_scdn varchar ( 65 ) ,
   @trt_bklog char ( 2 ) ,                     
   @trt_cal varchar   ( 9 ) ,                     
   @trt_fdate int  ,                            
   @trt_tstat char ( 2 )                  
)
as
begin
   Insert into jmo_trt (
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
)
   Values (
      @trt_trev, 
      @trt_trid, 
      @trt_qual, 
      @trt_apc7,
      @trt_desc,
      @trt_jnam,
      @trt_usid,
      @trt_stan,
      @trt_faill,
      @trt_failh,
      @trt_file,
      @trt_ustat,
      @trt_jobn,
      @trt_scdn,
      @trt_bklog,                     
      @trt_cal,                     
      @trt_fdate,                            
      @trt_tstat
)
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_Self    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_Self]
(
   @k_trt_trev      char(9),
   @k_trt_trid      char(65),
   @k_trt_qual      char(5)
)
as
begin
   Select
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
   From jmo_trt
   Where
       trt_trev         = @k_trt_trev      and
       trt_trid         = @k_trt_trid      and
       trt_qual         = @k_trt_qual
   Order by
       trt_trev,
       trt_trid,
       trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_Selp    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_Selp]
(
   @k_trt_trev      char(9),
   @k_trt_trid      char(65),
   @k_trt_qual      char(5)
)
as
begin
   Select
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
   From jmo_trt
   Where
       trt_trev         >= @k_trt_trev      and
       trt_trid         >= @k_trt_trid      and
       trt_qual         >= @k_trt_qual
   Order by
       trt_trev,
       trt_trid,
       trt_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT_Upd    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT_Upd]
(
   @trt_trev char    (  9 ) ,
   @trt_trid char    ( 65 ) ,
   @trt_qual char    (  5 ) ,
   @trt_apc7 varchar (  9 ) ,
   @trt_desc varchar (255 ) ,
   @trt_jnam varchar ( 65 ) ,
   @trt_usid varchar ( 33 ) ,
   @trt_stan varchar ( 21 ) ,
   @trt_faill int ,
   @trt_failh int ,
   @trt_file varchar (255 ) ,
   @trt_ustat char ( 2 ) ,
   @trt_jobn varchar  ( 5 ) ,
   @trt_scdn varchar ( 65 ) ,
   @trt_bklog char ( 2 ) ,                     
   @trt_cal varchar   ( 9 ) ,                     
   @trt_fdate int  ,                            
   @trt_tstat char ( 2 ),                  
   @k_trt_trev       char(9),
   @k_trt_trid       char(65),
   @k_trt_qual       char(5)
)
as
begin
   Update jmo_trt
   Set
      trt_trev  = @trt_trev, 
      trt_trid  = @trt_trid, 
      trt_qual  = @trt_qual, 
      trt_apc7  = @trt_apc7,
      trt_desc  = @trt_desc,
      trt_jnam  = @trt_jnam,
      trt_usid  = @trt_usid,
      trt_stan  = @trt_stan,
      trt_faill = @trt_faill,
      trt_failh = @trt_failh,
      trt_file  = @trt_file,
      trt_ustat = @trt_ustat,
      trt_jobn  = @trt_jobn,
      trt_scdn  = @trt_scdn,
      trt_bklog = @trt_bklog,                     
      trt_cal   = @trt_cal,                     
      trt_fdate = @trt_fdate,                            
      trt_tstat = @trt_tstat                  
   From  jmo_trt WITH (index=1)
   Where
      trt_trev         = @k_trt_trev      and
      trt_trid         = @k_trt_trid      and
      trt_qual         = @k_trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_Del].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_Del]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_Del] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_Del    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_Del]
(
   @k_trt_trev      char(8),
   @k_trt_trid      char(64),
   @k_trt_qual      char(5)
)
as
begin
   Delete From jmo_trt1
   Where
       trt_trev         = @k_trt_trev      and
       trt_trid         = @k_trt_trid      and
       trt_qual         = @k_trt_qual

   Delete From jmo_psr1
   Where
       psr_scdn         = @k_trt_trev      and
       psr_name         = @k_trt_trid      and
       psr_qual         = @k_trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_DelA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_DelA]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_DelA] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_DelA    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_DelA]
AS
begin
   Delete From jmo_trt1
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_Ins].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_Ins]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_Ins] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_Ins    Script Date: 12/1/2005 11:49:36 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_Ins]
(
   @trt_trev char    (  9 ) ,
   @trt_trid char    ( 65 ) ,
   @trt_qual char    (  5 ) ,
   @trt_apc7 varchar (  9 ) ,
   @trt_desc varchar (255 ) ,
   @trt_jnam varchar ( 65 ) ,
   @trt_usid varchar ( 33 ) ,
   @trt_stan varchar ( 21 ) ,
   @trt_faill int ,
   @trt_failh int ,
   @trt_file varchar (255 ) ,
   @trt_ustat char ( 2 ) ,
   @trt_jobn varchar  ( 5 ) ,
   @trt_scdn varchar ( 65 ) ,
   @trt_bklog char ( 2 ) ,                     
   @trt_cal varchar   ( 9 ) ,                     
   @trt_fdate int  ,                            
   @trt_tstat char ( 2 )                  
)
as
begin
   Insert into jmo_trt1 (
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
)
   Values (
      @trt_trev, 
      @trt_trid, 
      @trt_qual, 
      @trt_apc7,
      @trt_desc,
      @trt_jnam,
      @trt_usid,
      @trt_stan,
      @trt_faill,
      @trt_failh,
      @trt_file,
      @trt_ustat,
      @trt_jobn,
      @trt_scdn,
      @trt_bklog,                     
      @trt_cal,                     
      @trt_fdate,                            
      @trt_tstat
)
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_Self    Script Date: 12/1/2005 11:49:37 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_Self]
(
   @k_trt_trev      char(9),
   @k_trt_trid      char(65),
   @k_trt_qual      char(5)
)
as
begin
   Select
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
   From jmo_trt1
   Where
       trt_trev         = @k_trt_trev      and
       trt_trid         = @k_trt_trid      and
       trt_qual         = @k_trt_qual
   Order by
       trt_trev,
       trt_trid,
       trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_Selp    Script Date: 12/1/2005 11:49:37 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_Selp]
(
   @k_trt_trev      char(9),
   @k_trt_trid      char(65),
   @k_trt_qual      char(5)
)
as
begin
   Select
       trt_trev, 
       trt_trid, 
       trt_qual, 
       trt_apc7,
       trt_desc,
       trt_jnam,
       trt_usid,
       trt_stan,
       trt_faill,
       trt_failh,
       trt_file,
       trt_ustat,
       trt_jobn,
       trt_scdn,
       trt_bklog,                     
       trt_cal,                     
       trt_fdate,                            
       trt_tstat                  
   From jmo_trt1
   Where
       trt_trev         >= @k_trt_trev      and
       trt_trid         >= @k_trt_trid      and
       trt_qual         >= @k_trt_qual
   Order by
       trt_trev,
       trt_trid,
       trt_qual
   For Browse
end
GO

GO
--SqlScripter----[dbo].[JMO_TRT1_Upd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_TRT1_Upd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_TRT1_Upd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_TRT1_Upd    Script Date: 12/1/2005 11:49:37 PM ******/


ALTER PROCEDURE [dbo].[JMO_TRT1_Upd]
(
   @trt_trev char    (  9 ) ,
   @trt_trid char    ( 65 ) ,
   @trt_qual char    (  5 ) ,
   @trt_apc7 varchar (  9 ) ,
   @trt_desc varchar (255 ) ,
   @trt_jnam varchar ( 65 ) ,
   @trt_usid varchar ( 33 ) ,
   @trt_stan varchar ( 21 ) ,
   @trt_faill int ,
   @trt_failh int ,
   @trt_file varchar (255 ) ,
   @trt_ustat char ( 2 ) ,
   @trt_jobn varchar  ( 5 ) ,
   @trt_scdn varchar ( 65 ) ,
   @trt_bklog char ( 2 ) ,                     
   @trt_cal varchar   ( 9 ) ,                     
   @trt_fdate int  ,                            
   @trt_tstat char ( 2 ),                  
   @k_trt_trev       char(9),
   @k_trt_trid       char(65),
   @k_trt_qual       char(5)
)
as
begin
   Update jmo_trt1
   Set
      trt_trev  = @trt_trev, 
      trt_trid  = @trt_trid, 
      trt_qual  = @trt_qual, 
      trt_apc7  = @trt_apc7,
      trt_desc  = @trt_desc,
      trt_jnam  = @trt_jnam,
      trt_usid  = @trt_usid,
      trt_stan  = @trt_stan,
      trt_faill = @trt_faill,
      trt_failh = @trt_failh,
      trt_file  = @trt_file,
      trt_ustat = @trt_ustat,
      trt_jobn  = @trt_jobn,
      trt_scdn  = @trt_scdn,
      trt_bklog = @trt_bklog,                     
      trt_cal   = @trt_cal,                     
      trt_fdate = @trt_fdate,                            
      trt_tstat = @trt_tstat                  
   From  jmo_trt1 WITH (index=1)
   Where
      trt_trev         = @k_trt_trev      and
      trt_trid         = @k_trt_trid      and
      trt_qual         = @k_trt_qual
end
GO

GO
--SqlScripter----[dbo].[JMO_WBR_Self].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_WBR_Self]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_WBR_Self] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_WBR_Self    Script Date: 12/1/2005 11:50:09 PM ******/


ALTER PROCEDURE [dbo].[JMO_WBR_Self]
(
   @k_wbr_stid      char(21)
)
as
begin
   Select
      wbr_stid,
      wbr_groupid, 
      wbr_node,
      wbr_type,
      wbr_timz,
      wbr_dsc
   From jmo_wbr
   Where
       wbr_stid         = @k_wbr_stid
   Order by
       wbr_stid
end
GO

GO
--SqlScripter----[dbo].[JMO_WBR_Selp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[JMO_WBR_Selp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[JMO_WBR_Selp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.JMO_WBR_Selp    Script Date: 12/1/2005 11:50:10 PM ******/


ALTER PROCEDURE [dbo].[JMO_WBR_Selp]
(
   @k_wbr_stid      char(21)
)
as
begin
   Select
      wbr_stid,
      wbr_groupid, 
      wbr_node,
      wbr_type,
      wbr_timz,
      wbr_dsc
   From jmo_wbr
   Where
       wbr_stid         >= @k_wbr_stid
   Order by
       wbr_stid
   For Browse
end
GO

GO
--SqlScripter----[dbo].[ncjobcfg_server_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ncjobcfg_server_version]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ncjobcfg_server_version] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ncjobcfg_server_version    Script Date: 12/1/2005 11:49:37 PM ******/


/*
 ************************************
 *
 */

ALTER PROCEDURE [dbo].[ncjobcfg_server_version]
(@domain_id int,@job_id int)
as 
begin 
    update ncjobcfg set auto_server_version=auto_server_version+1 
        where domainid=@domain_id 
            and jobid=@job_id 
end
GO

GO
--SqlScripter----[dbo].[ncmodcfg_server_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ncmodcfg_server_version]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ncmodcfg_server_version] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ncmodcfg_server_version    Script Date: 12/1/2005 11:49:37 PM ******/


/*
 ************************************
 *
 */

ALTER PROCEDURE [dbo].[ncmodcfg_server_version]
(@domain_id int, @mo_id int)
as 
begin 
      update ncmodcfg set auto_server_version=auto_server_version+1
        where domainid=@domain_id 
            and moid=@mo_id 
end
GO

GO
--SqlScripter----[dbo].[nctpldef_server_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[nctpldef_server_version]') IS NULL EXEC('CREATE PROCEDURE [dbo].[nctpldef_server_version] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.nctpldef_server_version    Script Date: 12/1/2005 11:49:38 PM ******/


/*
 ************************************
 *
 */


ALTER PROCEDURE [dbo].[nctpldef_server_version]
(@domain_id int, @tp_id int)
as 
begin 
      update nctpldef set auto_server_version=auto_server_version+1 
      where domainid=@domain_id 
        and tpid=@tp_id 
end
GO

GO
--SqlScripter----[dbo].[ols_ac_reset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ols_ac_reset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_ac_reset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ols_ac_reset]
AS
begin 
-- setup security profiles
--
update ca_security_profile set area_ace = s.set_val_lng from ca_settings s
	where  s.set_id = 900;

update ca_security_profile set area_enabled = s.set_val_lng from ca_settings s
	where s.set_id = 901;


-- setup the ols_area_ace table
insert into ols_area_ace ( object_def_uuid, object_type )
		select distinct object_def_uuid, object_type 
			from ca_object_ace ;
			
update ols_area_ace set area_ace = s.set_val_lng from ca_settings s
	where  s.set_id = 900;

end
GO

GO
--SqlScripter----[dbo].[ols_ac_setup_area_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ols_ac_setup_area_ace]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_ac_setup_area_ace] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ols_ac_setup_area_ace]
AS
begin 

	-- get default values
	declare @_ace integer;
	set @_ace = (select set_val_lng from ca_settings where set_id = 900);


	insert into ols_area_ace ( object_def_uuid, area_ace, object_type, security_level ) 
			select distinct object_def_uuid, @_ace, object_type, 4 from ca_object_ace ace 
					where object_def_uuid not in ( select object_def_uuid from ols_area_ace);


end;
GO

GO
--SqlScripter----[dbo].[ols_ac_setup_sp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ols_ac_setup_sp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_ac_setup_sp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ols_ac_setup_sp]
AS
begin 

	declare @_ae integer;
	declare @_ace integer;

	set @_ae = (select set_val_lng from ca_settings where set_id = 901);
	-- set @_ae = 0;
	set @_ace = (select set_val_lng from ca_settings where set_id = 900);

	
	update ca_security_profile set area_enabled=@_ae, area_ace = @_ace
		where area_enabled is null or area_ace is null;

	-- make sure that the EVERYONE profile has no access always
	
	update ca_security_profile set area_enabled=@_ae, area_ace = 0
		where type = 1;

end;
GO

GO
--SqlScripter----[dbo].[ols_sp_applyAreaMask].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_sp_applyAreaMask]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_sp_applyAreaMask] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/**
 ******************************************************
 * set the area mask  of the ols_area_def table
 *	the area mask defiend whcih area bit is valid
 *
 * @param @obj_uuid if null all entries will be updated
 *				if set then onyl the row is set where the
 *				object_def_uuid  matches
 *
 */

ALTER PROCEDURE [dbo].[ols_sp_applyAreaMask]
(	@obj_uuid binary(16)
)
as
begin
	declare @area_mask integer;
	declare @aid	   integer;
	declare @abit	   integer;

	set nocount on;
	set @area_mask = 0;

	DECLARE amcur1 CURSOR
		FOR select area_id  from ols_area_def;

	OPEN amcur1
	FETCH NEXT FROM amcur1 INTO @aid	-- get first

	WHILE @@FETCH_STATUS = 0
	BEGIN
		if ( @aid > 31 )
		begin
			raiserror ('Error 9019: Area_id in ols_area_def greater than 31.', 16, 1);
		end;
		if ( @aid = 31 )
			set @abit	= 0x80000000;
		else
			select @abit = (power(2,@aid));
		set @area_mask = @area_mask | @abit;

		FETCH NEXT FROM amcur1 INTO @aid;	 -- get next

	END

	CLOSE amcur1
	DEALLOCATE amcur1

	if (@obj_uuid is null)
	begin
		-- update all rows of the table
		update ols_area_ace set area_mask = @area_mask;
	end
	else
	begin
		-- update a single object only
		update ols_area_ace set area_mask = @area_mask
			where object_def_uuid = @obj_uuid;
	end;
end;
GO

GO
--SqlScripter----[dbo].[ols_sp_area_changed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_sp_area_changed]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_sp_area_changed] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* ************************** 11466 10858 11494 begin **************/



/**
 ******************************************************
 * set/reset area  bit
 * used to manage the area permission in case an area was added, deleted
 */


ALTER PROCEDURE [dbo].[ols_sp_area_changed]
(
	@action		int,		-- 0 area was deleted, 1 area was created	
	@area_id	int		-- area uuid
)
as 
begin
	
	declare @aBit int;
	
	
	if ( @area_id > 31 )
	begin
			raiserror ('Error 9019: Area_id in ols_area_def greater than 31.', 16, 1);
			return;
	end;

	if ( @area_id = 31 )
		set @aBit	= 0x80000000;
	else
		-- < 31
		select @aBit = (power(2,@area_id));


	if (@action = 0)
	begin
 
		/* area is deleted */
		update ca_settings 
			set 	set_val_lng = (set_val_lng | @aBit )
			where 	set_id = 900;

		-- area was deleted - unlink the area
		-- level 4 will be updated, when ca_settings is changed
		update ols_area_ace set area_ace = (area_ace & ~(@aBit))
			where security_level = 0;
		update ols_area_ace set area_ace = (area_ace | @aBit)
			where security_level = 1 or security_level = 2;
		update ca_security_profile set area_ace = (area_ace & ~(@aBit))
			where buildin_profile = 0; -- not build in profile
	end;
/*
	else
	begin 
		-- area was set
		declare @g_area_ace int;

		select @g_area_ace = (select set_val_lng from ca_settings where set_id = 900);
		if(  @g_area_ace is null )
			return;
		if ( (@g_area_ace & @aBit) != 0 )
		begin
			-- bit is set in global settings
			--update ols_area_ace set area_ace= area_ace | @aBit;
			-- update ca_security_profile set area_ace= area_ace | @aBit;
		end
		else
			-- bit is not set in global settings
			begin 
				
			update ols_area_ace set area_ace = (area_ace & ~(@aBit));
			update ca_security_profile set area_ace = (area_ace & ~(@aBit));
			end
		
	end;
*/
end
GO

GO
--SqlScripter----[dbo].[ols_sp_getEffectiveAreaAce].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_sp_getEffectiveAreaAce]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_sp_getEffectiveAreaAce] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/**
 *****************************************************
 ols_getEffectiveAreaAce

	get the effective area permission for a user regarding
	a certain secured object


	if area support is disabled on a gloabl level then
	the function returns  a value -1

	if the area suppot is enabled on global level but disabled
	on profile level (at least in one profile the arae support
	is diabeld where the user is a meber of ) the the value
	-1 is returned (Everyone profile is excluded - will
	not be checked)

	if area code is enabled in all profiles for a user then
	the effective area permission is returned.
	(the ORed area permissons  of the profiles are
	ANDed with the object permissons for the particular object)


	@param @obj_uuid uuid of the secured object

	@param	@usr_uuid uuid of the user
 *****************************************************
 */
ALTER PROCEDURE [dbo].[ols_sp_getEffectiveAreaAce]
(	@obj_uuid  binary(16),
	@usr_uuid	binary(16)
)
as
begin
	declare @isEnabled		int;
	declare @eff_obj_area_ace	int;
	declare @eff_sp_area_ace	int;
	select @isEnabled = (select is_area_enabled from ols_v_user where user_uuid = @usr_uuid);
	if ( @isEnabled = 0 )
	begin
		-- area support is disabled, so give full access
		select -1 as eff_area_ace;
		return;
	end

	-- area support is enabled
	-- either at global level or for all security profiles where  the user is
	-- a member of ecluding the Everyone Profile
	-- now calculate the effectve area_ace

	select @eff_obj_area_ace = (select area_ace & area_mask  from ols_area_ace where object_def_uuid = @obj_uuid);
	if( @eff_obj_area_ace is null)
	begin
		-- error
		-- force to return an empty resultset
		select 0 as eff_area_ace;
		return;
	end;

	set @eff_sp_area_ace = (select [dbo].ols_fn_getAreaAceByUserUuid (@usr_uuid));
	if( @eff_sp_area_ace is null)
	begin
		-- error
		-- force to return an empty resultset
		select 0 as eff_area_ace;
		return;
	end;

	select (@eff_sp_area_ace & @eff_obj_area_ace) as eff_area_ace;
	return;

end
GO

GO
--SqlScripter----[dbo].[ols_sp_setAreaCodeByUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_sp_setAreaCodeByUser]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_sp_setAreaCodeByUser] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/**
 ******************************************************
 * set the area code for a ceration user for a secured
 * object
 *
 * @param @_uri URI of the creation user
 *
 * @param @_obj_uuid uuid of the created object
 */

ALTER PROCEDURE [dbo].[ols_sp_setAreaCodeByUser]
(	@_uri		nvarchar(255),
	@_obj_uuid	binary(16),
	@_object_type integer
)
as
begin
	declare @def_area_ace integer;
	declare @sec_level int;

	set nocount on;
	if( @_uri is null)
	begin
		-- update area settings - take it from the user's security profile

		set @def_area_ace = (select set_val_lng from ca_settings where set_id = 900);
		set @sec_level = 4; -- config level
	end
	else
	begin
		-- Uri given . calclaue the area ace
		select @def_area_ace = (select [dbo].ols_fn_getAreaAceByUser(@_uri));

		-- assert that we got a default area ace by URI
		if ( @def_area_ace is null)
		begin
			raiserror ('Error 9017: OLS: default area ace in ca_settings not found', 16,1);
			return;
		end;
		
		-- check if the area ace based on URI or default
		-- because we need to know if ols_fn_getAreaAceByUser() has found that the user is linke to a profiler
		set @sec_level = (select [dbo].ols_fn_getAreaSecLevelByUser(@_uri));

	end;


	if( select count(*) from ols_area_ace where object_def_uuid = @_obj_uuid) > 0
	begin
			-- area ace exists --> update needed
			update ols_area_ace
				set area_ace = @def_area_ace, security_level = @sec_level
				where object_def_uuid = @_obj_uuid;
	end
	else
	begin
		-- area ace doesn't exist --> insert needed
   	   insert into ols_area_ace  (object_def_uuid, area_ace, object_type,  security_level, creation_user)
						values (@_obj_uuid, @def_area_ace, @_object_type,  @sec_level, @_uri);

	end;

end;
GO

GO
--SqlScripter----[dbo].[ols_sp_setObjectOwner].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ols_sp_setObjectOwner]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ols_sp_setObjectOwner] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/**
 ******************************************************
 * set a link object owner for a ceration user
 *
 * @param @_uri URI of the creation user
 *
 * @param @_obj_uuid uuid of the created object
 */

ALTER PROCEDURE [dbo].[ols_sp_setObjectOwner]
(	@_uri		nvarchar(255),
	@_obj_uuid	binary(16)
)
as
begin
	declare @_owner_profile_uuid binary(16);
	declare @_user_uuid			binary(16);

	set nocount on;
	if ( @_uri is null )
	begin
		return 0;
	end;


	/* get the owner profile uuid */
	select @_owner_profile_uuid = (select security_profile_uuid
								  from ca_security_profile
										  where type = 0);

	if( @_owner_profile_uuid is null)
	begin
		return 0;
	end;

	/* get the user uuid  - normally we get only one*/
	declare cur_user cursor for select user_uuid
								from ca_discovered_user
								where uri = @_uri and (user_type = 1 or user_type = 2)
	open cur_user;
	fetch from cur_user into @_user_uuid; -- get first

	while @@fetch_status = 0
	begin
		-- create object owner
		insert into ca_link_object_owner (object_uuid, owner_uuid, security_profile_uuid, version_number)
				values ( @_obj_uuid, @_user_uuid, @_owner_profile_uuid,  0 );


		break;
	end;
	close cur_user;
	deallocate cur_user;
end;
GO

GO
--SqlScripter----[dbo].[p_d_discovered_hardware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_d_discovered_hardware]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_d_discovered_hardware] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_d_discovered_hardware    Script Date: 12/1/2005 11:50:16 PM ******/
ALTER PROCEDURE [dbo].[p_d_discovered_hardware]
( 
	@_dis_hw_uuid binary(16) 
	)
AS
declare 
	@_cnt integer; 
BEGIN 
	/* check if there is any agent record*/
	select @_cnt = (select count(*)  from ca_agent where object_uuid = @_dis_hw_uuid); 
	if (@_cnt != 0) 
	begin 
		raiserror ('Error 9004: deletion denied, ca_agent object still exists', 16,1);
	end; 
	
	/* check if there is any server record*/
	select @_cnt = (select count(*) from ca_server where dis_hw_uuid = @_dis_hw_uuid); 
	if (@_cnt != 0) 
	begin 
		raiserror ('Error 9004: deletion denied, ca_server object still exists', 16,1);
	end; 
	
	
	delete from ca_discovered_hardware_network where dis_hw_uuid = @_dis_hw_uuid; 
	
	
	update ca_engine set dis_hw_uuid=NULL where dis_hw_uuid = @_dis_hw_uuid; 
	
	/* bug fix 1406 
  	delete from ca_link_dis_hw WHERE primary_dis_hw_uuid = :_dis_hw_uuid;
  	delete from ca_link_dis_hw WHERE secondary_dis_hw_uuid = :_dis_hw_uuid;
  	*/
  	delete from ca_link_dis_hw WHERE primary_dis_hw_uuid = @_dis_hw_uuid or secondary_dis_hw_uuid = @_dis_hw_uuid;

  	delete from am_link_external_device WHERE secondary_uuid = @_dis_hw_uuid;

end
GO

GO
--SqlScripter----[dbo].[p_d_discovered_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_d_discovered_user]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_d_discovered_user] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_d_discovered_user    Script Date: 12/1/2005 11:50:16 PM ******/
ALTER PROCEDURE [dbo].[p_d_discovered_user]
@_dis_hw_uuid binary(16)

AS
	declare	@_cnt integer;	
BEGIN 

	select @_cnt = (select 	count(*) from ca_agent
                	where object_uuid = @_dis_hw_uuid);
                	
	if (@_cnt != 0) 
    begin
	     raiserror ('Error 9005: deletion denied, ca_agent object still exists', 16,1);
    end;
   
	delete 
		from am_link_external_device
		WHERE secondary_uuid = @_dis_hw_uuid;

end;
GO

GO
--SqlScripter----[dbo].[p_i_dis_user_uri_check].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[p_i_dis_user_uri_check]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_i_dis_user_uri_check] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 ************************************
 * procedure to
 * check uri of a discovered_user object
 *
 * !!! this check can be used before insertion !!!
 */

ALTER PROCEDURE [dbo].[p_i_dis_user_uri_check]
@_olduri nvarchar(255),
	@_newuri nvarchar(255),
	@_dom_uuid binary(16)

as
   declare	@_nr 		int;
   declare @_enumber	int ;
   declare @_rcount		int;
begin

	 set nocount on;

	 /* uri null is allowed */
	 if ( @_newuri IS NULL )
	 begin
		  return 0;
	 end;

	 select @_nr = (select count(*) from ca_discovered_user
						   where uri = @_newuri and (user_type = 1 or user_type = 2) and domain_uuid = @_dom_uuid);


	if (@_nr > 0)
	begin
		 raiserror ('Error 9007: uri for discovered user not unique: ', 16,1);
		return 1;
	end;

	return 0;
end
GO

GO
--SqlScripter----[dbo].[p_integrity_component_reg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[p_integrity_component_reg]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_component_reg] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[p_integrity_component_reg]
@_action	 integer,
	 @_server_uuid 	 binary(16),
	 @_comp_id integer
	
as
	declare @_dis_hw_uuid    	binary(16);
	declare @_user_uuid		binary(16);
	declare @_dis_hw_user_uuid 	binary(16);
	declare @_domain_uuid		binary(16);
	declare @_manager_uuid		binary(16);
	declare @_usage_list     	binary(32);
	declare @_leading_bytes  	binary varying(32);
	declare @_component_bit  	integer;
	declare @_end_byte	binary(1);
	declare @_indicator	binary(1);
	declare @_null_byte	binary(1);
	declare @_byte_nr	integer;
	declare @_i		integer;
	declare @_cc		char(30);
	declare @_agent_type 	integer;			-- agent type of an agent record 
	
	declare @_usage_leadbytes binary varying(32); 		-- leading bytes of the current usage list
	declare @_usage_byte  binary(1);			-- byte needs to be updated

begin
	--
 	--  assert pre-condition
	-- 
	if ( @_comp_id < 0 
		OR 
	     @_comp_id > 255)
	begin
		-- component id out of range
		raiserror('DSM Status: registering component with component id %d ', 10,1, @_comp_id ) with log;		
		return;
	end;
	
	--
	-- start update of the usage list 
	--
	select @_null_byte 	= 0x00;
	select @_indicator	= 0xFF;	 
	select @_byte_nr   	= @_comp_id/8;
	select @_end_byte  	= (power(2,7 - @_comp_id + @_byte_nr*8));
	/*_end_byte  	= byte( X'EE'); */
	select @_leading_bytes 	= 0x0000000000000000000000000000000000000000000000000000000000000000;

	select @_leading_bytes 	= convert (binary varying(32),substring(@_leading_bytes, 1,	 @_byte_nr));	
	set @_component_bit	= (@_leading_bytes + @_end_byte);	

	if(@_action = 0 or @_action = 1)
	begin	--
		-- a server component was (un)registered 
		--
		set @_dis_hw_uuid = (select dis_hw_uuid
					from ca_server
					where server_uuid = @_server_uuid
			             );

		-- read the current usage list
		
		set @_usage_list = (select usage_list from ca_discovered_hardware where  dis_hw_uuid = @_dis_hw_uuid);
		if( @_usage_list is NULL) 
			set @_usage_list = 0x00000000000000000000000000000000000000000000;

		if(@_action = 0)
		begin /* register */
			/*message ' update usage list for registering server component ';*/
			set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
			set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
			set @_usage_byte = (@_usage_byte | @_component_bit);
			if (( convert(int,@_byte_nr)+1) = 32)
				set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
			else
				set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
		
		end
		else 
		begin   /* unregister */
			/*message 'update usage list for unregistering server component ';*/
			set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
			set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
			set @_usage_byte = (@_usage_byte ^ @_component_bit);
			if (( convert(int,@_byte_nr)+1) = 32)
				set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
			else
				set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
			
		end;
		
		update ca_discovered_hardware
			set usage_list = @_usage_list
			where dis_hw_uuid = @_dis_hw_uuid;
		

	end
	else
	if(@_action = 2 or @_action = 3)
	begin
		/* an agent component was (un)registered                      */
		/* in this case the _server_uuid is set to the object_uuid    */
		/* check the agent type first to see if the component is for  */
		/* a computer or user */
		select @_dis_hw_uuid = @_server_uuid;
		select @_agent_type = (select agent_type from ca_agent 
				where object_uuid = @_dis_hw_uuid);


		/* agent_type */
		if(@_agent_type = 1)
		begin
			/* computer */
			
			set @_usage_list = (select usage_list from ca_discovered_hardware where  dis_hw_uuid = @_dis_hw_uuid);
			if( @_usage_list is NULL) 
				set @_usage_list = 0x00000000000000000000000000000000000000000000;
			if (@_action = 2 )
			begin /* register */
				/*message ' update usage list for registering computer agent component ';*/
				set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
				set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
				set @_usage_byte = (@_usage_byte | @_component_bit);
				if (( convert(int,@_byte_nr)+1) = 32)
					set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
				else
					set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
			end
			else
			begin
				/* unregister */
				/*message ' update usage list for unregistering computer agent component ';*/
				set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
				set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
				set @_usage_byte = (@_usage_byte ^ @_component_bit);
				if (( convert(int,@_byte_nr)+1) = 32)
					set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
				else
					set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
				
	                	/* reset SD status if SD component is unregistered */
				if(@_comp_id = 40 OR @_comp_id=46)
				begin
				    update ca_agent set derived_status_sd = 0 where object_uuid=@_dis_hw_uuid;
				end;
				
			end;
			update ca_discovered_hardware
				set usage_list = @_usage_list
				where dis_hw_uuid = @_dis_hw_uuid;


		end	
		else
		begin
			if(@_agent_type = 2) 
			begin   /* user */
				select @_user_uuid = @_server_uuid;
				
				set @_usage_list = (select usage_list from ca_discovered_user where  user_uuid = @_user_uuid);
				if( @_usage_list is NULL) 
					set @_usage_list = 0x00000000000000000000000000000000000000000000;
	

				if (@_action = 2 )
				begin /* register */
					/*message ' update usage list for registering user agent component ';*/
					set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
					set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
					set @_usage_byte = (@_usage_byte | @_component_bit);
					if (( convert(int,@_byte_nr)+1) = 32)
						set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
					else
						set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
				end
				else
				begin
					/* unregister */
					/*message ' update usage list for unregistering user agent component ';*/
					set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
					set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
					set @_usage_byte = (@_usage_byte ^ @_component_bit);
					if (( convert(int,@_byte_nr)+1) = 32)
						set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
					else
						set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	

				end;
				update ca_discovered_user
					set usage_list = @_usage_list
					where user_uuid = @_user_uuid;


			end
			else
			begin
				if(@_agent_type = 4) 
				begin
					/* computeruser */		
					select @_dis_hw_user_uuid = @_server_uuid;
					set @_usage_list = (select usage_list from ca_link_dis_hw_user where  link_dis_hw_user_uuid = @_dis_hw_user_uuid);
					if( @_usage_list is NULL) 
						set @_usage_list = 0x00000000000000000000000000000000000000000000;
	

					if (@_action = 2 )
					begin /* register */
						/*message ' update usage list for registering computeruser agent component ';*/
						set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
						set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
						set @_usage_byte = (@_usage_byte | @_component_bit);
						if (( convert(int,@_byte_nr)+1) = 32)
							set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
						else
							set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
					end
					else
					begin
						/* unregister */
						/*message ' update usage list for unregistering computeruser agent component ';*/
						set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
						set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
						set @_usage_byte = (@_usage_byte ^ @_component_bit);
						if (( convert(int,@_byte_nr)+1) = 32)
							set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
						else
							set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
					end;
					update ca_link_dis_hw_user
						set usage_list = @_usage_list
						where link_dis_hw_user_uuid = @_dis_hw_user_uuid;

				end;
			end;
		end;
	end
    else

	if(@_action = 4 or @_action = 5)
	  begin
		/* manager component was (un)registered*/
		select @_manager_uuid = @_server_uuid;
		
		set @_domain_uuid = (select domain_uuid	from ca_manager where manager_uuid = @_manager_uuid);
		set @_usage_list = (select usage_list from ca_n_tier where domain_uuid = @_domain_uuid);
		if( @_usage_list is NULL) 
			set @_usage_list = 0x00000000000000000000000000000000000000000000;
		if(@_action = 4)
		begin /* register */
			/*message ' update usage list for registering manager component ';*/
			set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
			set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
			set @_usage_byte = (@_usage_byte | @_component_bit);
			if (( convert(int,@_byte_nr)+1) = 32)
				set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
			else
				set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
				

		end
		else /* unregister */
		begin
			/*message ' update usage list for unregistering manager component ';*/
			set @_usage_leadbytes = convert (binary varying(32),substring(@_usage_list, 1,	 @_byte_nr));	
			set @_usage_byte = SUBSTRING (@_usage_list, 	 convert(int,@_byte_nr)+1, 1);	
			set @_usage_byte = (@_usage_byte ^ @_component_bit);
			if (( convert(int,@_byte_nr)+1) = 32)
				set @_usage_list = @_usage_leadbytes + @_usage_byte ;		
			else
				set @_usage_list = @_usage_leadbytes + @_usage_byte +SUBSTRING(@_usage_list, convert(int,@_byte_nr)+2, LEN(@_usage_list)-convert(int,@_byte_nr));	
		end;

		update ca_n_tier
			set usage_list = @_usage_list
			where domain_uuid = @_domain_uuid;
	  end
	else
	  begin
		/* it must be an programmimg error : unknow action code */
		raiserror('Error 9009: internal error: illegal action code in DB procedure p_integrity_component_reg', 16,1 );		
	  end;
	
    
end;
GO

GO
--SqlScripter----[dbo].[p_integrity_d_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_agent]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_agent] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_agent    Script Date: 12/1/2005 11:49:38 PM ******/


/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of agent
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 delete all entries of the ca_agent table if 
 a ca_agent_component object is deleted
*/

ALTER PROCEDURE [dbo].[p_integrity_d_agent]
(
	@old_object_uuid binary(16) 	/* old object uuid */
	)
as

begin
  delete from ca_agent_component where object_uuid = @old_object_uuid;
end
GO

GO
--SqlScripter----[dbo].[p_integrity_d_dir_schema_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_dir_schema_map]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_dir_schema_map] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_dir_schema_map    Script Date: 12/1/2005 11:50:10 PM ******/

/*
 ***********************************************
 handle deletion of ca_directory_schema_map
 */
ALTER PROCEDURE [dbo].[p_integrity_d_dir_schema_map]
(
	@old_dir_schema_uuid binary(16) 	/* old directory  schema uuid */
	)
as

begin
   delete from ca_link_dir_details_map  where dir_schema_uuid = @old_dir_schema_uuid;
end ;
GO

GO
--SqlScripter----[dbo].[p_integrity_d_directory_details].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_directory_details]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_directory_details] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_directory_details    Script Date: 12/1/2005 11:50:10 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of directory
 * integration tables
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 handle deletion of ca_directory_details
 */

ALTER PROCEDURE [dbo].[p_integrity_d_directory_details]
(
	@old_directory_uuid binary(16) 	/* old directory uuid */
	)
as

begin
   delete from ca_link_dir_details_map  where directory_uuid = @old_directory_uuid;
end ;
GO

GO
--SqlScripter----[dbo].[p_integrity_d_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_engine]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_engine] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_engine    Script Date: 12/1/2005 11:50:17 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of engine
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 handle deletion of an ca_engine
 */

ALTER PROCEDURE [dbo].[p_integrity_d_engine]
(
	@old_engine_uuid binary(16) 	/* old engine uuid */
	)
as

begin
   update ca_group_def set evaluation_uuid = null  where evaluation_uuid = @old_engine_uuid;
end ;
GO

GO
--SqlScripter----[dbo].[p_integrity_d_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_manager]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_manager] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_manager    Script Date: 12/1/2005 11:50:10 PM ******/



/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of manager
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 delete all entries of the ca_manager table if 
 a ca_manager_component object is deleted
*/

ALTER PROCEDURE [dbo].[p_integrity_d_manager]
(
	@old_manager_uuid binary(16) 	/* old manager uuid */
	)
as

begin
  delete from ca_manager_component where manager_uuid = @old_manager_uuid;
end
GO

GO
--SqlScripter----[dbo].[p_integrity_d_proc_os].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_proc_os]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_proc_os] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_proc_os    Script Date: 12/1/2005 11:50:17 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of ca_proc_os
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 handle deletion of an ca_proc_os
 */

ALTER PROCEDURE [dbo].[p_integrity_d_proc_os]
(
	@old_proc_os_id integer		/* old proc_s id */
	)
as
   declare @agncnt as int;

begin
   select @agncnt = (select count(*) from ca_agent where proc_os_id = @old_proc_os_id);
   
   if( @agncnt != 0)
   begin
    raiserror ('Error 9002: proc_os can''t be deleted because one or more agent objects still exists for this OS', 16,1);
        
   end;
  
end ;
GO

GO
--SqlScripter----[dbo].[p_integrity_d_query_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_query_def]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_query_def] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_query_def    Script Date: 12/1/2005 11:50:14 PM ******/




/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of query
 *********************************************************
 *********************************************************
 */
/*
 ***********************************************
 delete all entries of the ca_query_version, 
 ca_query_result table if 
 a ca_query_def object is deleted
*/

ALTER PROCEDURE [dbo].[p_integrity_d_query_def]
(
	@old_query_uuid binary(16) 	/* old query uuid */
	)
as

begin
  delete from ca_query_version where query_uuid = @old_query_uuid;
  delete from ca_query_result where query_uuid = @old_query_uuid;
end
GO

GO
--SqlScripter----[dbo].[p_integrity_d_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_integrity_d_server]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_d_server] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_integrity_d_server    Script Date: 12/1/2005 11:50:17 PM ******/



/*
 ***********************************************
 delete following entities if a ca_server enntity
 is delete
   ca_server_component 
   ca_server_push_status
*/


ALTER PROCEDURE [dbo].[p_integrity_d_server]
(
	@old_server_uuid binary(16) 	/* old server uuid */
	)
as

begin
 delete from ca_server_component where server_uuid = @old_server_uuid;
 delete from ca_server_push_status where server_uuid = @old_server_uuid;
 update ca_agent set server_uuid = null where server_uuid = @old_server_uuid;
 update ca_agent_component set server_uuid = null where server_uuid = @old_server_uuid;
 update ca_agent set server_uuid = null where server_uuid = @old_server_uuid;
end
GO

GO
--SqlScripter----[dbo].[p_integrity_version_number].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[p_integrity_version_number]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_integrity_version_number] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[p_integrity_version_number]
@old_verno int,
	   @new_verno int
as
begin
	if(@old_verno >= @new_verno)
	begin
		raiserror('Error 9001: update error, new version number less than the old version number', 16, 1 );
		return 1;
	end;

	return 0;
end
GO

GO
--SqlScripter----[dbo].[p_iu_computer_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_iu_computer_user]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_iu_computer_user] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_iu_computer_user    Script Date: 12/1/2005 11:50:17 PM ******/


/*
 *********************************************************
 *********************************************************
 * integrity discovered hardware
 *********************************************************
 *********************************************************
 */





/*
 *********************************************************
 *********************************************************
 * integrity discovered user
 *********************************************************
 *********************************************************
 */





/*
 *********************************************************
 *********************************************************
 * integrity computer  user
 *********************************************************
 *********************************************************
 */

/*
 ************************************************
 * handle update/insert computer user
 */
ALTER PROCEDURE [dbo].[p_iu_computer_user]
@_user_uuid binary(16),
	@_dis_hw_uuid binary(16)


AS
	declare @_cnt integer;	
BEGIN 

	select @_cnt = ( select count(*) from ca_discovered_user as u, ca_discovered_hardware as c 
			where  c.dis_hw_uuid = @_dis_hw_uuid 
				and u.user_uuid = @_user_uuid
				and c.domain_uuid = u.domain_uuid);
		
	if (@_cnt = 0) 
	begin
	    raiserror ('Error 9010: insert/update denied, different domain_uuid for user and computer', 16,1);
	end;
   

end;
GO

GO
--SqlScripter----[dbo].[p_iu_dis_hw_host_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_iu_dis_hw_host_uuid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_iu_dis_hw_host_uuid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_iu_dis_hw_host_uuid    Script Date: 12/1/2005 11:50:17 PM ******/

/*
 ************************************
 * procedure: check if  host_uuid   of a computer
 * is unqiue
 *
 * bug: the argument _olduuid is not used and should be removed
 *		to avoid resource wasting
 */


ALTER PROCEDURE [dbo].[p_iu_dis_hw_host_uuid]
@_olduuid char(36),
	@_newuuid char(36),
	@_dom_uuid binary(16)
	
as 

   declare  @_nr 		int;
   
   
begin
	

    if ( @_newuuid IS NULL )
    begin
	      return;
    end;

    select @_nr = (select count(*) from ca_discovered_hardware
                where host_uuid = @_newuuid and domain_uuid = @_dom_uuid
           );
    if( @_nr > 1)       
    begin
        raiserror ('Error 9008: host_uuid for discovered hardware not unique: ', 16,1);
    end;
      
end
GO

GO
--SqlScripter----[dbo].[p_iu_dis_user_uri_check].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_iu_dis_user_uri_check]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_iu_dis_user_uri_check] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_iu_dis_user_uri_check    Script Date: 12/1/2005 11:50:18 PM ******/



/*
 ************************************
 * procedure to
 * check uri of a discovered_user object
 */

ALTER PROCEDURE [dbo].[p_iu_dis_user_uri_check]
@_olduri nvarchar(255),
	@_newuri nvarchar(255),
	@_dom_uuid binary(16)

as 
   declare    @_nr 		int;
   declare @_enumber	int ;
   declare @_rcount	    int;
begin

     if ( @_newuri IS NULL )
     begin
	      return;
     end;

     select @_nr = (select count(*) from ca_discovered_user
	                       where uri = @_newuri and (user_type = 1 or user_type = 2) and domain_uuid = @_dom_uuid);


    if (@_nr > 1)
    begin
         raiserror ('Error 9007: uri for discovered user not unique: ', 16,1);
    end;
end
GO

GO
--SqlScripter----[dbo].[p_iu_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_iu_group_member]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_iu_group_member] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_iu_group_member    Script Date: 12/1/2005 11:49:12 PM ******/

/*
 *********************************************************
 *********************************************************
 * integrity group membership
 *********************************************************
 *********************************************************
 */

/*
 ************************************************
 * manage  group members
 */
ALTER PROCEDURE [dbo].[p_iu_group_member]
@_member_uuid binary(16),
  @_group_uuid  binary(16)
 

AS
	
BEGIN 
	
	if (@_member_uuid = @_group_uuid) 
	begin
	    raiserror ('Error 9003: insert/update error, member_uuid must be not equal the group_uuid', 16, 1);
	
  	end;
end;
GO

GO
--SqlScripter----[dbo].[p_sp_ssf_versionupdate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_sp_ssf_versionupdate]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_sp_ssf_versionupdate] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_sp_ssf_versionupdate    Script Date: 12/1/2005 11:49:38 PM ******/

/*
 *********************************************************
 *********************************************************
 * integrity triggers for replication
 *********************************************************
 *********************************************************
 */


/*
 ************************************************
 * manage  software signature
 */
ALTER PROCEDURE [dbo].[p_sp_ssf_versionupdate]
AS
	DECLARE @_incr integer;
BEGIN 

	select @_incr = (select set_val_lng 
		from ca_settings where set_id=5);
		
	IF (@_incr=0) 
	begin
		update ca_settings set set_val_lng=set_val_lng+1 where set_id=4;
		update ca_settings set set_val_lng=set_val_lng+1 where set_id=6;
		update ca_settings set set_val_lng=1 where set_id=5;
	end;
end;
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_agent_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_agent_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_agent_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_agent_updated    Script Date: 12/1/2005 11:50:18 PM ******/


/*
 *********************************************************************
 after update (description) on ca_agent
 used to track changes / handover of changes made 
 in the ITRM common object tables
 *********************************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_agent_updated]
@object_uuid binary(16),
	@label nvarchar(255),
	@domain_id integer
as
begin

	declare	@own_domain_uuid binary(16);
	declare @own_domain_id integer;

	/* retrieve own domain_uuid and domain_id*/
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)
	set @own_domain_id = (select domain_id
		  					from ca_n_tier
							where domain_uuid = @own_domain_uuid)

	/* execute procedure only for own domain_id */
	if (@own_domain_id = @domain_id)
	begin

		/*	
		if object_uuid exists in urc_ab_computer table
			update (label) in urc_ab_computer(uid = _object_uuid)
		*/
		update urc_ab_computer set label = @label 
								where uid = @object_uuid and domain_uuid = @own_domain_uuid; 
		/*	
		update the parents
		*/
		execute p_urc_ab_update_parents @object_uuid, 0x00000000000000000000000000000000, 1, @own_domain_uuid;
	end
end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_discvd_hw_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_discvd_hw_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_discvd_hw_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_discvd_hw_updated    Script Date: 12/1/2005 11:50:10 PM ******/



/*
 *********************************************************************
 after update (host_name, host_uuid) on ca_discovered_hardware
 used to track changes / handover of changes made 
 in the ITRM common object tables
 *********************************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_discvd_hw_updated]
@dis_hw_uuid binary(16),
	@host_name nvarchar(255),
	@domain_uuid binary(16),
	@host_uuid char(36)
as
begin

	declare	@own_domain_uuid binary(16);
	
	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)

	/* execute procedure only for own domain_uuid */
	if (@own_domain_uuid = @domain_uuid)
	begin

		/*	
		if dis_hw_uuid exists in urc_ab_computer table
			update (host_name, host_uuid) in urc_ab_computer(uid = dis_hw_uuid)
		*/
		update urc_ab_computer set host_name = @host_name, host_uuid = @host_uuid
							   where (uid = @dis_hw_uuid and domain_uuid = @own_domain_uuid) 
		/*	
		update the parents
		*/
		execute p_urc_ab_update_parents @dis_hw_uuid, 0x00000000000000000000000000000000, 1, @own_domain_uuid;
	
	end
	
end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_group_def_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_group_def_deleted]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_group_def_deleted] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_group_def_deleted    Script Date: 12/1/2005 11:49:38 PM ******/


/*
 ***********************************************
 an entry in urc_ab_group_def is deleted	
 ***********************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_group_def_deleted]
@uid binary(16),
	@domain_uuid binary(16)
as
begin

	declare @member_type integer;
	declare @member_uuid binary(16);
	declare @urcObjCnt integer;
	declare @group_domain_uuid binary(16);
	declare @tmpCnt integer;


	/* retrieve own domain_uuid */
	set @group_domain_uuid = (select set_val_uuid
							  from ca_settings
							  where set_id = 1)

	/* execute procedure only for own domain_uuid */
	if (@group_domain_uuid = @domain_uuid)
	begin

		/* delete all  RC permissions of the group: */
		delete from urc_ab_permission 
			   where uidaddressbook = @uid;
			
		/* for all children: */	

		declare cursor_urc_ab_group_member cursor local
		for 
			select member_type, member_uuid
			from urc_ab_group_member
			where group_uuid =@uid
			
		open cursor_urc_ab_group_member
		fetch next from cursor_urc_ab_group_member into @member_type, @member_uuid
		while @@fetch_status = 0
		begin
	
			if (@member_type = 0)
			begin	/* groupDef */
				/*check if there exists another urc_ab_group_member entry for the member_uuid */
				set @urcObjCnt = -1;
				set rowcount 2;
				set @urcObjCnt = (select count(*) from urc_ab_group_member where member_uuid = @member_uuid)
				set rowcount 0;
					
				if (@urcObjCnt = 1)
					/* object doesn't exists any more */
					delete from urc_ab_group_def where uid = @member_uuid;
				else
					/*its there the we have to update the entry 
					 because of removed permisssions
					 */
					update urc_ab_group_def set update_children = (cast('1' as binary(1))) where uid = @member_uuid;

			end -- if (@member_type = 0)

			/* for address book groups and computers */
			delete from urc_ab_group_member where (member_uuid = @member_uuid and group_uuid = @uid)

			fetch next from cursor_urc_ab_group_member into @member_type, @member_uuid
		end	

		close cursor_urc_ab_group_member
		deallocate cursor_urc_ab_group_member

	end

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_group_def_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_group_def_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_group_def_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_group_def_updated    Script Date: 12/1/2005 11:50:10 PM ******/



/*
 **************************************************
 after update (label, description) on ca_group_def
 used to track changes / handover of changes made 
 in the ITRM common object tables
 **************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_group_def_updated]
@group_uuid binary(16),
	@label nvarchar(255),
	@description nvarchar(255),
	@domain_uuid binary(16)
as
begin

	declare	@group_domain_uuid binary(16);

	/* retrieve own domain_uuid */
	set @group_domain_uuid = (select set_val_uuid
							  from ca_settings
							  where set_id = 1)

	/* execute procedure only for own domain_uuid */
	if (@group_domain_uuid = @domain_uuid)
	begin

		/*	
		if group_uuid exists in urc_ab_group_def table
			update (label, description) in urc_ab_group_def(uid = group_uuid), set update_children = 0
		*/
		update urc_ab_group_def set label = @label, description= @description, update_children = (cast('0' as binary(1)))
								where uid = @group_uuid

		 /* update all parents */
		execute p_urc_ab_update_parents @group_uuid, 0x00000000000000000000000000000000, 1, @group_domain_uuid;

	end
	
end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_group_member_created].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_group_member_created]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_group_member_created] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_group_member_created    Script Date: 12/1/2005 11:50:18 PM ******/



/*
The interesting operations on the ca_group_member table are:
-	a new entry is created, e.g. a new link is created
-	an entry is deleted, e.g. a link is deleted
-	the group_uuid is updated, e.g. the parent group has changed
*/


/*
 ***********************************************
 runs if a new entry in ca_group_member is created, 
 e.g. a new link is created	
 
 includes:
 - urc_ab_group_def_create - procedure
   creates an urc_ab_group_def entry

 ***********************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_group_member_created]
@member_uuid binary(16),
	@member_type integer, 
	@group_domain_uuid binary(16),
	@group_uuid binary(16),
	@member_domain_uuid binary(16)
as
begin

	declare	@domain_uuid binary(16);
	declare @urcObjCnt integer;
	declare @nTierDomainType integer;

	/* retrieve own domain_uuid */
	set @domain_uuid = (select set_val_uuid
						from ca_settings
						where set_id = 1)
						
	/* execute procedure only for own domain_uuid */
	if (@group_domain_uuid = @domain_uuid)	
	begin
		/* get number of URC objects*/
		set @urcObjCnt = 0;
		set rowcount 1;
		set @urcObjCnt = (select count(*) from urc_ab_group_def where uid = @group_uuid);
		set rowcount 0;
			
		if (@urcObjCnt > 0)
		begin
			/* parent exists in urc_ab_group_def table */
			/* check group */
			if (@member_type = 0 ) 
			begin
				/* "computer group" // new link for computer group */
				/* check if the member itself (member_uuid) is part of urc_ab_group_def table */
				set @urcObjCnt = 0;
				set rowcount 1;
				set @urcObjCnt = (select count(*) from urc_ab_group_def where uid = @member_uuid);
				set rowcount 0;
				
				if (@urcObjCnt = 0)
				begin
					/* the member itself is not part of the urc_ab_group_def */ 
					/*	create a new urc_ab_group_def entry */
					-- execute p_urc_ab_group_def_create @member_uuid, @member_domain_uuid;
					insert into urc_ab_group_def (uid, domain_uuid, label, description, sub_root_item, inheritance, update_children, update_viewer_version)
								(select @member_uuid, @member_domain_uuid, label, description, cast('0' as binary(1)), cast('1' as binary(1)), cast('0' as binary(1)), 1
									from ca_group_def where group_uuid = @member_uuid);
						
					execute p_urc_ab_update_parents @member_uuid, @group_uuid, 0, @member_domain_uuid;
				end
				else
				begin
					/* the member itself is part of the urc_ab_group_def */ 
					/* update the entry */
					
					/* the statement below will force an update of the version field for the viewer
					 because of possibly new inherited permissions 
					 */
					 update urc_ab_group_def set update_children = (cast('1' as binary(1)))
											 where uid = @member_uuid;
					
 					 execute p_urc_ab_update_parents @member_uuid, @group_uuid, 0, @member_domain_uuid;
				end
				
				/* create a new urc_ab_group_member entry: */
				execute p_urc_ab_group_member_create @member_uuid,@group_uuid, @member_type, @group_domain_uuid, @member_domain_uuid;
				
			end -- if (@member_type = 0 )
			else
			begin	
				
				/* check computer */
				if (@member_type = 1 )
				begin
					/* new link for computer */
					/* check if member_uuid is part of the urc_ab_computer table. */
					/* check the domain_uuid against the group_domain_uuid as the */
					/* computer entry can be twice in the tables !                */
					set @urcObjCnt = 0;
					set rowcount 1;
					set @urcObjCnt = (select count(*) from urc_ab_computer 
													 where (uid = @member_uuid and domain_uuid = @group_domain_uuid));
					set rowcount 0;

					if (@urcObjCnt > 0) 
					begin
						/* it is already a part of the urc computer table  */
						/* create a new urc_ab_group_member entry          */
						/* with the member_domain_uuid of the own domain ! */
						execute p_urc_ab_group_member_create @member_uuid, @group_uuid, @member_type, @group_domain_uuid, @group_domain_uuid;
					
						/*
						update the new parent
						*/
						execute p_urc_ab_update_parents @member_uuid, @group_uuid, 0, @member_domain_uuid;
					end
					else
					begin
						/* :_urcObjCnt = 0 */
						/* check if we are at an enterprise manager, get domain_type */
						set @nTierDomainType = (select domain_type 
												from ca_n_tier 
												where domain_uuid = @domain_uuid)

						if (@nTierDomainType = 1)
						begin
							/* we are an enterprise manager,		          */
							/* entpr. urc_ab_computer entry doesn't exist yet */
							/* --> create it with the enterprise domain_uuid  */	
							insert into urc_ab_computer (uid, domain_uuid, label, 
												host_name, connection_information, host_uuid)
												(select uid, @domain_uuid, label, 
												host_name, connection_information, host_uuid 
												from urc_ab_computer
												where (uid = @member_uuid and domain_uuid = @member_domain_uuid));

							/* --> p_urc_ab_computer_created is executed */
							/* --> that will add the member entry and    */
							/*     update the parents                    */
						end
						
					end

				end -- if (@member_type = 1 )
				
			end -- else (@member_type = 0 ) 
		
		end -- if (@urcObjCnt > 0)

	end	-- if (@group_domain_uuid = @domain_uuid)	

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_group_member_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_group_member_deleted]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_group_member_deleted] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_group_member_deleted    Script Date: 12/1/2005 11:50:18 PM ******/



/*
 ***********************************************
 an entry in ca_group_member is deleted	
 ***********************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_group_member_deleted]
@member_uuid binary(16),
	@member_type integer,
	@group_uuid binary(16),
	@group_domain_uuid binary(16)
as
begin

	declare @domain_uuid binary(16);
	declare @urcObjCnt integer;
	declare @urcObjCntMember integer;
	declare @sub_root_item binary(1);
	declare @tmpCnt integer;


	/* retrieve own domain_uuid */
	set @domain_uuid = (select set_val_uuid
						from ca_settings
						where set_id = 1)

	
	/* execute procedure only for own domain_uuid */
	if (@group_domain_uuid = @domain_uuid)
	begin
	
		set @sub_root_item = cast('0' as binary(1));

		/* check if the _member_uuid group is an address book group and a sub root item, */
		/* if it is a sub root item, the group_uuid must not match */
		if (@member_type = 0) 
		begin
			/* group item */
			set @sub_root_item = (select sub_root_item from urc_ab_group_def where uid = @member_uuid)
		end

		/* check if the group_uuid (=parent) exists in urc_ab_group_def table */
		set @urcObjCnt = 0;
		/* there can just be one entry and we are only interested */
		/* if there is none or if there is one */
		set rowcount 1;
		set @urcObjCnt = (select count(*) from urc_ab_group_def where uid = @group_uuid);
		set rowcount 0;										
		
		/* following condition is necessary when there is an address book group defined */
		/* as sub root item and has a parent that is no address book group              */

		if ( @urcObjCnt > 0 or  @sub_root_item = (cast('1' as binary(1))) )
		begin

			if (@member_type = 0) 
			begin
				/* computer group */
				/* check if there exists another urc_ab_group_member entry for the member_uuid */
				set @urcObjCntMember = -1;
				set rowcount 3;
				set @urcObjCntMember = (select count(*) from  urc_ab_group_member where member_uuid = @member_uuid)
				set rowcount 0;

				if ( @sub_root_item = (cast('0' as binary(1))) )
				begin
				
					/* the group entry is a 'normal' group item in the address books */
					if (@urcObjCntMember = 1)
						 delete from urc_ab_group_def where uid = @member_uuid;
					else
						/* member group has further links, update the entry */
						update urc_ab_group_def set update_children = (cast('1' as binary(1))) where uid = @member_uuid
				
				end
				else
				begin

					/* the group is a sub root item.							*/
					/* The sub root item can be assigned to either				*/
					/* an address book group, no address book group,			*/
					/* a combination of them,									*/
					/* or more common groups that are no address book groups	*/
					/* or not assigned at all									*/
					set @tmpCnt = -1;
					/* check if there is another link left in the common tables, */
					/* then the group may not be deleted						 */
					set rowcount 1;
					set @tmpCnt = (select count(*) from ca_group_member where member_uuid = @member_uuid)
					set rowcount 0;

					if (   (@urcObjCnt = 1 and @urcObjCntMember = 2 and @tmpCnt = 0)
					    or (@urcObjCnt = 0 and @urcObjCntMember = 1 and @tmpCnt = 0) )
					begin
						 /* the entry is the last one referenced in the address books 
							--> delete it */
						 delete from urc_ab_group_def where uid = @member_uuid;
						 /* delete the virtual link to the root entry */
						 delete from urc_ab_group_member where (member_uuid = @member_uuid and group_uuid = @domain_uuid);
						 execute p_urc_ab_update_parents @member_uuid, @domain_uuid, 0, @group_domain_uuid;
					end
					else
						/* member group has further links, update the entry */
						update urc_ab_group_def set update_children = (cast('1' as binary(1))) where uid = @member_uuid;

				end

				delete from urc_ab_group_member where (member_uuid = @member_uuid and group_uuid = @group_uuid);
				
				execute p_urc_ab_update_parents @member_uuid, @group_uuid, 0, @group_domain_uuid;

			end -- if (@member_type = 0) 
			else
			begin

				if (@member_type = 1) 
				begin /* computer */
					 /* check if there is a corresponding entry in urc_ab_group_member table */
					set @urcObjCnt = 0;
					set rowcount 1;
					set @urcObjCnt = (select count(*) from urc_ab_group_member 
									  where (member_uuid = @member_uuid and group_uuid = @group_uuid))
					set rowcount 0;
						
					if (@urcObjCnt > 0)
					begin
						/* urc_ab_group_member entry exists */
						/* update current parent because one child is removed */
						execute p_urc_ab_update_parents @member_uuid, @group_uuid, 0, @group_domain_uuid;
	    				/* delete the corresponding urc_ab_group_member entry */
						delete from urc_ab_group_member where (member_uuid = @member_uuid and group_uuid = @group_uuid);
					end
				end
			
			end -- else (@member_type = 0) 
			
		end  -- if ( @urcObjCnt > 0  or  @sub_root_item = (cast('1' as binary(1))) )

	end -- if (@group_domain_uuid = @domain_uuid)

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_group_member_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_group_member_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_group_member_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_group_member_updated    Script Date: 12/1/2005 11:50:18 PM ******/


/*
 *******************************************************
 after update (group_uuid) on ca_group_member:
 if a group member of the common objects has been moved
 *******************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_group_member_updated]
@member_uuid binary(16),
	@old_group_uuid binary(16),
	@new_group_uuid binary(16),
	@new_group_domain_uuid binary(16),
	@member_type integer,
	@member_domain_uuid binary(16),
	@old_group_domain_uuid binary(16)
as
begin

	declare @domain_uuid binary(16);
	declare @urcObjCntOld integer;
	declare @urcObjCntNew integer;
	declare @sub_root_item binary(1);


	/* retrieve own domain_uuid */
	set @domain_uuid = (select set_val_uuid
		  			    from ca_settings
						where set_id = 1)

	/* execute procedure only for own domain_uuid */
	if (@new_group_domain_uuid = @domain_uuid)
	begin

		/* check if the parents exist in urc_ab_group_def */
		set @urcObjCntOld = 0;
		set @urcObjCntNew = 0;
		set rowcount 1;
		set @urcObjCntOld = (select count(*) from urc_ab_group_def where uid = @old_group_uuid)
		set @urcObjCntNew = (select count(*) from urc_ab_group_def where uid = @new_group_uuid)
		set rowcount 0;

		if (@urcObjCntOld > 0  and  @urcObjCntNew > 0)
		begin
			/* move in between the address book groups */

			/*
			if there is an equivalent entry 
			(member_uuid, old_group_uuid) in urc_ab_group_member
			
			update group_uuid to new_group_uuid in urc_ab_group_member,
			set update_children = 1, in urc_ab_group_def of member_uuid
			*/

			update urc_ab_group_member set group_uuid= @new_group_uuid 
									   where (member_uuid = @member_uuid and group_uuid = @old_group_uuid)
						
			update urc_ab_group_def set update_children = (cast('1' as binary(1)))
									where uid = @member_uuid
			
			 /* update all parents, including the new one*/
			execute p_urc_ab_update_parents @member_uuid,  0x00000000000000000000000000000000, 1, @new_group_domain_uuid;
		
			/* update old parent */
			execute p_urc_ab_update_parents @member_uuid, @old_group_uuid, 0, @old_group_domain_uuid;
													  
		end -- if (@urcObjCntOld > 0  and  @urcObjCntNew > 0)


		if (@urcObjCntOld = 0  and  @urcObjCntNew > 0)
			/* group or computer has to be added to the address books */
			execute p_urc_ab_ca_group_member_created @member_uuid, @member_type, @new_group_domain_uuid, @new_group_uuid, @new_group_domain_uuid;


		if (@urcObjCntOld > 0  and  @urcObjCntNew = 0)
		begin
			/* link has to be removed out of the address books,
			   and possibly the item if it is not a sub root item 
			*/
			set @sub_root_item = (cast('0' as binary(1)));
			set @sub_root_item = (select sub_root_item from urc_ab_group_def where uid = @member_uuid);

			if (@member_type = 0  and  @sub_root_item = (cast('1' as binary(1)))) 
			begin
				/* update old parent and remove the urc_ab_group_member entry */
				execute p_urc_ab_update_parents @member_uuid, @old_group_uuid, 0, @old_group_domain_uuid;
				delete from urc_ab_group_member where (member_uuid = @member_uuid and group_uuid = @old_group_uuid);
			end
			else
				/* remove the link and possibly the item */
				execute p_urc_ab_ca_group_member_deleted @member_uuid, @member_type, @old_group_uuid, @old_group_domain_uuid;
			
		end -- if (@urcObjCntOld > 0  and  @urcObjCntNew = 0)
	
	end

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_ca_n_tier_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_ca_n_tier_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_ca_n_tier_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_ca_n_tier_updated    Script Date: 12/1/2005 11:49:38 PM ******/



/*
 **************************************************
 after update (label, description) on ca_n_tier
 used to track changes / handover of changes made 
 for the address book server node entry
 **************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_ca_n_tier_updated]
@domain_uuid binary(16),
	@label nvarchar(255),
	@description nvarchar(255)
as
begin

	declare @own_domain_uuid binary(16);

	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)

	/* execute procedure only for own ca_n_tier entry */
	if (@own_domain_uuid = @domain_uuid)
	begin

		update urc_ab_group_def set label = @label, description = @description,	update_children = (cast('0' as binary(1)))
								where uid = @own_domain_uuid; 
	end
end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_computer_created].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_computer_created]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_computer_created] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_computer_created    Script Date: 12/1/2005 11:50:18 PM ******/



/*
 ***********************************************
	a new urc_ab_computer entry is created	
 ***********************************************
 */

ALTER PROCEDURE [dbo].[p_urc_ab_computer_created]
@uid binary(16),
	@domain_uuid binary(16)
as
begin

	declare	@group_uuid binary(16);
	declare	@objCnt integer;
	declare	@own_domain_uuid binary(16);


	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)

	/* execute procedure only for own domain_uuid */
	if (@own_domain_uuid = @domain_uuid)
	begin
		/*
		take all group_uuids to the member_uuid = uid and 
		group_domain_uuid = domain_uuid in ca_group_member table
		
		check if the group_uuid exists in urc_ab_group_def
		if yes then create urc_ab_group_member entry with the information 
		out of the ca_group_member entry
		Afterwards execute procedure urc_ab_update_parents(uid, group_uuid)
		update parent
		*/
			
		declare cursor_ca_group_member cursor local
		for 
			select group_uuid
			from ca_group_member 
			where member_uuid = @uid and group_domain_uuid = @domain_uuid

		open cursor_ca_group_member
		fetch next from cursor_ca_group_member into @group_uuid
		while @@fetch_status = 0
		begin
			/* check if the group_uuid exists in urc_ab_group_def */
			set @objCnt = 0;
			set rowcount 1;
			set @objCnt = (select count(*) from urc_ab_group_def where uid = @group_uuid);
			set rowcount 0;
				
			if (@objCnt > 0) 
			begin
				/*
				create urc_ab_group_member entry with the information 
				out of the ca_group_member entry,
				but with the own domain uuid for computer entries
				*/
				insert into urc_ab_group_member (member_uuid, group_uuid, member_type, 
									group_domain_uuid, member_domain_uuid)
									(select member_uuid, group_uuid, member_type, group_domain_uuid, @own_domain_uuid 
									 from ca_group_member
									 where (member_uuid = @uid and group_uuid = @group_uuid and group_domain_uuid = @domain_uuid));
				
				execute p_urc_ab_update_parents @uid, @group_uuid, 0, @own_domain_uuid;
			end
			
			fetch next from cursor_ca_group_member into @group_uuid
		end	

		close cursor_ca_group_member
		deallocate cursor_ca_group_member
		
	end

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_group_member_create].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_group_member_create]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_group_member_create] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_group_member_create    Script Date: 12/1/2005 11:49:38 PM ******/



/*
 ***********************************************
 urc_ab_group_member_create - procedure
 creates an urc_ab_group_member entry
 ***********************************************
 */
/* the procedure is called only in other procedures, no rules,
   therefore it is not necessary to check for the own domain_uuid !! 
*/

ALTER PROCEDURE [dbo].[p_urc_ab_group_member_create]
@member_uuid binary(16),
	@group_uuid binary(16), 
	@member_type integer, 
	@group_domain_uuid binary(16),
	@member_domain_uuid binary(16)
as
begin

	insert into urc_ab_group_member (member_uuid, group_uuid, member_type, group_domain_uuid, member_domain_uuid )
	values (@member_uuid, @group_uuid, @member_type, @group_domain_uuid, @member_domain_uuid);

end
GO

GO
--SqlScripter----[dbo].[p_urc_ab_update_parents].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_ab_update_parents]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_ab_update_parents] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_ab_update_parents    Script Date: 12/1/2005 11:49:39 PM ******/



/*
 ***********************************************
 urc_ab_update_parents - procedure:
 used to update the parents of an urc_ab_group_def
 ***********************************************
 */
/* the procedure is called only in other procedures, no rules,
   therefore it is not necessary to check for the own domain_uuid !! 
*/

ALTER PROCEDURE [dbo].[p_urc_ab_update_parents]
@member_uuid binary(16),
	@parent_uuid binary(16),
	@updateAll integer,		/* flag: 0 = no, 1 = yes */
	@member_domain_uuid binary(16)	/* computer _member_uuid is not unique */
as
begin
	if (@updateAll = 0)
	begin
		/* uuid_parent != null */
		/* update a single parent */
		update urc_ab_group_def	set update_children = (cast('0' as binary(1)))
								where uid = @parent_uuid;
	end								
	else
	begin
		/* update all parents */
		update urc_ab_group_def	set update_children = (cast('0' as binary(1)))
								where uid IN ( select group_uuid from urc_ab_group_member where (member_uuid = @member_uuid and member_domain_uuid = @member_domain_uuid) );
		end
end
GO

GO
--SqlScripter----[dbo].[p_urc_computer_created].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_computer_created]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_computer_created] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_computer_created    Script Date: 12/1/2005 11:50:19 PM ******/


/*
 **************************************************
	a new urc_computer entry is registered/created
 **************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_computer_created]
@uid binary(16),
	@connection_information binary(510)
as
begin

	declare @own_domain_uuid binary(16);
	declare @domain_uuid binary(16);
	
	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)
							
	/* retrieve the computer's domain uuid */
	set @domain_uuid = (select domain_uuid from ca_discovered_hardware where dis_hw_uuid = @uid)

	/* execute procedure only for own domain_uuid */
	if (@own_domain_uuid = @domain_uuid)
	begin

		/*
		a new urc computer has registered,
		create the corresponding urc_ab_computer entry
		out of the urc_computer, the ca_discovered_hardware and ca_agent entries
		*/
		insert into urc_ab_computer (uid, domain_uuid, label, host_name, connection_information, host_uuid)
							(select @uid, dhw.domain_uuid, ag.description, dhw.host_name, @connection_information, dhw.host_uuid 
							 from ca_discovered_hardware dhw, ca_agent ag
							 where dhw.dis_hw_uuid = @uid and dhw.dis_hw_uuid = ag.object_uuid);
		/*
		The p_urc_ab_computer_created is now executed automatically.
		That will update the parents as well.
		*/

	end

end
GO

GO
--SqlScripter----[dbo].[p_urc_computer_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_computer_deleted]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_computer_deleted] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_computer_deleted    Script Date: 12/1/2005 11:50:11 PM ******/



/*
 ***************************************************
 after deletion of an urc_computer, 
 can only happen at the domain for domain entries
 ***************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_computer_deleted]
@uid binary(16)
as
begin

	declare	@own_domain_uuid binary(16);
	declare @domain_uuid binary(16);
	
	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)

	/*
	Delete the corresponding urc_ab_computer entry
	*/	
	delete from urc_ab_computer where (uid = @uid and domain_uuid = @own_domain_uuid); 
	/*	
	Update the parents:
	*/
	execute p_urc_ab_update_parents @uid, 0x00000000000000000000000000000000, 1, @own_domain_uuid;
	
	/*
	Delete the corresponding member entries,
	after the update of the parents !!
	else they won't be anymore there
	*/	
	delete from urc_ab_group_member where (member_uuid = @uid and member_domain_uuid = @own_domain_uuid);

end
GO

GO
--SqlScripter----[dbo].[p_urc_computer_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[p_urc_computer_updated]') IS NULL EXEC('CREATE PROCEDURE [dbo].[p_urc_computer_updated] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.p_urc_computer_updated    Script Date: 12/1/2005 11:50:19 PM ******/



/*
 ***************************************************
 after update (streamaddress) on urc_computer
 used to track changes / handover of changes made 
 during the registration of an urc computer
 ***************************************************
 */

ALTER PROCEDURE [dbo].[p_urc_computer_updated]
@uid binary(16),
	@streamaddress binary(510)
as
begin

	declare	@own_domain_uuid binary(16);
	declare @domain_uuid binary(16);
	
	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
		  					from ca_settings
							where set_id = 1)

	/* retrieve the computer's domain uuid */
	set @domain_uuid = (select domain_uuid from ca_discovered_hardware where dis_hw_uuid = @uid);

	/* execute procedure only for own domain_uuid */
	if (@own_domain_uuid = @domain_uuid)
	begin

		/*
		Update the corresponding urc_ab_computer entry
		*/	
		update urc_ab_computer set connection_information = @streamaddress 
							   where (uid = @uid and domain_uuid = @own_domain_uuid); 
		/*	
		update the parents
		*/
		execute p_urc_ab_update_parents @uid, 0x00000000000000000000000000000000, 1, @own_domain_uuid;

	end
	
end
GO

GO
--SqlScripter----[dbo].[proc_d_so_removed_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_d_so_removed_group_member]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_d_so_removed_group_member] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 **********************************************
 * procedure starts if a group member was deleted
 */
ALTER PROCEDURE [dbo].[proc_d_so_removed_group_member]
@_object_uuid binary(16) /* old.member_uuid; */

as

  declare  @_sp_uuid 	binary(16);
  declare  @_object_class_uuid binary(16);
  declare  @_object_ace 	integer;
  declare  @_object_access 	integer;
  declare  @_object_level 	integer;
  declare  @_object_type	integer;
  declare  @_parent_ace 	integer;
  declare  @_parent_access 	integer;


begin

	set nocount on;

	declare cur_oace cursor
	for select security_profile_uuid, object_type
		from ca_object_ace
		where object_def_uuid = @_object_uuid AND security_level = 1

	open cur_oace;
	fetch cur_oace into @_sp_uuid, @_object_type;
	while @@fetch_status = 0
	begin

		select @_object_class_uuid = (select class_def_uuid
												from ca_security_class_def
												where class_id = @_object_type);

		-- start with class ace values
		select @_object_ace = (select ace from ca_class_ace
												where class_def_uuid = @_object_class_uuid and security_profile_uuid = @_sp_uuid);
		select @_object_access = (select  access from ca_class_ace
												where class_def_uuid = @_object_class_uuid and security_profile_uuid = @_sp_uuid);

		select @_object_level = 0;


		-- Calculate a new ace from all its parents that has inheritance enabled
		declare cur_gace cursor
		for select a.ace, a.access
			from ca_group_ace a, ca_group_member m
			where a.security_profile_uuid = @_sp_uuid and a.enable_inheritance = 1
				and a.group_def_uuid=  m.group_uuid and m.member_uuid = @_object_uuid

		open cur_gace;
		fetch cur_gace into @_parent_ace, @_parent_access --get first ace;
		while @@fetch_status = 0
		begin

			-- message 3 'proc_d_so_removed_group_member ca_group_ace';
			if ( @_object_level = 0 ) -- still class level

					select @_object_ace = @_parent_ace;
			else if (@_object_level = 1)

				select @_object_ace = (@_object_ace | @_parent_ace);


			select @_object_access = @_parent_access;
			select @_object_level = 1; -- set security level = group level
			if (@_parent_access = 0)

				break;

			fetch cur_gace into @_parent_ace, @_parent_access --get next ace;
		end; -- while
		close cur_gace;
		deallocate cur_gace;

		update ca_object_ace
			set ace = @_object_ace, access = @_object_access, security_level = @_object_level
			where object_def_uuid = @_object_uuid AND security_profile_uuid = @_sp_uuid;


		fetch cur_oace into @_sp_uuid, @_object_type; -- get next
	end; -- end while
	close cur_oace;
	deallocate cur_oace;


	-- update area ace of the group member
	select @_object_type = (select object_type from ols_area_ace where object_def_uuid = @_object_uuid) ;

    -- update the security level of the object to object level
	-- in case it is not
	declare @grp_area_ace int;
	select @grp_area_ace = (select dbo.ols_fn_getGroupAreaPerm(@_object_uuid, @_object_type));
	if( @grp_area_ace is NULL)
	begin
		-- object is not longer a member of any group
		-- set it o object level in case it is not 
    	update ols_area_ace set security_level = 2
					where object_def_uuid = @_object_uuid
						and object_type = @_object_type
						and security_level != 2;
	end
    else
    begin
    	update ols_area_ace set area_ace= @grp_area_ace
					where object_def_uuid = @_object_uuid
						and object_type = @_object_type
						and security_level = 1;
	end;


end;
GO

GO
--SqlScripter----[dbo].[proc_d_so_removed_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_d_so_removed_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_d_so_removed_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 ******************************************
  procedure runs if a secured object is deleted
	- delete the entries of object_ace table
	- delete the entries of ca_link_object_owner table
	- delete the entry of ols_area_ace table

*/

ALTER PROCEDURE [dbo].[proc_d_so_removed_object]
@obj_uuid binary(16)

as
begin
	set nocount on;
	 delete from ca_object_ace
		   where object_def_uuid = @obj_uuid;

	 delete from ca_link_object_owner
			where object_uuid = @obj_uuid;

	delete from ols_area_ace
			where object_def_uuid = @obj_uuid;

end
GO

GO
--SqlScripter----[dbo].[proc_d_so_removed_security_prof].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_d_so_removed_security_prof]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_d_so_removed_security_prof] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 ***********************************************
 procedure starts if a security profile was removed
 deletes all entries assigned to the deleted
 security profile in the
 ca_class_ace,
 ca_group_ace
 ca_object_ace
 ca_link_dis_user_sec_profile
 ca_link_object_owner
 ols_area_ace
 tables
*/
ALTER PROCEDURE [dbo].[proc_d_so_removed_security_prof]
@dsp_uuid binary(16)
as
begin

	set nocount on;
	delete from ca_class_ace
		   where security_profile_uuid = @dsp_uuid;

	delete from ca_group_ace
		   where security_profile_uuid = @dsp_uuid;

	delete from ca_object_ace
		   where security_profile_uuid = @dsp_uuid
				 or object_def_uuid = @dsp_uuid;

	delete from ca_link_dis_user_sec_profile
		   where security_profile_uuid = @dsp_uuid;

	delete from ca_link_object_owner
		   where object_uuid = @dsp_uuid;

	delete from ols_area_ace
		where object_def_uuid = @dsp_uuid;
end;
GO

GO
--SqlScripter----[dbo].[proc_d_so_removed_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_d_so_removed_user]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_d_so_removed_user] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 *******************************************
  procedure starts if a user is deleted
  deletes all ca_object_ace entries for
  the deleted user
  deletes all ca_link_object_woner entries
  deletes all link to the securiyt profile
*/
ALTER PROCEDURE [dbo].[proc_d_so_removed_user]
@duser_uuid binary(16)


as
begin
	set nocount on;
  delete from ols_area_ace
		where object_def_uuid = @duser_uuid;

  delete from ca_object_ace
		 where object_def_uuid = @duser_uuid;

  delete from ca_link_object_owner
		 where owner_uuid = @duser_uuid;

  delete from ca_link_dis_user_sec_profile
		 where user_uuid = @duser_uuid;
end
GO

GO
--SqlScripter----[dbo].[proc_i_del_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_del_so_csm_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_del_so_csm_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_del_so_csm_object    Script Date: 12/1/2005 11:50:11 PM ******/

/*
 ***********************************************
 object of CSM object was deleted
*/
ALTER PROCEDURE [dbo].[proc_i_del_so_csm_object]
@_obj_uuid binary(16), 	/* new.security_profile_uuid */
	@_cms_class_id integer    /* new.default_ace */
	
as
begin
	 if( @_cms_class_id = 1008
		or @_cms_class_id = 1006)
    		execute   proc_d_so_removed_object @_obj_uuid;
    	else
    	if( @_cms_class_id = 2000)
    			/* ccnf policy computer */
    		execute   proc_d_so_removed_object @_obj_uuid;
    	else 
    	if( @_cms_class_id = 2002)
    		 /* ccnf policy user */
    		execute   proc_d_so_removed_object @_obj_uuid;
     
end;
GO

GO
--SqlScripter----[dbo].[proc_i_del_so_usd_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_del_so_usd_group]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_del_so_usd_group] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_del_so_usd_group    Script Date: 12/1/2005 11:50:19 PM ******/



/*
 ***********************************************
 * purpose:
 *	maintain the object if a object of a USD group was deleted
 *
 * parameters:
 *	_obj_uuid 	- uuid of the created object
 *	_type 		- type of the software folder/group
 *	_security_group - security group i
 *
 * post-condition:
 *	entry in ca_object_ace was deleted
 *	entry in the ca_group_ace was deleted
 * 
 */



ALTER PROCEDURE [dbo].[proc_i_del_so_usd_group]
@_obj_uuid binary(16), 	            /* new.security_profile_uuid */
	@_type integer                      /* new.default_ace */
	
as
begin
     if( @_type = 1 or @_type = 2)
     begin
		execute   proc_d_so_removed_object @_obj_uuid;
		execute  proc_d_so_removed_group_member @_obj_uuid;
   end;
end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_activity_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_activity_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_activity_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- New procedure that will call the old security procedure but also change the area ace
-- from the default to that of the "parent" job container
ALTER PROCEDURE [dbo].[proc_i_new_so_activity_object]
@_obj_uuid binary(16),
	@target_class_id integer,
	@_uri nvarchar(255)
	
as
begin
 
set nocount on;

	execute   proc_i_new_so_object @_obj_uuid, @target_class_id, @_uri


		-- at this point in time the area_ace of the new secured object is set as defined by 
		-- the creation user but now we switch it to the same area_ace as defined for the 
		-- associated software package
		declare @jcont_area_ace integer		-- read area_ace from the assign group
	
		set @jcont_area_ace = (select area_ace 
						from ols_area_ace as gace, 
							 usd_link_jc_act as ljcact
						where  ljcact.activity = @_obj_uuid
							and ljcact.jcont = gace.object_def_uuid)

		-- update the area_ace only if there was a swp assigned
		if ( @jcont_area_ace is not null )
		begin
		   update ols_area_ace set area_ace = @jcont_area_ace -- assign jobcont area_ace to the activity
		   where  object_def_uuid = @_obj_uuid
		end
end
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_csm_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_csm_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_new_so_csm_object    Script Date: 12/1/2005 11:50:20 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage CSM objects
 *********************************************************
 *********************************************************
 */



/*
 ***********************************************
 add a new secured object for a csm object
*/

ALTER PROCEDURE [dbo].[proc_i_new_so_csm_object]
@_obj_uuid binary(16),
	@_cms_class_id integer ,
	@_user nvarchar(255)   
	
as
begin
	if( @_cms_class_id = 1008
		or @_cms_class_id = 1006)
		 /* boot OS image */
		execute  proc_i_new_so_object @_obj_uuid, 4000, @_user;
	else
	if( @_cms_class_id = 2000)
		 /* ccnf policy computer */
		execute  proc_i_new_so_object @_obj_uuid, 4500, @_user;
	else
	if( @_cms_class_id = 2002)
		 /* ccnf policy user */
		execute  proc_i_new_so_object @_obj_uuid, 4501, @_user;
 
end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_group]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_group] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 **********************************************
 * purpose:
 *	 procedure starts if a new group object was created
 *	Give this new object a group ACL
 *	and an object ACL. Copy them from its class
 *
 * parameters:
 *	_obj_uuid - object uuid of the created group
 *	_security_group - security group flag of the new group
 * 	_grp_type - type of the created group
 *
 * post-condition:
 *	entry created in the ca_group_ace table
 *	entry created in the ca_object_ace table
 *	in both cases the given _grp_type is mapped into the
 *	correct security class id
 *
 */


ALTER PROCEDURE [dbo].[proc_i_new_so_group]
@_obj_uuid  binary(16),
	 @_security_group integer,
	 @_grp_type integer,
	 @_uri nvarchar(255)


as
begin

	 declare @_sp_uuid  binary(16);
	 declare @_ace	 integer;
	 declare @_access  integer;
	 declare @_owner_profile_uuid binary(16);
	 declare @_user_uuid binary(16);
	 declare @_grp_class_id integer;


	set nocount on;

	/* get security class id for software job OR policy/template */

	select @_grp_class_id = (select target_sec_class_id
								from ols_mapping
								where source_tbl_name = 'ca_group_def'
										and source_type = @_grp_type);


	if (@_grp_type = 300)
		 /* softwareGrp*/
		select @_grp_class_id = 2002;
	else if (@_grp_type = 301)
		 /* procedureGrp */
		select @_grp_class_id = 2003;
	else
		select @_grp_class_id = (select target_sec_class_id
								from ols_mapping
								where source_tbl_name = 'ca_group_def'
										and source_type = @_grp_type);

	if( @_grp_class_id is null)
	begin
		raiserror ('Error 9016: OLS: target security class id not found in OLS-Mapping table', 16,1);
		select @_grp_class_id = 1005;
	end;

	-- IMPL-NOTE:  cursor replaced by INSERT ..: SELECT
  	-- create group ace object
   	insert into ca_group_ace (group_def_uuid, security_profile_uuid, ace, access, enable_inheritance, object_type)
		  	select @_obj_uuid, security_profile_uuid, ace, access, @_security_group, @_grp_class_id
			from ca_class_ace
				where class_def_uuid = (select class_def_uuid from ca_security_class_def where class_id = @_grp_class_id);

	-- create matching object ace object
	insert into ca_object_ace (object_def_uuid, security_profile_uuid, ace, access, security_level, object_type)
	  		select @_obj_uuid, security_profile_uuid, ace, access, 0, @_grp_class_id
			from ca_class_ace
				where class_def_uuid = (select class_def_uuid from ca_security_class_def where class_id = @_grp_class_id);


	-- now assign the object owner
	execute ols_sp_setObjectOwner @_uri, 	@_obj_uuid;

	-- set the area ace
	execute ols_sp_setAreaCodeByUser @_uri, @_obj_uuid, @_grp_class_id;

	-- calcluate and apply the correct area-mask
	execute ols_sp_applyAreaMask @obj_uuid=@_obj_uuid;

end
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_group_member]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_group_member] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 ********************************************
 procedure runs if a new member was created
 in the ca_group_member table

 parameters
	@ngmem_uuid		uuid of the new group member
	@nggroup_uuid	uuid of the assigned group


  post-condition
	if it is not and inheritance group then nothing was done

	if it is inheritance group  then the object_ace was
	calculated based on the object_ace of the parent group

	In case  the security_level of the member object_ace
	is set to class level,
	then the member object_ace is set to the parent group ace

	else the security_level of the object_ace is set to group level
	In this case the new member object_ace is ORed with the parent group
	ace

 */
ALTER PROCEDURE [dbo].[proc_i_new_so_group_member]
@ngmem_uuid binary(16),
	@nggroup_uuid binary(16)

as

  declare @_inherit_ace integer;
  declare @_sp_uuid  binary(16);
  declare @_object_level  integer;
  declare @_object_ace  integer;
  declare @_parent_ace  integer;

  declare @_temp_ace  integer;
  declare @_parent_access  integer;

begin

	set nocount on;
	-- check if it's a security group
	select @_inherit_ace = (select g.security_group
								from ca_group_def g
								where g.group_uuid = @nggroup_uuid);

	if(@_inherit_ace = 1)
	begin
		-- it is a security group
		 declare cur_sp cursor
			for select o.security_profile_uuid, o.security_level, o.ace, g.ace, g.access
			from ca_object_ace o, ca_group_ace g
			where g.group_def_uuid = @nggroup_uuid AND
				o.object_def_uuid = @ngmem_uuid  AND
				o.security_profile_uuid = g.security_profile_uuid
		 open cur_sp
		 fetch cur_sp into @_sp_uuid, @_object_level, @_object_ace, @_parent_ace, @_parent_access;
		 while @@fetch_status = 0
		 begin
			-- Calculate a new ace from the new parent
			if (@_object_level = 0)-- class
			begin
				update ca_object_ace
					set ace = @_parent_ace, access = @_parent_access, security_level = 1
					where object_def_uuid = @ngmem_uuid AND security_profile_uuid = @_sp_uuid;
				 end
			else if (@_object_level = 1) -- group
			begin
				select @_temp_ace = (@_object_ace | @_parent_ace);

				if(@_temp_ace <> @_object_ace  )
				begin
					update ca_object_ace
						set ace = @_temp_ace, access = @_parent_access, security_level = 1
						where object_def_uuid = @ngmem_uuid AND security_profile_uuid = @_sp_uuid;
				end;
			end;

			fetch cur_sp into @_sp_uuid, @_object_level, @_object_ace, @_parent_ace, @_parent_access;
		  end;	-- end while
		  close cur_sp;
		  deallocate cur_sp;


		-- re-caclulate the area ace now
		-- update area ace of the group member
		declare @_level_before integer;
		select @_level_before = (select security_level from ols_area_ace where object_def_uuid = @ngmem_uuid) ;

		declare @_object_type integer;
		select @_object_type = (select object_type from ols_area_ace where object_def_uuid = @ngmem_uuid) ;

        -- set the area permission to group level in case it is not object level
		if  (@_level_before != 2)
        begin
			declare @grp_area_ace int;
			select @grp_area_ace = (select dbo.ols_fn_getGroupAreaPerm(@ngmem_uuid, @_object_type));
			if( @grp_area_ace is not NULL)
    			update ols_area_ace set area_ace = @grp_area_ace,
						security_level = 1			-- set to group level now 
					where object_def_uuid = @ngmem_uuid
						and object_type = @_object_type;
        end;

   end;
end
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage objects
 * except group objects
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 update object ace tabel for each new object
 give this new object an ACL. Copy it from its class
*/
ALTER PROCEDURE [dbo].[proc_i_new_so_object]
@_obj_uuid binary(16), 			 /* new.security_profile_uuid */
	@_clsid integer,				 /* security class */
	@_uri nvarchar(255)			  /* creation user */

as
begin
	declare @_sp_uuid binary(16);
	declare @_ace integer;
	declare @_access integer;

	declare @_owner_profile_uuid binary(16);
	declare @_user_uuid binary(16);

	set nocount on;
	-- IMPL-NOTE: cursor replaced by INSERT..SELECT

	insert into ca_object_ace (object_def_uuid, security_profile_uuid, ace, access, security_level, object_type)
			select distinct @_obj_uuid, a.security_profile_uuid, a.ace, a.access, 0, @_clsid
				from ca_class_ace a, ca_security_class_def s
				where a.class_def_uuid = s.class_def_uuid and s.class_id = @_clsid;



	-- create object owner  if creation user is know
	execute  ols_sp_setObjectOwner @_uri, 	@_obj_uuid;

	-- set the area ace
	execute ols_sp_setAreaCodeByUser @_uri, @_obj_uuid, @_clsid;

	-- calcluate and apply the correct area-mask
	execute ols_sp_applyAreaMask @obj_uuid=@_obj_uuid;

end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_procedure_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_procedure_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_procedure_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/**
*******************************************************
* new procs and changes for USD area support 
*******************************************************
*/

-- New procedure that will call the old security procedure but also change the area ace
-- from the default to that of the "parent" sw package
ALTER PROCEDURE [dbo].[proc_i_new_so_procedure_object]
@_obj_uuid binary(16),
	@target_class_id integer,
	@_uri nvarchar(255)
	
as
begin

set nocount on;
 
	execute   proc_i_new_so_object @_obj_uuid, @target_class_id, @_uri


		-- at this point in time the area_ace of the new secured object is set as defined by 
		-- the creation user but now we switch it to the same area_ace as defined for the 
		-- associated software package
		declare @swp_area_ace integer						-- read area_ace from the assign group
	
		set @swp_area_ace = (select area_ace 
						from ols_area_ace as gace, 
							 usd_actproc as ap
						where  ap.objectid = @_obj_uuid
							and ap.rsw = gace.object_def_uuid)

		-- update the area_ace only if there was a swp assigned
		if ( @swp_area_ace is not null )
		begin
		   update ols_area_ace set area_ace = @swp_area_ace	-- assign swp area_ace to the procedure
		   where  object_def_uuid = @_obj_uuid
		end
end
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_rptree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_rptree]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_rptree] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_new_so_rptree    Script Date: 12/1/2005 11:50:20 PM ******/


/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage  security for the reporter
 *********************************************************
 *********************************************************
 */



/*
 ***********************************************
 add a new secured object for report classes
*/

ALTER PROCEDURE [dbo].[proc_i_new_so_rptree]
@_obj_uuid binary(16),
	@_type integer ,
	@_user nvarchar(64)   
	
as
begin
	if( @_type = 3 )
		 /* report templates*/
		execute  proc_i_new_so_object @_obj_uuid,  8000, @_user;
	else
	if( @_type = 40)
		 /* schedule template */
		execute  proc_i_new_so_object @_obj_uuid, 8001, @_user;
	
    
end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_security_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_security_profile]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_security_profile] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 ***********************************************
 procedure start if a new security profile
 was created
 addes a class ace for the new security profile
*/

ALTER PROCEDURE [dbo].[proc_i_new_so_security_profile]
@_obj_uuid binary(16), 	/* new.security_profile_uuid */
	@_type integer,
	@_default_ace integer   /* new.default_ace */

as
begin
	 declare @_access integer;

	set nocount on;
	-- Give this new object an ACL. Copy it from its class
	-- IMPL-NOTE: cursor  replace be INSERT ..SELECT
	insert into ca_object_ace (object_def_uuid, security_profile_uuid, ace, access, security_level, object_type)
		select @_obj_uuid, security_profile_uuid, ace, access, 0, 2
		from ca_class_ace
		where class_def_uuid = (select class_def_uuid from ca_security_class_def where class_id = 2)



	/* -- Now, as this new object is a security profile we must add its ace to each acl. */
	/* -- 1 means everyone */
	/* insert into log (des) values('bodbod test 2'); */
	select @_access=1;

	if( @_default_ace = 0)
		begin
		select @_access=0
		end
	if( @_type = 1 )
   	begin
		select @_access = 1
		end

	insert into ca_class_ace (class_def_uuid, security_profile_uuid, ace, access)
		select			cd.class_def_uuid,	 @_obj_uuid, @_default_ace, @_access
		from ca_security_class_def cd;

	insert into ca_object_ace(object_def_uuid, security_profile_uuid, ace, access, security_level, object_type )
		select distinct o.object_def_uuid, @_obj_uuid, @_default_ace, @_access, 0, o.object_type
		from ca_object_ace o;

	insert into ca_group_ace (group_def_uuid, security_profile_uuid, ace, access, enable_inheritance,   object_type )
		select distinct g.group_def_uuid, @_obj_uuid, @_default_ace, @_access, g.enable_inheritance,   g.object_type
		from ca_group_ace g

	-- create area ace but only if security class is defined
	-- this is important  to setup the model
	-- we do it in  the same way as the genesis of the object_ace
	-- set security level always to 0  and area_ace to -1 to make it visible in all areas
	if ((select count(*) from ca_security_class_def) > 0)
	begin
		insert into ols_area_ace (object_def_uuid, object_type, area_ace, security_level )
			values( @_obj_uuid, 2,  -1, 0)	;
	end;

	-- calcluate and apply the correct area-mask
	execute ols_sp_applyAreaMask @obj_uuid=@_obj_uuid;




end
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_usd_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_usd_group]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_usd_group] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_new_so_usd_group    Script Date: 12/1/2005 11:50:20 PM ******/
 





/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage USD SW Group
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 * purpose:
 *	maintain the object if a new object of a USD group was created
 *
 * parameters:
 *	_obj_uuid 	- uuid of the created object
 *	_type 		- type of the software folder/group
 *	_security_group - security group information
 *	_user		- creation user
 *
 * post-condition:
 *	entry in ca_object_ace was created
 *	entry in the ca_group_ace was created
 * 
*/
 

ALTER PROCEDURE [dbo].[proc_i_new_so_usd_group]
@_obj_uuid 		binary(16),
	@_type 			integer,
	@_security_group integer,
	@_user 			nvarchar(255)   
	
as
begin
     declare @_clsid	 integer;
 	declare @_member_type integer;

	if( @_type = 1)
    	begin
		/* SEC_CLSID_USD_SW_GROUP */
		select @_clsid = 2002;											
		select @_member_type = 300;	/* please see proc_i_new_so_group() -we are using a gap here */
	end
	else
	if( @_type = 2)
    	begin
		/* SEC_CLSID_USD_PROC_GROUP */
		select @_clsid = 2003;
		select @_member_type = 301; /* please see proc_i_new_so_group() -we are using a gap here */
	end;											
    



	/* create ca_group_ace entry */
	execute  proc_i_new_so_group @_obj_uuid, @_security_group, @_member_type, @_user;
																	
end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_usd_job_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_usd_job_container]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_usd_job_container] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_new_so_usd_job_container    Script Date: 12/1/2005 11:50:20 PM ******/


/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage USD job container
 *********************************************************
 *********************************************************
 */


/*
 ***********************************************
 object of USD  group
 definition of the types are in  usd\src\common\include\sdcomm.h
*/

ALTER PROCEDURE [dbo].[proc_i_new_so_usd_job_container]
@_obj_uuid binary(16),
	@_type integer,   		
	@_uri nvarchar(255)
	
as
begin
    if( @_type = 3 )
	/* job container */
	execute   proc_i_new_so_object @_obj_uuid, 2004, @_uri;
     else 
	if( @_type = 4)
		/* sofware template */
		execute   proc_i_new_so_object  @_obj_uuid,  2009, @_uri;
							
    
end;
GO

GO
--SqlScripter----[dbo].[proc_i_new_so_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_i_new_so_user]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_new_so_user] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage user objects
 *********************************************************
 *********************************************************
 */

/********************************************
 procedure to handle new discovered_users
 creates an ca_object_ace entry for each security class and security profile
 the ace will be taken from the class ace
*/
ALTER PROCEDURE [dbo].[proc_i_new_so_user]
@obj_uuid binary(16)

as
begin
	 declare @sp_uuid binary(16);
	 declare @ace int;
	 declare @access int;

	set nocount on;
	-- IMPL-NOTE: cursor replaces by INSERT..SELECT

	insert into ca_object_ace (object_def_uuid, security_profile_uuid, ace, access, security_level, object_type)
  		select @obj_uuid, security_profile_uuid, ace, access, 0, 1002
				from ca_class_ace
				where class_def_uuid = (select class_def_uuid from ca_security_class_def where class_id = 1002)


	-- set the area ace
	declare @_uri nvarchar(255);
	select @_uri = (select uri from ca_discovered_user where user_uuid = @obj_uuid);
	execute ols_sp_setAreaCodeByUser @_uri, @obj_uuid, 1002;

	-- calcluate and apply the correct area-mask
	execute ols_sp_applyAreaMask @obj_uuid=@obj_uuid;

end
GO

GO
--SqlScripter----[dbo].[proc_i_so_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_so_class_def]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_so_class_def] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_so_class_def    Script Date: 12/1/2005 11:50:11 PM ******/



/**
 *******************************************************
 * procedure to handel a new security class definition
 */

ALTER PROCEDURE [dbo].[proc_i_so_class_def]
@obj_uuid binary(16),
	@classId integer
	
as
begin
    declare @access integer;
	declare @_ace integer;
	declare @sp_uuid binary(16);
	declare @sp_ace integer;
	declare @sp_type integer;


   -- Create a class ACE for this class
    declare sp_list cursor for select security_profile_uuid, type, default_ace
    from ca_security_profile
    
    open sp_list
    fetch from sp_list into @sp_uuid, @sp_type, @sp_ace --get first row
    
    while @@fetch_status = 0
    begin
    	select @access=1;
    	if (0= @sp_ace)
    		select @access=0
    	if(1= @sp_type)-- 1 means everyone 
    		select @access=1
    	insert into ca_class_ace (class_def_uuid, security_profile_uuid, ace, access)
    	       values (@obj_uuid, @sp_uuid, @sp_ace, @access)
    	       fetch from sp_list into @sp_uuid, @sp_type, @sp_ace -- get next row                    
    end
    close sp_list
    deallocate sp_list
    
    
    -- Give all objects (created before this class object!) of this class an ACL. Copy it from the class acl
    -- Currently supported for security profiles only
    
    if(2 = @classId)
    	insert into ca_object_ace
    	select sp.security_profile_uuid, c.security_profile_uuid, c.ace, c.access, 0, 2                      
    	from ca_security_profile sp, ca_class_ace c
    	where c.class_def_uuid = @obj_uuid
    
    
    -- Give this new object an ACL. Copy it from the class definition class 
    
    declare @ace as int
    
    
    declare acl cursor for
    select security_profile_uuid, ace, access
    from ca_class_ace
    where class_def_uuid = (select class_def_uuid from ca_security_class_def where class_id = 1)
    
    open acl
    fetch from acl into @sp_uuid, @ace, @access --get first ace
    
    while @@fetch_status = 0
    begin
    	insert into ca_object_ace (object_def_uuid, security_profile_uuid, ace, access, security_level, object_type)
    	values (@obj_uuid, @sp_uuid, @ace, @access, 0, 1)
    	
    	fetch from acl into @sp_uuid, @ace, @access -- get next ace                    
    end
    close acl
    deallocate acl
end
GO

GO
--SqlScripter----[dbo].[proc_i_so_inserted_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_so_inserted_group_ace]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_so_inserted_group_ace] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_so_inserted_group_ace    Script Date: 12/1/2005 11:50:21 PM ******/

 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage groups
 *********************************************************
 *********************************************************
 */

/*
 *****************************************************
 procedure if a new group_ace was inserted
 */

ALTER PROCEDURE [dbo].[proc_i_so_inserted_group_ace]
@group_uuid binary(16),              /* new.group_def_uuid */
		@sp_uuid binary(16),                 /* new.security_profile_uuid */
		@_group_ace integer,                  /* new.ace */
		@_group_enable_inheritance integer    /* new.enable_inheritance */
		
as
begin
	declare @member_class_uuid	binary(16);

	declare @member_uuid	binary(16);
	declare @member_ace	integer;
	declare @member_access	integer;
	declare @member_level	integer;
	declare @member_type	integer;

	declare @parent_ace	integer;
	declare @parent_access	integer;

	declare @tmpbyte binary(16);

	if ( @_group_enable_inheritance = 1 )
    begin
		-- Get all members ace with group or class level security

		
		declare member_list cursor for
		select object_def_uuid, object_type
		from ca_object_ace
		where security_profile_uuid = @sp_uuid 
              and (security_level = 1 or security_level = 0)
              and (object_def_uuid in  (select member_uuid from ca_group_member 
                                   where group_uuid = @group_uuid))

		open member_list
		fetch from member_list into @member_uuid, @member_type --get first member
		while @@fetch_status = 0
		begin


			-- start with class ace

			select @member_class_uuid = (select class_def_uuid 
		                                      from ca_security_class_def
                                                       where class_id = @member_type);

			select @member_ace = (select ace from ca_class_ace
				                               where class_def_uuid = @member_class_uuid
	                                                 	and security_profile_uuid = @sp_uuid);
			select  @member_access = (select  access from ca_class_ace
				                                 where class_def_uuid = @member_class_uuid
	                                                    	 and security_profile_uuid = @sp_uuid);

			select @member_level = 0;

			-- For a member calculate a new ace from all its parents that has inheritance enabled
           		declare parent_ace_list cursor for
			select ace, access
			from ca_group_ace
			where security_profile_uuid = @sp_uuid and enable_inheritance = 1 and group_def_uuid in 
			(select group_uuid from ca_group_member 
			where member_uuid = @member_uuid)

			open parent_ace_list
			fetch from parent_ace_list into @parent_ace, @parent_access --get first ace
			while @@fetch_status = 0
			begin
			
				if (@member_level = 0) /* still class level */
                 		begin
					select @member_ace = @parent_ace;
				end
				else
				begin   if (@member_level = 1)
                     			begin
						select @member_ace = (@member_ace | @parent_ace);
                     			end;
				 
                		end;

				select @member_access = @parent_access;
				select @member_level  = 1;
				if (@member_access = 0)
		                begin
					break;
                		end;

				fetch from parent_ace_list into @parent_ace, @parent_access --get next ace
			end
			close parent_ace_list
			deallocate parent_ace_list

			-- update member ace
			update ca_object_ace
				set ace = @member_ace, access = @member_access, security_level = @member_level
				where object_def_uuid = @member_uuid and security_profile_uuid = @sp_uuid;


		    	-- Get next member
		    	fetch from member_list into @member_uuid, @member_type --get next member
		end
		close member_list
		deallocate member_list

    end;

end;
GO

GO
--SqlScripter----[dbo].[proc_i_so_new_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_so_new_job]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_so_new_job] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_so_new_job    Script Date: 12/1/2005 11:50:21 PM ******/


 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage  jobs
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 procedure for creating  jobs
*/

ALTER PROCEDURE [dbo].[proc_i_so_new_job]
@_obj_uuid binary(16),
	@_uri nvarchar(255),
	@_job_category integer
	

as
begin
	declare @_sec_class_id integer;
	

	if( @_job_category = 1)
		/* it's an asset job */
		select @_sec_class_id =3100;
	
	else if( @_job_category = 2)   
		/* it's an engine job */
		select @_sec_class_id =3101;
						
	execute  proc_i_new_so_object 	@_obj_uuid,  @_sec_class_id, @_uri;					
						
end;
GO

GO
--SqlScripter----[dbo].[proc_i_so_new_module].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_i_so_new_module]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_i_so_new_module] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_i_so_new_module    Script Date: 12/1/2005 11:50:21 PM ******/



 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage moduls
 *********************************************************
 *********************************************************
 */
/*
 *********************************************
 procedure for creating  modules
*/

ALTER PROCEDURE [dbo].[proc_i_so_new_module]
@_obj_uuid binary(16),
	@_uri nvarchar(255),
	@_motype integer
	

as
begin
	declare @_sec_class_id integer;

	if( @_motype = 12)
    
		/* it's an ACHardwareInventory module */
		select @_sec_class_id =3201;
	else if( @_motype = 16)
    
			/* it's an ACTemplateInventory module */
	    select @_sec_class_id =3202;
	else if( @_motype = 6)
    
			/* it's an ACSoftwareInventory moudule */
			select @_sec_class_id =3203;
	else if( @_motype = 7)
    
			/* it's an ACSoftwareMetering moudule */
			select @_sec_class_id =3204;
	
	execute  proc_i_new_so_object	@_obj_uuid, @_sec_class_id, @_uri;
					
	
end
GO

GO
--SqlScripter----[dbo].[proc_u_so_area_revert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_u_so_area_revert]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_u_so_area_revert] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage security profiles
 *********************************************************
 *********************************************************
 */
/*
 *****************************************************
 procedure for updating the security_level of a area definition
 as well as the area permission in case of reverting 
	The security API sets the Security_level = 3 to signal that 
	we need to reverting the area permissiosn as follow:

	if obejct is member of a securiyt group
		--> revert to sec level 1  :: group level

	if( object i not member of a group but creation user is known)
		--> revert to sec level = 0 :: creation user level

	others
		--> revert to default value


	Note: reverting is onyl needed if
	current security level = 3		
			previous securiyt level = 2 ( object level)


	@param 			@_level curent securoty level (should be 3)

	@param			@object_uuid uuid of the objects to be updated

	@object_uuid	@_level_before	old securiyt level

	@param	@_object_type	object type
 */

ALTER PROCEDURE [dbo].[proc_u_so_area_revert]
(
			@_level 		integer,		  /* new.security_level */
			@object_uuid	binary(16),	   /* old.object_def_uuid */
			@_level_before	integer,		  /* old.security_level */
			@_object_type 	integer		   /* old.object_type */

)
as
begin
	
	declare @gcnt integer;

	set nocount on;
	if ( @_level = 3 -- reverting
		and @_level_before = 2 ) -- object level before. Set to group ace
	begin

		  set @gcnt = 0;
		  select @gcnt = ( select count(*) from ca_group_member m , ca_group_def g
							  where m.member_uuid = @object_uuid
							  and  m.group_uuid = g.group_uuid
							  and g.security_group  = 1 );
		  if( @gcnt > 0 )
		  begin
			-- the object is a member of a group, then we need to recalculate the area_ace
			-- revert to group level

			declare @_object_class_uuid binary(16);
			declare @object_ace integer;
			declare @object_access integer;
			declare @object_level integer;
			declare @parent_ace integer;
			declare @parent_access integer;
			declare @ace_found integer;

			set @parent_ace = 0;	-- set default value
			set @object_ace = 0;	-- set default value

			declare parent_ace_list cursor for
			select area_ace
			from ols_area_ace
			where object_def_uuid in
			(select g.group_uuid from ca_group_member m , ca_group_def g
			where m.member_uuid = @object_uuid
					and m.group_uuid = g.group_uuid
					and g.security_group = 1)

			select @object_level = 0 -- set security level
			open parent_ace_list
			fetch from parent_ace_list into @parent_ace --get first ace
			while @@fetch_status = 0
			begin
				select @ace_found = 1  -- ace calculated
				if @object_level = 0 -- still class level
					begin
						select @object_ace = @parent_ace
					end
				else if @object_level = 1
					begin
						select @object_ace = (@object_ace | @parent_ace)
					end

				select @object_level = 1 -- set security level = group level

				fetch from parent_ace_list into @parent_ace  --get next ace
			end
			close parent_ace_list
			deallocate parent_ace_list


			update ols_area_ace set area_ace = @object_ace, security_level = @object_level
			  where object_def_uuid = @object_uuid;
		  end
		  else
		  begin
			-- the object is NOT member of a group
			-- we need to revert to creation user level / OR global level
			declare @uri nvarchar(255);
			
			select @uri = (	select creation_user from ols_area_ace 
				where object_def_uuid =  @object_uuid)
			-- in case of null then  we will get the gloabl settings
			execute ols_sp_setAreaCodeByUser @uri, @object_uuid, @_object_type;
		   end;
	end;


end
GO

GO
--SqlScripter----[dbo].[proc_u_so_class_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[proc_u_so_class_ace]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_u_so_class_ace] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[proc_u_so_class_ace]
@new_ace int,
    @new_access int,
    @old_ace int,
    @sp_uuid binary(16),
    @class_uuid binary(16)
  
as
begin
   declare @object_type int;

  SET NOCOUNT ON;  

  if(@new_ace <> @old_ace)
  begin
	select @object_type = (select class_id  from ca_security_class_def where class_def_uuid = @class_uuid);

    update ca_object_ace
                    set
                    ace = @new_ace,
                    access  = @new_access
                    where  security_profile_uuid = @sp_uuid and object_type = @object_type and security_level = 0;
          
    -- update ca_group_ace  in case of a group and  security level is set 
    -- to class level security                
    update ca_group_ace 
		set 
		ace=@new_ace,
		access  = @new_access 
		where object_type = @object_type 	
			and security_profile_uuid = @sp_uuid
			and security_level = 0;
	                    
                    
  end;

end
GO

GO
--SqlScripter----[dbo].[proc_u_so_updated_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_u_so_updated_group]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_u_so_updated_group] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_u_so_updated_group    Script Date: 12/1/2005 11:49:39 PM ******/





/*
 **************************************
 procedure runs if a group definition is
 updated
 if the goroup_inheritance was changed in the
 group:def tabel begin the enable_inheritance will be
 updated also in the ca_group_ace table
 */

ALTER PROCEDURE [dbo].[proc_u_so_updated_group]
@ugrp_uuid binary(16),
  @old_grpinheritance smallint,
  @new_grpinheritance smallint

as
begin
 
 if(@new_grpinheritance <> @old_grpinheritance)
 begin
	update ca_group_ace
		set enable_inheritance = @new_grpinheritance
		where group_def_uuid = @ugrp_uuid;

 end;

end
GO

GO
--SqlScripter----[dbo].[proc_u_so_updated_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_u_so_updated_group_ace]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_u_so_updated_group_ace] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_u_so_updated_group_ace    Script Date: 12/1/2005 11:50:21 PM ******/

/*
 *********************************************
 procedure runs if a group_ace was changed
 */

ALTER PROCEDURE [dbo].[proc_u_so_updated_group_ace]
@_group_uuid 	binary(16), 	          /* new.group_def_uuid,*/
		@_sp_uuid 	binary(16), 	             /* new.security_profile_uuid,*/
		@_group_ace 	integer, 	              /* new.ace,*/
		@_group_enable_inheritance integer, /* new.enable_inheritance,*/
		@_group_old_ace 	integer,          /* old.ace,*/
		@_group_old_enable_inheritance integer /* old.enable_inheritance --get first ace*/
	
as
begin
  declare @_member_class_uuid binary(16);
  declare @_member_uuid binary(16);

  declare @_member_ace integer;
  declare @_member_access integer;
  declare @_member_level integer;
  declare @_member_type integer;
  declare @_parent_ace integer;
  declare @_parent_access integer;


	

	--_prot='proc_u_so_updated_group_ace: input parameter: ' + '_group_ace: ' + c(_group_ace ) + ', _group_enable_inheritance: ' + c(_group_enable_inheritance ) + ', _group_old_ace: ' + c(_group_old_ace) + ', _group_old_enable_inheritance: ' + c(_group_old_enable_inheritance);
	--message _prot;

	if ( @_group_enable_inheritance <> @_group_old_enable_inheritance or
		 ( (@_group_enable_inheritance = 1) and (@_group_ace <> @_group_old_ace) ))
    begin
		-- inheritance or ace is changed. Get all members ace with group or class level security


		--_prot='proc_u_so_updated_group_ace: input parameter: ' + '_group_ace: ' + c(_group_ace ) + ', _group_enable_inheritance: ' + c(_group_enable_inheritance ) + ', _group_old_ace: ' + c(_group_old_ace) + ', _group_old_enable_inheritance: ' + c(_group_old_enable_inheritance);
		--message _prot;
        declare cur_oace cursor
		for select distinct a.object_def_uuid, a.object_type
			from ca_object_ace a, ca_group_member m
			where a.security_profile_uuid = @_sp_uuid and (a.security_level = 1 or a.security_level = 0)
				and a.object_def_uuid = m.member_uuid and m.group_uuid = @_group_uuid
        open cur_oace;
        fetch cur_oace into @_member_uuid, @_member_type --get first member;
        while @@fetch_status = 0
		begin

			--_prot='proc_u_so_updated_group_ace: inside 1. for';
			--message _prot;


			-- start with class ace
			select @_member_class_uuid = (select class_def_uuid
                            				from ca_security_class_def
                            				where class_id = @_member_type);


			select @_member_ace = (select ace from ca_class_ace
                                    				where class_def_uuid = @_member_class_uuid and security_profile_uuid = @_sp_uuid);

			select @_member_access = (select  access from ca_class_ace
                                    				where class_def_uuid = @_member_class_uuid and security_profile_uuid = @_sp_uuid);

			select @_member_level = 0;

			-- For a member calculate a new ace from all its parents that has inheritance enabled
			declare cur_gace cursor
			for select a.ace, a.access
				from ca_group_ace a, ca_group_member m
				where a.security_profile_uuid = @_sp_uuid and a.enable_inheritance = 1 
					and a.group_def_uuid = m.group_uuid and m.member_uuid = @_member_uuid;
            
            open cur_gace;
            
            fetch cur_gace into @_parent_ace, @_parent_access --get first ace;
            while @@fetch_status = 0
			begin
				if ( @_member_level = 0 ) -- still class level
                
					select @_member_ace = @_parent_ace;
				else if (@_member_level = 1)
                
					select @_member_ace = (@_member_ace | @_parent_ace);
                

				select @_member_access = @_parent_access;
				select @_member_level = 1;

				if (@_member_access = 0)
					break;

                fetch cur_gace into @_parent_ace, @_parent_access --get next ace;
            end;
            close cur_gace;
            deallocate cur_gace;

			-- update member ace
			update ca_object_ace
				set ace = @_member_ace, access = @_member_access, security_level = @_member_level
				where object_def_uuid = @_member_uuid and security_profile_uuid = @_sp_uuid;


	        fetch cur_oace into @_member_uuid, @_member_type --get next member;

		end; -- while end
		close cur_oace;
		deallocate cur_oace;

 end;

end
GO

GO
--SqlScripter----[dbo].[proc_u_so_updated_object_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_u_so_updated_object_ace]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_u_so_updated_object_ace] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_u_so_updated_object_ace    Script Date: 12/1/2005 11:50:21 PM ******/


ALTER PROCEDURE [dbo].[proc_u_so_updated_object_ace]
@_level 		integer,          /* new.security_level */
			@object_uuid	binary(16),       /* old.object_def_uuid */
			@sp_uuid	binary(16),           /* old.security_profile_uuid */
			@_level_before	integer,          /* old.security_level */
			@_object_type 	integer           /* old.object_type */
	
as
begin

    declare @_object_class_uuid binary(16);
	declare @object_ace integer;
	declare @object_access integer;
	declare @object_level integer;
	declare @parent_ace integer;
	declare @parent_access integer;
	declare @ace_found integer;
	
	select @ace_found = 0  -- no ace calculated

	if ( @_level = 3 -- reverting
		and @_level_before = 2 ) -- object level before. Set class or group ace
        begin
		/* select @_object_class_uuid = (select class_def_uuid from ca_security_class_def where class_id = @_object_type);
	*/
		select  @_object_class_uuid= class_def_uuid
			from ca_security_class_def
			where class_id = @_object_type;

		-- start with class ace values
		select @object_ace=ace
			from ca_class_ace
			where class_def_uuid = @_object_class_uuid and security_profile_uuid = @sp_uuid;

		select  @object_access = access 
			from ca_class_ace
			where class_def_uuid = @_object_class_uuid and security_profile_uuid = @sp_uuid;

        -- Calculate a new ace from all its parents that has inheritance enabled
		
		
		declare parent_ace_list cursor for
		select ace, access
		from ca_group_ace
		where security_profile_uuid = @sp_uuid and enable_inheritance = 1 and group_def_uuid in 
		(select group_uuid from ca_group_member 
		where member_uuid = @object_uuid)

		select @object_level = 0 -- set security level 
		open parent_ace_list
		fetch from parent_ace_list into @parent_ace, @parent_access --get first ace
		while @@fetch_status = 0
		begin
			select @ace_found = 1  -- ace calculated
			if @object_level = 0 -- still class level
				begin
					select @object_ace = @parent_ace
				end
			else if @object_level = 1
				begin
					select @object_ace = (@object_ace | @parent_ace)
				end
			select @object_access = @parent_access
			select @object_level = 1 -- set security level = group level
			if (@parent_access = 0)
				break
					
			fetch from parent_ace_list into @parent_ace, @parent_access --get next ace
		end
		close parent_ace_list
		deallocate parent_ace_list

		
			update ca_object_ace
			set ace = @object_ace, access = @object_access, security_level = @object_level 
			where object_def_uuid = @object_uuid AND security_profile_uuid = @sp_uuid;
			
    end;
end;
GO

GO
--SqlScripter----[dbo].[proc_upd_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_upd_so_csm_object]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_upd_so_csm_object] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_upd_so_csm_object    Script Date: 12/1/2005 11:50:21 PM ******/


/*
 *********************************************
 procedure to check update of csm objects
 ********************************************
 */

ALTER PROCEDURE [dbo].[proc_upd_so_csm_object]
@_old_uuid binary(16),
							@_new_uuid binary(16),
							@_new_csm_class_id integer,
							@_old_cms_class_id  integer,
							@_user nvarchar(255)
							
as
begin

	if( @_new_csm_class_id = 0 
		and @_old_cms_class_id != 0)
      begin
    	/* a csm object is deleted */
		execute   proc_i_del_so_csm_object @_old_uuid, @_old_cms_class_id;
		return;
      end;
    		
 	if( @_new_csm_class_id != 0  
    		and @_old_cms_class_id = 0)
      begin
		/* a new csm object is created */		
    	execute   proc_i_new_so_csm_object @_new_uuid, @_new_csm_class_id , @_user;
    	return;
      end;
		
end
GO

GO
--SqlScripter----[dbo].[proc_upd_so_usd_group_sec_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[proc_upd_so_usd_group_sec_grp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[proc_upd_so_usd_group_sec_grp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.proc_upd_so_usd_group_sec_grp    Script Date: 12/1/2005 11:50:11 PM ******/



 
 
/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage  security for SD SW folder
 *********************************************************
 *********************************************************
 */


/*
 ***********************************************
 * purpose:
 *	 maintain the ace of a USD swfold object
 *
 * parameters:
 *
 *
 * post-condition
 *
 */

ALTER PROCEDURE [dbo].[proc_upd_so_usd_group_sec_grp]
@_obj_uuid  binary(16),
							@_type  integer,
							@_old_security_group integer,
							@_new_security_group integer
							
as
begin
	if( @_type = 1 or @_type = 2)
    begin
	   execute  proc_u_so_updated_group  @_obj_uuid, @_old_security_group, @_new_security_group;
    end;

end;
GO

GO
--SqlScripter----[dbo].[SELECT_UND_ANIMATION_IP].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_ANIMATION_IP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_ANIMATION_IP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_ANIMATION_IP    Script Date: 12/1/2005 11:49:39 PM ******/

/****** Object:  Stored Procedure SELECT_UND_ANIMATION_IP    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_ANIMATION_IP]
( @inJobID integer )
AS

DECLARE @f_ip nvarchar(80), @t_ip nvarchar(80), @date_start datetime, @date_stop datetime

DECLARE animation_cursor CURSOR FOR
SELECT DISTINCT t.from_ip, t.to_ip, t.dt_start, t.dt_stop 
   FROM und_transaction t
WHERE t.job_id = @inJobID
GROUP BY t.from_ip, t.to_ip, t.dt_start, t.dt_stop 
ORDER BY t.dt_start asc

OPEN animation_cursor

FETCH NEXT FROM authors_cursor
INTO @f_ip, @t_ip, @date_start, @date_stop

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM animation_cursor
   INTO @f_ip, @t_ip, @date_start, @date_stop
END

CLOSE animation_cursor
DEALLOCATE animation_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_ANIMATION_MAC].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_ANIMATION_MAC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_ANIMATION_MAC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_ANIMATION_MAC    Script Date: 12/1/2005 11:49:39 PM ******/

/****** Object:  Stored Procedure SELECT_UND_ANIMATION_MAC    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_ANIMATION_MAC]
( @inJobID integer )
AS

DECLARE @f_mac nvarchar(80), @t_mac nvarchar(80), @date_start datetime, @date_stop datetime

DECLARE animation_mac_cursor CURSOR FOR
SELECT DISTINCT t.from_mac, t.to_mac, t.dt_start, t.dt_stop 
   FROM und_transaction t
WHERE t.job_id = @inJobID
GROUP BY t.from_mac, t.to_mac, t.dt_start, t.dt_stop 
ORDER BY t.dt_start asc

OPEN animation_mac_cursor

FETCH NEXT FROM authors_cursor
INTO @f_mac, @t_mac, @date_start, @date_stop

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM animation_mac_cursor
   INTO @f_mac, @t_mac, @date_start, @date_stop
END

CLOSE animation_mac_cursor
DEALLOCATE animation_mac_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_IP_MAC].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_IP_MAC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_IP_MAC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_IP_MAC    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_IP_MAC    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_IP_MAC]
( @inJobID integer )
AS

DECLARE @f_mac nvarchar(80), @t_mac nvarchar(80), @totoal_pkt_size integer

DECLARE proto_by_ip_mac_cursor CURSOR FOR
SELECT DISTINCT t.from_mac, t.to_mac, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID 
GROUP BY t.from_mac, t.to_mac

OPEN proto_by_ip_mac_cursor

FETCH NEXT FROM proto_by_ip_mac_cursor
INTO @f_mac, @t_mac, @totoal_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_ip_mac_cursor
   INTO @f_mac, @t_mac, @totoal_pkt_size
END

CLOSE proto_by_ip_mac_cursor
DEALLOCATE proto_by_ip_mac_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_IP_VND].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_IP_VND]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_IP_VND] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_IP_VND    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_IP_VND    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_IP_VND]
( @inJobID integer )
AS

DECLARE @f_ip nvarchar(80), @t_ip nvarchar(80), @totoal_pkt_size integer

DECLARE proto_by_ip_vnd_cursor CURSOR FOR
SELECT DISTINCT t.from_ip, t.to_ip, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID 
GROUP BY t.from_ip, t.to_ip

OPEN proto_by_ip_vnd_cursor

FETCH NEXT FROM proto_by_ip_vnd_cursor
INTO @f_ip, @t_ip, @totoal_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_ip_vnd_cursor
   INTO @f_ip, @t_ip, @totoal_pkt_size
END

CLOSE proto_by_ip_vnd_cursor
DEALLOCATE proto_by_ip_vnd_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_PROTO_BY_FROM_IP].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_PROTO_BY_FROM_IP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_PROTO_BY_FROM_IP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_PROTO_BY_FROM_IP    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_PROTO_BY_FROM_IP    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_PROTO_BY_FROM_IP]
( @inJobID integer, @inFromIP nvarchar )
AS

DECLARE @proto nvarchar(250), @total_pkt_size integer

DECLARE proto_by_from_ip_cursor CURSOR FOR
SELECT DISTINCT t.protocol, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID and t.to_ip = @inFromIP
GROUP BY t.protocol 

OPEN proto_by_from_ip_cursor

FETCH NEXT FROM proto_by_from_ip_cursor
INTO @proto, @total_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_from_ip_cursor
   INTO @proto, @total_pkt_size
END

CLOSE proto_by_from_ip_cursor
DEALLOCATE proto_by_from_ip_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_PROTO_BY_FROM_MAC].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_PROTO_BY_FROM_MAC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_PROTO_BY_FROM_MAC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_PROTO_BY_FROM_MAC    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_PROTO_BY_FROM_MAC    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_PROTO_BY_FROM_MAC]
( @inJobID integer, @inFromMAC nvarchar )
AS

DECLARE @proto nvarchar(250), @total_pkt_size integer

DECLARE proto_by_from_mac_cursor CURSOR FOR
SELECT DISTINCT t.protocol, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID and t.to_mac = @inFromMAC
GROUP BY t.protocol 

OPEN proto_by_from_mac_cursor

FETCH NEXT FROM proto_by_from_mac_cursor
INTO @proto, @total_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_from_mac_cursor
   INTO @proto, @total_pkt_size
END

CLOSE proto_by_from_mac_cursor
DEALLOCATE proto_by_from_mac_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_PROTO_BY_JOB].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_PROTO_BY_JOB]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_PROTO_BY_JOB] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_PROTO_BY_JOB    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_PROTO_BY_JOB    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_PROTO_BY_JOB]
( @inJobID integer )
AS

DECLARE @proto nvarchar(250), @total_pkt_size integer

DECLARE proto_by_job_id_cursor CURSOR FOR
SELECT DISTINCT t.protocol, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID 
GROUP BY t.protocol 

OPEN proto_by_job_id_cursor

FETCH NEXT FROM proto_by_job_id_cursor
INTO @proto, @total_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_job_id_cursor
   INTO @proto, @total_pkt_size
END

CLOSE proto_by_job_id_cursor
DEALLOCATE proto_by_job_id_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_PROTO_BY_TO_IP].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_PROTO_BY_TO_IP]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_PROTO_BY_TO_IP] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_PROTO_BY_TO_IP    Script Date: 12/1/2005 11:49:40 PM ******/

/****** Object:  Stored Procedure SELECT_UND_PROTO_BY_TO_IP    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_PROTO_BY_TO_IP]
( @inJobID integer, @inToIP nvarchar )
AS

DECLARE @proto nvarchar(250), @total_pkt_size integer

DECLARE proto_by_ip_cursor CURSOR FOR
SELECT DISTINCT t.protocol, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID and t.to_ip = @inToIP
GROUP BY t.protocol 

OPEN proto_by_ip_cursor

FETCH NEXT FROM proto_by_ip_cursor
INTO @proto, @total_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_ip_cursor
   INTO @proto, @total_pkt_size
END

CLOSE proto_by_ip_cursor
DEALLOCATE proto_by_ip_cursor
GO

GO
--SqlScripter----[dbo].[SELECT_UND_PROTO_BY_TO_MAC].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[SELECT_UND_PROTO_BY_TO_MAC]') IS NULL EXEC('CREATE PROCEDURE [dbo].[SELECT_UND_PROTO_BY_TO_MAC] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.SELECT_UND_PROTO_BY_TO_MAC    Script Date: 12/1/2005 11:49:41 PM ******/

/****** Object:  Stored Procedure SELECT_UND_PROTO_BY_TO_MAC    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[SELECT_UND_PROTO_BY_TO_MAC]
( @inJobID integer, @inToMAC nvarchar )
AS

DECLARE @proto nvarchar(250), @total_pkt_size integer

DECLARE proto_by_mac_cursor CURSOR FOR
SELECT DISTINCT t.protocol, sum(t.pkt_size) 
   FROM und_transaction t
WHERE t.job_id = @inJobID and t.to_mac = @inToMAC
GROUP BY t.protocol 

OPEN proto_by_mac_cursor

FETCH NEXT FROM proto_by_mac_cursor
INTO @proto, @total_pkt_size

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM proto_by_mac_cursor
   INTO @proto, @total_pkt_size
END

CLOSE proto_by_mac_cursor
DEALLOCATE proto_by_mac_cursor
GO

GO
--SqlScripter----[dbo].[send_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[send_event]') IS NULL EXEC('CREATE PROCEDURE [dbo].[send_event] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.send_event    Script Date: 12/1/2005 11:50:12 PM ******/

ALTER PROCEDURE [dbo].[send_event]
@eoid       varchar(12),
    @joid       int,
    @job_name   varchar(64),
    @box_name   varchar(64),
    @AUTOSERV   varchar(30),
    @priority   int,
    @event      int,
    @status     int,
    @alarm      int,
    @event_time_gmt int,
    @exit_code  int,
    @machine    varchar(80),
    @pid        int,
    @jc_pid     int,
    @run_num    int,
    @ntry       int,
    @text       varchar(255),
    @que_priority   int    

AS
begin

exec ujo_send_event @eoid,@joid,@job_name,@box_name,
	@AUTOSERV, @priority, @event,@status,@alarm,@event_time_gmt,
	@exit_code,@machine,@pid,@jc_pid,@run_num,@ntry,@text,@que_priority

end
return 1
GO

GO
--SqlScripter----[dbo].[setDateFirst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[setDateFirst]') IS NULL EXEC('CREATE PROCEDURE [dbo].[setDateFirst] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.setDateFirst    Script Date: 12/1/2005 11:49:12 PM ******/

ALTER PROCEDURE [dbo].[setDateFirst]
@num int = -1
AS
BEGIN
	IF @num < 8 and @num >0
		SET DATEFIRST @num
END
GO

GO
--SqlScripter----[dbo].[spConsultaIndicadoresProyectos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[spConsultaIndicadoresProyectos]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spConsultaIndicadoresProyectos] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spConsultaIndicadoresProyectos]
@dMesConsulta  VARCHAR(2),
                                                 @dAñoConsulta  VARCHAR(4)

AS

DECLARE @dFechaInicioConsulta DATETIME,
        @dFechaFinConsulta DATETIME,
        @iNumerador     INT,
        @iDenominador   INT,
        @fRendimiento   FLOAT

--Obtenemos el intervalo en el cual se va ha realizar la consulta.
--Primer día del Mes
SELECT @dFechaInicioConsulta = CONVERT(DATETIME,@dMesConsulta+'-1-'+@dAñoConsulta)
--Ultimo día del Mes
SELECT @dFechaFinConsulta = dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,@dFechaInicioConsulta)+1, 0));

--Creamos la tablas auxiliares para realizar las consultas sobre las OTs.
CREATE TABLE #tmp_proy
(
	OTID     INT IDENTITY,  --id forma
	OTPAKGID VARCHAR(40),   --id paquete
	OTPKGNME VARCHAR(128),  --nombre paquete
	OTDENUME VARCHAR(40),   --id ot
	OTDETIPO VARCHAR(16),   --tipo requerimiento
	OTDEREQU VARCHAR(255),  --descripcion requerimiento
	OTFRECEP DATETIME,      --fecha recibida el
	OTDEUSRC VARCHAR(40),   --emisor
	OTDEFREQ DATETIME,      --fecha requerida
	OTASJEFE VARCHAR(128),  --jpy
	OTASINGP VARCHAR(128),  --ipy
	OTDEFINI DATETIME,      --fecha inicio
	OTFTERES DATETIME,      --fecha termino construccion estimado
	OTFETERR DATETIME,      --fecha termino construccion real
	OTFEREPR DATETIME,      --fecha reprogramacion
	OTFEACPE DATETIME,      --fecha aceptacion estimado
	OTFEACPR DATETIME,      --fecha aceptacion real
	OTFENTOP DATETIME,      --fecha entrega operaciones
	OTFEPROD DATETIME,      --fecha puesta en produccion
	OTESTADO VARCHAR(40),   --estado ot
	OTDEFPRO VARCHAR(30)    --familia producto
)

CREATE TABLE #tmp_proy1
(
	OTPAKGID VARCHAR(40),   --id paquete
	OTPKGNME VARCHAR(128),  --nombre paquete
	OTDENUME VARCHAR(40),   --id ot
	OTDETIPO VARCHAR(16),   --tipo requerimiento
	OTDEREQU VARCHAR(255),  --descripcion requerimiento
	OTDEUSRC VARCHAR(40),   --emisor
	OTDEFREQ DATETIME,      --fecha requerida
	OTASJEFE VARCHAR(128),  --jpy
	OTASINGP VARCHAR(128),  --ipy
	OTFTERES DATETIME,      --fecha termino construccion estimado
	OTFEREPR DATETIME,      --fecha reprogramacion
	OTFEACPE DATETIME,      --fecha aceptacion estimado
	OTESTADO VARCHAR(40),   --estado ot
	OTDEFPRO VARCHAR(30),   --familia producto
)

CREATE TABLE #tmp_fechas_proy
(
	OTDENUME VARCHAR(40),   --id ot
	OTFRECEP DATETIME,      --fecha recibida el
	OTDEFINI DATETIME,      --fecha inicio
	OTFETERR DATETIME,      --fecha termino construccion real
	OTFEACEP DATETIME,      --fecha aceptacion real
	OTFENTOP DATETIME,      --fecha entrega operaciones
	OTFEPROD DATETIME,      --fecha puesta en produccion
	OTPAKGID VARCHAR(40)    --id paquete
)

-- Tablas auxiliares para obtener el estado actual del paquete.
CREATE TABLE #tmp_fecha_estado_actual
(
	cPKGID        VARCHAR(40),
	cFechaMAXPKG  DATETIME
)

CREATE TABLE #tmp_estado_actual
(
	cPKGID    VARCHAR(40),
	vcESTADO  VARCHAR(40)
)

CREATE TABLE #tmp_nombre_paquete
(
	cPKGID       VARCHAR(40),  
	vcNombrePKG  VARCHAR(128)
)

-- Tablas auxiliares para ocupar los filtros preestablecidos.
CREATE TABLE #tmp_filtro_tipo
(
	cTipo CHAR(16)
)

CREATE TABLE #tmp_filtro_estado
(
	cEstado CHAR(40)
)

CREATE TABLE #tmp_filtro_jefe
(
	cNombreJefe CHAR(128)
)

CREATE TABLE #tmp_filtro_ingeniero
(
	cNombreIngeniero CHAR(128)
)

-- Tablas auxiliares para calcular los ciclos de QA.
CREATE TABLE #tmp_history
(
	id       INT IDENTITY,
	idpak    VARCHAR(40),
	action   VARCHAR(40),
	fecha    DATETIME,
	estado   VARCHAR(40)
)

CREATE TABLE #tmp_nciclos
(
	id       INT IDENTITY,
	idpak    VARCHAR(40),
	nciclos  INT
)

-- Rellenar los filtros para mantener concordancia con los
-- proyectos que se muestran en el sis.
-- Filtro Tipo
INSERT #tmp_filtro_tipo VALUES ('Nuevo')
INSERT #tmp_filtro_tipo VALUES ('Modificacion')
INSERT #tmp_filtro_tipo VALUES ('Falla')
INSERT #tmp_filtro_tipo VALUES ('Evaluacion')

-- Filtrp Estado
INSERT #tmp_filtro_estado VALUES ('Definicion de requerimientos')
INSERT #tmp_filtro_estado VALUES ('Requerimientos Eliminados')
INSERT #tmp_filtro_estado VALUES ('Asignacion de requerimientos')
INSERT #tmp_filtro_estado VALUES ('Diseño')
INSERT #tmp_filtro_estado VALUES ('Codificacion')
INSERT #tmp_filtro_estado VALUES ('Pruebas')
INSERT #tmp_filtro_estado VALUES ('Aseguramiento de Calidad')
INSERT #tmp_filtro_estado VALUES ('Aceptacion Usuario')
INSERT #tmp_filtro_estado VALUES ('Puesta en Produccion')
INSERT #tmp_filtro_estado VALUES ('Produccion')

-- Filtro Jefe
INSERT #tmp_filtro_jefe
SELECT realname
FROM   haruser hu, harusersingroup hig, harusergroup hug
WHERE  hu.usrobjid = hig.usrobjid
AND hig.usrgrpobjid = hug. usrgrpobjid
AND usergroupname = 'SF Jefe de Proyectos'

-- Filtro Ingeniero
INSERT #tmp_filtro_ingeniero
SELECT realname
FROM   haruser hu, harusersingroup hig, harusergroup hug
WHERE  hu.usrobjid = hig.usrobjid
       AND hig.usrgrpobjid = hug. usrgrpobjid
       AND usergroupname = 'SF Ingeniero de Proyectos'

-- Se procede a obtener el estado actual del paquete
INSERT #tmp_fecha_estado_actual
SELECT packageobjid, MAX(execdtime)
FROM   harpkghistory
GROUP BY packageobjid  
ORDER BY packageobjid

INSERT #tmp_estado_actual
SELECT packageobjid, statename
FROM   harpkghistory, #tmp_fecha_estado_actual
WHERE  packageobjid = cPKGID
       AND execdtime = cFechaMAXPKG
GROUP BY packageobjid, statename
ORDER BY packageobjid

INSERT #tmp_nombre_paquete
SELECT packageobjid, packagename
FROM   harpackage

-- Se hace las inseciones para 4 escenarios
-- Cuando el jefe y el ingeniero no son nulos
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",  
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o, 
		 --harpkghistory hfre, 
		 --harpkghistory hfi, 
		 --harpkghistory hfctr,
		 --harpkghistory hfar, 
		 --harpkghistory hfeo, 
		 --harpkghistory hfep, 
		 #tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
       --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
       --AND o.OTPAKGID *= hfi.packageobjid
      -- AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
       --AND o.OTPAKGID *= hfctr.packageobjid
       --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
       --AND o.OTPAKGID *= hfar.packageobjid
       --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
       --AND o.OTPAKGID *= hfeo.packageobjid
       --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
       --AND o.OTPAKGID *= hfep.packageobjid
       --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

-- Cuando el jefe y el ingeniero son nulos
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IS NULL
	     AND o.OTASINGP IS NULL
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o, 
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
	     --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     --AND o.OTPAKGID *= hfi.packageobjid
	     --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
	     --AND o.OTPAKGID *= hfctr.packageobjid
	     --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
	     --AND o.OTPAKGID *= hfar.packageobjid
	    -- AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
	     --AND o.OTPAKGID *= hfeo.packageobjid
	     --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
	     --AND o.OTPAKGID *= hfep.packageobjid
	     --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
	     AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
	     AND o.OTASJEFE IS NULL
       AND o.OTASINGP IS NULL
GROUP BY o.OTDENUME, o.OTPAKGID
		ORDER BY o.OTDENUME DESC

-- Cuando el jefe es nulo y el ingeniero no
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
	     AND o.OTASJEFE IS NULL
	     AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o,
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid  AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
       AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
       --AND o.OTPAKGID *= hfi.packageobjid
       --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
       --AND o.OTPAKGID *= hfctr.packageobjid
       --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
       --AND o.OTPAKGID *= hfar.packageobjid
       --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
       --AND o.OTPAKGID *= hfeo.packageobjid
       --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
       --AND o.OTPAKGID *= hfep.packageobjid
       --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IS NULL
       AND o.OTASINGP IN (SELECT cNombreIngeniero FROM #tmp_filtro_ingeniero)
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

--Cuando el jefe no es nulo y el ingeniero si
INSERT INTO #tmp_proy1
SELECT o.OTPAKGID"Id Paquete", tnp.vcNombrePKG"Nombre Paquete", o.OTDENUME"OT", o.OTDETIPO"Tipo Requerimiento", o.OTDEREQU "Descripción",
       o.OTDEUSRC"Emisor", o.OTDEFREQ"Fecha Requerida", o.OTASJEFE"JPY", o.OTASINGP"IPY", o.OTREFTE1"Fecha Termino Construcción Estimado",
       isnull(o.OTREFRE3,isnull(o.OTREFRE2,o.OTREFRE1))"Fecha Reprogramación", o.OTREFTE2"Fecha Aceptación Estimado",
       tea.vcESTADO"Estado", o.OTDEFPRO"Familia"
FROM   ot1sinac o, #tmp_estado_actual tea, #tmp_nombre_paquete tnp
WHERE  o.OTPAKGID = tea.cPKGID
       AND tnp.cPKGID = tea.cPKGID
       AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
       AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
       AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
       AND o.OTASINGP IS NULL
GROUP BY o.OTPAKGID, tnp.vcNombrePKG, o.OTDENUME, o.OTDETIPO, o. OTDEREQU, o.OTDEUSRC, o.OTDEFREQ,   o.OTASJEFE,
         o.OTASINGP, o.OTREFTE1,      o.OTREFRE1, o.OTREFRE2, o.OTREFRE3,  o.OTREFTE2, tea.vcESTADO, o.OTDEFPRO
ORDER BY o.OTDENUME DESC

INSERT INTO #tmp_fechas_proy
SELECT o.OTDENUME"OT", MAX(hfre.execdtime)"Fecha Recibida el", MAX(hfi.execdtime)"Fecha Inicio",
       MAX(hfctr.execdtime)"Fecha Termino Construcción Real", MAX(hfar.execdtime)"Fecha Aceptación Real",
       MAX(hfeo.execdtime)"Fecha Entrega Operaciones", MAX(hfep.execdtime)"Fecha Puesta en Produccion", o.OTPAKGID"Id Paquete"
FROM   ot1sinac o,
		#tmp_estado_actual tea
left join harpkghistory hfre on o.OTPAKGID = hfre.packageobjid AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
left join harpkghistory hfi on o.OTPAKGID = hfi.packageobjid AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
left join harpkghistory hfctr on o.OTPAKGID = hfctr.packageobjid AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
left join harpkghistory hfar on o.OTPAKGID = hfar.packageobjid AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
left join harpkghistory hfeo on o.OTPAKGID = hfeo.packageobjid AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
left join harpkghistory hfep on o.OTPAKGID = hfep.packageobjid AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
WHERE  o.OTPAKGID = tea.cPKGID
       --AND o.OTPAKGID *= hfre.packageobjid
	     --AND hfre.statename = 'Asignacion de requerimientos' AND hfre.action = 'Promote'
	     --AND o.OTPAKGID *= hfi.packageobjid
	     --AND hfi.statename = 'Diseño' AND hfi.action = 'Promote'
	     --AND o.OTPAKGID *= hfctr.packageobjid
	     --AND hfctr.statename = 'Aseguramiento de Calidad' AND hfctr.action = 'Promote'
	     --AND o.OTPAKGID *= hfar.packageobjid
	     --AND hfar.statename = 'Aceptacion Usuario' AND hfar.action = 'Promote'
	     --AND o.OTPAKGID *= hfeo.packageobjid
	     --AND hfeo.statename = 'Puesta en Produccion' AND hfeo.action = 'Promote'
	     --AND o.OTPAKGID *= hfep.packageobjid
	     --AND hfep.statename = 'Produccion' and hfep.action = 'Promote'
	     AND o.OTDETIPO IN (SELECT cTipo FROM #tmp_filtro_tipo)
	     AND tea.vcESTADO IN (SELECT cEstado FROM #tmp_filtro_estado)
		   AND o.OTASJEFE IN (SELECT cNombreJefe FROM #tmp_filtro_jefe)
		   AND o.OTASINGP IS NULL
GROUP BY o.OTDENUME, o.OTPAKGID
ORDER BY o.OTDENUME DESC

-- Se almacenan todos los datos de las OTs.
INSERT #tmp_proy
SELECT tp1.OTPAKGID"Id Paquete", tp1.OTPKGNME"Nombre Paquete", tp1.OTDENUME"OT", tp1.OTDETIPO"Tipo Requerimiento", tp1.OTDEREQU "Descripción",
       tf.OTFRECEP"Recibida el", tp1.OTDEUSRC"Emisor", tp1.OTDEFREQ"Fecha Requerida", tp1.OTASJEFE"JPY", tp1.OTASINGP"IPY",
       tf.OTDEFINI"Fecha Inicio", tp1.OTFTERES"Fecha Termino Construcción Estimado", tf.OTFETERR"Fecha Termino Construcción Real",
       tp1.OTFEREPR"Fecha Reprogramación", tp1.OTFEACPE"Fecha Aceptación Estimado", tf.OTFEACEP"Fecha Aceptación Real",
       tf.OTFENTOP"Fecha Entrega Operaciones", tf.OTFEPROD"Fecha Entrega Producción", tp1.OTESTADO"Estado", tp1.OTDEFPRO"Familia"
FROM   #tmp_proy1 tp1, #tmp_fechas_proy tf
WHERE  tp1.OTDENUME = tf.OTDENUME
       AND tp1.OTPAKGID = tf.OTPAKGID
ORDER BY  tp1.OTPAKGID DESC

-- Procedemos a calcular los indicadores.
-- 1er Indicador
-- % de OTs que cumplen fecha comprosiso con el cliente.
-- Numerador: Número de OTs que la Fecha Real Puesta en Produccion es menor o igual que la Fecha Estimada Puesta en Produccion dentro del mes consultado.
SELECT @iNumerador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFEPROD <= OTDEFREQ
       AND OTFEPROD BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs con Fecha Estimada Puesta en Produccion dentro del mes consultado.
SELECT @iDenominador = COUNT(*)
FROM   #tmp_proy
WHERE  OTDEFREQ BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total Proyectos Puestos en Produccion a la fecha Antes de la Fecha requerida", @iDenominador"Total proyectos que requerián estar en produccion a la fecha de consulta", @fRendimiento"% de OT que cumplen la fecha de compromiso con el cliente"

-- 2ndo Indicador
-- % de OT que cumplen la planificación detallada
-- Numerador: : Número de OTs que la Fecha de Término Construcción Real es menor o igual que la Fecha de Término Construcción Estimado dentro del mes consultado.
SELECT @iNumerador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFETERR <= OTFTERES
       AND OTFTERES BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs con Fecha de Término Construcción Estimado dentro del mes consultado.
SELECT @iDenominador = COUNT(*)
FROM   #tmp_proy
WHERE  OTFTERES BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos terminados de contruir antes de la fecha requerida", @iDenominador"Total proyectos que requerián estar construidos a la fecha de consulta.", @fRendimiento"% de OT que cumplen la fecha de compromiso con el cliente"

-- Se rellenan las tablas para calcular los ciclos de QA
INSERT #tmp_history
SELECT hh.packageobjid"Id Paquete", hh.action"Accion", hh.execdtime"Fecha", hh.statename"Estado"
FROM   harpkghistory AS hh
WHERE  (hh.action = 'Demote' or hh.action = 'Promote')
ORDER BY hh.packageobjid desc, hh.execdtime ASC

INSERT #tmp_nciclos
SELECT idpak"Id Paquete", COUNT(estado)"Ciclos QA"
FROM   #tmp_history
WHERE  estado = 'Aseguramiento de Calidad'
GROUP BY idpak
ORDER BY idpak DESC

-- 3er Indicador
-- % de OT aceptadas por QA (1 ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 1 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos = 1
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 1 ciclo de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 1 ciclo de QA"

-- 4to Indicador
-- % de OT aceptadas por QA (2 ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 2 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos = 2
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 2 ciclos de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 2 ciclo de QA"

-- 5to Indicador
-- % de OT aceptadas por QA (2 o + ciclo)
-- Numerador: : Número de OTs Aceptadas por QA en 2 ciclo de desarrollo.
SELECT @iNumerador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tc.nciclos > 2
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Denominador: Número de OTs Aceptadas por QA dentro del mes consultado.
SELECT @iDenominador = COUNT(tc.idpak)
FROM   #tmp_proy tp, #tmp_nciclos tc
WHERE  tp.OTPAKGID = tc.idpak
       AND tp.OTFEACPR BETWEEN @dFechaInicioConsulta AND @dFechaFinConsulta

-- Se calcula el rendimiento. En caso de que no existen proyectos requeridos para la fecha de la consulta, automaticamente se entrega 0.
IF @iDenominador > 0
	SELECT @fRendimiento = (CONVERT(FLOAT,@iNumerador)*100)/CONVERT(FLOAT,@iDenominador)
ELSE
	SELECT @fRendimiento = 0

--Entregamos los valores obtenidos por el indicador
SELECT @iNumerador"Total de proyectos aceptados en 2 o + ciclos de QA del mes", @iDenominador"Total de proyectos aceptados por QA en el mes.", @fRendimiento"% de OT que cumplen aceptadas en 2 ciclo de QA"

-- Eliminamos las tablas que ya no van a ser ocupadas.
DROP TABLE #tmp_proy1
DROP TABLE #tmp_fecha_estado_actual
DROP TABLE #tmp_estado_actual
DROP TABLE #tmp_nombre_paquete
DROP TABLE #tmp_fechas_proy
DROP TABLE #tmp_filtro_tipo
DROP TABLE #tmp_filtro_jefe
DROP TABLE #tmp_filtro_ingeniero
DROP TABLE #tmp_proy
DROP TABLE #tmp_history
DROP TABLE #tmp_nciclos
GO

GO
--SqlScripter----[dbo].[tng_add_2d_icon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_2d_icon]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_2d_icon] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_2d_icon    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_2d_icon]
(
         @icongroup		varchar(30) ,
      	 @icon0			varchar(64) =NULL,
		 @icon1			varchar(64) =NULL,
         @icon2			varchar(64) =NULL,
		 @icon3			varchar(64) =NULL,
		 @icon4			varchar(64) =NULL,
         @icon5			varchar(64) =NULL,
		 @icon6			varchar(64) =NULL,
		 @icon7			varchar(64) =NULL,
		 @icon8			varchar(64) =NULL,
		 @icon9			varchar(64) =NULL 
		  )
  as		 

    insert into tng_icon_2d ( name,normal_icon,unknown_icon,warning_icon,minor_icon,major_icon,critical_icon,down_icon,inservice_icon,remove_icon,future_icon)
			values (    @icongroup,  @icon0,      @icon1,      @icon2,     @icon3,   @icon4,         @icon5, @icon6,      @icon7,       @icon8,   @icon9)
GO

GO
--SqlScripter----[dbo].[tng_add_3d_icon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_3d_icon]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_3d_icon] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_3d_icon    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_3d_icon]
(
         @icongroup		varchar(30) ,
      	 @nff_file1			varchar(64) =NULL,
		 @nff_file2			varchar(64) =NULL,
         @nff_file3			varchar(64) =NULL,
		 @nff_file4			varchar(64) =NULL,
		 @distance1			float =NULL,
         @distance2			float =NULL,
		 @distance3			float =NULL,
		 @distance4			float =NULL,
		 @expand_distance	float =NULL,
		 @nff_inside			varchar(64) =NULL,
		 @status				int =null
		  )
  as		 
	select 	@nff_file2=null, @nff_file3=null, @nff_file4=null

    insert into tng_icon_3d ( name, nff_file1, nff_file2, nff_file3, nff_file4, 
    			distance1, distance2, distance3, distance4, expand_distance, nff_inside, status )
			values ( @icongroup, @nff_file1, @nff_file2, @nff_file3, @nff_file4, 
				@distance1, @distance2, @distance3, @distance4, @expand_distance, @nff_inside, @status)
GO

GO
--SqlScripter----[dbo].[tng_add_alarmset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_alarmset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_alarmset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_alarmset    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_alarmset]
(
         @name		varchar(30) ,
		 @comment		varchar(255)=NULL
		 )
as		 


 	  if (@name is null)
	  begin
	    BEGIN PRINT 'Server: Msg '+cast(90030 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90030) add_alarmset: bad @name'; RAISERROR (90030, 16, 1); END;
        return
	  end
	   
	  begin transaction addalarmset
		insert into tng_alarmset ( name,  comment)
                          values (@name,  @comment)
      commit transaction addalarmset
/*2/9/96
	  exec tng_add_alarmset_entry @alarmset_name=@name,
	  	  						  @start_sequence_no=1
*/
GO

GO
--SqlScripter----[dbo].[tng_add_auth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_auth]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_auth] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_auth    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_auth]
( @name varchar(20), 
							@access char(1),
							@mask varchar(15)='*.*.*.*',
							@status_on tinyint=0  )
   as
     
 insert into tng_auth ( name,  access, mask )
           values ( @name, @access, @mask )

 if @@error !=0
 begin
   if @status_on=1
     raiserror ('MSG:(90024) Insert tng_auth error, @name=%s, @access=%s.', 16, -1, @name, @access)
   return
 end
GO

GO
--SqlScripter----[dbo].[tng_add_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_class]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_class] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_class    Script Date: 12/1/2005 11:50:14 PM ******/


ALTER PROCEDURE [dbo].[tng_add_class]
( 
		  @classname varchar(30), 				
		  @superclassname varchar(30), 
          @virtual_class tinyint =0, 			
          @vendor_name char(30)=null, 
   		  @map_visible  	tinyint=1,		
		  @vr_visible   	tinyint=1,
		  @external_data  tinyint=null,  /*1/30/96 @external_data  tinyint=0, */
		  @open_space     tinyint=1,
		  @propagate_status   	tinyint=1,
		  @system_class   tinyint=0,
		  @hidden_class   tinyint=0,
		  @property_group varchar(10)=null,
		  @instance_storage varchar(32)=null, 
		  @popup_menu_name varchar(30)=null, 
          @2d_icongroup varchar(30) =null, 		
		  @3d_icongroup varchar(30) =null,
		  @initial_x		int =null,
		  @initial_y		int =null,
		  @initial_z		int =null,
          @label_font 	    varchar(10) =null,	
   		  @label_position 	varchar(20) =null,	
   		  @label_border  	varchar(5) 	=null,
          @top_left_name varchar(30) =null,
          @top_right_name varchar(30) =null,	
          @bottom_left_name varchar(30) =null,
		  @bottom_right_name varchar(30) =null  
          )
    as 	set nocount on 	 
declare @super_class_id int
declare @vendor_id int
declare @rc int 
declare @string varchar(255)
declare @vendor_full_name varchar(30)

  if(@superclassname='Class' and @classname='Class' )
    select @super_class_id=0
  else
  Begin
    select @super_class_id = null 
    select @super_class_id =(select class_id from tng_class where name=@superclassname)
	if(	@super_class_id is null)
	begin
	  BEGIN PRINT 'Server: Msg '+cast(90021 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90021) Bad @superclassname'; RAISERROR (90021, 16, 1); END;
	  return
	end
  end

  if(@vendor_name is null)
    select @vendor_id = 0 /*unknown vendor id*/
  else
  Begin
    select @vendor_id = null 
    select @vendor_id = (select vendor_id from tng_vendor where vendor_name=@vendor_name)
	if(	@vendor_id is null)
	begin
	  BEGIN PRINT 'Server: Msg '+cast(90022 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90022) Bad @vendor_name'; RAISERROR (90022, 16, 1); END;
	  return
	end
  end

  /*class has no instance and is not external storage*/
  /*
  if((@instance_storage is null) and (@external_data=0) ) 
	select @virtual_class=1
*/
  
  if(upper(@classname) = 'CLASS')
    select @superclassname='Class'

  begin transaction addclass	       
    insert into dbo.tng_class (name, super_class_id, super_class_name,virtual_class, 
    						map_visible, vr_visible,  system_class, hidden_class, instance_storage)
  						 
                 values (@classname, @super_class_id, @superclassname, @virtual_class,  
                 			@map_visible, @vr_visible,@system_class, @hidden_class, @instance_storage)

    if @@error != 0 or @@rowcount != 1
	  begin
		BEGIN PRINT 'Server: Msg '+cast(90023 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90023) Can''t insert entry into tng_class table.'; RAISERROR (90023, 16, 1); END;
		rollback transaction addclass
		return
	  end
  commit transaction addclass

  /*get extent property of 2d and 3d for the class*/ 
  if(@2d_icongroup is null)
    select @2d_icongroup=name from tng_icon_2d	where name=@classname
  if(@3d_icongroup is null)
    select @3d_icongroup=name from tng_icon_3d where name=@classname
  /*2/13/96 if @3d_icongroup is still null, get icon group name from parent class*/
  if(@3d_icongroup is null)
    select @3d_icongroup=name from tng_icon_3d where name=@superclassname

/*4/22/96
  if (upper(@classname)!='CLASS')
  begin
	if(@virtual_class = 1 or @map_visible=0)
    begin	/*if is virtual class, don't specify following property in tng_class_ext table*/

	  select @vendor_name=null, @label_font=null,@label_position=null,
	  		 @label_border=null,@2d_icongroup=null,@3d_icongroup=null
	  select @top_left_name=null,@top_right_name=null,@bottom_left_name=null,@bottom_right_name=null
	end
	if( @vr_visible=0)
    begin	/*if is virtual class, don't specify following property in tng_class_ext table*/

	  select @3d_icongroup=null,@top_left_name=null,@top_right_name=null,@bottom_left_name=null,@bottom_right_name=null

	end
  end
*/
  						 
  begin transaction addclass_ext

    /*1/31/96 for CLP popup_menu_name*/
	if ( @popup_menu_name is not null) 
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='popup_menu_name',
						  				@datatype='varchar',
						   				@string=@popup_menu_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='popup_menu_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='Map_2d',
						  @string=@popup_menu_name
	end

	if ( @external_data is not null) 
	begin
	  select @rc=-1, @string=convert(varchar(3),	@external_data)
	  
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='external_data',
						  				@datatype='tinyint',
						   			/*	@tinyint=@external_data,*/
										@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='external_data',
						  @datatype='tinyint',
						  @length=1,
						  @property_group='Class_Flag',
						  /*@tinyint=@external_data*/
						  @string=@string
	end

    

	if ( @open_space is not null) 
	begin
	  select @rc=-1,@string=convert(varchar(3),	@open_space)
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='open_space',
						  				@datatype='tinyint',
						   			/*	@tinyint=@open_space,*/
										@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='open_space',
						  @datatype='tinyint',
						  @length=1,
						  @property_group='VR_3d',
						  /*@tinyint=@open_space*/
						  @string=@string
	end

  
    
/*06/14/96
	if ( @propagate_status is not null) 
	begin
	  select @rc=-1	, @string=convert(varchar(3),	@propagate_status)
	  exec tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='status_propagation', 
						  				@datatype='tinyint',
										@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='status_propagation',	
						  @datatype='tinyint',
						  @length=1,
						  @property_group='Class_Flag',
						  /*@tinyint=@propagate_status*/
						  @string=@string
	end
*/

    if ( @vendor_name is not null) 
	begin
	  select @vendor_full_name=null
	  select @vendor_full_name=name from tng_vendor where vendor_name=@vendor_name
	  if(@vendor_full_name is not null)
	    select @vendor_name=@vendor_full_name
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='vendor_name',
						  				@datatype='varchar',
						   				@string=@vendor_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='vendor_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='Vendor',
						  @string=@vendor_name
	end



    if (@label_font is not null) 
	begin
      select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='label_font',
						  				@datatype='varchar',
						   				@string=@label_font,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	   	exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='label_font',
						  @datatype='varchar',
						  @length=10,
						  @property_group='Map_2d',
						  @string=@label_font
    end

    if (@label_position is not null)
    begin
      select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='label_position',
						  				@datatype='varchar',
						   				@string=@label_position,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	   	exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='label_position',
						  @datatype='varchar',
						  @length=20,
						  @property_group='Map_2d',
						  @string=@label_position
    end

    if (@label_border is not null)
    begin
      select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='label_border',
						  				@datatype='varchar',
						   				@string=@label_border,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='label_border',
						  @datatype='varchar',
						  @length=5,
						  @property_group='Map_2d',
						  @string=@label_border
	end

	if (@2d_icongroup is not null)
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='icon_2d_name',
						  				@datatype='varchar',
						   				@string=@2d_icongroup,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='icon_2d_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='Map_2d',
						  @string=@2d_icongroup
    end
	if (@3d_icongroup is not null)
	begin
	  select @rc=-1	
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='icon_3d_name',
						  				@datatype='varchar',
						   				@string=@3d_icongroup,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='icon_3d_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='VR_3d',
						  @string=@3d_icongroup
    end

	if (@initial_x is not null)
	begin
	  select @rc=-1	, @string=convert(varchar(4),	@initial_x)
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='initial_x',
						  				@datatype='int',
						   				@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='initial_x',
						  @datatype='int',
						  @length=4,
						  @property_group='VR_3d',
						  @string=@string
    end

	if (@initial_y is not null)
	begin
	  select @rc=-1	, @string=convert(varchar(4),	@initial_y)
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='initial_y',
						  				@datatype='int',
						   				@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='initial_y',
						  @datatype='int',
						  @length=4,
						  @property_group='VR_3d',
						  @string=@string
    end

	if (@initial_z is not null)
	begin
	  select @rc=-1	, @string=convert(varchar(4),	@initial_z)
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='initial_z',
						  				@datatype='int',
						   				@string=@string,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='initial_z',
						  @datatype='int',
						  @length=4,
						  @property_group='VR_3d',
						  @string=@string
    end

	if (@top_left_name is not null)
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='top_left_name',
						  				@datatype='varchar',
						   				@string=@top_left_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='top_left_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='VR_3d',
						  @string=@top_left_name
	end

	if (@top_right_name is not null) 
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='top_right_name',
						  				@datatype='varchar',
						   				@string=@top_right_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='top_right_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='VR_3d',
						  @string=@top_right_name
	end

	if (@bottom_left_name is not null) 
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='bottom_left_name',
						  				@datatype='varchar',
						   				@string=@bottom_left_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='bottom_left_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='VR_3d',
						  @string=@bottom_left_name
	end

	if (@bottom_right_name is not null) 
	begin
	  select @rc=-1
	  exec dbo.tng_is_attr_same_as_superclass 	@classname=@classname, 
	 					  				@name='bottom_right_name',
						  				@datatype='varchar',
						   				@string=@bottom_right_name,
										@rc=@rc OUTPUT
      
      if( @rc=0)
	    exec dbo.tng_add_class_ext @classname=@classname, 
	 					  @name='bottom_right_name',
						  @datatype='varchar',
						  @length=40,
						  @property_group='VR_3d',
						  @string=@bottom_right_name
   	end

  commit transaction addclass_ext
GO

GO
--SqlScripter----[dbo].[tng_add_class_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_class_ext]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_class_ext] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_class_ext    Script Date: 12/1/2005 11:50:12 PM ******/


ALTER PROCEDURE [dbo].[tng_add_class_ext]
( 
				   @classname 	varchar(30),
				   @name 		varchar(255),
				   @datatype 	varchar(30),
				   @length		int,
				   @property_group   varchar(10) =null,
				   @integer		int =null,
				   @tinyint		tinyint=null,
				   @float		float =null,
				   @datetime    datetime =null,
				   @string		varchar(255) =null,
				   @binary		varbinary(255) =null
				)
as
declare @class_id int
   
   select @class_id = null
   select @class_id = class_id from tng_class where name=@classname
   if( @class_id is null )
   begin
	  BEGIN PRINT 'Server: Msg '+cast(90018 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG(90018): Bad @classname pass in add_class_ext procedure.'; RAISERROR (90018, 16, 1); END;
	  return
   end  
   insert into tng_class_ext (	class_id,  name,  datatype,  length, property_group,    string  )
                     values (@class_id, @name, @datatype,	@length,@property_group, @string )
GO

GO
--SqlScripter----[dbo].[tng_add_managedobject].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_managedobject]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_managedobject] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_managedobject    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_managedobject]
(
 		@uuid UUID,
         @name		varchar(255) =null,
 		@label		varchar(255) =null,
 		@address		varchar(255) =null,
 		@address_type	int=null,
 		@class_name		varchar(30),
 		@interface_type  int =null,
 		@hidden 	 tinyint=null,
 		@propagate_status 	 tinyint=null,
 		@status_no  int =null,
 		@severity  int =null,
 		@autoarrange_type  int=null,
 		@posted 	 tinyint=null,
 		@acknowledge 	 tinyint=null,
 /*		@status_time	datetime=null, */
 		@ip_address_hex		binary(4)=null,
 		@mac_address	varchar(12) =null,
 		@subnet_mask	binary(4)=null,
 		@date_ins		datetime=null,
 		@date_modify		datetime=null,
 		@alarmset_name	varchar(30)=null,
 		@override_imagelarge	varchar(64)=null,
 		@override_imagesmall	varchar(64)=null,	
 		@override_imagedecal	varchar(64)=null,	
 		@override_imagetintbool	tinyint=null,
 		@override_model			varchar(64)=null,	
 		@background_image	varchar(64) =null,
 		@source_repository	varchar(64) = null
 		 )
 as		 
 
 	select @source_repository = (@@SERVERNAME + ':ODBC')
 
  	  INSERT INTO tng_managedobject ( uuid, name, label, address, address_type, class_name, interface_type, hidden, 
  	  								  propagate_status, status_no, severity, posted, acknowledge,autoarrange_type ,
  	  								  ip_address_hex, mac_address, subnet_mask, date_ins, date_modify, alarmset_name, 
 									  override_imagelarge, override_imagesmall, override_imagedecal,
 									  override_imagetintbool, override_model, background_image,source_repository)
 					
 							values	( @uuid,@name,@label,@address,@address_type,@class_name,@interface_type,@hidden, 
  	  								 @propagate_status,@status_no,@severity,@posted,@acknowledge,@autoarrange_type, 
  	  								@ip_address_hex,@mac_address,@subnet_mask,@date_ins,@date_modify, @alarmset_name, 
 									@override_imagelarge,@override_imagesmall,@override_imagedecal,
 									  @override_imagetintbool,@override_model,@background_image,@source_repository)
 
       if @@error !=0
          raiserror ('MSG:(90031) Insert tng_managedobject error, @name=%s, @label=%s, @class_name=%s. @ip_address_hex=%x', 
          				16, -1, @name, @label, @class_name, @ip_address_hex )
 
       
 	  return
GO

GO
--SqlScripter----[dbo].[tng_add_manuf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_manuf]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_manuf] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_manuf    Script Date: 12/1/2005 11:49:41 PM ******/

ALTER PROCEDURE [dbo].[tng_add_manuf]
(@id int, @name varchar(30), @vendor_name varchar(10), 
          @comment varchar(80)  )
    as  
 insert into tng_vendor (vendor_id, name, vendor_name, comment )
             values (@id, @name, @vendor_name, @comment )
GO

GO
--SqlScripter----[dbo].[tng_add_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_method]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_method] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_method    Script Date: 12/1/2005 11:49:42 PM ******/

ALTER PROCEDURE [dbo].[tng_add_method]
(
         @name		varchar(30) ,

      	 @type		int=null,
      	 @exe_name	varchar(255)= NULL,
      	 @parameter		varchar(255)=NULL
		 )
  as 	set nocount on 			 


 	  if (@name is null)
	  begin
	    BEGIN PRINT 'Server: Msg '+cast(90028 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90028) add_method: bad @name'; RAISERROR (90028, 16, 1); END;
        return
	  end
	
     insert into tng_method ( name,  type, exe_name, parameter)
                     values (@name, @type,@exe_name, @parameter)
GO

GO
--SqlScripter----[dbo].[tng_add_pollset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_pollset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_pollset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_pollset    Script Date: 12/1/2005 11:49:42 PM ******/

ALTER PROCEDURE [dbo].[tng_add_pollset]
(@name varchar(20), @Pinterval int,
                 @TOinterval int, @retries int,
                 @port_number int =161,
                 @getCommunityString  varchar(30) ='public',
                 @setCommunityString  varchar(30) ='admin',
                 @retriesInterval int =0,
                 @objectFilter  varchar(30) ='*',
                 @hostFilter    varchar(30) ='*'
)
as
     insert into dbo.tng_pollset ( name, interval, timeout, retries, port_number,
                               getcommunitystring,setcommunitystring,retriesinterval,objectfilter,hostfilter)
                 values  ( @name,@Pinterval, @TOinterval,@retries,@port_number,
                           @getCommunityString,@setCommunityString,@retriesInterval,@objectFilter,@hostFilter )
GO

GO
--SqlScripter----[dbo].[tng_add_propertydef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_propertydef]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_propertydef] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_propertydef    Script Date: 12/1/2005 11:50:14 PM ******/

ALTER PROCEDURE [dbo].[tng_add_propertydef]
(
         @classname		varchar(30) ,
      	 @name			varchar(30) ,
		 @datatype		varchar(20) ,
         @length		int,
		 @is_key		tinyint=0,
		 @required		tinyint=0,
		 @readonly		tinyint=0,
		 @default		varchar(255) =NULL,
         @storage		varchar(32) =NULL,
		 @storage_field varchar(30) =NULL,
		 @property_group	varchar(10) =NULL,
		 @method_name		varchar(30)=null
		 )
  as		 
declare @class_id		int
declare @rc		int
declare @err_msg varchar(255)


 	if(	upper(@classname) = 'CLASS')
	  select @class_id=0
	else
	begin
      select @class_id=class_id from dbo.tng_class where name=@classname
	  if (@class_id is null)
	  begin
   	    select @err_msg='MSG:(90026) add_property_def: bad @classname: '+@classname
	    BEGIN PRINT 'Server: Msg '+cast(90026 as varchar)+', Level 16, State 1, Line 0'+char(13)+@err_msg; RAISERROR (90026, 16, 1); END;
        return
	  end
	end
    
	if( (@storage is not null) and (@storage_field is null) )
	begin  /*if no specify for @storage_field, @name is same as @storage_field*/
	   select @storage_field=lower(@name)
	end

	select @rc=-1
	exec dbo.tng_is_same_property  @classname =	@classname,
				   @name =	@name,
				   @datatype=@datatype,
				   @length=@length,
				   @is_key=@is_key,
				   @required=@required,
				   @instance_storage= @storage,
				   @storage_field =@storage_field,
				   @default_value=@default,
				   @rc=@rc OUTPUT
	if(@rc=0)
	   insert into dbo.tng_property_definition ( class_id,   name,  datatype, length, is_key, required, default_value, 
                                     instance_storage, storage_field, property_group, method_name, readonly, override)
			                     values ( @class_id, @name, @datatype, @length, @is_key, @required, @default, 
			                           @storage,  @storage_field,    @property_group, @method_name, @readonly,  1)
    if(@@error!=0)
	begin
	  select @err_msg='MSG:(90027) Failed to insert entry for property of class name: '+@classname
	  BEGIN PRINT 'Server: Msg '+cast(90027 as varchar)+', Level 16, State 1, Line 0'+char(13)+@err_msg; RAISERROR (90027, 16, 1); END;
	end
GO

GO
--SqlScripter----[dbo].[tng_add_sysobjid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_sysobjid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_sysobjid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_sysobjid    Script Date: 12/1/2005 11:49:42 PM ******/


ALTER PROCEDURE [dbo].[tng_add_sysobjid]
(@classname varchar(30), 
@sysobjid varchar(251) )
as  declare @class_id int

/*07/09/96 disable checking
select @class_id = null
select @class_id = class_id from tng_class where name = @classname
if @class_id is null begin
BEGIN PRINT 'Server: Msg '+cast(90025 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG:(90025) add_sysobjid: bad @classname'; RAISERROR (90025, 16, 1); END;
return
end
*/

insert into tng_sysobjid ( class_name, sysobjid  )
      values(@classname, @sysobjid )

	  return
GO

GO
--SqlScripter----[dbo].[tng_add_to_alarmset_entry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_add_to_alarmset_entry]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_add_to_alarmset_entry] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_add_to_alarmset_entry    Script Date: 12/1/2005 11:49:42 PM ******/

ALTER PROCEDURE [dbo].[tng_add_to_alarmset_entry]
(
	@alarmset_name          varchar(30),
         @status_no 	int,
         @severity	int,
	@propagate_status	tinyint=1
		 )
  as		 



   if( @alarmset_name='Workstation' or @alarmset_name='Unclassified_TCP')
     select @propagate_status=0

   insert into tng_alarmset_entry ( alarmset_name,  status_no,   severity, propagate_status)
			 values   (@alarmset_name, @status_no, @severity,@propagate_status)
GO

GO
--SqlScripter----[dbo].[tng_ca_add_subnet1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_add_subnet1]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_add_subnet1] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_add_subnet1    Script Date: 12/1/2005 11:50:15 PM ******/

ALTER PROCEDURE [dbo].[tng_ca_add_subnet1]
(   	@name           char(20),
	@subnet_addr    binary(4),
	@subnet_mask    binary(4),
	@gateway1       binary(4)=null,
	@gateway2       binary(4)=null,
	@managed        int = 1,
	@uuid1			UUID,
	@uuid2			UUID,
	@uuid3			UUID,
	@uuid4			UUID,
	@uuid5			UUID,
	@uuid6			UUID,
	@call_noniu	int = 1
)
as
declare @ipsubnet_id    int
declare @free_id        int
declare @start_ipaddr   binary(4)
declare @end_ipaddr     binary(4)
declare @objid          int
declare @time_stamp     datetime
declare @ipaddr_str1    char(15)
declare @subnet_addr_only binary(4)
declare @subnet_class_id 	int  
declare @uuid_bin 		UUID
declare @uuid_str 		varchar(36)
declare @network_class_id 	int
declare @network_uuid 		UUID
declare @hier_uuid 		UUID
declare @internet_uuid  UUID  /*03/20/96 The uuid of object Internet*/
declare @ManagedObjectRoot_uuid UUID
declare @IP_network_uuid UUID /*01/07/2004*/ /* ksk added this to get the IP_network uuid if the ip_subnet is present in tng_managedobject table but not in the inclusion*/

declare @network_class					char(1)
declare @network_class_addr_hex 		binary(4)
declare @network_class_addr_str 		varchar(15)
declare @network_mask 		binary(4)
declare @class_name 		varchar(30)
declare @hidden				tinyint
declare @propagate_status	tinyint
declare @label varchar(255)
declare @severity		int
declare @address_type		int
declare @autoarrange_type		int
declare @posted		tinyint
declare @acknowledge		tinyint
declare @msg varchar(255)


/* SW@002 Begin */
declare @subnetaddr     binary(4)
declare @subnetaddrstr  char(15)
declare @subnetmaskstr  char(15)
declare @gateway1str    char(15)
declare @gateway2str    char(15)
declare @managedstr     char(6)
/* SW@002 End */
declare @rerun int


set nocount on
select @rerun = 0

if (@call_noniu = 2)
  return

select @start_ipaddr = convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask))

select @end_ipaddr = convert(binary(4), convert(int,@subnet_addr) + 
~convert(int,@subnet_mask))

if (select count(*) from dbo.tng_discovery_ipsubnet where upper(name)=upper(@name)) > 0
	begin
		/*exec tng_senderror @errno=40040 */
		select @rerun = 1
	end

/*06/06/96
if (select count(*) from dbo.tng_discovery_ipsubnet) >= 4000
	begin
		exec tng_senderror @errno=40045 
		return
	end
*/

if (select count(*) from dbo.tng_discovery_ipsubnet where 
((
(convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask) & convert(int,subnet_mask))
)
>= 
convert(binary(4), convert(int,subnet_addr) & 
convert(int,subnet_mask)&convert(int,@subnet_mask)
) and
(convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask) & convert(int,subnet_mask))
)
<= convert(binary(4), (convert(int,subnet_addr) +
~(convert(int,subnet_mask) ) & convert(int,@subnet_mask))
)
)
OR

(
(
convert(binary(4), convert(int,@subnet_addr) + 
~(convert(int,@subnet_mask)&convert(int,@subnet_mask))
)
)
>= convert(binary(4), convert(int,subnet_addr) & 
convert(int,subnet_mask)&convert(int,@subnet_mask)
) and
(
convert(binary(4), convert(int,@subnet_addr) + 
~(convert(int,@subnet_mask)&convert(int,@subnet_mask))
)
)
<= convert(binary(4), (convert(int,subnet_addr) +
~(convert(int,subnet_mask))&convert(int,@subnet_mask))
)
)
)
) > 0
begin
/*exec tng_senderror @errno=40050*/
select @rerun = 1
end

begin transaction ca_add_subnet1


select @time_stamp = getdate()


/* SW@002 Begin */
select @subnetaddr = convert(binary(4), convert(int,@subnet_addr) & convert(int,@subnet_mask))

exec tng_iphex2str_nd @subnetaddr, @ipaddr_str = @subnetaddrstr OUTPUT
exec tng_iphex2str_nd @subnet_mask, @ipaddr_str = @subnetmaskstr OUTPUT
exec tng_iphex2str_nd @gateway1, @ipaddr_str = @gateway1str OUTPUT
exec tng_iphex2str_nd @gateway2, @ipaddr_str = @gateway2str OUTPUT
if @managed = 1
select @managedstr = 'Yes'
else
select @managedstr = 'No'
/* SW@002 End */

begin transaction addip

if( @gateway1 is not null)
begin
if (@rerun <> 1)
insert dbo.tng_discovery_ipsubnet ( name, subnet_addr, subnet_mask, gateway1, gateway2,
			    managed, time_stamp, subnet_addr_str, subnet_mask_str,
			    gateway1_str, gateway2_str, managed_str, computer_name,
			    instance_no  ) 
values ( @name, @subnetaddr, @subnet_mask, @gateway1, @gateway2,
	 @managed, @time_stamp, @subnetaddrstr, @subnetmaskstr,
	 @gateway1str, @gateway2str, @managedstr, null, 
	 0 )
end

commit transaction addip 


/* add a segment object for the subnet added */
select @subnet_addr_only = convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask))

/*3/20/96 initialize @network_uuid, @internet_uuid*/
select @network_uuid=null, @internet_uuid=null

if ( @call_noniu = 1 )  
begin
exec dbo.tng_get_network_class @subnet_addr=@subnet_addr, 
							@subnet_mask=@subnet_mask,
							@network_class =@network_class  OUTPUT,
							@network_class_addr_hex=@network_class_addr_hex OUTPUT,
							@network_class_addr_str =@network_class_addr_str OUTPUT

  if not exists (select * from dbo.tng_managedobject where ip_address_hex = @subnet_addr_only) 
  begin
	select @ipaddr_str1 =                                   /* SW@002 */
	ltrim(str(convert(int,substring(@subnet_addr_only, 1, 1)))) + '.' +
	ltrim(str(convert(int,substring(@subnet_addr_only, 2, 1)))) + '.' +
	ltrim(str(convert(int,substring(@subnet_addr_only, 3, 1)))) + '.' +
	ltrim(str(convert(int,substring(@subnet_addr_only, 4, 1)))) 

/*	select @subnet_class_id = class_id from tng_class where upper(name) = 'IP_SUBNET' */

	

	if(@network_class='A' or @network_class='B' or @network_class='C')
	  if( not exists (select * from tng_managedobject where name=@network_class_addr_str and class_name='IP_Network'))
	  begin
	    if(	@network_class='A')
		  select @network_mask=0xff000000
		if(	@network_class='B')
		  select @network_mask=0xffff0000
		if(	@network_class='C')
		  select @network_mask=0xffffff00

		 select @hidden=1,@propagate_status=1,@address_type=1,@autoarrange_type=1,@severity=1,@posted=1,@acknowledge=1
		  exec dbo.tng_get_class_ilp @class_name='IP_Network',
						 @hidden=@hidden OUTPUT,
						 @propagate_status=@propagate_status OUTPUT,
						 @address_type=@address_type OUTPUT,
					     @autoarrange_type=@autoarrange_type OUTPUT,
					     @severity=@severity OUTPUT,
					     @posted=@posted OUTPUT,
					     @acknowledge=@acknowledge	OUTPUT
		
	    begin transaction addnetwork
		 
		  /*03/20/96 create object of Internet as parent of all IP_Network object*/
		  select @internet_uuid=null
		  select @internet_uuid=uuid from tng_managedobject 
				where class_name='Network' and name='TCP/IP Network' and label='TCP/IP Network'

		  if(@internet_uuid is null) 
		  begin /*The object of Internet not exist*/
			begin transaction add_internet_obj
			  select @internet_uuid=@uuid1

			  exec dbo.tng_add_managedobject @uuid=@internet_uuid,
	  						 @name='TCP/IP Network',
							 @label='TCP/IP Network',
							 
							 @class_name='Network',
							
							 @hidden=0,
							 @propagate_status=1,
							 @status_no=0,
							 @severity=0 ,
					         @posted=0 ,
					         @acknowledge=0,
							 @autoarrange_type=@autoarrange_type,
							 
							 @date_ins=@time_stamp,
							 @date_modify=@time_stamp


			commit transaction add_internet_obj

			/*****03/22/96 create ManagedObjectRoot(toppest level) object of class:ManagedObjectRoot******/
			select @ManagedObjectRoot_uuid=0x8809f8f5ca81cf11b4370020af03cf7c /*This is Fixed uuid to all Repository*/
			/*3/22/96 create inclusion between ManagedObjectRoot object of ManagedObjectRoot and the object of Network*/
			select @hier_uuid=@uuid2

	        begin transaction add_inclusion4
	          INSERT INTO dbo.tng_inclusion ( uuid, parent_class, parent_uuid, child_class, child_uuid )
	           VALUES ( @hier_uuid, 'ManagedObjectRoot', @ManagedObjectRoot_uuid, 'Network', @internet_uuid )
	        commit transaction add_inclusion4
	   end /*If it is a valid network class*/
		commit transaction addnetwork
	end /* Check to see if network class exists*/
     end /*to check if we should create a network class*/
     	
	if not exists (select * from dbo.tng_managedobject where name = @network_class_addr_str and class_name = 'IP_Network') 
	begin
	  select @network_uuid=@uuid3
	  select @internet_uuid=uuid from tng_managedobject where name='TCP/IP Network' and class_name='Network'

		print 'The value of @network_class_addr_str' + @network_class_addr_str
		print @network_uuid
	      exec dbo.tng_add_managedobject @uuid=@network_uuid,
	  						 @name=@network_class_addr_str,
							 @label=@network_class_addr_str,
							 @address=@network_class_addr_str,
							 @class_name='IP_Network',
							
							 @hidden=0,
							 @propagate_status=1,
							 @status_no=0,
							 @severity=0 ,
					         @posted=0 ,
					         @acknowledge=0,
							 @autoarrange_type=@autoarrange_type,
							 @ip_address_hex=@network_class_addr_hex,
							 @subnet_mask=@network_mask,
							 @date_ins=@time_stamp,
							 @date_modify=@time_stamp

	     

		/*3/20/96 create inclusion between Internet object of Network and the object of IP_Network*/
		select @hier_uuid=@uuid4


	    begin transaction add_inclusion0
	    INSERT INTO dbo.tng_inclusion ( uuid, parent_class, parent_uuid, child_class, child_uuid )
	    VALUES ( @hier_uuid, 'Network', @internet_uuid, 'IP_Network', @network_uuid )
	    commit transaction add_inclusion0



	  end /* End of creating ip_Network*/
	/* get uuid from the extend procedure */
	select @uuid_bin=@uuid5

	begin transaction addsubnet
	  if(@network_class='R')
	    select @class_name='Unclassified_Class'
	  else select @class_name='IP_Subnet'
	  select @label=@name
	  if((@network_class='B') and ((convert(int,0x000000ff) & convert(int,@subnet_mask)) =0) )
	  begin
/*1/24/96
		select @label =	ltrim(str(convert(int,substring(@subnet_addr_only, 1, 1)))) + '.' +
						ltrim(str(convert(int,substring(@subnet_addr_only, 2, 1)))) + '.' +
						ltrim(str(convert(int,substring(@subnet_addr_only, 3, 1)))) + '.'
*/
        select @label =	ltrim(str(convert(int,substring(@subnet_addr_only, 3, 1)))) 
	  end
	
	  select @hidden=1,@propagate_status=1,@address_type=1,@autoarrange_type=1,@severity=1,@posted=1,@acknowledge=1
		  exec dbo.tng_get_class_ilp @class_name=@class_name,
						 @hidden=@hidden OUTPUT,
						 @propagate_status=@propagate_status OUTPUT,
						 @address_type=@address_type OUTPUT,
					     @autoarrange_type=@autoarrange_type OUTPUT,
					     @severity=@severity OUTPUT,
					     @posted=@posted OUTPUT,
					     @acknowledge=@acknowledge	OUTPUT
/* check if the ip_Subnet is present*/
	if not exists (select * from tng_managedobject where name = @name and class_name = @class_name) 
	  begin
		exec dbo.tng_add_managedobject @uuid=@uuid_bin,
	  						 @name=@name,
							 @label=@label,
							 @address=@ipaddr_str1,
							 @class_name=@class_name,
							
							 @hidden=@hidden,
							 @propagate_status=@propagate_status,
							 @status_no=10,
							 @address_type=@address_type ,
					         @autoarrange_type=@autoarrange_type ,
					         @severity=@severity ,
					         @posted=@posted ,
					         @acknowledge=@acknowledge,

							 @ip_address_hex=@subnet_addr_only,
							 @subnet_mask=@subnet_mask,
							 @date_ins=@time_stamp,
							 @date_modify=@time_stamp

          /*  2/17/2000 */
		  insert into dbo.tng_ip_subnet(uuid) values (@uuid_bin)

	/* 11/01/00 rmcs now updating field in fillsql.exe */
    /*    update mdbtng_discovery_status set new_subnet=new_subnet+1 */
		
	

	/* after insert the object add the hierarchy relationship */

/*	select @network_class_id = class_id from tng_class where upper(name) = 'IP_NETWORK' */
    if(@network_class != 'R' )
	begin
	  if(@network_uuid is null)  
	    select @network_uuid = uuid from dbo.tng_managedobject where upper(class_name) = 'IP_NETWORK' and name=@network_class_addr_str
	  
	  if( @network_uuid is not null)
	  begin
		  
		select @hier_uuid=@uuid6

	    begin transaction addinclusion1
	    INSERT INTO dbo.tng_inclusion ( uuid, parent_class, parent_uuid, child_class, child_uuid )
	    VALUES ( @hier_uuid, 'IP_Network', @network_uuid, 'IP_Subnet', @uuid_bin )
	    commit transaction addinclusion1
	  end
	  else
	  begin
	    /*3/20/96 if there is no parent for IP_Subnet, get uuid of object 'TCP/IP Network' as its parent*/
		if(@internet_uuid is null)  
	      select @internet_uuid = uuid from dbo.tng_managedobject 
		    where upper(class_name) = 'NETWORK' and name='TCP/IP Network' and label='TCP/IP Network'

		if(@internet_uuid is null)
		begin
          select @msg='MSG(99991):(call in ca_add_ipsubnet) can not create hierarchy for IP_Subnet: '+@name+' because  object of Internet not exists!'
          print @msg
		end
		else
		begin
		  select @hier_uuid=@uuid6

	      begin transaction addinclusion2
	        INSERT INTO dbo.tng_inclusion ( uuid, parent_class, parent_uuid, child_class, child_uuid )
	           VALUES ( @hier_uuid, 'Network', @internet_uuid, 'IP_Subnet', @uuid_bin )
	      commit transaction addinclusion2
		end
	  end
	end
     end  /*End of the if the ip_subnet is present in tng_managedobject table*/
     else /* if ip_Subnet is present in tng_managedobject table then check if it has inclusions*/
	begin
		print @name
		print @network_class_addr_str
		select @IP_network_uuid = uuid from dbo.tng_managedobject where name = @network_class_addr_str and class_name = 'IP_Network'
		select @uuid_bin = uuid  from dbo.tng_managedobject where name = @name and class_name = 'IP_Subnet'
		if not exists (select * from tng_inclusion where parent_class = 'IP_Network' and child_class = 'IP_Subnet' and parent_uuid = @IP_network_uuid and child_uuid = @uuid_bin)
		 Begin
			print  @uuid_bin
			begin transaction addinclusion3
				INSERT INTO dbo.tng_inclusion ( uuid, parent_class, parent_uuid, child_class, child_uuid )
	    			VALUES ( @uuid3, 'IP_Network', @IP_network_uuid, 'IP_Subnet', @uuid_bin )
					if @@error <> 0
					  Begin
						print 'Error creating inclusions'
					  end
					else						
						commit transaction addinclusion3
		end
	end	
	commit transaction addsubnet 
end

commit transaction ca_add_subnet1
GO

GO
--SqlScripter----[dbo].[tng_ca_add_subnet2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_add_subnet2]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_add_subnet2] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_add_subnet2    Script Date: 12/1/2005 11:49:42 PM ******/




ALTER PROCEDURE [dbo].[tng_ca_add_subnet2]
(   	@name           char(20),
	@subnet_addr    binary(4),
	@subnet_mask    binary(4),
	@gateway1       binary(4)=null,
	@gateway2       binary(4)=null,
	@managed        int = 1
)
as
declare @start_ipaddr   binary(4)
declare @end_ipaddr     binary(4)
declare @time_stamp     datetime

/* SW@002 Begin */
declare @subnetaddr     binary(4)
declare @subnetaddrstr  char(15)
declare @subnetmaskstr  char(15)
declare @gateway1str    char(15)
declare @gateway2str    char(15)
declare @managedstr     char(6)
/* SW@002 End */


set nocount on

select @start_ipaddr = convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask))

select @end_ipaddr = convert(binary(4), convert(int,@subnet_addr) + 
~convert(int,@subnet_mask))

/*09/09/98
if (select count(*) from tng_discovery_ipsubnet where upper(name)=upper(@name)) > 0
	begin
		exec tng_senderror @errno=40040
		return
	end
*/

/*06/06/96
if (select count(*) from tng_discovery_ipsubnet) >= 4000
	begin
		exec tng_senderror @errno=40045
		return
	end
*/

/*09/09/98
if (select count(*) from tng_discovery_ipsubnet where 
((
(convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask) & convert(int,subnet_mask))
)
>= 
convert(binary(4), convert(int,subnet_addr) & 
convert(int,subnet_mask)&convert(int,@subnet_mask)
) and
(convert(binary(4), convert(int,@subnet_addr) & 
convert(int,@subnet_mask) & convert(int,subnet_mask))
)
<= convert(binary(4), (convert(int,subnet_addr) +
~(convert(int,subnet_mask) ) & convert(int,@subnet_mask))
)
)
OR

(
(
convert(binary(4), convert(int,@subnet_addr) + 
~(convert(int,@subnet_mask)&convert(int,@subnet_mask))
)
)
>= convert(binary(4), convert(int,subnet_addr) & 
convert(int,subnet_mask)&convert(int,@subnet_mask)
) and
(
convert(binary(4), convert(int,@subnet_addr) + 
~(convert(int,@subnet_mask)&convert(int,@subnet_mask))
)
)
<= convert(binary(4), (convert(int,subnet_addr) +
~(convert(int,subnet_mask))&convert(int,@subnet_mask))
)
)
)
) > 0
begin
exec tng_senderror @errno=40050
return
end
*/

select @time_stamp = getdate()


/* SW@002 Begin */
select @subnetaddr = convert(binary(4), convert(int,@subnet_addr) & convert(int,@subnet_mask))

exec tng_iphex2str_nd @subnetaddr, @ipaddr_str = @subnetaddrstr OUTPUT
exec tng_iphex2str_nd @subnet_mask, @ipaddr_str = @subnetmaskstr OUTPUT
exec tng_iphex2str_nd @gateway1, @ipaddr_str = @gateway1str OUTPUT
exec tng_iphex2str_nd @gateway2, @ipaddr_str = @gateway2str OUTPUT
if @managed = 1
select @managedstr = 'Yes'
else
select @managedstr = 'No'
/* SW@002 End */

begin transaction addip

insert tng_discovery_ipsubnet ( name, subnet_addr, subnet_mask, gateway1, gateway2,
			    managed, time_stamp, subnet_addr_str, subnet_mask_str,
			    gateway1_str, gateway2_str, managed_str, computer_name,
			    instance_no  ) 
values ( @name, @subnetaddr, @subnet_mask, @gateway1, @gateway2,
	 @managed, @time_stamp, @subnetaddrstr, @subnetmaskstr,
	 @gateway1str, @gateway2str, @managedstr, null, 
	 0 )


commit transaction addip
GO

GO
--SqlScripter----[dbo].[tng_ca_claim_discovery].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_claim_discovery]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_claim_discovery] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_claim_discovery    Script Date: 12/1/2005 11:49:42 PM ******/

ALTER PROCEDURE [dbo].[tng_ca_claim_discovery]
AS
declare @process_no int

	set nocount on
	select @process_no = count(*) from master.dbo.sysprocesses 
	    where program_name = 'dscvrbe'
	if @process_no > 1
		select 1
	else
		begin		/* cleanup ipsubnet and status */
			update tng_discovery_ipsubnet set instance_no = 0
			update tng_discovery_status set  curr_total_devices = 0,
				new_tcpip=0, new_subnet=0, new_managedobject=0,
				init_time = getdate(), curr_new_devices = 0  
			select 0
		end
GO

GO
--SqlScripter----[dbo].[tng_ca_devices_under_subnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_devices_under_subnet]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_devices_under_subnet] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_devices_under_subnet    Script Date: 12/1/2005 11:49:43 PM ******/



/*  Ameya 1/02/04 Procedure for getting all devices under a subnet */
ALTER PROCEDURE [dbo].[tng_ca_devices_under_subnet]
@in_address varchar(32) 
AS 

/*  Get the subnet address and subnet mask for this subnet from the COR */
DECLARE @vsubnet_addr binary(4)
DECLARE @vsubnet_mask binary(4)


SELECT @vsubnet_addr= ip_address_hex, @vsubnet_mask=subnet_mask 
from tng_managedobject
where class_name='IP_Subnet'
and address=@in_address

/*  For bitwise operations, we need one operand as int. so we first convert the binary values as ints */
DECLARE @i_vsubnet_addr int
SELECT @i_vsubnet_addr= @vsubnet_addr | 0

DECLARE @i_vsubnet_mask int
SELECT @i_vsubnet_mask = @vsubnet_mask | 0 

/*  T find the first IP address on this subnet */
DECLARE @b_firstIP binary(4) 
SELECT  @b_firstIP = @i_vsubnet_addr & @i_vsubnet_mask

/*  To find the last IP address on this subnet */
DECLARE @not_i_vsubnet_mask int
SELECT @not_i_vsubnet_mask = ~@i_vsubnet_mask

DECLARE @i_vendIP binary(4)
SELECT @i_vendIP = @i_vsubnet_addr | @not_i_vsubnet_mask

/*  Output these values */
/*  Uncomment this line to print out the values */
/*  SELECT ip_address_hex = @vsubnet_addr, subnet_mask = @vsubnet_mask, startIP = @b_firstIP, endIP = @i_vendIP*/

/*  Now SELECT all the devices that fall within this range */
SELECT uuid, name, label, address, class_name, status_no, severity, ip_address_hex, mac_address, subnet_mask, date_ins, 
date_modify, propagated_sev, propagated_status_no  from tng_managedobject
where ip_address_hex between @b_firstIP and  @i_vendIP
and class_name in (SELECT name COLLATE Modern_Spanish_CS_AS_KS_WS from tng_class
		where super_class_name in ('Host','Workstation','Unclassified_Class')
		)
GO

GO
--SqlScripter----[dbo].[tng_ca_update_discovery_setup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_update_discovery_setup]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_update_discovery_setup] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_update_discovery_setup    Script Date: 12/1/2005 11:49:43 PM ******/


ALTER PROCEDURE [dbo].[tng_ca_update_discovery_setup]
(@start_time datetime = null, 
@frequency int= 0, 
@mask int = 0
)
as  set nocount on
declare @dev_mask int
declare @s_time   datetime

if ( @start_time is not null )
	select @s_time = @start_time
else 
	select @s_time = getdate()

update tng_discovery_setup set start_time = @s_time, frequency = @frequency
GO

GO
--SqlScripter----[dbo].[tng_ca_update_discovery_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ca_update_discovery_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ca_update_discovery_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ca_update_discovery_status    Script Date: 12/1/2005 11:49:43 PM ******/

ALTER PROCEDURE [dbo].[tng_ca_update_discovery_status]
(@curr_status int,
@start_time datetime = null, 
@cycle_time int= null, 
@type int = 0
)
as
	set nocount on
	if( @type = 1 )
	begin
		update tng_discovery_status 
			set current_status = @curr_status,
		start_time= getdate()
	end                                           
	else if ( @type = 2 )                                             
		update tng_discovery_status 
			set current_status = @curr_status,
			    cycle_time = @cycle_time
	else                                 
		update tng_discovery_status 
			set current_status = @curr_status
GO

GO
--SqlScripter----[dbo].[tng_clean_change_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_clean_change_history]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_clean_change_history] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_clean_change_history    Script Date: 12/1/2005 11:49:43 PM ******/

ALTER PROCEDURE [dbo].[tng_clean_change_history]
AS
set nocount on
declare @rowcount int
declare @deletecount int
Begin

  select @rowcount = count(*) from tng_change_history
  
  if ( @rowcount <= 1000000 ) 
    return
    

	select @deletecount = @rowcount - 1000000	
	
/* Delete in chunks of 10,000 records */
	if (@deletecount < 10000)
		select @deletecount = 10000		

/* set the rowcount to less than 1000000*/

	set rowcount @deletecount
	delete from tng_change_history 


/* reset the count to all rows*/
 set rowcount 0

  return
END
GO

GO
--SqlScripter----[dbo].[tng_clean_prop_status_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_clean_prop_status_history]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_clean_prop_status_history] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_clean_prop_status_history    Script Date: 12/1/2005 11:49:43 PM ******/

ALTER PROCEDURE [dbo].[tng_clean_prop_status_history]
AS
set nocount on
declare @rowcount int
declare @deletecount int
Begin

  select @rowcount = count(*) from tng_prop_status_history
  
  if ( @rowcount <= 1000000 ) 
    return
  

	select @deletecount = @rowcount - 1000000

/* Delete in chunks of 10,000 records */
	if (@deletecount < 10000)
		select @deletecount = 10000
	
	set rowcount @deletecount
	  /*delete prior entries once the row count reaches 1000000*/
	  delete from tng_prop_status_history

 set rowcount 0
 
 return
END
GO

GO
--SqlScripter----[dbo].[tng_clean_status_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_clean_status_history]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_clean_status_history] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_clean_status_history    Script Date: 12/1/2005 11:49:43 PM ******/



ALTER PROCEDURE [dbo].[tng_clean_status_history]
AS
set nocount on
declare @rowcount int
declare @deletecount int
Begin
  select @rowcount = count(*) from tng_status_history
  
  if ( @rowcount <= 1000000 ) 
    	return
  

	select @deletecount = @rowcount - 1000000	

/* Delete in chunks of 10,000 records */
	if (@deletecount < 10000)
		select @deletecount = 10000

	set rowcount @deletecount
	  /*delete prior entries once the row count reaches 10,0000*/
	  delete from tng_status_history 

	set rowcount 0
end
GO

GO
--SqlScripter----[dbo].[tng_del_uncls_w_name_option_ip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_del_uncls_w_name_option_ip]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_del_uncls_w_name_option_ip] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_del_uncls_w_name_option_ip    Script Date: 12/1/2005 11:49:43 PM ******/

ALTER PROCEDURE [dbo].[tng_del_uncls_w_name_option_ip]
(
		@name				varchar(255),
		@ipaddr_str			varchar(16),
		@bDelUnclassifyObj		int=0
		 )
as set nocount on 			 
declare  @del_count int, @del_uuid UUID


  select @del_uuid=null

  if(@bDelUnclassifyObj<>0)
    select @del_count=count(*) from tng_managedobject 
      where class_name='Unclassified_TCP' and address=@ipaddr_str
  else
    select @del_count=count(*) from tng_managedobject 
      where class_name='Unclassified_TCP' and name=@name and address=@ipaddr_str

/*roger 09/20/96*/
  if(@del_count<>0 and @bDelUnclassifyObj<>0)
  begin
    begin transaction del_unclassified_TCP_obj

      delete from tng_unclassified_tcp
	where uuid in (select uuid from tng_managedobject 
                     where class_name='Unclassified_TCP' and address=@ipaddr_str
                      )
      delete from tng_managedobject
	    where uuid in (select uuid from tng_managedobject 
                      where class_name='Unclassified_TCP' and address=@ipaddr_str
                      )

    commit transaction del_unclassified_TCP_obj
  end
  else
  if(@del_count<>0 and @bDelUnclassifyObj=0)
  begin
	begin transaction del_unclassified_TCP_obj1

      delete from tng_unclassified_tcp
	where uuid in (select uuid from tng_managedobject 
         where class_name='Unclassified_TCP' and name=@name and address=@ipaddr_str
                      )
      delete from tng_managedobject
	    where uuid in (select uuid from tng_managedobject 
            where class_name='Unclassified_TCP' and name=@name and address=@ipaddr_str
                      )

    commit transaction del_unclassified_TCP_obj1
  end



  select @del_count  
  return
GO

GO
--SqlScripter----[dbo].[tng_DelUncls_IpDiffName_UptClsIp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_DelUncls_IpDiffName_UptClsIp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_DelUncls_IpDiffName_UptClsIp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_DelUncls_IpDiffName_UptClsIp    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_DelUncls_IpDiffName_UptClsIp]
(
					@class_name  varchar(30),
					@name        varchar(255),
					@address	 varchar(255),
					@bDelUnclassifyObj int=0,
					@bUpdateClassifyObj int=0,
					@bIsInDHCPRange		int=0
		 )
as set nocount on 			 
declare  @del_count int, @del_uuid UUID


  
  
  select @del_count=count(*) from tng_managedobject 
      where class_name=@class_name and address=@address and name<>@name



  if(@bDelUnclassifyObj<>0 and @del_count<>0)
  begin
    begin transaction del_unclassified_TCP_obj

      delete from tng_unclassified_tcp
	where uuid in (select uuid from tng_managedobject 
                         where class_name=@class_name and address=@address and name<>@name
                      )
      delete from tng_managedobject
	        where uuid in (select uuid from tng_managedobject 
                         where class_name=@class_name and address=@address and name<>@name
                      )

    commit transaction del_unclassified_TCP_obj
  
    
  end

  if(@bUpdateClassifyObj<>0 and @bUpdateClassifyObj<>0)
  begin
    begin transaction update_cls_obj_invalid_dhcp

      update  tng_managedobject set status_no=23
	    where (class_name<>'Unclassified_TCP' and class_name<>@class_name and address=@address and status_no<>23) or
		      (	name<>@name and class_name=@class_name and address=@address and status_no<>23)
        

    commit transaction update_cls_obj_invalid_dhcp
  
    
  end

  select @del_count  
  return
GO

GO
--SqlScripter----[dbo].[tng_discovery_get_community].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_discovery_get_community]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_discovery_get_community] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_discovery_get_community    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_discovery_get_community]
AS  set nocount on
select  tng_auth.name,tng_auth.mask  from   tng_auth
where   tng_auth.access = 'G'
GO

GO
--SqlScripter----[dbo].[tng_discovery_get_drg_swtypes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_discovery_get_drg_swtypes]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_discovery_get_drg_swtypes] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_discovery_get_drg_swtypes    Script Date: 12/1/2005 11:49:12 PM ******/

ALTER PROCEDURE [dbo].[tng_discovery_get_drg_swtypes]
AS  

return
GO

GO
--SqlScripter----[dbo].[tng_discovery_get_ip_subnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_discovery_get_ip_subnet]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_discovery_get_ip_subnet] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_discovery_get_ip_subnet    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_discovery_get_ip_subnet]
( @instance_no int = null,
  @computer_name varchar(25) = null,
  @nonew int = 0 )	
as  set nocount on
if @instance_no = null or @instance_no = 0
begin
	select subnet_addr, subnet_mask, gateway1, gateway2 
	from  tng_discovery_ipsubnet
	where  managed = 1 order by time_stamp desc
end
else
begin
declare @tid int
declare @init_time datetime
	select @tid = 0
	if (@nonew = 0) or (@nonew = null)
        begin
	  if exists (select * from tng_discovery_ipsubnet where managed = 1 
	 	and instance_no = @instance_no and (computer_name = null
		or computer_name = @computer_name) )  
		select @tid = max(discovery_ipsubnet_id) from tng_discovery_ipsubnet where  managed = 1  
		and instance_no = @instance_no
	  else	
	    begin
		select @tid = max(discovery_ipsubnet_id) from tng_discovery_ipsubnet where  managed = 1  
		and ( instance_no = 0 or instance_no = null )

		update tng_discovery_ipsubnet set instance_no = @instance_no,
		computer_name = @computer_name
		where discovery_ipsubnet_id = @tid
	    end
	end
	else
	begin
	  select @init_time=init_time from tng_discovery_status
	  if exists (select * from tng_discovery_ipsubnet where managed = 1 
		and instance_no = @instance_no and (computer_name = null
		or computer_name = @computer_name) and time_stamp <= @init_time)  
		select @tid = max(discovery_ipsubnet_id) from tng_discovery_ipsubnet where  managed = 1  
		and instance_no = @instance_no and time_stamp <= @init_time
	  else	
	    begin
		select @tid = max(discovery_ipsubnet_id) from tng_discovery_ipsubnet where  managed = 1  
		and ( instance_no = 0 or instance_no = null ) and time_stamp <= @init_time

		update tng_discovery_ipsubnet set instance_no = @instance_no,
		computer_name = @computer_name
		where discovery_ipsubnet_id = @tid
	    end
	end

	select  subnet_addr, subnet_mask, gateway1, gateway2 
	from  tng_discovery_ipsubnet
	where discovery_ipsubnet_id = @tid

end
GO

GO
--SqlScripter----[dbo].[tng_discovery_get_lookup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_discovery_get_lookup]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_discovery_get_lookup] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_discovery_get_lookup    Script Date: 12/1/2005 11:50:12 PM ******/

ALTER PROCEDURE [dbo].[tng_discovery_get_lookup]
AS  set nocount on

select 'class_name' = tng_class.name, 'description' = tng_class.name, 'super_class_name'=super_class_name, 
	'a1gProductType' = null, 'add_ipcount' = 1, 'f_a1supv' = 0,
	'sysobjid' = tng_sysobjid.sysobjid, 'san' = tng_class_ext.string from 
	(tng_class left join tng_class_ext on tng_class_ext.name = 'SAN' and 
	tng_class_ext.class_id = tng_class.class_id), 
	tng_sysobjid where tng_sysobjid.class_name COLLATE Modern_Spanish_CS_AS_KS_WS = tng_class.name
GO

GO
--SqlScripter----[dbo].[tng_discovery_get_setup_date].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_discovery_get_setup_date]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_discovery_get_setup_date] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_discovery_get_setup_date    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_discovery_get_setup_date]
AS  set nocount on
select   datepart(year,start_time), datepart(month,start_time),
datepart(day,start_time), datepart(hour,start_time),
datepart(minute,start_time), datepart(second,start_time)
from tng_discovery_setup
GO

GO
--SqlScripter----[dbo].[tng_get_class_ilp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_class_ilp]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_class_ilp] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_class_ilp    Script Date: 12/1/2005 11:50:12 PM ******/

ALTER PROCEDURE [dbo].[tng_get_class_ilp]
(
					@class_name			varchar(30),
					@hidden		tinyint=null OUTPUT,
					@propagate_status	tinyint=null OUTPUT	,
					@address_type  int=null OUTPUT,
					@autoarrange_type	int=null OUTPUT	,
					@severity			int=null OUTPUT	,
					@posted			tinyint=null OUTPUT	,
					@alarmset_name	varchar(30)=null OUTPUT	,
					@acknowledge			tinyint=null OUTPUT	,
					@override_imagelarge	varchar(64)=null OUTPUT,
					@override_imagesmall	varchar(64)=null OUTPUT,	
					@override_imagedecal	varchar(64)=null OUTPUT,	
					@override_imagetintbool	tinyint=null OUTPUT	,
					@override_model			varchar(64)=null OUTPUT,	
					@background_image	varchar(64)=null OUTPUT	
					)
as	set nocount on 	

declare @super_classname varchar(30), @msg varchar(255)
declare @prodef_id int
 
 if( not exists (select * from tng_class where name=@class_name))
 begin
   select @msg='(MSG:90033)The class '+@class_name+' not exist.'
   print @msg
   return
 end
    
 if(@hidden is not null)
 begin
   select @hidden=null, @prodef_id=null     
   select @super_classname=@class_name
   while(2>1)
   begin
	  
     select @hidden=convert(tinyint, default_value), @prodef_id=id 
        from tng_property_definition 
        where name='hidden' and class_id= (select class_id from tng_class where name=@super_classname)
	
	 if(@prodef_id is not null)
    	   goto get_propagation

     
     select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	 if(@super_classname is null or @super_classname='Class')
	 begin
	   /*raiserror ('MSG(90016): Bad  @class_name=%s for hidden value.', 16, -1, @class_name ) */
	   goto get_propagation
     end 
   end
 end

get_propagation:
  if(@propagate_status is not null)
  begin
    select @propagate_status=null, @prodef_id=null     
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @propagate_status=convert(tinyint, default_value) , @prodef_id=id 
        from tng_property_definition 
        where name='propagate_status' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_address_type

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for propagate_status value.', 16, -1, @class_name )*/
	    goto get_address_type
      end 
    end
  end

get_address_type:
  if(@address_type is not null)
  begin
    select @address_type=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @address_type=convert(int, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='address_type' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_autoarrange_type

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for address_type value.', 16, -1, @class_name )*/
	    goto get_autoarrange_type
      end 
    end
  end
    
get_autoarrange_type:
  if(@autoarrange_type is not null)
  begin
    select @autoarrange_type=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @autoarrange_type=convert(int, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='autoarrange_type' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_severity

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for autoarrange_type value.', 16, -1, @class_name )*/
	    goto get_severity
      end 
    end
  end

    
get_severity:
  if(@severity is not null)
  begin
    select @severity=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @severity=convert(int, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='severity' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_posted

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for severity value.', 16, -1, @class_name )*/
	    goto get_posted
      end 
    end
  end
    
get_posted:
  if(@posted is not null)
  begin
    select @posted=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @posted=convert(tinyint, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='posted' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_acknowledge

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for posted value.', 16, -1, @class_name )*/
	    goto get_acknowledge
      end 
    end
  end
    
get_acknowledge:
  if(@acknowledge is not null)
  begin
    select @acknowledge=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @acknowledge=convert(tinyint, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='acknowledge' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_alarmset_name

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for acknowledge value.', 16, -1, @class_name )*/
	    goto get_alarmset_name
      end 
    end
  end
    
get_alarmset_name:
  if(@alarmset_name is not null)
  begin
    select @alarmset_name=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @alarmset_name=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='alarmset_name' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_override_imagelarge

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for alarmset_name value.', 16, -1, @class_name )*/
	    goto get_override_imagelarge
      end 
    end
  end
    
    
get_override_imagelarge:
  if(@override_imagelarge is not null)
  begin
    select @override_imagelarge=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @override_imagelarge=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='override_imagelarge' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_override_imagesmall

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for background_image value.', 16, -1, @class_name )*/
	    goto get_override_imagesmall
      end 
    end
  end

get_override_imagesmall:
  if(@override_imagesmall is not null)
  begin
    select @override_imagesmall=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @override_imagesmall=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='override_imagesmall' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_override_imagedecal

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for background_image value.', 16, -1, @class_name )*/
	    goto get_override_imagedecal
      end 
    end
  end


get_override_imagedecal:
  if(@override_imagedecal is not null)
  begin
    select @override_imagedecal=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @override_imagedecal=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='override_imagedecal' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_override_imagetintbool

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for background_image value.', 16, -1, @class_name )*/
	    goto get_override_imagetintbool
      end 
    end
  end

get_override_imagetintbool:
  if(@override_imagetintbool is not null)
  begin
    select @override_imagetintbool=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @override_imagetintbool=convert(tinyint, default_value) , @prodef_id=id  
        from tng_property_definition 
        where name='override_imagetintbool' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_override_model

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for posted value.', 16, -1, @class_name )*/
	    goto get_override_model
      end 
    end
  end


get_override_model:
  if(@override_model is not null)
  begin
    select @override_model=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @override_model=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='override_model' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    goto get_background_image

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for background_image value.', 16, -1, @class_name )*/
	    goto get_background_image
      end 
    end
  end


get_background_image:
  if(@background_image is not null)
  begin
    select @background_image=null  , @prodef_id=null
    select @super_classname=@class_name
    while(2>1)
    begin
     
      select @background_image=default_value , @prodef_id=id  
        from tng_property_definition 
        where name='background_image' and class_id= (select class_id from tng_class where name=@super_classname)
	
	  if(@prodef_id is not null)
	    return

     
      select @super_classname = super_class_name
        from tng_class 
        where name=@super_classname 
	 
	  if(@super_classname is null or @super_classname='Class')
	  begin
	    /*raiserror ('MSG(90017): Bad  @class_name=%s for background_image value.', 16, -1, @class_name )*/
	    return 
      end 
    end
  end


  return
GO

GO
--SqlScripter----[dbo].[tng_get_IF_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_IF_uuid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_IF_uuid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_IF_uuid    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_get_IF_uuid]
(
        
		@parent_uuid		UUID,
        @ifnum				int
	
		 )
as		 
declare  @msg varchar(255)
/*it may return multiple rows*/
declare @status_no int
 
 select child_uuid from tng_inclusion t1, tng_ip_interface t2
   where t1.child_class='IP_Interface' and t1.parent_uuid=@parent_uuid and 
         t2.interface_no=@ifnum and t1.child_uuid=t2.uuid

 return
GO

GO
--SqlScripter----[dbo].[tng_get_network_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_network_class]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_network_class] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_network_class    Script Date: 12/1/2005 11:49:13 PM ******/

ALTER PROCEDURE [dbo].[tng_get_network_class]
( 
				   @subnet_addr	binary(4),
				   @subnet_mask binary(4),
				   @network_class char(1)=null OUTPUT,
				   @network_class_addr_hex binary(4)=null OUTPUT,
				   @network_class_addr_str varchar(15)=null OUTPUT
				)
as 	set nocount on 	

declare @subnet_1st_octet int 
declare	@network_addr_only binary(4)

	select @network_addr_only=convert(binary(4), convert(int, @subnet_addr )&convert(int, @subnet_mask))
	select @subnet_1st_octet=convert(int, substring(@network_addr_only,1,1))

	if(@subnet_1st_octet=0)
	begin /*Reserved. This Host address*/
	  select @network_class='R'
	  return
	end

	if(@subnet_1st_octet>=1 and @subnet_1st_octet<=126)
	begin
	  select @network_class='A'
	  select @network_class_addr_hex=convert(binary(4), convert(int, @subnet_addr )&convert(int, 0xff000000))
	  select @network_class_addr_str=ltrim( str( convert( int, substring(@network_addr_only, 1,1)))) /*1/25/96 + '.' */
	  return
	end
	else 
	if(@subnet_1st_octet>=128 and @subnet_1st_octet<=191)
    begin
	  select @network_class='B'
	  select @network_class_addr_hex=convert(binary(4), convert(int, @subnet_addr )&convert(int, 0xffff0000))
	  select @network_class_addr_str=ltrim( str( convert( int, substring(@network_addr_only, 1,1)))) + '.' +
									 ltrim( str( convert( int, substring(@network_addr_only, 2,1)))) /*1/25/96 + '.' */
	  return
	end
	else 
	if(@subnet_1st_octet>=192 and @subnet_1st_octet<=223)
	begin
	  select @network_class='C'
	  select @network_class_addr_hex=convert(binary(4), convert(int, @subnet_addr )&convert(int, 0xffffff00))
	  select @network_class_addr_str=ltrim( str( convert( int, substring(@network_addr_only, 1,1)))) + '.' +
									 ltrim( str( convert( int, substring(@network_addr_only, 2,1)))) + '.' +
									 ltrim( str( convert( int, substring(@network_addr_only, 3,1)))) /*1/25/96 + '.' */
	  
	  return
	end
	else 
	if(@subnet_1st_octet>=224 and @subnet_1st_octet<=239)
	begin 
	  select @network_class='D'
	  return
	end
	else 
	begin
	  select @network_class='E'
	  return
	end
GO

GO
--SqlScripter----[dbo].[tng_get_segment_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_segment_name]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_segment_name] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_segment_name    Script Date: 12/1/2005 11:49:44 PM ******/

ALTER PROCEDURE [dbo].[tng_get_segment_name]
(
        
		@subnet_in_str			varchar(16)=null,
		@subnet_in_hex			binary(4)=null
		
		
		 )
as		 

declare @subnet_name varchar(255)  ,@segment_name varchar(255), @segment_number int

        if(@subnet_in_str is not null)
          select  @subnet_name = name
		from tng_managedobject 
		where upper(class_name) = 'IP_SUBNET' and address = @subnet_in_str
        else
	  select  @subnet_name = name
		from tng_managedobject 
		where upper(class_name) = 'IP_SUBNET' and ip_address_hex = @subnet_in_hex

	select @segment_number = count(*) from tng_managedobject
			where upper(name) like @subnet_name + ':SEGMENT%'   /*1/25/96 '.SEGMENT%'*/
			      
	select @segment_number = @segment_number + 1

	
	select @segment_name = @subnet_name + ':Segment.'  /*1/26/96 '.Segment.' */ +  convert(varchar(3), @segment_number) 

	select @segment_name
GO

GO
--SqlScripter----[dbo].[tng_get_subnet_IF_connect_to].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_subnet_IF_connect_to]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_subnet_IF_connect_to] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_subnet_IF_connect_to    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_get_subnet_IF_connect_to]
(
        
/*		@ip_address_str			varchar(16)=null,		*/
		@ip_address_hex			binary(4)
		
		
		 )
as		 

 select uuid, ip_address_hex, subnet_mask
 from tng_managedobject where 
class_name='IP_Subnet' and
(
substring(subnet_mask, 4, 1) != null and
(
(
substring(ip_address_hex, 4, 1) != null and
convert(int,substring(@ip_address_hex, 1, 1)) >= convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) >= convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) >= convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) >= convert(int,substring(ip_address_hex, 4, 1) ) 
and
convert(int,substring(@ip_address_hex, 1, 1)) <= convert(int,substring(ip_address_hex, 1, 1)) + 255 - convert(int,substring(subnet_mask, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) <=  convert(int,substring(ip_address_hex, 2, 1))+ 255 - convert(int,substring(subnet_mask, 2, 1))  and
convert(int,substring(@ip_address_hex, 3, 1)) <=  convert(int,substring(ip_address_hex, 3, 1))+ 255 - convert(int,substring(subnet_mask, 3, 1))  and
convert(int,substring(@ip_address_hex, 4, 1)) <=  convert(int,substring(ip_address_hex, 4, 1) )+ 255 - convert(int,substring(subnet_mask, 4, 1)) 
)

or
(
substring(ip_address_hex, 4, 1) = null and
convert(int,substring(@ip_address_hex, 1, 1)) >= convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) >= convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) >= convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) >= 0
and
convert(int,substring(@ip_address_hex, 1, 1)) + 255 - convert(int,substring(subnet_mask, 1, 1)) <=  convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) + 255 - convert(int,substring(subnet_mask, 2, 1)) <=  convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) + 255 - convert(int,substring(subnet_mask, 3, 1)) <=  convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) 	<= 255 - convert(int,substring(subnet_mask, 4, 1)) 
)
)
or


substring(subnet_mask, 4, 1) = null and
(
(
substring(ip_address_hex, 4, 1) != null and
convert(int,substring(@ip_address_hex, 1, 1)) >= convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) >= convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) >= convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) >= convert(int,substring(ip_address_hex, 4, 1) ) 
and
convert(int,substring(@ip_address_hex, 1, 1)) <= convert(int,substring(ip_address_hex, 1, 1)) + 255 - convert(int,substring(subnet_mask, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) <=  convert(int,substring(ip_address_hex, 2, 1))+ 255 - convert(int,substring(subnet_mask, 2, 1))  and
convert(int,substring(@ip_address_hex, 3, 1)) <=  convert(int,substring(ip_address_hex, 3, 1))+ 255 - convert(int,substring(subnet_mask, 3, 1))  and
convert(int,substring(@ip_address_hex, 4, 1)) <=  convert(int,substring(ip_address_hex, 4, 1) )+ 255 - convert(int,substring(subnet_mask, 4, 1)) 
)

or
(
substring(ip_address_hex, 4, 1) = null and
convert(int,substring(@ip_address_hex, 1, 1)) >= convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) >= convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) >= convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) >= 0
and
convert(int,substring(@ip_address_hex, 1, 1)) + 255 - convert(int,substring(subnet_mask, 1, 1)) <=  convert(int,substring(ip_address_hex, 1, 1)) and
convert(int,substring(@ip_address_hex, 2, 1)) + 255 - convert(int,substring(subnet_mask, 2, 1)) <=  convert(int,substring(ip_address_hex, 2, 1)) and
convert(int,substring(@ip_address_hex, 3, 1)) + 255 - convert(int,substring(subnet_mask, 3, 1)) <=  convert(int,substring(ip_address_hex, 3, 1)) and
convert(int,substring(@ip_address_hex, 4, 1)) 	<= 255 
)
)

/****** chuyo01 : yong chun : addtional checking for class B subnets link generation for 2dmap 2/5/98 ****/
/*** begin ***/
or

(

(convert(int, substring(@ip_address_hex, 1,1)) & convert(int, substring(subnet_mask, 1 , 1))) =
convert(int, substring(ip_address_hex,1,1)) and

(convert(int, substring(@ip_address_hex, 2,1)) & convert(int, substring(subnet_mask, 2 , 1))) =
convert(int, substring(ip_address_hex,2,1)) and

(convert(int, substring(@ip_address_hex, 3,1)) & convert(int, substring(subnet_mask, 3 , 1))) =
convert(int, substring(ip_address_hex,3,1)) 

)


or

(

substring(subnet_mask, 3, 1) = null and substring(subnet_mask, 3, 1) = null and

(convert(int, substring(@ip_address_hex, 1,1)) & convert(int, substring(subnet_mask, 1 , 1))) =
convert(int, substring(ip_address_hex,1,1)) and

(convert(int, substring(@ip_address_hex, 2,1)) & convert(int, substring(subnet_mask, 2 , 1))) =
convert(int, substring(ip_address_hex,2,1))

)

/**** end  ******/


)
GO

GO
--SqlScripter----[dbo].[tng_get_super_class_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_super_class_name]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_super_class_name] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_super_class_name    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_get_super_class_name]
(
							@class_name varchar(30)	,
	  						@super_class_name varchar(30) OUTPUT
							)
as
  
declare @v_class_name	varchar(30)
declare @msg varchar(255)   
   
   if (not exists (select * from tng_class where name=@class_name) )
   begin
     select @msg='The class name: '+@class_name+' is not defined in tng_class table'
     print @msg
	 select @super_class_name=null
	 return
   end

   select @super_class_name=@class_name, @v_class_name=@class_name

   while(2>1)
   begin
   	 if( @super_class_name='Router' or @super_class_name='Hub'     or @super_class_name='Workstation'      or
	     @super_class_name='Xterm'  or @super_class_name='Printers' or @super_class_name='Host'             or 
	     @super_class_name='Server' or @super_class_name='Manager' or @super_class_name='Unclassified_TCP' or 
	     @super_class_name='Bridge' ) 
	 begin /*recursive to toppest class associated with a table*/
	   
	   return
	 end
	 else if ( @super_class_name='Class')
	        begin
			  select @msg='The class name: '+@class_name+' is not derived from class:Hub,Host,Workstation,Xterm,Manager,Printers or Unclassified_TCP.'
     		  print @msg
	 		  select @super_class_name=null
	 		  return
			end
    select @super_class_name=super_class_name from tng_class where @v_class_name=name
	select @v_class_name=@super_class_name
  end
GO

GO
--SqlScripter----[dbo].[tng_get_uuid_classname_by_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_get_uuid_classname_by_name]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_get_uuid_classname_by_name] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_get_uuid_classname_by_name    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_get_uuid_classname_by_name]
(
		
        @name				varchar(255)     /*input parameter*/
		
		 )
as		 
declare  @msg varchar(255)
/*it may return multiple rows*/
 
 select uuid, class_name from tng_managedobject where name=@name

 return
GO

GO
--SqlScripter----[dbo].[tng_iphex2str_nd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_iphex2str_nd]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_iphex2str_nd] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_iphex2str_nd    Script Date: 12/1/2005 11:49:13 PM ******/


ALTER PROCEDURE [dbo].[tng_iphex2str_nd]
@ipaddr_hex binary(4), @ipaddr_str varchar(15) OUTPUT
as
	if (@ipaddr_hex = NULL)
		select @ipaddr_str = NULL
	else
	begin
		select @ipaddr_str = ltrim(str(convert(int,substring(@ipaddr_hex, 1, 1)))) + '.' +
			ltrim(str(convert(int,substring(@ipaddr_hex, 2, 1)))) + '.' +
			ltrim(str(convert(int,substring(@ipaddr_hex, 3, 1)))) + '.' +
			ltrim(str(convert(int,substring(@ipaddr_hex, 4, 1)))) 
	end
GO

GO
--SqlScripter----[dbo].[tng_ipstr2iphex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ipstr2iphex]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_ipstr2iphex] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_ipstr2iphex    Script Date: 12/1/2005 11:49:13 PM ******/


ALTER PROCEDURE [dbo].[tng_ipstr2iphex]
@ipaddr_str char(15), @ipaddr_hex binary(4) OUTPUT 
as
	declare @ipaddr float, @ipbyte int, @temp char(25), @ch char(1), @ipaddr_int int

	if (@ipaddr_str = NULL)
	begin
		select @ipaddr_hex = NULL
		return
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
			return
		end
		select @temp = stuff( @temp, 1, 1, ' ' )
		select @temp = ltrim(@temp)
	end
GO

GO
--SqlScripter----[dbo].[tng_is_attr_same_as_superclass].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_is_attr_same_as_superclass]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_is_attr_same_as_superclass] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_is_attr_same_as_superclass    Script Date: 12/1/2005 11:50:12 PM ******/

ALTER PROCEDURE [dbo].[tng_is_attr_same_as_superclass]
( 
				   @classname 	varchar(30),
				   @name 		varchar(255),
				   @datatype 	varchar(30),
				   @length		int =null,
				   @string		varchar(255) =null,
				   @integer		int =null,
				   @tinyint		int =null,
				   @rc		    int OUTPUT
				)
as
declare @super_class_id int
declare @super_classname varchar(30)
declare @string_value varchar(255)
declare @integer_value	int
declare @tinyint_value	tinyint
   
   if( upper(@classname)='CLASS' OR upper(@classname)='TNGROOT') 
   begin /*This is definition of base class, so any attribute is unique*/
	   select @rc=0
	   return
   end

   while(2>1)
   begin
   
     select @super_classname = null	, @super_class_id=null
     select @super_classname = t1.super_class_name, @super_class_id=t1.super_class_id
       from tng_class t1
       where t1.name=@classname 
	 
	 if(@super_classname is null)
	 begin
	   BEGIN PRINT 'Server: Msg '+cast(90019 as varchar)+', Level 16, State 1, Line 0'+char(13)+'MSG(90019): Bad @classname pass in is_attr_same_as_superclass procedure.'; RAISERROR (90019, 16, 1); END;
	   return
     end 

	 if( upper(@super_classname)='TNGROOT' ) 
	 begin /*recursive to toppest class*/
	   select @rc=0
	   return
	 end

	 if( exists ( select * from tng_class_ext where name=@name and  class_id=@super_class_id))
	 begin
	   if(@string is not null)
	   begin
	     select @string_value=string from tng_class_ext where name=@name and  class_id=@super_class_id 
	   	 if(@string_value=@string)
	     begin /*child class has the same attr and value with super class*/
	       select @rc=1
	       return
	     end
	     else
	     begin /*redefine child class attr value*/
		   select @rc=0 
	       return
	     end
	   end

	 end
	 select @classname=@super_classname
   end
GO

GO
--SqlScripter----[dbo].[tng_is_man_obj_exist_w_sameip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_is_man_obj_exist_w_sameip]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_is_man_obj_exist_w_sameip] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_is_man_obj_exist_w_sameip    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_is_man_obj_exist_w_sameip]
(
                @ipaddr_str			varchar(16)=null,
		@ipaddr_hex			binary(4)=null
		 )
as set nocount on 			 
declare  @obj_count int
  if(@ipaddr_str is not null)
    select 'total_count' = count(*) from tng_managedobject 
    where  address=@ipaddr_str
  else
    select 'total_count' = count(*) from tng_managedobject 
      where  ip_address_hex=@ipaddr_hex


/*  select @obj_count*/
GO

GO
--SqlScripter----[dbo].[tng_is_obj_exist_class_name_ip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_is_obj_exist_class_name_ip]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_is_obj_exist_class_name_ip] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_is_obj_exist_class_name_ip    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_is_obj_exist_class_name_ip]
(
				@class_name			varchar(30),
                @name				varchar(255)=null,
				@address			varchar(255)=null
		 )
as set nocount on 			 
declare  @obj_count int
  if(@name is not null and @address is not null)
  begin
    select @obj_count = count(*) from tng_managedobject 
    where  address=@address and name =@name and class_name=@class_name
	select @obj_count
	return
  end

  if(@name is not null and @address is null)
  begin
    select @obj_count = count(*) from tng_managedobject 
    where  name =@name and class_name=@class_name
	select @obj_count
	return
  end

  if(@name is null and @address is not null)
  begin
    select @obj_count = count(*) from tng_managedobject 
    where  address =@address and class_name=@class_name
	select @obj_count
	return
  end




/*  select @obj_count*/
GO

GO
--SqlScripter----[dbo].[tng_is_obj_exist_w_name_diff_ip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_is_obj_exist_w_name_diff_ip]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_is_obj_exist_w_name_diff_ip] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_is_obj_exist_w_name_diff_ip    Script Date: 12/1/2005 11:49:45 PM ******/

ALTER PROCEDURE [dbo].[tng_is_obj_exist_w_name_diff_ip]
(
				@class_name			varchar(30),
                @name				varchar(255)=null,
				@address			varchar(255)=null
		 )
as set nocount on 			 
declare  @obj_count int

    select @obj_count = count(*) from tng_managedobject 
    where    class_name=@class_name and name =@name and address<>@address 
	select @obj_count
	return


/*  select @obj_count*/
GO

GO
--SqlScripter----[dbo].[tng_is_same_property].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_is_same_property]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_is_same_property] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_is_same_property    Script Date: 12/1/2005 11:50:12 PM ******/

ALTER PROCEDURE [dbo].[tng_is_same_property]
( 
				   @classname 	varchar(30),
				   @name 		varchar(255),
				   @datatype 	varchar(30),
				   @length		int ,
				   @is_key		tinyint,
				   @required	tinyint=null,
				   @instance_storage varchar(32)=null,
				   @storage_field 	 varchar(30)=null,
				   @default_value	varchar(255) =null,
				   @rc		    int OUTPUT
				)
as
declare @super_class_id int
declare @super_classname varchar(30)
declare @string_value varchar(255)
declare @error_msg varchar(255)
declare @v_datatype varchar(30)
declare @v_length int
declare @v_is_key	tinyint
declare @v_required	tinyint
declare @v_instance_storage varchar(32)
declare @v_storage_field 	 varchar(30)
declare @v_default_value	varchar(255)
declare @v_classname varchar(30)   
   
   select @v_classname=@classname

   while(2>1)
   begin
   
     select @super_classname = null	, @super_class_id=null
     select @super_classname = t1.super_class_name, @super_class_id=t1.super_class_id
       from tng_class t1
       where t1.name=@classname 
	 
	 if(@super_classname is null)
	 begin
	   select @error_msg='MSG(90019): Bad classname: '+@classname+' pass in is_attr_same_as_superclass procedure.'
	   BEGIN PRINT 'Server: Msg '+cast(90019 as varchar)+', Level 16, State 1, Line 0'+char(13)+@error_msg; RAISERROR (90019, 16, 1); END;
	   return
     end 

	 if( upper(@super_classname)='CLASS' ) 
	 begin /*recursive to toppest class*/
	   select @rc=0
	   return
	 end

	 if( exists ( select * from tng_property_definition where name=@name and  class_id=@super_class_id))
	 begin
	   select @v_datatype=datatype, @v_length=length, @v_is_key=is_key, @v_required=required,
	        @v_instance_storage=instance_storage,@v_storage_field=storage_field	,@v_default_value=default_value
	     from tng_property_definition 
	     where name=@name and  class_id=@super_class_id

	   if( @v_datatype != @datatype or @v_length != @length or 
	   			((@v_is_key=1) and (@is_key=0)) ) /* key can be added only*/
	   begin
	     select @error_msg='MSG(90020): Can''t change super class: '+@super_classname+'''s property name: '+@name+' s''datatype:'+@datatype+' or length: '
		 select @error_msg=@error_msg+convert(varchar(3),@length)+' or is_key:'+ convert(varchar(3),@is_key)+', when add property for class:'+@v_classname
	     BEGIN PRINT 'Server: Msg '+cast(90020 as varchar)+', Level 16, State 1, Line 0'+char(13)+@error_msg; RAISERROR (90020, 16, 1); END;
		 select @rc=1
	     return
       end 
	  
	   if( @v_is_key != @is_key)
	   begin  /*	@v_is_key and @is_key can not be null */
	     select @rc=0
	     return
	   end

	   if( (@v_required is null) or (@required is null))
	   begin
	     if( (@v_required is not null) or (@required is not null))
	   	 begin  /*super class and child class have different attr value*/
		   select @rc=0
	       return
	     end
	   end
	   else if( @v_required != @required)
		    begin
		      select @rc=0
	          return
	        end
	   
	   if( (@v_instance_storage is null) or (@instance_storage is null))
	   begin
	     if( (@v_instance_storage is not null) or (@instance_storage is not null))
	   	 begin  /*super class and child class have different attr value*/
		   select @rc=0
	       return
	     end
	   end
	   else if( @v_instance_storage != @instance_storage)
		    begin
		      select @rc=0
	          return
	        end
	   
	   if( (@v_storage_field is null) or (@storage_field is null))
	   begin
	     if( (@v_storage_field is not null) or (@storage_field is not null))
	   	 begin  /*super class and child class have different attr value*/
		   select @rc=0
	       return
	     end
	   end
	   else if( @v_storage_field != @storage_field)
		    begin
		      select @rc=0
	          return
	        end
	   
	   if( (@v_default_value is null) or (@default_value is null))
	   begin
	     if( (@v_default_value is not null) or (@default_value is not null))
	   	 begin  /*super class and child class have different attr value*/
		   select @rc=0
	       return
	     end
	   end
	   else if( @v_default_value != @default_value)
		    begin
		      select @rc=0
	          return
	        end
	   
	   select @rc=1
	   return
     end
	 
	 select @classname=@super_classname
   end
GO

GO
--SqlScripter----[dbo].[tng_IsDiffClsSameIpNameExist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_IsDiffClsSameIpNameExist]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_IsDiffClsSameIpNameExist] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_IsDiffClsSameIpNameExist    Script Date: 12/1/2005 11:49:46 PM ******/

ALTER PROCEDURE [dbo].[tng_IsDiffClsSameIpNameExist]
(
		@class_name			varchar(30),
		@dsc_name			varchar(255),
		@ipaddr_str			varchar(16)
		 )

as set nocount on 			 		 
declare @obj_count int
/*it may return multiple rows*/






    select @obj_count=count(*)
      from tng_managedobject		
      where class_name !=@class_name and
 		    name = @dsc_name         and
			address=@ipaddr_str
  select @obj_count
GO

GO
--SqlScripter----[dbo].[tng_manag_all_discovery_ipsubnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_manag_all_discovery_ipsubnet]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_manag_all_discovery_ipsubnet] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_manag_all_discovery_ipsubnet    Script Date: 12/1/2005 11:49:46 PM ******/

ALTER PROCEDURE [dbo].[tng_manag_all_discovery_ipsubnet]
( @name   varchar(20) )
as
	set nocount on 	
	update tng_discovery_ipsubnet set managed = 1,
		managed_str = 'Yes'
	where managed_str = 'Finish'
	return
GO

GO
--SqlScripter----[dbo].[tng_senderror].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_senderror]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_senderror] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_senderror    Script Date: 12/1/2005 11:49:13 PM ******/

ALTER PROCEDURE [dbo].[tng_senderror]
(@errno int = null)  
as
declare @str varchar(255)
/* select @str = description from topmessages where error = @errno */
/* if @@rowcount != 1  */
if 	@errno = 40040
select @str = 'MSG:('+convert(varchar(8), @errno)+') Warning: The subnet is already specified. '
else
select @str = 'MSG:('+convert(varchar(8), @errno)+') Senderror:  An unknown error has occurred.' 

BEGIN PRINT 'Server: Msg @errno, Level 16, State 1, Line 0'+char(13)+@str; RAISERROR (@errno, 16, 1); END;
return
GO

GO
--SqlScripter----[dbo].[tng_setup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_setup_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_setup_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_setup_status    Script Date: 12/1/2005 11:49:46 PM ******/

ALTER PROCEDURE [dbo].[tng_setup_status]
(
        	@bNeedQueryStatus		int=1,
		@dsc_name			varchar(255),
		@ipaddr_str			varchar(16)=null,
		@ipaddr_hex			binary(4)=null,
		@macaddr			varchar(15),
		@class_name			varchar(30),
		@bIpInDHCPRange		int=0,
		@bDelUncls			int=0,
		@iDHCPStatus		int=0
		
		 )

as set nocount on 			 		 
declare  @msg varchar(255), @old_name varchar(255), @old_ipaddr_hex binary(4), @old_ipaddr_str varchar(16)
declare  @old_mac  varchar(15) , @old_class_name varchar(30), @upper_mac varchar(30)
declare @status_no int
/*it may return multiple rows*/


  if( @bIpInDHCPRange<>0 and @bDelUncls=0)
  begin
    begin transaction updateinvaliddhcpip
	  update tng_managedobject set status_no=@iDHCPStatus, address_type=2
	    where address=@ipaddr_str and status_no<>@iDHCPStatus
	commit transaction updateinvaliddhcpip
  end
  else if( @bIpInDHCPRange<>0 and @bDelUncls<>0)
  begin
    begin transaction updateinvaliddhcpip1
	  update tng_managedobject set status_no=@iDHCPStatus, address_type=2
	    where class_name<>'Unclassified_TCP' and address=@ipaddr_str and status_no<>@iDHCPStatus
	commit transaction updateinvaliddhcpip1
  end




if(@bNeedQueryStatus<>0)
begin
  select @upper_mac=upper(@macaddr), @status_no=0
  select  @old_name=null, @old_ipaddr_hex=null, @old_ipaddr_str=null, @old_class_name=null,@old_mac=null

  if(@ipaddr_str is not null)
    select @old_name = name ,@old_ipaddr_str = address, @old_class_name = class_name, @old_mac = upper(mac_address)
      from tng_managedobject		
      where class_name !='Unclassified_TCP' and address_type <= 2 and
 		(name = @dsc_name  or address=@ipaddr_str  or upper(mac_address)=@upper_mac )
      
  else 
    select @old_name = name ,@old_ipaddr_hex = ip_address_hex, @old_class_name = class_name, @old_mac = upper(mac_address)
      from tng_managedobject		
      where class_name !='Unclassified_TCP' and address_type <= 2 and
 	    (name = @dsc_name  or ip_address_hex=@ipaddr_hex  or upper(mac_address)=@upper_mac )
      
  /*normal way should do select query tng_managedobject 4 times to set status, but too expansive.*/
  if(@ipaddr_str is null)
  begin
    if(@old_ipaddr_hex!=@ipaddr_hex and @old_name=@dsc_name)
      select @status_no=21
    if(@old_ipaddr_hex!=@ipaddr_hex and @old_mac=@upper_mac and @upper_mac!='000000000000' )
      select @status_no=14
    if(@old_class_name!=@class_name and @old_mac=@upper_mac and @upper_mac!='000000000000' )
      select @status_no=15
    if(@old_class_name!=@class_name and @old_ipaddr_hex=@ipaddr_hex)
      select @status_no=16
  end
  else
  begin
    if(@old_ipaddr_str!=@ipaddr_str and @old_name=@dsc_name)
      select @status_no=21
    if(@old_ipaddr_str!=@ipaddr_str and @old_mac=@upper_mac and @upper_mac!='000000000000' )
      select @status_no=14
    if(@old_class_name!=@class_name and @old_mac=@upper_mac and @upper_mac!='000000000000' )
      select @status_no=15
    if(@old_class_name!=@class_name and @old_ipaddr_str=@ipaddr_str)
      select @status_no=16
  end

  select @status_no
end
else select 0
GO

GO
--SqlScripter----[dbo].[tng_start_service].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_start_service]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_start_service] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_start_service    Script Date: 12/1/2005 11:49:13 PM ******/

ALTER PROCEDURE [dbo].[tng_start_service]
( @servicename  varchar(64))

as 
	declare @cmdline varchar(255)

	select @cmdline = 'net start ' + @servicename

 	exec tng_master..xp_cmdshell  @cmdline , NO_OUTPUT
GO

GO
--SqlScripter----[dbo].[tng_stop_service].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_stop_service]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_stop_service] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_stop_service    Script Date: 12/1/2005 11:49:13 PM ******/

ALTER PROCEDURE [dbo].[tng_stop_service]
( @servicename  varchar(64))

as 
	declare @cmdline varchar(255)

	select @cmdline = 'net stop ' + @servicename

 	exec tng_master..xp_cmdshell  @cmdline , NO_OUTPUT
GO

GO
--SqlScripter----[dbo].[tng_unmanage_discovery_ipsubnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_unmanage_discovery_ipsubnet]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_unmanage_discovery_ipsubnet] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_unmanage_discovery_ipsubnet    Script Date: 12/1/2005 11:49:46 PM ******/

ALTER PROCEDURE [dbo].[tng_unmanage_discovery_ipsubnet]
( @name   varchar(20) )
as
	set nocount on 	
	update tng_discovery_ipsubnet set managed = 2,
		managed_str = 'Finish'
	where subnet_addr_str = @name
/*1/22/96 	select 0	*/
	return
GO

GO
--SqlScripter----[dbo].[tng_upd_segment_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_upd_segment_uuid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[tng_upd_segment_uuid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.tng_upd_segment_uuid    Script Date: 12/1/2005 11:49:46 PM ******/


ALTER PROCEDURE [dbo].[tng_upd_segment_uuid]
(
                @start_address 			varchar(200),
				@end_address			varchar(200),
				@iftype					int,
				@segment_uuid			UUID
		 )
as set nocount on 			 
declare  @upd_count int


  select @upd_count=0

  select @upd_count=count(*)
    from tng_ip_interface i, tng_managedobject m
	   where address >= @start_address and
			 address <= @end_address and
			 m.interface_type=@iftype and
			 class_name='IP_Interface' and
			 m.uuid=i.uuid

  if(@upd_count<>0)
  begin
    begin transaction upd_segment_uuid
      update tng_ip_interface set segment_uuid=@segment_uuid
	    from tng_ip_interface i, tng_managedobject m
	   where address >= @start_address and
			 address <= @end_address and
			 m.interface_type=@iftype and
			 class_name='IP_Interface' and
			 m.uuid=i.uuid
	commit transaction upd_segment_uuid
  end

  select @upd_count
GO

GO
--SqlScripter----[dbo].[ujo_audit_info_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_audit_info_log]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_audit_info_log] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_audit_info_log    Script Date: 12/1/2005 11:49:46 PM ******/
ALTER PROCEDURE [dbo].[ujo_audit_info_log]
@audit_info_num	int,
	@entity 		varchar(80),
	@time			int,
	@type			varchar(1)
AS

BEGIN
	INSERT ujo_audit_info ( entity, time, type, audit_info_num )
	VALUES	( @entity, @time, @type, @audit_info_num )
	return 1
END
GO

GO
--SqlScripter----[dbo].[ujo_audit_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_audit_msg_log]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_audit_msg_log] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_audit_msg_log    Script Date: 12/1/2005 11:49:47 PM ******/
ALTER PROCEDURE [dbo].[ujo_audit_msg_log]
@audit_info_num	int,
	@seq_no			int,
	@attribute		varchar(30),
	@value			varchar(4096),
	@is_edit		varchar(1)
AS

BEGIN
	INSERT into ujo_audit_msg ( audit_info_num, seq_no, attribute, value, is_edit)
	VALUES	( @audit_info_num, @seq_no, @attribute, @value, @is_edit)
	return 1
END
GO

GO
--SqlScripter----[dbo].[ujo_batch_get_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_batch_get_event]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_batch_get_event] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_batch_get_event]
@time0  int
AS

/* maximum number of events we wish to retrieve */

declare @time_stamp    datetime,
        @firstcount    int,
        @error_var     int, 
        @rowcount_var  int


/* Set our timestamp */
select @time_stamp = getdate()

begin tran
     
     /* update que_status flag and stamp */
     update ujo_event
        set que_status       = -1,
            que_status_stamp = @time_stamp
      where eoid in (select top 1024 eoid from ujo_event where event_time_gmt <= @time0
        and que_status = 0)

    -- Save the @@error and @@rowcount values in local 
    -- variables before they are cleared.
    SELECT @error_var = @@error, @firstcount = @@rowcount

    if (@error_var != 0 )
    begin
	raiserror ('procedure ujo_batch_get_event failed during first update', 16, 1)
	rollback tran
	return -1
    end	        
    /* If nothing was found during this clock tick, return */    
    if (@firstcount = 0)
    begin       
       rollback tran
       return 0
    end    


    /* retrieve the event 1024 */

    select TOP 1024 eoid, joid, priority, event, status, alarm, event_time_gmt,
	       exit_code, machine, pid, jc_pid, run_num, ntry, text,
	       stamp_diff=datediff(ss, stamp, @time_stamp), job_name,
	       box_name, que_priority, AUTOSERV, evt_num
    from ujo_event
    where event_time_gmt     <= @time0
	   and que_status         = -1
	   and que_status_stamp   = @time_stamp
    order by priority, event_time_gmt, evt_num

    -- Save the @@error and @@rowcount values in local 
    -- variables before they are cleared.
    SELECT @error_var = @@error, @rowcount_var = @@rowcount

    /* If nothing was found during this clock tick, return */
    if (@error_var != 0 )
    begin
	raiserror ('procedure ujo_batch_get_event failed during select', 16, 1)
	rollback tran
	return -1
    end    
     
    /* update que_status flag and stamp */
    update ujo_event
        set que_status       = -2
        where que_status_stamp = @time_stamp
        and event_time_gmt <= @time0
        and que_status = -1

    -- Save the @@error and @@rowcount values in local 
    -- variables before they are cleared.
    SELECT @error_var = @@error, @rowcount_var = @@rowcount
    
    if (@error_var != 0 )
    begin
	raiserror ('procedure ujo_batch_get_event failed during second update', 16, 1)
	rollback tran
	return -1
    end	  
        
    /* If nothing was found during this clock tick, return */    
    if (@firstcount != @rowcount_var)
    begin       
       raiserror ('procedure ujo_batch_get_event failed during second update. Data has been lost or modified', 16, 1)
       rollback tran
       return -1
    end    

commit tran 

return 1
GO

GO
--SqlScripter----[dbo].[ujo_bump_digit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_bump_digit]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_bump_digit] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_bump_digit    Script Date: 12/1/2005 11:49:13 PM ******/


ALTER PROCEDURE [dbo].[ujo_bump_digit]
@i_odigit VARCHAR(13), @result VARCHAR(1) output, @did_roll int output
as
    declare @new_val int,
            @orig_val int           
    
    
    set @did_roll = 0
    set @orig_val = ASCII(@i_odigit)    
    IF @orig_val = 57 
    begin
            /* go from '9' to 'a'*/
            set @new_val = 97
    end
    else IF @orig_val = 122  
    begin
            /* go from 'z' to '0'*/
            set @new_val = 48
            set @did_roll = 1            
    end
    else
    begin            
            set @new_val = @orig_val + 1
    end

   set @result = CHAR(@new_val)
GO

GO
--SqlScripter----[dbo].[ujo_chase_state].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_chase_state]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_chase_state] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_chase_state]
@starting_delay_time int

AS

declare @nstart  int

select @nstart = max( nstart ) from ujo_chase
if (@nstart IS NULL)
begin
	set @nstart = 0
end

set @nstart = @nstart+1

/* Rolling slots */
if @nstart > 50
begin
	set @nstart = 1
	delete ujo_chase 	/* Issue 12216151 - sinpr01 */
end

/* Clean it out */

delete ujo_chase where nstart = @nstart



/* Put in the ones that were in the event and are waiting */

/* RUNNING */
/* Issue 12216151 - sinpr01 add eoid */

    insert into ujo_chase
    	(nstart, joid, eoid, job_name, job_type, status, run_machine, pid, jc_pid )
    
    select	@nstart, j.joid, e.eoid, j.job_name, j.job_type, status, e.machine, pid, jc_pid
    from	ujo_event e, ujo_job j
    where	e.joid = j.joid and job_type in ('c', 'f')
    and	que_status = 0
    and	status = 1


/* Put in the current status */

insert into ujo_chase 
	(nstart, joid, job_name, job_type, status, run_machine, pid, jc_pid )

select	@nstart, j.joid, j.job_name, j.job_type, 
	status, run_machine, pid, jc_pid

from	ujo_job j, ujo_job_status s
where	j.joid = s.joid
and	status = 1
and	job_type in ('c','f')
and	j.joid not in
	( select joid from ujo_chase where nstart = @nstart )

/* STARTING */
insert ujo_chase 
	(nstart, joid, job_name, job_type, status, run_machine, pid, jc_pid )

select	@nstart, j.joid, j.job_name, j.job_type, 
	status, run_machine, pid, jc_pid

from	ujo_job j, ujo_job_status s
where	j.joid = s.joid
and	status = 3 
and	status_time < @starting_delay_time
and	job_type in ('c','f')
and	j.joid not in
       	( select joid from ujo_event where status = 3 and event_time_gmt < @starting_delay_time )
and	j.joid not in
	( select joid from ujo_chase where nstart = @nstart )



/* Now blow off the 1's that are waiting in the event and finished */


    
delete from ujo_chase    
where joid in 
     (SELECT r.joid 
      FROM ujo_chase r, ujo_event e
      WHERE r.joid = e.joid
      and	que_status = 0 /* Means its waiting to be processed */
      and	e.status in ( 4,5,6,10 ) /* Success, Failure, Terminated, Restart */
      and	nstart = @nstart) 


/* Remove the rows in the chase table that are for Z/Team machines. */
delete from ujo_chase where run_machine in
(select distinct j.run_machine from ujo_job_status j, ujo_machine m where
j.run_machine = m.name and m.type in ('z', 't'))

/* Issue 12184156 - sinpr01 */
/* Remove the rows in the chase table that have blank machine names */
delete from ujo_chase where run_machine='' and nstart=@nstart

/* pass back which chase number it is... IF = 0 there's nothing ! */
if ( select top 1 1 from ujo_chase where nstart = @nstart ) > 0
begin
	select @nstart
end
else
begin
	select @nstart = 0
end

select @nstart as nstart
return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_chk_cond].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_chk_cond]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_chk_cond] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_chk_cond    Script Date: 12/1/2005 11:49:47 PM ******/

ALTER PROCEDURE [dbo].[ujo_chk_cond]
@job_name  varchar(64) = 'ALL',
	@mode int
AS

if @job_name = 'ALL'
begin
	if @mode = 1
	begin
		select  job_name Job, cond_job_name Missing_Condition_Job
		from    ujo_job j, ujo_job_cond c
		where   j.joid = c.joid
		AND     cond_job_name NOT IN
			( select job_name from ujo_job )
		AND     cond_job_name != ''
		AND type != 'g'
		AND cond_job_AUTOSERV = '' /* No X-instance checking */
		return -999 /*SUCCESS*/
	end	
	else
	begin
		select  job_name Job, cond_job_name Missing_Condition_Job
		from    ujo_job j, ujo_job_cond c, ujo_job_status s
		where   j.joid = c.joid
		AND     j.joid = s.joid
		AND     cond_job_name NOT IN
			( select job_name from ujo_job )
		AND     cond_job_name != ''
		AND type != 'g'
		AND cond_job_AUTOSERV = '' /* No X-instance checking */
		AND c.over_num = s.over_num
		return -999 /*SUCCESS*/	
	end	
end

if @job_name = 'ON_ICE'
begin
	if @mode = 1
	begin
		print   'Jobs which depend (starting conditions) on a Job which is currently ON_ICE.'
		select  j.job_name Job, cond_job_name Condition_Job_ON_ICE
		from    ujo_job j, ujo_job_cond c, ujo_job j2, ujo_job_status s
		where   j.joid = c.joid
		AND     j.joid = s.joid
		AND     cond_job_name = j2.job_name
		AND     j2.joid = s.joid
		AND     s.status = 7  /* 7=ON_ICE */
		AND     cond_job_name != ''
		AND     cond_job_AUTOSERV = ''
		AND     c.over_num = -1
		return -999 /*SUCCESS*/
	end	
	else
	begin
		print   'Jobs which depend (starting conditions) on a Job which is currently ON_ICE.'
		select  j.job_name Job, cond_job_name Condition_Job_ON_ICE
		from    ujo_job j, ujo_job_cond c, ujo_job j2, ujo_job_status s
		where   j.joid = c.joid
		AND     j.joid = s.joid
		AND     cond_job_name = j2.job_name
		AND     j2.joid = s.joid
		AND     s.status = 7  /* 7=ON_ICE */
		AND     cond_job_name != ''
		AND     cond_job_AUTOSERV = ''
		AND     c.over_num = s.over_num
		return -999 /*SUCCESS*/	
	end	
end

if @mode = 1	
begin
        select  j.job_name as Job, cond_job_name as Missing_Condition_Job
    	from    ujo_job j, ujo_job_cond c
    	where   j.joid = c.joid 
    	AND     j.job_name = @job_name
    	AND     cond_job_name NOT IN
    		( select job_name from ujo_job )
    	AND     cond_job_name != ''
    	AND     type != 'g'
    	AND     cond_job_AUTOSERV = ''
    	AND     c.over_num = -1
    	return -999 /*SUCCESS*/
end    	
else
begin
	select  j.job_name as Job, cond_job_name as Missing_Condition_Job
	from    ujo_job j, ujo_job_cond c, ujo_job_status s
	where   j.joid = c.joid 
	AND     j.joid = s.joid
	AND     j.job_name = @job_name
	AND     cond_job_name NOT IN
		( select job_name from ujo_job )
	AND     cond_job_name != ''
	AND     type != 'g'
	AND     cond_job_AUTOSERV = ''
	AND     c.over_num = s.over_num
	return -999 /*SUCCESS*/
end
GO

GO
--SqlScripter----[dbo].[ujo_chk_running].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_chk_running]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_chk_running] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_chk_running    Script Date: 12/1/2005 11:49:47 PM ******/

ALTER PROCEDURE [dbo].[ujo_chk_running]
AS

select	job_name, last_start
from	ujo_jobst
where	status = 1

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_cred_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_cred_delete]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_cred_delete] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_cred_delete    Script Date: 12/1/2005 11:49:47 PM ******/


ALTER PROCEDURE [dbo].[ujo_cred_delete]
@cred_domain   varchar(8),
     @domain_name   varchar(64),
     @principal     varchar(64)
AS

	if exists (select cred_domain from ujo_cred where (
                      (cred_domain=@cred_domain) AND
                      (domain_name = @domain_name) AND 
                      (principal=@principal)))

     BEGIN
          DELETE     ujo_cred
          WHERE    ( (cred_domain = @cred_domain)
               AND   (domain_name = @domain_name)
               AND   (principal= @principal) )
		  return 1
     END

     return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_cred_get].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_cred_get]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_cred_get] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_cred_get    Script Date: 12/1/2005 11:49:48 PM ******/
ALTER PROCEDURE [dbo].[ujo_cred_get]
@cred_domain   varchar(8),
     @domain_name   varchar(64),
     @principal     varchar(64)

as

	if @cred_domain = 'ALL'
		select distinct cred_value, owner
		from ujo_cred
	else
	begin
		if exists (select cred_domain from ujo_cred where (
                         (cred_domain=@cred_domain) AND
                         (domain_name = @domain_name) AND 
                         (principal=@principal)))

			select cred_value, owner from ujo_cred
                  WHERE    ( (cred_domain = @cred_domain)
                    AND   (domain_name = @domain_name)
                    AND  (principal= @principal) )

		else
			return 0
	end
	return 1
GO

GO
--SqlScripter----[dbo].[ujo_cred_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_cred_set]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_cred_set] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_cred_set    Script Date: 12/1/2005 11:49:48 PM ******/
ALTER PROCEDURE [dbo].[ujo_cred_set]
@cred_domain   varchar(8),
     @domain_name   varchar(64),
     @principal     varchar(64),
     @cred_value    varchar(64),
     @owner         varchar(80)
AS

IF NOT EXISTS ( select cred_domain from ujo_cred where ((cred_domain=@cred_domain) AND (domain_name = @domain_name) AND (principal=@principal)))
BEGIN
     /* First time in - do an INSERT */
     INSERT ujo_cred ( cred_domain, domain_name, principal, cred_value,owner )
     VALUES     ( @cred_domain,@domain_name,@principal,@cred_value,@owner )

     return 1
END

/* Do an update */

UPDATE     ujo_cred
SET  cred_value = @cred_value,
     owner = @owner
     WHERE    ( (cred_domain = @cred_domain)
          AND   (domain_name = @domain_name)
          AND   (principal= @principal) )

return 1
GO

GO
--SqlScripter----[dbo].[ujo_det_rep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_det_rep]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_det_rep] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_det_rep]
@joid int,
   @run_num int

AS

select 	status,
	alarm,
	event,
	event_time_gmt,
	ntry,
	que_status,
	MONTH(que_status_stamp),	
  DAY(que_status_stamp),    
  YEAR(que_status_stamp),
  DATEPART(hh,que_status_stamp),
  DATEPART(mi,que_status_stamp),
  DATEPART(ss,que_status_stamp),
	text,
	machine,
	evt_num
from	ujo_eventvu
where	joid = @joid
	and	run_num = @run_num

union

select 	status,
	alarm,
	event,
	event_time_gmt,
	ntry,
	que_status,
	MONTH(que_status_stamp),
  DAY(que_status_stamp),    
  YEAR(que_status_stamp),
  DATEPART(hh,que_status_stamp),
  DATEPART(mi,que_status_stamp),
  DATEPART(ss,que_status_stamp),
	text,
	machine,
  evt_num
from	ujo_proc_eventvu
where	joid = @joid
	and	run_num = @run_num

order by event_time_gmt, evt_num

return -999
GO

GO
--SqlScripter----[dbo].[ujo_event_state].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_event_state]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_event_state] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Correct problem with duplicate evt_num values */
/* 15024555 - Ensure unique evt_num values */
ALTER PROCEDURE [dbo].[ujo_event_state]
@eoid        varchar(12),
	@que_status  int,
	@evt_num	 int
AS
/* If it's a 2 (EVENT_DONE), 3 (HDLR_ERROR), or 4 (UN_SENT), copy it to the proc_event table and delete it */
if (@que_status > 1 AND @que_status < 5)
begin
	begin tran
    update ujo_next_oid set oid = oid + 1 where field = 'evt_proc_num'
    if @@rowcount = 0
    begin
        insert into ujo_next_oid (oid, field) values (1, 'evt_proc_num')
        select @evt_num = 1
    end
    else
    begin
    	select @evt_num = oid - 1 from ujo_next_oid where field = 'evt_proc_num'
    end
    commit
    
    begin tran
    insert into ujo_proc_event (eoid, joid, job_name, box_name, AUTOSERV, priority, 
                            event, status, alarm, event_time_gmt, exit_code, machine,
                            pid, jc_pid, run_num, ntry, text, que_priority, stamp,
                            evt_num, que_status, que_status_stamp)
      select ujo_event.eoid, ujo_event.joid, ujo_event.job_name, ujo_event.box_name, 
	      ujo_event.AUTOSERV, ujo_event.priority, ujo_event.event, ujo_event.status, 
	      ujo_event.alarm, ujo_event.event_time_gmt, ujo_event.exit_code, ujo_event.machine, 
	      ujo_event.pid, ujo_event.jc_pid, ujo_event.run_num, ujo_event.ntry, ujo_event.text, 
	      ujo_event.que_priority, ujo_event.stamp, @evt_num, @que_status, getdate()
      from ujo_event
      where eoid = @eoid

    if @@rowcount = 1
    begin
        delete from ujo_event where eoid = @eoid
        commit
    end
	else 
	begin 
		rollback
	end
end
else
begin
	begin tran
	update	ujo_event
	set	que_status = @que_status, que_status_stamp = getdate(), evt_num = @evt_num + 1
		where	eoid = @eoid
	if @@rowcount !=1
	begin
		print 'event_state stored proc has a problem'
		rollback
		return 0
	end
	commit
end

return 1
GO

GO
--SqlScripter----[dbo].[ujo_get_eoid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_eoid]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_eoid] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_eoid    Script Date: 12/1/2005 11:49:48 PM ******/

ALTER PROCEDURE [dbo].[ujo_get_eoid]
AS
    declare @digit0 VARCHAR(1),
            @digit1 VARCHAR(1),
            @digit2 VARCHAR(1),
            @digit3 VARCHAR(1),
            @digit4 VARCHAR(1),
            @digit5 VARCHAR(1),
            @digit6 VARCHAR(1),
            @last_eoid VARCHAR(12),
            @eoid VARCHAR(12),
            @test0 int,
            @test1 int,
            @test2 int,
            @test3 int,
            @test4 int,
            @test5 int,
            @test6 int
           
BEGIN TRANSACTION    
    set @last_eoid = (SELECT counter FROM ujo_last_Eoid_counter (UPDLOCK))

    set @digit0 = SUBSTRING(@last_eoid, 1, 1)
    set @digit1 = SUBSTRING(@last_eoid, 2, 1)
    set @digit2 = SUBSTRING(@last_eoid, 3, 1)
    set @digit3 = SUBSTRING(@last_eoid, 4, 1)
    set @digit4 = SUBSTRING(@last_eoid, 5, 1)
    set @digit5 = SUBSTRING(@last_eoid, 6, 1)
    set @digit6 = SUBSTRING(@last_eoid, 7, 1)
    
    exec ujo_bump_digit @digit6,@digit6 output,@test6 output
    IF @test6 = 1
      begin
      exec ujo_bump_digit @digit5,@digit5 output,@test5 output
         IF @test5 = 1
         begin
         exec ujo_bump_digit @digit4,@digit4 output,@test4 output
          IF @test4 = 1
          begin 
          exec ujo_bump_digit @digit3,@digit3 output,@test3 output
           IF @test3 = 1
           begin 
           exec ujo_bump_digit @digit2,@digit2 output,@test2 output
            IF @test2 = 1
            begin
            exec ujo_bump_digit @digit1,@digit1 output,@test1 output
             IF @test1 = 1
             begin
             exec ujo_bump_digit @digit0,@digit0 output,@test0 output 
              IF @test0 = 1
              begin                         
                set @digit0 = '0'
                set @digit1 = '0'
                set @digit2 = '0'
                set @digit3 = '0'
                set @digit4 = '1'
                set @digit5 = '0'
                set @digit6 = '0'
              end
             end
           end
         end
       end
     end
    end
    
    set @eoid = @digit0 + @digit1 + @digit2 + @digit3 + @digit4 + @digit5 + @digit6                  

    UPDATE ujo_last_Eoid_counter SET counter = @eoid 
COMMIT TRANSACTION
    SELECT @eoid      
    return -999
GO

GO
--SqlScripter----[dbo].[ujo_get_ext_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_ext_event]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_ext_event] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_ext_event    Script Date: 12/1/2005 11:49:49 PM ******/


ALTER PROCEDURE [dbo].[ujo_get_ext_event]
@time0  int,
	@machine  varchar(80)
AS

declare @eoid varchar(12)

delete from ujo_event0


insert	ujo_event0 ( eoid, priority, event_time_gmt, evt_num )

select	eoid, priority, event_time_gmt, evt_num
from	ujo_event
where	que_status = 5
and	machine = @machine
and	event_time_gmt < @time0-1       /* No future events! */


set rowcount 1

select  @eoid = eoid
from	ujo_event0
order by priority, event_time_gmt, evt_num


set rowcount 0

if exists (select 	eoid  		,
	                joid  		,
	                priority 	,
	                event 		,
	                status  	,
	                alarm   	,
	                event_time_gmt	,
	                exit_code 	,
	                machine  	,
	                pid 		,
	                jc_pid 		,
	                run_num  	,
	                ntry 		,
	                text		,
	                datediff(ss, convert(datetime,stamp,101), getdate() ),
	                job_name	,
	                box_name	,
	                que_priority,
	                AUTOSERV

        from 	ujo_event
        where	eoid = @eoid)        
    return 1
else
    return 0
GO

GO
--SqlScripter----[dbo].[ujo_get_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_id]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_id] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_id    Script Date: 12/1/2005 11:49:49 PM ******/
ALTER PROCEDURE [dbo].[ujo_get_id]
@id  int,
	@fld varchar(30)
AS

if @id = 0
begin
	begin tran
	set transaction isolation level SERIALIZABLE
	UPDATE ujo_next_oid set oid=oid+1 where field=@fld
	SELECT oid-1 from ujo_next_oid WHERE field = @fld
	commit tran
	return -999 /*SUCCESS*/
end

UPDATE ujo_next_oid set oid = @id+1 WHERE field=@fld AND oid < @id+1

SELECT @id

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_get_job_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_job_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_job_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_job_status    Script Date: 12/1/2005 11:49:49 PM ******/

ALTER PROCEDURE [dbo].[ujo_get_job_status]
@joid  int
AS
select status from ujo_job_status where joid = @joid

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_get_jobrow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_get_jobrow]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_jobrow] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_get_jobrow]
@joid  int
AS

SELECT  
	j.joid, 
    j.job_name,
    j.job_type,
    j.owner,
    j.permission,
	j.box_joid,
	j.machine,
	j.n_retrys,
	j.date_conditions,
	j.days_of_week,
	j.run_calendar,
	j.exclude_calendar,
	j.start_times,
	j.start_mins,
	j.run_window,
	j.command,	 
    j.description, 
    j.term_run_time,
    j.box_terminator, 
    j.job_terminator,
    j.std_in_file,
    j.std_out_file,
    j.std_err_file,
	j.watch_file,
	j.watch_file_min_size,
	j.watch_interval,
    j.min_run_alarm, 
    j.max_run_alarm, 
    j.alarm_if_fail,
	j.chk_files,
	j.free_procs,
	j.profile,
	j.heartbeat_interval,
	j.auto_hold, 
	j.job_load,
	j.priority, 
	j.auto_delete, 
	j.numero,
	j.max_exit_success, 
	j.box_success, 
	j.box_failure,
	status,
    status_time,
    last_start,
    last_end,
    next_start,
    run_window_end,
	exit_code,
	run_machine,
	que_name,
	jc_pid,
	pid,
	run_num, 
	ntry, 
	appl_ntry, 
	last_heartbeat,
	run_priority,
	next_priority, 
	evt_num, 
	over_num,
	b.job_name, 
	j2.command2,
	j2.external_app, 
	j2.timezone, 
	j2.as_applic,
    j2.as_group,    
	j.send_notification,
    j.service_desk  

FROM  	ujo_job_status s , ujo_job2 j2, ujo_job j 
LEFT OUTER JOIN ujo_job b ON j.box_joid = b.joid
WHERE 	j.joid = @joid AND j2.joid = @joid AND s.joid = @joid

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_get_mach_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_mach_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_mach_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_mach_jobs    Script Date: 12/1/2005 11:49:49 PM ******/
ALTER PROCEDURE [dbo].[ujo_get_mach_jobs]
@machine_name varchar(80)

as
	
	if @machine_name = 'ALL'

		select job_name, ujo_job.machine, run_machine, que_name, status, priority, 
		run_priority, job_load
		from ujo_job, ujo_job_status
		where
		(status = 1 or status = 3 or status = 12 or status = 14) and
		ujo_job.joid = ujo_job_status.joid

	else 
	begin
		if exists (select name from ujo_machine where name = @machine_name)
			select job_name, ujo_job.machine, run_machine, que_name, status, 
			priority, run_priority, job_load
			from ujo_job, ujo_job_status
			where
			(status = 1 or status = 3 or status = 12 or status = 14) and
			ujo_job.joid = ujo_job_status.joid and
			(ujo_job.machine = @machine_name or
			 run_machine = @machine_name or
			 que_name = @machine_name)

		--else
		--	print "This machine is not defined to AutoSys."
	end
return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_get_machine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_get_machine]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_machine] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_get_machine]
@machine_name varchar(80)

as
	declare @machine_type char(1)

	if @machine_name = 'ALL'
		select distinct name, parent_name, que_name, type, factor, max_load, mstatus
		from ujo_machine 
	else
	begin
		if exists (select name from ujo_machine where name = @machine_name)
			select name, parent_name, que_name, type, factor, max_load, mstatus
			from ujo_machine where 
			name = @machine_name or 
			parent_name = @machine_name or 
			que_name = @machine_name
		--else
		--	print 'machine is not defined to AutoSys' 
	end
return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_get_run_num].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_get_run_num]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_get_run_num] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_get_run_num    Script Date: 12/1/2005 11:49:50 PM ******/
ALTER PROCEDURE [dbo].[ujo_get_run_num]
AS

declare	@joid int,
	   @stamp datetime, 
	   @status int, 
	   @run_num int
	   
update ujo_next_run_num  set run_num = run_num + 1

if ( @@rowcount = 0 )
begin   
	insert into ujo_next_run_num( run_num )
	select max(run_num) + 1 from ujo_job_status
end

select run_num from ujo_next_run_num

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_glob_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_glob_set]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_glob_set] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_glob_set    Script Date: 12/1/2005 11:49:50 PM ******/

ALTER PROCEDURE [dbo].[ujo_glob_set]
@glo_name 	varchar(64),
	@value		varchar(100),
	@value_set_time	int
AS

IF @value = 'DELETE'
BEGIN
	DELETE	ujo_glob
	WHERE	glo_name = @glo_name
	return 1
END


IF NOT EXISTS ( select glo_name from ujo_glob where glo_name = @glo_name )
BEGIN
	/* First time in - do an INSERT */
	INSERT ujo_glob ( glo_name, value, value_set_time )
	VALUES	( @glo_name, @value, @value_set_time )

	return 1
END

/* Do an update */

UPDATE	ujo_glob
SET	value = @value,
	value_set_time = @value_set_time
WHERE	glo_name = @glo_name

return 1
GO

GO
--SqlScripter----[dbo].[ujo_init_jobset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_init_jobset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_init_jobset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_init_jobset    Script Date: 12/1/2005 11:49:50 PM ******/
ALTER PROCEDURE [dbo].[ujo_init_jobset]
AS
select
	j.joid,
	j.job_name,
	j.job_type,
	j.box_joid,  
	b.job_name,    /* box_name */
	j.n_retrys,
	j.date_conditions,
	j.days_of_week,
	j.run_calendar,
	j.exclude_calendar,
	j.start_times,
	j.start_mins,
	j.run_window,	
	j.term_run_time,
	j.box_terminator,
	j.job_terminator,
	j.min_run_alarm,
	j.max_run_alarm,
	j.alarm_if_fail,
	j.auto_hold,
	j.job_load,
	j.priority,
	j.auto_delete,
	j.max_exit_success,
	j.box_success,
	j.box_failure,
	avg_runtime
from ujo_job j left join ujo_avg_job_runs on j.joid = ujo_avg_job_runs.joid,ujo_job j2 left join ujo_job b on j2.box_joid = b.joid

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_job_lookup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_job_lookup]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_job_lookup] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_job_lookup    Script Date: 12/1/2005 11:49:50 PM ******/


ALTER PROCEDURE [dbo].[ujo_job_lookup]
@job_name	varchar(65),
	@job_type	char(1),
	@box_name	varchar(65)

AS
if @job_name != '%'
	select @job_name=@job_name + '%'

select	j.joid, 
	substring( j.job_name + '                             '  , 1, 65 ),
	j.job_type,
	substring( b.job_name + '                             ', 1, 65 )
FROM ujo_job j right join ujo_job b on b.joid = j.box_joid
where	j.job_name like @job_name 

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_lic_check].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_lic_check]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_lic_check] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_lic_check    Script Date: 12/1/2005 11:49:50 PM ******/

ALTER PROCEDURE [dbo].[ujo_lic_check]
@insert		int,
@curr_machine	varchar(80),
@curr_joid	int

AS

declare @this_machine int
declare @total_machines int

if @insert = 1
	begin
		insert ujo_lic_machine(machine, first_stamp, first_joid, recent_stamp, recent_joid)
				values(@curr_machine, getdate(), @curr_joid, getdate(), @curr_joid)
	end
else
	begin
		update ujo_lic_machine
		set
			recent_stamp = getdate(),
			recent_joid = @curr_joid
		where
			machine = @curr_machine

	end

	select @this_machine = count(*) from ujo_lic_machine where machine = @curr_machine
	select @total_machines = count(*) from ujo_lic_machine

	select  @this_machine, @total_machines
GO

GO
--SqlScripter----[dbo].[ujo_move_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_move_event]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_move_event] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_move_event]
@eoid        varchar(12),
	@que_status  int
AS

declare @error_var     int, 
        @rowcount_var  int
        
	if( @eoid is null )
	begin
		raiserror ('Input parameter eoid cannot be null', 16, 1)
		return -1
   	end
   	else if( @que_status is null )
	begin
		raiserror ('Input parameter que_status cannot be null', 16, 1)
		return -1
   	end
   	
   	select @error_var = 0
	select @rowcount_var = 0
	
	update	ujo_event
	set	que_status = @que_status
		where eoid = @eoid

	SELECT @error_var = @@error, @rowcount_var = @@rowcount		
	
	if (@error_var != 0 )	
	begin
		raiserror ('procedure ujo_move_event failed during update with error:%d', 16, 1, @error_var)		
		return -1
	end    
	
	if (@rowcount_var !=1)
	begin		
		raiserror ('Invalid Event(%s)', 16, 1, @eoid)		
		return 0
	end
	
   	
   	select @error_var = 0
	select @rowcount_var = 0
	
	insert into ujo_proc_event (eoid, joid, job_name, box_name, AUTOSERV, priority, 
	                            event, status, alarm, event_time_gmt, exit_code, machine,
	                            pid, jc_pid, run_num, ntry, text, que_priority, stamp,
	                            evt_num, que_status, que_status_stamp)
	select *
	from ujo_event
	where eoid = @eoid
	
	SELECT @error_var = @@error, @rowcount_var = @@rowcount		
	
	if (@error_var != 0 )	
	begin
		raiserror ('procedure ujo_move_event failed inserting event into ujo_proc_event with error:%d', 16, 1, @error_var)
		return -1
	end    
	
	if (@rowcount_var = 1)
	begin
		delete from ujo_event where eoid = @eoid
	end
	
return 1
GO

GO
--SqlScripter----[dbo].[ujo_put_jobrow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_put_jobrow]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_put_jobrow] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_put_jobrow    Script Date: 12/1/2005 11:49:50 PM ******/


ALTER PROCEDURE [dbo].[ujo_put_jobrow]
@insert		int,
@joid 		int,
@job_name	varchar(64),
@job_type	char(1),
@owner		varchar(80),
@permission	varchar(30),
@box_joid	int,
@box_name	varchar(64),
@machine	varchar(80),
@n_retrys	int,
@date_conditions	tinyint,
@days_of_week	varchar(80),
@run_calendar	varchar(30),
@exclude_calendar	varchar(30),
@start_times	varchar(255),
@start_mins	varchar(255),
@run_window	varchar(20),
@command	varchar(255),
@description	varchar(255),
@term_run_time	int,
@box_terminator	tinyint,
@job_terminator	tinyint,
@std_in_file	varchar(255),
@std_out_file	varchar(255),
@std_err_file	varchar(255),
@watch_file	varchar(255),
@watch_file_min_size	int,
@watch_interval	int,
@min_run_alarm	int,
@max_run_alarm	int,
@alarm_if_fail	tinyint,
@chk_files	varchar(255),
@free_procs	int,
@profile	varchar(255),
@heartbeat_interval	int,
@auto_hold	tinyint,
@job_load		int,
@priority	int,
@auto_delete	int,
@numero		int,
@max_exit_success	int,
@box_success	varchar(255),
@box_failure	varchar(255),
@avg_runtime	int,
@command2	varchar(255),
@external_app	varchar(40),
@timezone		varchar(50),
@create_modify_user	varchar(80),
@as_applic 	varchar(64),
@as_group    varchar(64),
@send_notification  char(1),
@service_desk int

AS

declare @boxid int

if  @box_name = ''
begin
	set @boxid = NULL
end

else
begin
	select @boxid = joid from ujo_job 
	where job_name = @box_name AND job_type = 'b'

	if (@@rowcount = 0 )
	begin
		return -1
	end

end

set @box_joid = @boxid


if @insert = 1
BEGIN

	if ( select TOP 1 1 from ujo_job where job_name=@job_name ) = 1
	BEGIN
		return -2
	END
	INSERT INTO ujo_job(
	 joid
	,job_name
	,job_type	
	,owner
	,permission
	,box_joid	
	,machine	
	,n_retrys	
	,date_conditions
	,days_of_week
	,run_calendar
	,exclude_calendar
	,start_times
	,start_mins
	,run_window
	,command	
	,description	
	,term_run_time	
	,box_terminator	
	,job_terminator	
	,std_in_file
	,std_out_file	
	,std_err_file	
	,watch_file
	,watch_file_min_size
	,watch_interval
	,min_run_alarm	
	,max_run_alarm	
	,alarm_if_fail	
	,chk_files
	,free_procs
	,profile
	,heartbeat_interval
	,auto_hold
	,job_load
	,priority
	,auto_delete
	,numero
	,max_exit_success
	,box_success
	,box_failure
	,send_notification
	,service_desk
	)
	VALUES (
	 @joid
	,@job_name	
	,@job_type	
	,@owner
	,@permission
	,@box_joid	
	,@machine	
	,@n_retrys	
	,@date_conditions
	,@days_of_week
	,@run_calendar
    ,@exclude_calendar
    ,@start_times
    ,@start_mins
	,@run_window
	,@command		
	,@description
	,@term_run_time
	,@box_terminator
	,@job_terminator
	,@std_in_file
	,@std_out_file	
	,@std_err_file
	,@watch_file
	,@watch_file_min_size
	,@watch_interval	
	,@min_run_alarm	
	,@max_run_alarm	
	,@alarm_if_fail	
	,@chk_files
	,@free_procs
	,@profile
	,@heartbeat_interval
	,@auto_hold
	,@job_load
	,@priority
	,@auto_delete
	,@numero
	,@max_exit_success
    ,@box_success
    ,@box_failure
    ,@send_notification
    ,@service_desk
	)
	if @@rowcount = 0
		return -1

	/* Setup the job2 table */

	INSERT INTO ujo_job2 (
	joid,
	command2,
	external_app,
	timezone,
	create_user,
	create_stamp,
	modify_user,
	modify_stamp,
	as_applic,
	as_group	
	)
	VALUES (
	@joid,
	@command2,	
	@external_app,
	@timezone,	
	@create_modify_user,
	getdate(),
	@create_modify_user,
	getdate(),
	@as_applic,
	@as_group
	
	)

	/* stub out some rows so the things work! */
	/* start with status = 8 (INACTIVE)       */

	INSERT INTO ujo_job_status ( joid, status, status_time,
		last_start, last_end, next_start, run_priority, exit_code, 
		ntry, run_num, pid, jc_pid )
	VALUES ( @joid, 8, 0,0,0, 0,-1, 
				 -656, 0, 0, -1, -1)
END

ELSE
BEGIN
	/* Its an UPDATE  */

	UPDATE ujo_job
	SET

	 job_name = @job_name	
	,job_type = @job_type	
	,owner = @owner
	,permission = @permission
	,box_joid = @box_joid	
	,machine = @machine	
	,n_retrys = @n_retrys	
	,date_conditions = @date_conditions
	,days_of_week = @days_of_week
	,run_calendar = @run_calendar
	,exclude_calendar = @exclude_calendar
	,start_times = @start_times
	,start_mins = @start_mins
	,run_window = @run_window
	,command = @command		
	,description = @description
	,term_run_time = @term_run_time
	,box_terminator = @box_terminator
	,job_terminator = @job_terminator
	,std_in_file = @std_in_file
	,std_out_file = @std_out_file	
	,std_err_file = @std_err_file
	,watch_file = @watch_file
	,watch_file_min_size = @watch_file_min_size
	,watch_interval = @watch_interval	
	,min_run_alarm = @min_run_alarm	
	,max_run_alarm = @max_run_alarm	
	,alarm_if_fail = @alarm_if_fail	
	,chk_files = @chk_files
	,free_procs = @free_procs
	,profile = @profile
	,heartbeat_interval = @heartbeat_interval
	,auto_hold = @auto_hold
	,job_load = @job_load
	,priority = @priority
	,auto_delete = @auto_delete
	,numero = @numero
	,max_exit_success = @max_exit_success
	,box_success = @box_success
	,box_failure = @box_failure
	,send_notification = @send_notification
    ,service_desk = @service_desk

	WHERE	joid = @joid


	if @@rowcount = 0
		return -1

	UPDATE  ujo_job2
	SET
	command2 = @command2,	
	external_app = @external_app,
	timezone = @timezone,	
	modify_user = @create_modify_user,
	modify_stamp = getdate(),
	as_applic = @as_applic,
	as_group = @as_group	

	WHERE   joid = @joid

END

/* See if we gotta set the avg_runtime */

if @avg_runtime > 0
BEGIN
	DELETE ujo_avg_job_runs WHERE joid=@joid
	INSERT ujo_avg_job_runs( joid, avg_runtime, num_runs )
	VALUES ( @joid, @avg_runtime, -1 ) /* -1 sez it wuz manual */
END

return 1
GO

GO
--SqlScripter----[dbo].[ujo_put_monbro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_put_monbro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_put_monbro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_put_monbro    Script Date: 12/1/2005 11:49:50 PM ******/

ALTER PROCEDURE [dbo].[ujo_put_monbro]
@name		varchar(30),
	@mon_mode	char(1),
	@do_output	char(1),
	@sound		tinyint,
	@alarm_verif	tinyint,
	@alarm		tinyint,
	@all_events	tinyint,
	@all_status	tinyint,
	@running	tinyint,
	@success	tinyint,
	@failure	tinyint,
	@terminate	tinyint,
	@starting	tinyint,
	@restart	tinyint,
	@on_ice		tinyint,
	@on_hold	tinyint,
	@job_filter	char(1),
	@job_name	varchar(64),
	@currun		tinyint,
	@after_time	varchar(20),
	@autoserv	varchar(30)

AS


if not exists ( select * from ujo_monbro where name = @name )
begin
	insert ujo_monbro (
	name		,
	mon_mode		,
	do_output		,
	sound		,
	alarm_verif	,
	alarm		,
	all_events		,
	all_status	,
	running		,
	success		,
	failure		,
	terminate	,
	starting	,
	restart		,
	on_ice		,
	on_hold		,
	job_filter	,
	job_name	,
	currun		,
	after_time	,
	autoserv
	)
	values (
	@name		,
	@mon_mode	,
	@do_output		,
	@sound	,
	@alarm_verif	,
	@alarm		,
	@all_events		,
	@all_status	,
	@running	,
	@success	,
	@failure	,
	@terminate	,
	@starting	,
	@restart	,
	@on_ice		,
	@on_hold	,
	@job_filter	,
	@job_name		,
	@currun		,
	@after_time	,
	@autoserv
	)

		
	return 1
	
end

/* Must be an update  */


update	ujo_monbro
set	
	name		=	@name,
	mon_mode	=	@mon_mode,
	do_output	=	@do_output,
	sound		=	@sound,
	alarm_verif	=	@alarm_verif,
	alarm		=	@alarm	,
	all_events	=	@all_events	,
	all_status	=	@all_status,
	running		=	@running,
	success		=	@success	,
	failure		=	@failure	,
	terminate	=	@terminate,
	starting	=	@starting,
	restart		=	@restart,
	on_ice		=	@on_ice	,
	on_hold		=	@on_hold,
	job_filter	=	@job_filter,
	job_name	=	@job_name	,
	currun		=	@currun	,
	after_time	=	@after_time,
	autoserv	=	@autoserv

where	name = @name

if @@rowcount = 1
	return 1

return -1
GO

GO
--SqlScripter----[dbo].[ujo_put_sendbuf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_put_sendbuf]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_put_sendbuf] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_put_sendbuf    Script Date: 12/1/2005 11:49:51 PM ******/

ALTER PROCEDURE [dbo].[ujo_put_sendbuf]
@eoid		varchar(12),
	@serverdb	varchar(40)

AS


if exists ( select eoid from ujo_send_buffer
		 where eoid = @eoid AND serverdb = @serverdb )
    return 1


insert ujo_send_buffer ( eoid, serverdb, stamp, send_status )
values ( @eoid, @serverdb, getdate(), 0 )

if @@rowcount = 1
	return 1

return -1
GO

GO
--SqlScripter----[dbo].[ujo_return_int].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_return_int]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_return_int] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_return_int    Script Date: 12/1/2005 11:49:14 PM ******/

ALTER PROCEDURE [dbo].[ujo_return_int]
@input int

as
	return @input
GO

GO
--SqlScripter----[dbo].[ujo_send_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ujo_send_event]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_send_event] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[ujo_send_event]
@eoid       varchar(12),
    @joid       int,
    @job_name   varchar(64),
    @box_name   varchar(64),
    @AUTOSERV   varchar(30),
    @priority   int,
    @event      int,
    @status     int,
    @alarm      int,
    @event_time_gmt int,
    @exit_code  int,
    @machine    varchar(80),
    @pid        int,
    @jc_pid     int,
    @run_num    int,
    @ntry       int,
    @text       varchar(255),
    @que_priority   int    

AS
declare @counter varchar(7)
declare @evt_num int
declare @l_instance varchar(4)
declare @l_event_time_gmt int
declare @l_gmt_offset int
declare @job_type char(1)
declare @count int

declare @charpos int
declare @nod_name varchar(65)
declare @nod_ckpt varchar(16)
declare @nod_boot varchar(16)

/* STAR 11631087 */
if (@event = 101 AND
    (@status = 1 OR @status = 4 OR @status = 5 OR @status = 6 OR @status = 10))
begin
    select @priority = 10
end

select @l_instance = str_val from ujo_alamode where type = 'AUTOSERV'
update ujo_next_oid set oid = oid + 1 where field = 'evt_num'
select @evt_num = oid - 1 from ujo_next_oid where field = 'evt_num'

if ( @l_instance != @AUTOSERV OR (@event = 101 AND (@status = 1 OR @status = 3 OR @status = 4 OR @status = 5 OR @status = 6 OR @status = 10)) )
begin
    select @l_event_time_gmt = datediff( ss,'01/01/1970', getdate() )
    select @l_gmt_offset = int_val from ujo_alamode where type = 'gmt_offset'
    select @l_event_time_gmt =  @l_event_time_gmt + @l_gmt_offset
    if (@event = 101 AND @status = 10)
    begin
        select @l_event_time_gmt = @l_event_time_gmt + 2
    end

end
else
begin
    select @l_event_time_gmt = @event_time_gmt
end

/* Update the asbnode table if necessary */
if (substring(@eoid, 4, 1) = 'y')
begin
    select @charpos = charindex('$$UJM_NODE$$', @text)
    if (@charpos != 0)
    begin
        select @nod_name = substring(@text, @charpos + 12, 65)
        select @nod_name = upper(@nod_name)
        select @nod_ckpt = substring(@text, @charpos + 77, 16)
        select @nod_boot = substring(@text, @charpos + 93, 16)

        if (select TOP 1 1 from ujo_asbnode where nod_name=@nod_name) = 1
        begin
            update ujo_asbnode set nod_ckpt=@nod_ckpt, nod_boot=@nod_boot
                where nod_name=@nod_name
        end
        else
        begin            
            insert into ujo_asbnode (nod_name, nod_ckpt, nod_boot)
                values (@nod_name, @nod_ckpt, @nod_boot)
        end
    end
end

/* Added for issue number 9344983 - Xia Lin */
if (@event = 12345)
begin
   select @event = 101

   if (@status = 1 OR @status = 3 OR @status = 4 OR @status = 5 OR @status = 6 OR @status = 8)
   begin
      select @l_event_time_gmt = @event_time_gmt
   end
end

/* Ended for issue number 9344983 - Xia Lin */
if exists(select eoid from ujo_event where eoid = @eoid) or exists(select eoid from ujo_proc_event where eoid = @eoid)
begin
    if exists ( select eoid from ujo_event where eoid = @eoid and
        (job_name = @job_name AND event = @event AND status = @status
        AND ntry = @ntry ))
       or exists ( select eoid from ujo_proc_event where eoid = @eoid and
        (job_name = @job_name AND event = @event AND status = @status
        AND ntry = @ntry ))
    /* Issue 10725507/2 -sinpr01 don't compare event_time_gmt */
    begin
        /* Really is the same event */
        print 'This Event was already here'
        return 1
    end

    select @counter = counter from ujo_last_Eoid_counter

    insert ujo_event2
    ( eoid,stamp,joid,job_name,box_name,AUTOSERV,
    priority,event,status,alarm,
    event_time_gmt,exit_code,
    machine,pid, jc_pid, run_num, ntry, text, que_priority,
    evt_num, que_status, que_status_stamp,
    counter
    )
    values  ( @eoid, getdate(),@joid,@job_name,@box_name,@AUTOSERV,
    @priority,@event, @status, 
    @alarm, @l_event_time_gmt, @exit_code, 
    @machine, @pid, @jc_pid, @run_num, @ntry, @text, @que_priority,
    @evt_num, 0, getdate(),
    @counter )

    print 'Detected duplicate event.'
    return -1       /* -1 => SE_DUP_EVENT */
end
/* get a run_num (Needed for autorep reports sendevents & missing heartbeat) */
    /* IF this causes blocks, we'll think about it
    */

if @run_num = 0 and @joid != 0
begin
    select  @run_num = run_num 
    from    ujo_job_status 
    where   joid = @joid

    if @run_num is NULL
    begin
        select @run_num = 0
    end
end

/* PUT this INTO the event table */

insert  ujo_event
    ( eoid,stamp,joid,job_name,box_name,AUTOSERV,
    priority,event,status,alarm,
    event_time_gmt,exit_code,
    machine,pid, jc_pid, run_num, ntry, text, que_priority,
    evt_num, que_status, que_status_stamp )
values  ( @eoid, getdate(),@joid,@job_name,@box_name,@AUTOSERV,
    @priority,@event, @status, 
    @alarm, @l_event_time_gmt, @exit_code, 
    @machine, @pid, @jc_pid, @run_num, @ntry, @text, @que_priority,
    @evt_num, 0, getdate() )    
  

if @@rowcount = 1
begin
    if ( @event = 106 )  /* ALARM! - stub out alarm table */
    begin
        insert  ujo_alarm
            ( eoid,alarm,alarm_time,job_name,joid,
              state,state_time,evt_num, event_comment,
              len, response )
        values  ( @eoid,@alarm,@l_event_time_gmt,@job_name,@joid,
              43, @l_event_time_gmt, 0, @text, /*43=OPEN*/
              1, ' ' )
    end    
    return 1
end
return 2
GO

GO
--SqlScripter----[dbo].[ujo_sendevent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_sendevent]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_sendevent] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_sendevent    Script Date: 12/1/2005 11:50:13 PM ******/

ALTER PROCEDURE [dbo].[ujo_sendevent]
@eventtxt       varchar(20),
	@job_name       varchar(100), /* Bigger cuz SET_GLOBAL over-loads it */
	@statustxt      varchar(20),
	@alarmtxt       varchar(30),
	@event_time     datetime,
	@text           varchar(255)
AS
declare
	@eoid           varchar(22),
	@seq_num        int,
	@event          int,
	@status         int,
	@alarm          int,
	@joid           int,
	@event_time_gmt int,
	@gmt_offset     int,
	@box_name       varchar(65),
	@box_joid       int,
	@AUTOSERV       varchar(3),
	@i              int

select @event=code from ujo_intcodes where fld='event' and text=@eventtxt

if @@rowcount = 0
begin
	print 'Invalid EVENT'
	return 0
end

select @alarm = 0

if @eventtxt='ALARM'
begin
	select @alarm=code from ujo_intcodes where fld='alarm' and text=@alarmtxt
	if @@rowcount=0
	begin
		print 'Invalid ALARM'
		return 0
	end
end

select @status = 0

if @eventtxt='CHANGE_STATUS'
begin
	select @status=code from ujo_intcodes where fld='status' and text=@statustxt
	if @@rowcount=0
	begin
		print 'Invalid STATUS'
		return 0
	end
end

select @joid = 0
select @box_name = ''

if @eventtxt='SET_GLOBAL'
begin
	select @i = charindex( '=', @job_name )
	if @i = 0
	begin
		print 'SET_GLOBAL Syntax:  Global=Value'
		return 0
	end

	select @box_name=substring( @job_name,@i+1,100 )
	select @job_name=substring( @job_name, 1, @i-1 )
end

ELSE
begin
	if @job_name!=''
	begin
		select @joid=joid,@box_joid=box_joid from ujo_job where job_name=@job_name
		if @@rowcount=0
		begin
			print 'Invalid Job Name'
			return 0
		end

		if @box_joid > 0
		begin
			select @box_name=job_name from ujo_job where joid=@box_joid
		end
	end
end


if @joid = 0
begin
	if @eventtxt='CHANGE_STATUS' or @eventtxt='STARTJOB' 
	or @eventtxt='FORCE_STARTJOB' or @eventtxt='KILLOB' 
	or @eventtxt='JOB_ON_ICE' or @eventtxt='JOB_OFF_ICE'
	or @eventtxt='JOB_ON_HOLD' or @eventtxt='JOB_OFF_HOLD'
	or @eventtxt='DELETEJOB'
	begin
		print 'Job Name Required'
		return 0
	end
end

/* Now do the time stuff */

if @event_time is NULL or @event_time=''
begin
	select @event_time=getdate()
end

select @event_time_gmt = datediff( ss, '1/1/1970', @event_time )
select @gmt_offset = int_val from ujo_alamode where type = 'gmt_offset'

select @event_time_gmt = @event_time_gmt + @gmt_offset


select @AUTOSERV = str_val FROM ujo_alamode where type='AUTOSERV'


/* get the eoid */

begin tran
UPDATE ujo_next_oid set oid=oid+1 where field='eoid'
SELECT @seq_num=oid-1 from ujo_next_oid WHERE field = 'eoid'
commit tran

select @eoid = @AUTOSERV + 'z' + convert(varchar(10),@seq_num)


/* Send it off */

exec ujo_send_event @eoid,@joid,@job_name,@box_name,
	@AUTOSERV, 10, @event,@status,@alarm,@event_time_gmt,
	-656,'',0,0,0,0,@text,0


return 1
GO

GO
--SqlScripter----[dbo].[ujo_set_Eoid_counter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_set_Eoid_counter]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_set_Eoid_counter] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_set_Eoid_counter    Script Date: 12/1/2005 11:49:51 PM ******/

ALTER PROCEDURE [dbo].[ujo_set_Eoid_counter]
@counter  char(7)
AS
declare @l_counter char(7)



UPDATE ujo_last_Eoid_counter
SET counter = @counter
WHERE counter < @counter
OR counter='zzzzzzz'  /* to handle rollover */

return 1
GO

GO
--SqlScripter----[dbo].[ujo_set_job_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_set_job_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_set_job_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_set_job_status    Script Date: 12/1/2005 11:49:51 PM ******/
ALTER PROCEDURE [dbo].[ujo_set_job_status]
@joid  int,
	@status  tinyint,
	@gmt	int,
	@evt_num int
AS

update	ujo_job_status
set	status = @status,
	status_time = @gmt,
	evt_num = @evt_num
where	joid = @joid

if @@rowcount = 1  return 1

return 0
GO

GO
--SqlScripter----[dbo].[ujo_set2act].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_set2act]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_set2act] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_set2act    Script Date: 12/1/2005 11:49:51 PM ******/

ALTER PROCEDURE [dbo].[ujo_set2act]
@status  int,
	@run_num int,  /* if = 0 its a restart of a box */
	@joid  int,
	@gmt   int
AS

declare @auto_hold  tinyint, 
	@auto_hold_over tinyint,
	@curr_status  int,
	@over_num int,
	@job_name varchar(64),
	@has_ext  int,
	@isbox_job int,
	@box_status int

SELECT @isbox_job = 0

/* Get the Current Status */

SELECT 	@curr_status = status, @over_num=over_num
FROM 	ujo_job_status 
WHERE 	joid = @joid


/* See if its an Autohold Job - job_name is used later */

select 	@job_name = job_name, @auto_hold = auto_hold 
from 	ujo_job 
where 	joid = @joid

/* Check whether job is inside the box */
select @isbox_job = box_joid
from ujo_job
where joid = @joid and box_joid != NULL

/* if box job get the status */
if (@isbox_job > 0)
begin
    select @box_status = status
    from ujo_job_status
    where joid = @isbox_job
end

/* If theres an override in effect, see if its the auto_hold one */

if ( @over_num > 0 )
BEGIN
	select @auto_hold_over = auto_hold from ujo_overjob 
	WHERE joid=@joid AND over_num = @over_num

	/* if @auto_hold_over = 10 its sez NO OVERRIDE */
	IF @@rowcount=1 AND @auto_hold_over != 10
	BEGIN
		SELECT @auto_hold = @auto_hold_over
	END
END


/* If auto_hold and its changing to ACTIVATED, make it ON_HOLD */

if ( @auto_hold = 1 AND @status = 9 )  SELECT @status = 11


/* If for some reason its in QUE_WAIT, blow it off */

if ( @curr_status = 12 )
BEGIN
	DELETE	ujo_wait_que
	WHERE	joid = @joid
END


/* If ACTIVATE and ON_ICE or  ON_HOLD, just quit */
if ( @status=9 AND (@curr_status = 7 OR @curr_status = 11) )
	return 1

/* If INACTIVATE and ON_ICE just quit */
if ( @status=8 AND (@curr_status = 7 OR @curr_status = 11) )
	return 1

/* If box job and box status is ON_ICE or ON_HOLD just quit. */
if (@isbox_job > 0 AND (@box_status =7 OR @box_status = 11))
    return 1

/* IF its a normal start, change the statuses */

if ( @run_num > 0 )
BEGIN
	if ( @status = 8 )
	/* Dont reset times OR ntry if going to INACTIVE */
	BEGIN
		UPDATE	ujo_job_status 
		SET 	status = @status,
			status_time = @gmt, run_num = @run_num , 
			exit_code=-656
		WHERE	joid = @joid
	END
	
	else
	BEGIN
		UPDATE	ujo_job_status 
		SET 	status = @status,
			status_time = @gmt, run_num = @run_num , 
			ntry = 0, exit_code=-656,
			last_start=0,last_end=0
		WHERE	joid = @joid
	END

END
ELSE
BEGIN

	/* IF its a restart, change the statuses only if they arent running.
	   otherwise we could start up mutiples */

	if ( @run_num = 0 AND @curr_status != 1 AND @curr_status != 3)
				/* RUNNING, STARTING */
	BEGIN
		UPDATE	ujo_job_status 
		SET 	status = @status,
			status_time = @gmt, last_start=0,last_end=0,
			exit_code=-656
		WHERE	joid = @joid

	END

END

/* NOW see if it has a External status to send */

if EXISTS ( select job_name FROM ujo_req_job WHERE job_name=@job_name )
	select @has_ext = 1
else
	select @has_ext = 0


/* See if it was in the QUE_WAIT state */
if @curr_status = 12 and @status != 9
BEGIN
	if  @has_ext=1
		return 4
	else
		return 3
END

if @has_ext=1
	return 2

return 1
GO

GO
--SqlScripter----[dbo].[ujo_setNget_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_setNget_status]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_setNget_status] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_setNget_status    Script Date: 12/1/2005 11:50:13 PM ******/

ALTER PROCEDURE [dbo].[ujo_setNget_status]
@i_pid           int,
                           @i_time_stamp    int,
                           @i_hostname      varchar(255),
                           @i_designator    varchar(20),
                           @i_status        varchar(20),
                           @i_state         varchar(20)
                          
AS

declare @l_ha_designator_id    int
declare @l_ha_status_id        int
declare @l_ha_state_id         int
declare @l_num_rows            int
declare @l_current_state       varchar(20)
declare @l_pid		           decimal(16)
declare @l_time_stamp          decimal(16)
declare @l_hostname            varchar(255)
declare @l_dname		       varchar(20)
declare @l_sname		       varchar(20)
declare @l_state		       varchar(20)


  /* Validate the designator */

  /* Validate the designator */
  select   @l_num_rows = 0  
  SELECT   @l_ha_designator_id = id
  FROM     ujo_ha_designator
  WHERE    name     = @i_designator
 
  if (@@rowcount =0)
  begin   
     print 'Invalid designator value'
     return 1
  end

 /* Validate the status */


  SELECT   @l_ha_status_id = id
  FROM     ujo_ha_status
  WHERE    name     =@i_status

  if (@@rowcount = 0)
  begin 
     print 'Invalid status value'
     return 1
  end

  /* Validate the state */


  SELECT   @l_ha_state_id = id
  FROM     ujo_ha_state
  WHERE    name     = @i_state

  if (@@rowcount = 0) 
  begin
     print 'Invalid state value'
     return 1
  end

  /* First thing we need to do is search for a row with the designator,
   if it's not there, insert it, otherwise update it. */
  
if  (        SELECT TOP 1 1 
             FROM      ujo_ha_process
             WHERE     ha_designator_id = @l_ha_designator_id) > 0
begin       
     UPDATE   ujo_ha_process
     SET      pid               = @i_pid,
              time_stamp        = @i_time_stamp,
              hostname          = @i_hostname,
              ha_status_id      = @l_ha_status_id
     WHERE    ha_designator_id  = @l_ha_designator_id   
end
else
begin
     INSERT INTO ujo_ha_process ( pid, time_stamp, hostname, ha_designator_id, ha_status_id)
        VALUES ( @i_pid, @i_time_stamp, @i_hostname, @l_ha_designator_id, @l_ha_status_id)
end

 /* Commit the time_stamp update */
  
COMMIT

/* state check 'n set - see diagram above! */
/*   Note:  We want to lock access to this table while we review its content and */
/*          decide what to do. */

  
  SELECT   @l_current_state = h.name
  FROM     ujo_sys_ha_state sys,
           ujo_ha_state h
  WHERE    sys.ha_state_id      = h.id
  
/* Do we transition? */

  if (@l_current_state = 'Normal'      AND @i_state = 'Pending')
                                      OR
     (@l_current_state = 'Pending'     AND @i_state = 'Failed-over')
                                      OR
     (@l_current_state = 'Failed-over' AND @i_state = 'Pending')
                                      OR
     (@l_current_state = 'Pending'     AND @i_state = 'Normal')

  begin

     UPDATE   ujo_sys_ha_state
     SET      ha_state_id    = @l_ha_state_id

     SELECT @l_state = @i_state
  end
  ELSE
  begin
     /* Either we're not allowed to switch states, or the state didn't change! */

     SELECT @l_state = @l_current_state
     
  end
  COMMIT


 /*    return ujo_ha_process data    */

  SELECT    p.pid,
            p.time_stamp,
            p.hostname,
            d.name,
            s.name
  
  FROM     ujo_ha_process    p,
           ujo_ha_designator d,
           ujo_ha_status     s
  WHERE    p.ha_designator_id  = d.id
  AND      p.ha_status_id      = s.id
  ORDER BY
           d.name
  
  
  commit
  
 
return 0
GO

GO
--SqlScripter----[dbo].[ujo_sum_rep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_sum_rep]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_sum_rep] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_sum_rep    Script Date: 12/1/2005 11:49:51 PM ******/

ALTER PROCEDURE [dbo].[ujo_sum_rep]
@joid int

AS

SELECT 	job_name,job_type,status,last_start,last_end,
	run_num,ntry,exit_code,run_priority 
FROM 	ujo_jobst 
WHERE 	joid=@joid

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[ujo_time_offset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ujo_time_offset]') IS NULL EXEC('CREATE PROCEDURE [dbo].[ujo_time_offset] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.ujo_time_offset    Script Date: 12/1/2005 11:49:14 PM ******/

ALTER PROCEDURE [dbo].[ujo_time_offset]
@time_in  varchar(30)
AS

select datediff( ss, convert(datetime,@time_in,101), getdate() )

return -999 /*SUCCESS*/
GO

GO
--SqlScripter----[dbo].[UPDATE_UND_JOB_STATUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[UPDATE_UND_JOB_STATUS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[UPDATE_UND_JOB_STATUS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.UPDATE_UND_JOB_STATUS    Script Date: 12/1/2005 11:49:14 PM ******/

/****** Object:  Stored Procedure UPDATE_UND_JOB_STATUS    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[UPDATE_UND_JOB_STATUS]
(@job_id_1 	[bigint],
	 @status_2 	[nvarchar](75) )

AS UPDATE [srdb].[und_job] 

SET  [status]	 = @status_2,
	 [dt_last_modified]	 = getdate() 

WHERE 
	( [job_id]	 = @job_id_1)
GO

GO
--SqlScripter----[dbo].[UPDATE_UND_TASK_STATUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[UPDATE_UND_TASK_STATUS]') IS NULL EXEC('CREATE PROCEDURE [dbo].[UPDATE_UND_TASK_STATUS] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.UPDATE_UND_TASK_STATUS    Script Date: 12/1/2005 11:49:14 PM ******/

/****** Object:  Stored Procedure UPDATE_UND_TASK_STATUS    Script Date: 3/25/2005 2:24:50 PM ******/
ALTER PROCEDURE [dbo].[UPDATE_UND_TASK_STATUS]
(@task_id_1 	[bigint],
	 @status_2 	[nvarchar](50))

AS UPDATE [srdb].[und_task] 

SET  [status]	 = @status_2,
	 [dt_last_modified]	 = getdate()

WHERE 
	( [task_id]	 = @task_id_1)
GO

GO
--SqlScripter----[dbo].[UpdateSequence].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[UpdateSequence]') IS NULL EXEC('CREATE PROCEDURE [dbo].[UpdateSequence] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[UpdateSequence]
@CTRIN char(20), @OBJIDOUT int OUTPUT AS
UPDATE HARSEQTABLE 
SET @OBJIDOUT = OBJID = OBJID +1 WHERE CTR = @CTRIN
GO

GO
--SqlScripter----[dbo].[usd_act_appl_cmpname_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_appl_cmpname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_appl_cmpname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_appl_cmpname_cltn    Script Date: 12/1/2005 11:50:21 PM ******/

ALTER PROCEDURE [dbo].[usd_act_appl_cmpname_cltn]
(@key_value as binary(16)) as
begin
select app.objectid from usd_applic app, usd_v_target cmp
where app.target = cmp.objectid
and activity = @key_value
order by cmp.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_act_appl_cmpname_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_appl_cmpname_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_appl_cmpname_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_appl_cmpname_cltn_ro    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_appl_cmpname_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, target, actproc, activity, installation, 
status, errorcause, errorparam, creationtime, activationtime, 
completiontime, administrator, applicationid, comment, task, 
percentsent, retentiontime, renewstatus, firstrenew, nextrenew, 
applicationgroup, userparams, uuid, racassoc, uninstallstate, 
permmask, starttime, uuid2
from usd_applic
where activity = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_act_cmp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_cmp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_cmp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_cmp_name_cltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_act_cmp_name_cltn]
(@key_value as binary(16)) as
begin
select lac.comp from usd_link_act_cmp lac, usd_v_target c
where lac.comp = c.objectid
and lac.act = @key_value
order by c.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_act_cmp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_act_cmp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_cmp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* ******************** 9990 end *************************** */

/* ********************** 10173 begin ************************** */
ALTER PROCEDURE [dbo].[usd_act_cmp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select c.objectid, c.version, c.creation_user, 
c.managementtype, c.ssname, c.lanname, c.lanaddress, c.ip_address, 
c.creationtime, c.changetime, c.regflag, c.type, c.state, c.curros, 
c.comment, c.calendar, c.ssid, c.sdver, c.uuid, c.prevls, c.agrefcnt, 
c.locks, c.download_method, c.agent_lock
from usd_link_act_cmp lac, usd_v_target c
where lac.comp = c.objectid
and lac.act = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_act_grp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_grp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_grp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_grp_name_cltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_act_grp_name_cltn]
(@key_value as binary(16)) as
begin
select lag.grp from usd_link_act_grp lag, usd_v_common_grp ag
where lag.grp = ag.objectid
and lag.act = @key_value
-- (ag.attributes & 0x00000004) ????? tbd 
order by ag.name 
end
GO

GO
--SqlScripter----[dbo].[usd_act_grp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_grp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_grp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_grp_name_cltn_ro    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_act_grp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
ag.objectid, ag.version, ag.creation_user, ag.qtask, ag.aux, ag.aux2, 
ag.type, ag.attributes, ag.name, ag.comment, ag.credate, ag.cretime, 
ag.chdate, ag.chtime, ag.propflag, ag.qcalendar, ag.qevalrate, 
ag.qnextevaldate, ag.qnextevaltime, ag.qevaldate, ag.qevaltime, 
ag.qtemplfold, ag.qtype, ag.state, ag.seal, ag.var, ag.auxtext0, 
ag.auxtext1, ag.auxtext2, ag.auxtext3, ag.queryid, 
ag.evaluation_location, ag.group_flag, ag.group_system
from usd_link_act_grp lag, usd_v_common_grp ag
where lag.grp = ag.objectid
and lag.act = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_act_inst_instoid_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_inst_instoid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_inst_instoid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_inst_instoid_cltn    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_inst_instoid_cltn]
(@key_value as binary(16)) as
begin
select lai.installation from usd_link_act_inst lai
where lai.activity = @key_value
order by lai.installation
end
GO

GO
--SqlScripter----[dbo].[usd_act_inst_instoid_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_inst_instoid_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_inst_instoid_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_inst_instoid_cltn_ro    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_inst_instoid_cltn_ro]
(@key_value as binary(16)) as
begin
select a.objectid, a.version, a.target, a.actproc, a.activity, 
a.installation, a.status, a.errorcause, a.errorparam, a.creationtime, 
a.activationtime, a.completiontime, a.administrator, a.applicationid, 
a.comment, a.task, a.percentsent, a.retentiontime, a.renewstatus, 
a.firstrenew, a.nextrenew, a.applicationgroup, a.userparams, a.uuid, 
a.racassoc, a.uninstallstate, a.permmask, a.starttime, a.uuid2
from usd_link_act_inst lai, usd_applic a
where lai.installation = a.objectid
and lai.activity = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_act_jc_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_act_jc_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_jc_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_act_jc_name_cltn    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_act_jc_name_cltn]
(@key_value as binary(16)) as
begin
select ljca.jcont from usd_link_jc_act ljca, usd_job_cont jc
where ljca.jcont = jc.objectid
and ljca.activity = @key_value
order by jc.name, (cast(jc.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_act_jc_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_act_jc_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_act_jc_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_act_jc_name_cltn_ro]
(@key_value as binary(16)) as
begin
select jc.objectid, jc.version, jc.creation_user, 
jc.qtask, jc.aux, jc.aux2, jc.type, jc.attributes, jc.name, 
jc.comment, jc.credate, jc.cretime, jc.chdate, jc.chtime, jc.propflag,
jc.qcalendar, jc.qevalrate, jc.qnextevaldate, jc.qnextevaltime, 
jc.qevaldate, jc.qevaltime, jc.qtemplfold, jc.qtype, jc.state, 
jc.seal, jc.var, jc.auxtext0, jc.auxtext1, jc.auxtext2, jc.auxtext3, 
jc.queryid, jc.dts_state, jc.priority
from usd_link_jc_act ljca, usd_job_cont jc
where ljca.jcont = jc.objectid
and ljca.activity = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_activity_acttime_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_activity_acttime_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_activity_acttime_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_activity_acttime_allcltn    Script Date: 12/1/2005 11:49:52 PM ******/

ALTER PROCEDURE [dbo].[usd_activity_acttime_allcltn]
AS
begin
select objectid from usd_activity
order by activationtime
end
GO

GO
--SqlScripter----[dbo].[usd_agrp_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_agrp_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_agrp_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_agrp_name_allcltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_agrp_name_allcltn]
AS
begin
select objectid from usd_v_asset_grp
--(attributes & 0x00000004)
order by name
end
GO

GO
--SqlScripter----[dbo].[usd_ap_apdep_ordernr_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_apdep_ordernr_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_apdep_ordernr_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_apdep_ordernr_cltn    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_apdep_ordernr_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_apdep
where ap = @key_value
order by ordernumber
end
GO

GO
--SqlScripter----[dbo].[usd_ap_apdep_ordernr_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_apdep_ordernr_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_apdep_ordernr_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_apdep_ordernr_cltn_ro    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_apdep_ordernr_cltn_ro]
(@key_value as binary(16)) as
begin
select 
objectid, version, rswname, rswversion, apname, apversion, filedby, 
ap, depap, ordernumber
from usd_apdep
where ap = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ap_applic_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_applic_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_applic_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_applic_nosort_cltn    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_applic_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_applic
where actproc = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ap_applic_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_applic_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_applic_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_applic_nosort_cltn_ro    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_applic_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, target, actproc, activity, installation, 
status, errorcause, errorparam, creationtime, activationtime, 
completiontime, administrator, applicationid, comment, task, 
percentsent, retentiontime, renewstatus, firstrenew, nextrenew, 
applicationgroup, userparams, uuid, racassoc, uninstallstate, 
permmask, starttime, uuid2
from usd_applic
where actproc = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ap_distap_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_distap_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_distap_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_distap_nosort_cltn    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_distap_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_distap
where ape = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ap_distap_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_distap_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_distap_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_distap_nosort_cltn_ro    Script Date: 12/1/2005 11:49:53 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_distap_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, 
distributiondate, distributiontime, ape, distsw
from usd_distap
where ape = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ap_swfold_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_swfold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_swfold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_swfold_name_cltn    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_swfold_name_cltn]
(@key_value as binary(16)) as
begin
select lapg.procgrp from usd_link_grp_proc lapg, usd_swfold swf
where lapg.procgrp = swf.objectid
and lapg.ap = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_ap_swfold_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ap_swfold_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ap_swfold_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ap_swfold_name_cltn_ro    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_ap_swfold_name_cltn_ro]
(@key_value as binary(16)) as
begin
select swf.objectid, swf.version, swf.creation_user, 
swf.qtask, swf.aux, swf.aux2, swf.type, swf.attributes, swf.name, 
swf.comment, swf.credate, swf.cretime, swf.chdate, swf.chtime, 
swf.propflag, swf.qcalendar, swf.qevalrate, swf.qnextevaldate, 
swf.qnextevaltime, swf.qevaldate, swf.qevaltime, swf.qtemplfold, 
swf.qtype, swf.state, swf.seal, swf.var, swf.auxtext0, swf.auxtext1, 
swf.auxtext2, swf.auxtext3, swf.queryid, swf.security_group
from usd_link_grp_proc lapg, usd_swfold swf
where lapg.procgrp = swf.objectid
and lapg.ap = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_app_inst_acttime_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_app_inst_acttime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_app_inst_acttime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_app_inst_acttime_cltn    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_app_inst_acttime_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_applic
where installation = @key_value
and  installation <> objectid -- do not read myself 
order by activationtime
end
GO

GO
--SqlScripter----[dbo].[usd_app_inst_acttime_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_app_inst_acttime_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_app_inst_acttime_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_app_inst_acttime_cltn_ro    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_app_inst_acttime_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, target, actproc, activity, installation, 
status, errorcause, errorparam, creationtime, activationtime, 
completiontime, administrator, applicationid, comment, task, 
percentsent, retentiontime, renewstatus, firstrenew, nextrenew, 
applicationgroup, userparams, uuid, racassoc, uninstallstate, 
permmask, starttime, uuid2
from usd_applic
where installation = @key_value
and  installation <> objectid -- do not read myself 
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_cmp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_cmp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_cmp_name_cltn    Script Date: 12/1/2005 11:50:22 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_target c
where gm.member_uuid = c.objectid
and gm.group_uuid = @key_value
and (gm.member_type = 1 or gm.member_type = 4)
order by c.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_cmp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_cmp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_assetgrp_cmp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select c.objectid, c.version, c.creation_user,
c.managementtype, c.ssname, c.lanname, c.lanaddress, c.ip_address, 
c.creationtime, c.changetime, c.regflag, c.type, c.state, c.curros, 
c.comment, c.calendar, c.ssid, c.sdver, c.uuid, c.prevls, c.agrefcnt, 
c.locks, c.download_method, c.agent_lock
from ca_group_member gm, usd_v_target c
where gm.member_uuid = c.objectid
and gm.group_uuid = @key_value
and (gm.member_type = 1 or gm.member_type = 4)
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_jc_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_jc_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_jc_name_cltn    Script Date: 12/1/2005 11:49:54 PM ******/


ALTER PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn]
(@key_value as binary(16)) as
begin
select j.objectid from usd_job_cont j
where j.qtemplfold = @key_value
order by j.name, (cast(j.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_jc_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_jc_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_assetgrp_jc_name_cltn_ro]
(@key_value as binary(16)) as
begin
select j.objectid, j.version, j.creation_user,
j.qtask, j.aux, j.aux2, j.type, j.attributes, j.name, j.comment, 
j.credate, j.cretime, j.chdate, j.chtime, j.propflag, j.qcalendar, 
j.qevalrate, j.qnextevaldate, j.qnextevaltime, j.qevaldate, 
j.qevaltime, j.qtemplfold, j.qtype, j.state, j.seal, j.var, 
j.auxtext0, j.auxtext1, j.auxtext2, j.auxtext3, j.queryid, j.dts_state,
j.priority
from usd_job_cont j
where j.qtemplfold = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_asset_grp ag
where gm.member_uuid = ag.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
--(cg.attributes & 0x00000004)
order by ag.name
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
ag.objectid, ag.version, ag.creation_user, ag.qtask, ag.aux, ag.aux2, 
ag.type, ag.attributes, ag.name, ag.comment, ag.credate, ag.cretime, 
ag.chdate, ag.chtime, ag.propflag, ag.qcalendar, ag.qevalrate, 
ag.qnextevaldate, ag.qnextevaltime, ag.qevaldate, ag.qevaltime, 
ag.qtemplfold, ag.qtype, ag.state, ag.seal, ag.var, ag.auxtext0, 
ag.auxtext1, ag.auxtext2, ag.auxtext3, ag.queryid, 
ag.evaluation_location, ag.group_flag, ag.group_system
from ca_group_member gm, usd_v_asset_grp ag
where gm.member_uuid = ag.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_supgrp_name_cltn    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.group_uuid from ca_group_member gm, usd_v_asset_grp ag
where gm.group_uuid = ag.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
--(cg.attributes & 0x00000004)
order by ag.name
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
ag.objectid, ag.version, ag.creation_user, ag.qtask, ag.aux, ag.aux2, 
ag.type, ag.attributes, ag.name, ag.comment, ag.credate, ag.cretime, 
ag.chdate, ag.chtime, ag.propflag, ag.qcalendar, ag.qevalrate, 
ag.qnextevaldate, ag.qnextevaltime, ag.qevaldate, ag.qevaltime, 
ag.qtemplfold, ag.qtype, ag.state, ag.seal, ag.var, ag.auxtext0, 
ag.auxtext1, ag.auxtext2, ag.auxtext3, ag.queryid, 
ag.evaluation_location, ag.group_flag, ag.group_system
from ca_group_member gm, usd_v_asset_grp ag
where gm.group_uuid = ag.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_swgr_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_swgr_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_swgr_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_swgr_nosort_cltn    Script Date: 12/1/2005 11:49:54 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_swgr_nosort_cltn]
(@key_value as binary(16)) as
begin
select swf.objectid from usd_swfold swf
where swf.aux = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_assetgrp_swgr_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_assetgrp_swgr_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_assetgrp_swgr_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_assetgrp_swgr_nosort_cltn_ro    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_assetgrp_swgr_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select swf.objectid, swf.version, swf.creation_user, swf.qtask, 
swf.aux, swf.aux2, swf.type, swf.attributes, swf.name, swf.comment, 
swf.credate, swf.cretime, swf.chdate, swf.chtime, swf.propflag, 
swf.qcalendar, swf.qevalrate, swf.qnextevaldate, swf.qnextevaltime, 
swf.qevaldate, swf.qevaltime, swf.qtemplfold, swf.qtype, swf.state, 
swf.seal, swf.var, swf.auxtext0, swf.auxtext1, swf.auxtext2, 
swf.auxtext3, swf.queryid
from usd_swfold swf
where swf.aux = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_cont_disttime_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_cont_disttime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_cont_disttime_cltn    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn]
(@key_value as binary(16)) as
begin
select lcfc.cont from usd_link_cfold_cont lcfc, usd_cont c
where lcfc.cont = c.objectid
and lcfc.contfold = @key_value
order by c.disttime
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_cont_disttime_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_cfold_cont_disttime_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_cfold_cont_disttime_cltn_ro]
(@key_value as binary(16)) as
begin
select c.objectid, c.version, c.creation_user, c.name, 
c.overallstatus, c.sendid, c.containerpath, c.distlistpath, 
c.distlisttype, c.distdate, c.disttime, c.credate, c.cretime, 
c.ahdinfo, c.priority
from usd_link_cfold_cont lcfc, usd_cont c
where lcfc.cont = c.objectid
and lcfc.contfold = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_subgrp_name_cltn    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcf.cfold_child from usd_link_contfold lcf, usd_contfold cf
where lcf.cfold_child = cf.objectid
and lcf.cfold_parent = @key_value
order by cf.name
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select cf.objectid, cf.version, cf.creation_user, cf.qtask, cf.aux, 
cf.aux2, cf.type, cf.attributes, cf.name, cf.comment, cf.credate, 
cf.cretime, cf.chdate, cf.chtime, cf.propflag, cf.qcalendar, 
cf.qevalrate, cf.qnextevaldate, cf.qnextevaltime, cf.qevaldate, 
cf.qevaltime, cf.qtemplfold, cf.qtype, cf.state, cf.seal, cf.var, 
cf.auxtext0, cf.auxtext1, cf.auxtext2, cf.auxtext3, cf.queryid
from usd_link_contfold lcf, usd_contfold cf
where lcf.cfold_child = cf.objectid
and lcf.cfold_parent = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_supgrp_name_cltn    Script Date: 12/1/2005 11:49:55 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcf.cfold_parent from usd_link_contfold lcf, usd_contfold cf
where lcf.cfold_parent = cf.objectid
and lcf.cfold_child = @key_value
order by cf.name
end
GO

GO
--SqlScripter----[dbo].[usd_cfold_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cfold_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cfold_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cfold_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cfold_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select cf.objectid, cf.version, cf.creation_user, cf.qtask, cf.aux, 
cf.aux2, cf.type, cf.attributes, cf.name, cf.comment, cf.credate, 
cf.cretime, cf.chdate, cf.chtime, cf.propflag, cf.qcalendar, 
cf.qevalrate, cf.qnextevaldate, cf.qnextevaltime, cf.qevaldate, 
cf.qevaltime, cf.qtemplfold, cf.qtype, cf.state, cf.seal, cf.var, 
cf.auxtext0, cf.auxtext1, cf.auxtext2, cf.auxtext3, cf.queryid
from usd_link_contfold lcf, usd_contfold cf
where lcf.cfold_parent = cf.objectid
and lcf.cfold_child = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cgrp_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cgrp_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cgrp_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cgrp_name_allcltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cgrp_name_allcltn]
AS
begin
-- special sort because of distributions, second level sort is dist. attr. 
select objectid from usd_cmp_grp
order by name, (cast(attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_appl_appltime_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_appl_appltime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_appl_appltime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_appl_appltime_cltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_appl_appltime_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_applic 
where target = @key_value
order by activationtime
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_appl_appltime_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_appl_appltime_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_appl_appltime_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_appl_appltime_cltn_ro    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_appl_appltime_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, target, actproc, activity, installation, 
status, errorcause, errorparam, creationtime, activationtime, 
completiontime, administrator, applicationid, comment, task, 
percentsent, retentiontime, renewstatus, firstrenew, nextrenew, 
applicationgroup, userparams, uuid, racassoc, uninstallstate, 
permmask, starttime, uuid2
from usd_applic 
where target = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_applic_actprocid_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_actprocid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_actprocid_cltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn]
(@key_value as binary(16)) as
begin
select a.objectid from usd_applic a, usd_actproc ap
where a.actproc = ap.objectid
and a.target = @key_value
and (
-- task&install and status!=execution_error and status!=already_installed and status!=manipulation_not_allowed 
(a.task = 0x00000001 and a.status != 10 and a.status != 15 and a.status != 16) or

-- task&deliver and status!=delivery_error and status!=already_delivered 
(a.task = 0x00000010 and a.status != 5 and a.status != 6)
)
-- not uninstalled 
and a.uninstallstate <> 2
order by ap.objectid
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_applic_actprocid_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_actprocid_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_actprocid_cltn_ro    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_actprocid_cltn_ro]
(@key_value as binary(16)) as
begin
select a.objectid, a.version, a.target, a.actproc, a.activity, 
a.installation, a.status, a.errorcause, a.errorparam, a.creationtime, 
a.activationtime, a.completiontime, a.administrator, a.applicationid, 
a.comment, a.task, a.percentsent, a.retentiontime, a.renewstatus, 
a.firstrenew, a.nextrenew, a.applicationgroup, a.userparams, a.uuid, 
a.racassoc, a.uninstallstate, a.permmask, a.starttime, a.uuid2
from usd_applic a, usd_actproc ap
where a.actproc = ap.objectid
and a.target = @key_value
and (
-- task&install and status!=execution_error and status!=already_installed and status!=manipulation_not_allowed 
(a.task = 0x00000001 and a.status != 10 and a.status != 15 and a.status != 16) or

-- task&deliver and status!=delivery_error and status!=already_delivered 
(a.task = 0x00000010 and a.status != 5 and a.status != 6)
)
-- not uninstalled 
and a.uninstallstate <> 2
order by ap.objectid
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_applic_itemname_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_itemname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_itemname_cltn    Script Date: 12/1/2005 11:49:56 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn]
(@key_value as binary(16)) as
begin
select app.objectid from usd_applic app, usd_actproc acp, usd_rsw rsw
where app.actproc = acp.objectid
and acp.rsw= rsw.objectid
and app.target = @key_value
order by rsw.itemname
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_applic_itemname_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_applic_itemname_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_applic_itemname_cltn_ro    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_applic_itemname_cltn_ro]
(@key_value as binary(16)) as
begin
select app.objectid, app.version, app.target, app.actproc, 
app.activity, app.installation, app.status, app.errorcause, 
app.errorparam, app.creationtime, app.activationtime, 
app.completiontime, app.administrator, app.applicationid, app.comment,
app.task, app.percentsent, app.retentiontime, app.renewstatus, 
app.firstrenew, app.nextrenew, app.applicationgroup, app.userparams, 
app.uuid, app.racassoc, app.uninstallstate, app.permmask, 
app.starttime, app.uuid2
from usd_applic app, usd_actproc acp, usd_rsw rsw
where app.actproc = acp.objectid
and acp.rsw = rsw.objectid
and app.target = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_comp_ssname_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_comp_ssname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_comp_ssname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_comp_ssname_cltn    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_comp_ssname_cltn]
(@key_value as binary(16)) as
begin
select cmp.objectid from usd_v_target cmp
where cmp.objectid = cmp.ssid
and cmp.ssid = @key_value
order by cmp.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_group_groupname_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_group_groupname_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_group_groupname_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_group_groupname_cltn    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_group_groupname_cltn]
(@key_value as binary(16)) as
begin
select lccg.grp from usd_link_grp_cmp lccg, usd_cmp_grp cg
where lccg.grp = cg.objectid
and lccg.comp = @key_value
order by cg.name, (cast(cg.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_group_groupname_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_group_groupname_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_group_groupname_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_group_groupname_cltn_ro    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_group_groupname_cltn_ro]
(@key_value as binary(16)) as
begin
select cg.objectid, cg.version, cg.creation_user, cg.qtask, cg.aux, 
cg.aux2, cg.type, cg.attributes, cg.name, cg.comment, cg.credate, 
cg.cretime, cg.chdate, cg.chtime, cg.propflag, cg.qcalendar, 
cg.qevalrate, cg.qnextevaldate, cg.qnextevaltime, cg.qevaldate, 
cg.qevaltime, cg.qtemplfold, cg.qtype, cg.state, cg.seal, cg.var, 
cg.auxtext0, cg.auxtext1, cg.auxtext2, cg.auxtext3, cg.queryid
from usd_link_grp_cmp lccg, usd_cmp_grp cg
where lccg.grp = cg.objectid
and lccg.comp = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_name_allcltn    Script Date: 12/1/2005 11:50:23 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_name_allcltn]
AS
begin
select objectid from usd_v_target
order by lanname
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_ss_comp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmp_ss_comp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_ss_comp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmp_ss_comp_name_cltn    Script Date: 12/1/2005 11:50:24 PM ******/

ALTER PROCEDURE [dbo].[usd_cmp_ss_comp_name_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_v_target
where ssid = @key_value
order by lanname
end
GO

GO
--SqlScripter----[dbo].[usd_cmp_ss_comp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_cmp_ss_comp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmp_ss_comp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_cmp_ss_comp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, creation_user, 
managementtype, ssname, lanname, lanaddress, ip_address, creationtime,
changetime, regflag, type, state, curros, comment, calendar, ssid, 
sdver, uuid, prevls, agrefcnt, locks, download_method, agent_lock
from usd_v_target
where ssid = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_cmp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_cmp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_cmp_name_cltn    Script Date: 12/1/2005 11:50:24 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn]
(@key_value as binary(16)) as
begin
select lccg.comp from usd_link_grp_cmp lccg, usd_v_target c
where lccg.comp = c.objectid
and lccg.grp = @key_value
order by c.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_cmp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_cmp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_cmpgrp_cmp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select c.objectid, c.version, c.creation_user, 
c.managementtype, c.ssname, c.lanname, c.lanaddress, c.ip_address, 
c.creationtime, c.changetime, c.regflag, c.type, c.state, c.curros, 
c.comment, c.calendar, c.ssid, c.sdver, c.uuid, c.prevls, c.agrefcnt, 
c.locks, c.download_method, c.agent_lock
from usd_link_grp_cmp lccg, usd_v_target c
where lccg.comp = c.objectid
and lccg.grp = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcg.grpchild from usd_link_cmpgrp lcg, usd_cmp_grp cg
where lcg.grpchild = cg.objectid
and lcg.grpparent = @key_value
order by cg.name, (cast(cg.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select cg.objectid, cg.version, cg.creation_user, cg.qtask, cg.aux, 
cg.aux2, cg.type, cg.attributes, cg.name, cg.comment, cg.credate, 
cg.cretime, cg.chdate, cg.chtime, cg.propflag, cg.qcalendar, 
cg.qevalrate, cg.qnextevaldate, cg.qnextevaltime, cg.qevaldate, 
cg.qevaltime, cg.qtemplfold, cg.qtype, cg.state, cg.seal, cg.var, 
cg.auxtext0, cg.auxtext1, cg.auxtext2, cg.auxtext3, cg.queryid
from usd_link_cmpgrp lcg, usd_cmp_grp cg
where lcg.grpchild = cg.objectid
and lcg.grpparent = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_supgrp_name_cltn    Script Date: 12/1/2005 11:49:57 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lcg.grpparent from usd_link_cmpgrp lcg, usd_cmp_grp cg
where lcg.grpparent = cg.objectid
and lcg.grpchild = @key_value
order by cg.name, (cast(cg.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_cmpgrp_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cmpgrp_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cmpgrp_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cmpgrp_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cmpgrp_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select cg.objectid, cg.version, cg.creation_user, cg.qtask, cg.aux, 
cg.aux2, cg.type, cg.attributes, cg.name, cg.comment, cg.credate, 
cg.cretime, cg.chdate, cg.chtime, cg.propflag, cg.qcalendar, 
cg.qevalrate, cg.qnextevaldate, cg.qnextevaltime, cg.qevaldate, 
cg.qevaltime, cg.qtemplfold, cg.qtype, cg.state, cg.seal, cg.var, 
cg.auxtext0, cg.auxtext1, cg.auxtext2, cg.auxtext3, cg.queryid
from usd_link_cmpgrp lcg, usd_cmp_grp cg
where lcg.grpparent = cg.objectid
and lcg.grpchild = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_compos_id_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_compos_id_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_compos_id_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_compos_id_allcltn    Script Date: 12/1/2005 11:50:13 PM ******/

ALTER PROCEDURE [dbo].[usd_compos_id_allcltn]
AS
begin
select objectid from usd_compos
order by id
end
GO

GO
--SqlScripter----[dbo].[usd_cont_ccarr_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_ccarr_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_ccarr_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_ccarr_nosort_cltn    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_ccarr_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_cc
where cont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cont_ccarr_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_ccarr_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_ccarr_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_ccarr_nosort_cltn_ro    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_ccarr_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, boundto, diststatus, 
overalljobstatus, numberofparameters, failure, creationdate, 
creationtime, cont
from usd_cc
where cont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cont_cfold_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_cfold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_cfold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_cfold_name_cltn    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_cfold_name_cltn]
(@key_value as binary(16)) as
begin
select lcfc.contfold from usd_link_cfold_cont lcfc, usd_contfold cf
where lcfc.contfold = cf.objectid
and lcfc.cont = @key_value
order by cf.name
end
GO

GO
--SqlScripter----[dbo].[usd_cont_cfold_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_cfold_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_cfold_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_cfold_name_cltn_ro    Script Date: 12/1/2005 11:49:58 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_cfold_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
cf.objectid, cf.version, cf.creation_user, cf.qtask, cf.aux, cf.aux2, 
cf.type, cf.attributes, cf.name, cf.comment, cf.credate, cf.cretime, 
cf.chdate, cf.chtime, cf.propflag, cf.qcalendar, cf.qevalrate, 
cf.qnextevaldate, cf.qnextevaltime, cf.qevaldate, cf.qevaltime, 
cf.qtemplfold, cf.qtype, cf.state, cf.seal, cf.var, cf.auxtext0, 
cf.auxtext1, cf.auxtext2, cf.auxtext3, cf.queryid
from usd_link_cfold_cont lcfc, usd_contfold cf
where lcfc.contfold = cf.objectid
and lcfc.cont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_cont_disttime_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_disttime_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_disttime_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_disttime_allcltn    Script Date: 12/1/2005 11:49:58 PM ******/


ALTER PROCEDURE [dbo].[usd_cont_disttime_allcltn]
AS
begin
select objectid from usd_cont
order by distdate, disttime
end
GO

GO
--SqlScripter----[dbo].[usd_cont_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_name_allcltn    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_name_allcltn]
AS
begin
select objectid from usd_cont
order by name
end
GO

GO
--SqlScripter----[dbo].[usd_cont_order_orderno_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_order_orderno_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_order_orderno_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_order_orderno_cltn    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_order_orderno_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_order
where cont = @key_value
order by sequenceno
end
GO

GO
--SqlScripter----[dbo].[usd_cont_order_orderno_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_cont_order_orderno_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_cont_order_orderno_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_cont_order_orderno_cltn_ro    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_cont_order_orderno_cltn_ro]
(@key_value as binary(16)) as
begin
select 
objectid, version, type, operand, miscitem, sequenceno, 
activationdate, activationtime, creationdate, creationtime, cont
from usd_order
where cont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_contfold_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_contfold_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_contfold_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_contfold_name_allcltn    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_contfold_name_allcltn]
AS
begin
select objectid from usd_contfold
order by name
end
GO

GO
--SqlScripter----[dbo].[usd_csite_siteid_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_csite_siteid_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_csite_siteid_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_csite_siteid_allcltn    Script Date: 12/1/2005 11:50:24 PM ******/

ALTER PROCEDURE [dbo].[usd_csite_siteid_allcltn]
AS
begin
select objectid from usd_v_csite
order by siteid
end
GO

GO
--SqlScripter----[dbo].[usd_dispap_nosort_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_dispap_nosort_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_dispap_nosort_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_dispap_nosort_allcltn    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_dispap_nosort_allcltn]
AS
begin
select objectid from usd_distap
end
GO

GO
--SqlScripter----[dbo].[usd_distsw_distap_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_distsw_distap_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_distsw_distap_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_distsw_distap_nosort_cltn    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_distsw_distap_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_distap
where distsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_distsw_distap_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_distsw_distap_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_distsw_distap_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_distsw_distap_nosort_cltn_ro    Script Date: 12/1/2005 11:49:59 PM ******/

ALTER PROCEDURE [dbo].[usd_distsw_distap_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, 
distributiondate, distributiontime, ape, distsw
from usd_distap
where distsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_fio_fitems_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_fio_fitems_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_fio_fitems_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_fio_fitems_nosort_cltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_fio_fitems_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_fitem
where fio = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_fio_fitems_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_fio_fitems_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_fio_fitems_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_fio_fitems_nosort_cltn_ro    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_fio_fitems_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, fetchdate, fetchtime, 
fipath, copied, localsite, fio
from usd_fitem
where fio = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_fio_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_fio_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_fio_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_fio_name_allcltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_fio_name_allcltn]
AS
begin
select objectid from usd_fio
order by finame
end
GO

GO
--SqlScripter----[dbo].[usd_jc_act_order_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_act_order_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_act_order_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_act_order_cltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_act_order_cltn]
(@key_value as binary(16)) as
begin
select ljca.activity from usd_link_jc_act ljca, usd_activity a
where ljca.activity = a.objectid
and ljca.jcont = @key_value
order by a.ordernumb
end
GO

GO
--SqlScripter----[dbo].[usd_jc_act_order_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_act_order_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_act_order_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_act_order_cltn_ro    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_act_order_cltn_ro]
(@key_value as binary(16)) as
begin
select a.objectid, a.version, a.creation_user, 
a.ordernumb, a.actproc, a.instproc, a.state, a.startflag, 
a.activationtime, a.creationtime, a.giveuptime, a.compfold, 
a.execmode, a.jobname, a.promptmsg, a.promptto, a.userparams, 
a.jobbanner, a.okcnt, a.activecnt, a.errorcnt, a.mask, a.opmask, 
a.bootbefore, a.bootafter, a.targetmask, a.dtsstate, a.deliverytime, 
a.cause, a.renewstate, a.waitingcnt, a.waitingrenewcnt, 
a.activerenewcnt, a.okrenewcnt, a.errorrenewcnt, a.permmask, 
a.calendar, a.errorcause
from usd_link_jc_act ljca, usd_activity a
where ljca.activity = a.objectid
and ljca.jcont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_distemp_time_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_distemp_time_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_distemp_time_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_distemp_time_cltn    Script Date: 12/1/2005 11:50:00 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_distemp_time_cltn]
(@key_value as binary(16)) as
begin
select dt.objectid from usd_disttempl dt, usd_job_cont jc
where dt.template = jc.objectid
and jc.objectid = @key_value
order by dt.disttime
end
GO

GO
--SqlScripter----[dbo].[usd_jc_distemp_time_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_distemp_time_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_distemp_time_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_distemp_time_cltn_ro    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_distemp_time_cltn_ro]
(@key_value as binary(16)) as
begin
select dt.objectid, dt.version, 
dt.disttime, dt.number_of_violators, dt.number_of_members, 
dt.last_eval_time, dt.template, dt.domain
from usd_disttempl dt, usd_job_cont jc
where dt.template = jc.objectid
and jc.objectid = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_jcview_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_jcview_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_jcview_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_jcview_nosort_cltn    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_jcview_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_jcview
where jobcont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_jcview_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_jcview_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_jcview_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_jcview_nosort_cltn_ro    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_jcview_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, jobcont, type, waitingcnt, 
activecnt, errorcnt, okcnt, waitingrenewcnt, activerenewcnt, 
errorrenewcnt, okrenewcnt
from usd_jcview
where jobcont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_server_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_server_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_server_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_server_nosort_cltn    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_server_nosort_cltn]
(@key_value as binary(16)) as
begin
select ljs.server from usd_link_jc_srv ljs
where ljs.jcont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_server_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_server_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_server_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_server_nosort_cltn_ro    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_server_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select ljs.jcont, ljs.server
from usd_link_jc_srv ljs
where ljs.jcont = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_subgrp_name_cltn    Script Date: 12/1/2005 11:50:01 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select ljc.jcchild from usd_link_jc ljc, usd_job_cont jc
where ljc.jcchild = jc.objectid
and ljc.jcparent = @key_value
order by jc.name, (cast(jc.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_jc_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_jc_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_jc_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select jc.objectid, jc.version, jc.creation_user, 
jc.qtask, jc.aux, jc.aux2, jc.type, jc.attributes, jc.name, 
jc.comment, jc.credate, jc.cretime, jc.chdate, jc.chtime, jc.propflag,
jc.qcalendar, jc.qevalrate, jc.qnextevaldate, jc.qnextevaltime, 
jc.qevaldate, jc.qevaltime, jc.qtemplfold, jc.qtype, jc.state, 
jc.seal, jc.var, jc.auxtext0, jc.auxtext1, jc.auxtext2, jc.auxtext3, 
jc.queryid, jc.dts_state, jc.priority
from usd_link_jc ljc, usd_job_cont jc
where ljc.jcchild = jc.objectid
and ljc.jcparent = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jc_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jc_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jc_supgrp_name_cltn    Script Date: 12/1/2005 11:50:02 PM ******/

ALTER PROCEDURE [dbo].[usd_jc_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select ljc.jcparent from usd_link_jc ljc, usd_job_cont jc
where ljc.jcparent = jc.objectid
and ljc.jcchild = @key_value
order by jc.name, (cast(jc.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_jc_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_jc_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jc_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_jc_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select jc.objectid, jc.version, jc.creation_user, 
jc.qtask, jc.aux, jc.aux2, jc.type, jc.attributes, jc.name, 
jc.comment, jc.credate, jc.cretime, jc.chdate, jc.chtime, jc.propflag,
jc.qcalendar, jc.qevalrate, jc.qnextevaldate, jc.qnextevaltime, 
jc.qevaldate, jc.qevaltime, jc.qtemplfold, jc.qtype, jc.state, 
jc.seal, jc.var, jc.auxtext0, jc.auxtext1, jc.auxtext2, jc.auxtext3, 
jc.queryid, jc.dts_state, jc.priority
from usd_link_jc ljc, usd_job_cont jc
where ljc.jcparent = jc.objectid
and ljc.jcchild = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jcappgr_appl_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jcappgr_appl_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jcappgr_appl_nosort_cltn    Script Date: 12/1/2005 11:50:02 PM ******/

ALTER PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn]
(@key_value as binary(16)) as
begin
select ap.objectid
from usd_applic ap, usd_activity ac
where ac.objectid = ap.activity
and ap.applicationgroup = @key_value 
order by ac.ordernumb
end
GO

GO
--SqlScripter----[dbo].[usd_jcappgr_appl_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jcappgr_appl_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jcappgr_appl_nosort_cltn_ro    Script Date: 12/1/2005 11:50:02 PM ******/

ALTER PROCEDURE [dbo].[usd_jcappgr_appl_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, target, actproc, activity, installation, 
status, errorcause, errorparam, creationtime, activationtime, 
completiontime, administrator, applicationid, comment, task, 
percentsent, retentiontime, renewstatus, firstrenew, nextrenew, 
applicationgroup, userparams, uuid, racassoc, uninstallstate, 
permmask, starttime, uuid2
from usd_applic
where applicationgroup = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jcview_jcapgr_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jcview_jcapgr_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jcview_jcapgr_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jcview_jcapgr_nosort_cltn    Script Date: 12/1/2005 11:50:02 PM ******/

ALTER PROCEDURE [dbo].[usd_jcview_jcapgr_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_jcappgr
where jobcontview = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jcview_jcapgr_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jcview_jcapgr_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jcview_jcapgr_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jcview_jcapgr_nosort_cltn_ro    Script Date: 12/1/2005 11:50:02 PM ******/


ALTER PROCEDURE [dbo].[usd_jcview_jcapgr_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select 
objectid, version, jobcontview, jobtarget, jobstatus, 
renewedjobstatus, okcnt, activecnt, errorcnt, waitingcnt, okrenewcnt, 
activerenewcnt, waitingrenewcnt, errorrenewcnt, permmask
from usd_jcappgr
where jobcontview = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_jobcont_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_jobcont_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_jobcont_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_jobcont_name_allcltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_jobcont_name_allcltn]
AS
begin
-- special sort because of distributions, second level sort is dist. attr. 
select objectid from usd_job_cont
order by name, (cast(attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_ls_distemp_time_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_distemp_time_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_distemp_time_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_distemp_time_cltn    Script Date: 12/1/2005 11:50:24 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_distemp_time_cltn]
(@key_value as binary(16)) as
begin
select dt.objectid from usd_disttempl dt, usd_v_ls ls
where dt.domain = ls.objectid
and ls.objectid = @key_value
order by dt.disttime
end
GO

GO
--SqlScripter----[dbo].[usd_ls_distemp_time_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_distemp_time_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_distemp_time_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_distemp_time_cltn_ro    Script Date: 12/1/2005 11:50:25 PM ******/


ALTER PROCEDURE [dbo].[usd_ls_distemp_time_cltn_ro]
(@key_value as binary(16)) as
begin
select dt.objectid, dt.version, 
dt.disttime, dt.number_of_violators, dt.number_of_members, 
dt.last_eval_time, dt.template, dt.domain
from usd_disttempl dt, usd_v_ls ls
where dt.domain = ls.objectid
and ls.objectid = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ls_distsw_namever_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_distsw_namever_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_distsw_namever_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_distsw_namever_cltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_distsw_namever_cltn]
(@key_value as binary(16)) as
begin
select dsw.objectid from usd_distsw dsw, usd_rsw sw
where dsw.rsw = sw.objectid
and dsw.localsite = @key_value
order by sw.itemname, sw.itemversion
end
GO

GO
--SqlScripter----[dbo].[usd_ls_distsw_namever_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_distsw_namever_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_distsw_namever_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_distsw_namever_cltn_ro    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_distsw_namever_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, 
distributiondate, distributiontime, numberofinstallations, 
numberofinstsfound, numberofinstslocally, filedby, rsw, localsite
from usd_distsw
where localsite = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ls_fitems_nametime_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_fitems_nametime_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_fitems_nametime_cltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn]
(@key_value as binary(16)) as
begin
select fi.objectid from usd_fitem fi, usd_fio fio
where fi.fio = fio.objectid
and fi.localsite = @key_value
order by fio.finame, fi.fetchtime
end
GO

GO
--SqlScripter----[dbo].[usd_ls_fitems_nametime_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_fitems_nametime_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_fitems_nametime_cltn_ro    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_fitems_nametime_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, fetchdate, fetchtime, 
fipath, copied, localsite, fio
from usd_fitem fi
where localsite = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_ls_lsg_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_lsg_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_lsg_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_lsg_name_cltn    Script Date: 12/1/2005 11:50:25 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_lsg_name_cltn]
(@key_value as binary(16)) as
begin
select gm.group_uuid from ca_group_member gm, usd_v_lsg lsg
where gm.group_uuid = lsg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
order by lsg.name
end
GO

GO
--SqlScripter----[dbo].[usd_ls_lsg_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_lsg_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_lsg_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_lsg_name_cltn_ro    Script Date: 12/1/2005 11:50:25 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_lsg_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
lsg.objectid, lsg.version, lsg.creation_user, lsg.qtask, lsg.aux, 
lsg.aux2, lsg.type, lsg.attributes, lsg.name, lsg.comment, 
lsg.credate, lsg.cretime, lsg.chdate, lsg.chtime, lsg.propflag, 
lsg.qcalendar, lsg.qevalrate, lsg.qnextevaldate, lsg.qnextevaltime, 
lsg.qevaldate, lsg.qevaltime, lsg.qtemplfold, lsg.qtype, lsg.state, 
lsg.seal, lsg.var, lsg.auxtext0, lsg.auxtext1, lsg.auxtext2, 
lsg.auxtext3, lsg.queryid, lsg.evaluation_location, lsg.group_flag, 
lsg.group_system
from ca_group_member gm, usd_v_lsg lsg
where gm.group_uuid = lsg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_ls_siteid_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ls_siteid_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ls_siteid_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ls_siteid_allcltn    Script Date: 12/1/2005 11:50:25 PM ******/

ALTER PROCEDURE [dbo].[usd_ls_siteid_allcltn]
AS
begin
select objectid from usd_v_ls
order by siteid
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_ls_siteid_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_ls_siteid_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_ls_siteid_cltn    Script Date: 12/1/2005 11:50:25 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_ls ls
where gm.member_uuid = ls.objectid
and gm.group_uuid = @key_value
and gm.member_type = 5
order by ls.siteid
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_ls_siteid_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_ls_siteid_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_ls_siteid_cltn_ro    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_ls_siteid_cltn_ro]
(@key_value as binary(16)) as
begin
select 
ls.objectid, ls.version, ls.creation_user, ls.siteid, 
ls.contact_information, ls.asmversion, ls.creationtime, ls.changetime,
ls.remoteaddress, ls.usercomment, ls.uuid
from ca_group_member gm, usd_v_ls ls
where gm.member_uuid = ls.objectid
and gm.group_uuid = @key_value
and gm.member_type = 5
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_name_allcltn    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_name_allcltn]
AS
begin
select objectid from usd_v_lsg
order by name
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_lsg lsg
where gm.member_uuid = lsg.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
order by lsg.name
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
lsg.objectid, lsg.version, lsg.creation_user, lsg.qtask, lsg.aux, 
lsg.aux2, lsg.type, lsg.attributes, lsg.name, lsg.comment, 
lsg.credate, lsg.cretime, lsg.chdate, lsg.chtime, lsg.propflag, 
lsg.qcalendar, lsg.qevalrate, lsg.qnextevaldate, lsg.qnextevaltime, 
lsg.qevaldate, lsg.qevaltime, lsg.qtemplfold, lsg.qtype, lsg.state, 
lsg.seal, lsg.var, lsg.auxtext0, lsg.auxtext1, lsg.auxtext2, 
lsg.auxtext3, lsg.queryid, lsg.evaluation_location, lsg.group_flag, 
lsg.group_system
from ca_group_member gm, usd_v_lsg lsg
where gm.member_uuid = lsg.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_supgrp_name_cltn    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.group_uuid from ca_group_member gm, usd_v_lsg lsg
where gm.group_uuid = lsg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
order by lsg.name
end
GO

GO
--SqlScripter----[dbo].[usd_lsgrp_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_lsgrp_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_lsgrp_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_lsgrp_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:26 PM ******/

ALTER PROCEDURE [dbo].[usd_lsgrp_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
lsg.objectid, lsg.version, lsg.creation_user, lsg.qtask, lsg.aux, 
lsg.aux2, lsg.type, lsg.attributes, lsg.name, lsg.comment, 
lsg.credate, lsg.cretime, lsg.chdate, lsg.chtime, lsg.propflag, 
lsg.qcalendar, lsg.qevalrate, lsg.qnextevaldate, lsg.qnextevaltime, 
lsg.qevaldate, lsg.qevaltime, lsg.qtemplfold, lsg.qtype, lsg.state, 
lsg.seal, lsg.var, lsg.auxtext0, lsg.auxtext1, lsg.auxtext2, 
lsg.auxtext3, lsg.queryid, lsg.evaluation_location, lsg.group_flag, 
lsg.group_system
from ca_group_member gm, usd_v_lsg lsg
where gm.group_uuid = lsg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_order_nosort_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_order_nosort_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_order_nosort_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_order_nosort_allcltn    Script Date: 12/1/2005 11:50:03 PM ******/

ALTER PROCEDURE [dbo].[usd_order_nosort_allcltn]
AS
begin
select objectid from usd_order
end
GO

GO
--SqlScripter----[dbo].[usd_ownsite_siteid_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_ownsite_siteid_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_ownsite_siteid_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_ownsite_siteid_allcltn    Script Date: 12/1/2005 11:50:27 PM ******/

ALTER PROCEDURE [dbo].[usd_ownsite_siteid_allcltn]
AS
begin
select objectid from usd_v_ownsite
order by siteid
end
GO

GO
--SqlScripter----[dbo].[usd_p_container_fd_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_fd_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_fd_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_container_fd_jobs    Script Date: 12/1/2005 11:50:27 PM ******/




ALTER PROCEDURE [dbo].[usd_p_container_fd_jobs]
( @__containername nvarchar(129) )
as 
begin
	select 	
		containername, 
		agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_container_jobs

	where  	containername like @__containername 
		and ( state = 10 or state = 5 or state = 14 )

	order by jobname, productname, productversion, "procedure"
	
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_container_fd_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_fd_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_fd_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_container__fd_jobs
	displays the (failed and non-installation) jobs
	of a container.

	procedure 	usd_p_container_fd_jobs_s 
	is the security form.
************************************************************************/



/************************************************************************
	procedure

************************************************************************/


ALTER PROCEDURE [dbo].[usd_p_container_fd_jobs_s]
(	@__uri nvarchar(255), @__containername nvarchar(129) )
as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )

		 select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_container_jobs_s

		where  	user_uuid=@__user_uuid and containername like @__containername
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     
	else 

		 select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_container_jobs_a_s

		where  	user_uuid=@__user_uuid and containername like @__containername
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_container_installations].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_installations]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_installations] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_container_installations    Script Date: 12/1/2005 11:50:27 PM ******/


ALTER PROCEDURE [dbo].[usd_p_container_installations]
(@__containername nvarchar(129) )


as 
begin
	select 
		containername,
		agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion 
	
	from usd_v_container_installations
	where  	containername like @__containername
	order by containername, jobname,
			productname, productversion, "procedure"
	
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_container_installations_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_installations_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_installations_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_container_installations
	displays the installation done via a container
	
	procedure 	usd_p_container_installations_s
	is used for security impacts

************************************************************************/




/************************************************************************
	procedure

************************************************************************/


ALTER PROCEDURE [dbo].[usd_p_container_installations_s]
(	@__uri nvarchar(255), @__containername nvarchar(129) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_container_installations_s

		where  	user_uuid= @__user_uuid and containername like @__containername
		
		order by containername, jobname,
				productname, productversion, "procedure";

	else 

		select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_container_installations_a_s

		where  	user_uuid = @__user_uuid and containername like @__containername
		
		order by containername, jobname,
				productname, productversion, "procedure";



end
GO

GO
--SqlScripter----[dbo].[usd_p_container_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_container_jobs    Script Date: 12/1/2005 11:50:27 PM ******/



ALTER PROCEDURE [dbo].[usd_p_container_jobs]
(	@__containername nvarchar(129) )
as 
begin
	select 	
		containername, 
		agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_container_jobs

	where  	containername like @__containername 

	order by jobname, productname, productversion, "procedure"
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_container_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_container_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_container_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_container_jobs
	displays the (failed and non-installation) jobs
	of a container.

	procedure 	usd_p_container_jobs_s 
	is the security form.
************************************************************************/




/************************************************************************
	procedure

************************************************************************/



ALTER PROCEDURE [dbo].[usd_p_container_jobs_s]
(@__uri nvarchar(255), @__containername nvarchar(129) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		from usd_v_container_jobs_s

		where  	user_uuid=@__user_uuid and containername like @__containername

		order by jobname, productname, productversion, "procedure"
	     
	else 

		select 	
			containername, 
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		from usd_v_container_jobs_a_s

		where  	user_uuid=@__user_uuid and containername like @__containername

		order by jobname, productname, productversion, "procedure"
	     

end
GO

GO
--SqlScripter----[dbo].[usd_p_group_fd_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_fd_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_fd_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_group_fd_jobs    Script Date: 12/1/2005 11:50:28 PM ******/


ALTER PROCEDURE [dbo].[usd_p_group_fd_jobs]
(@__group_name nvarchar(155) )

as 
begin

	select group_name, agent_name, agent_type, agent_uuid, 
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_group_jobs

	where  group_name like @__group_name
		and ( state = 10 or state = 5 or state = 14 )

	order by jobname, productname, productversion, "procedure"
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_group_fd_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_fd_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_fd_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_group_fd_jobs
	displays the jobs distributed to a group
	of targets. Jobs means the failed installation jobs.
	
	procedure 	usd_p_group_fd_jobs_s
	is used for security impacts

************************************************************************/
	


/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_group_fd_jobs_s]
(	@__uri nvarchar(255), @__group_name nvarchar(155) )


as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		
		from usd_v_group_jobs_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     
	else 

		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		
		from usd_v_group_jobs_a_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_group_installed_products].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_installed_products]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_installed_products] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_group_installed_products    Script Date: 12/1/2005 11:50:28 PM ******/


ALTER PROCEDURE [dbo].[usd_p_group_installed_products]
(@__group_name nvarchar(155) )

as 
begin

	select 	group_name, agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		"procedure", procedureversion
	
	from usd_v_group_installed_products

	where  	group_name like @__group_name

	order by productname, productversion, "procedure"
	
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_group_installed_products_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_installed_products_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_installed_products_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_group_installed_products
	displays the installed products in a group of targets

	procedure 	usd_p_group_installed_products_s
	is used for security impacts
************************************************************************/





/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_group_installed_products_s]
(@__uri nvarchar(255), @__group_name nvarchar(155) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			"procedure", procedureversion
		
		from usd_v_group_installed_products_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name 
			 
		order by productname, productversion, "procedure"

	else 

		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			"procedure", procedureversion
		
		from usd_v_group_installed_products_a_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name 
			 
		order by productname, productversion, "procedure"


end
GO

GO
--SqlScripter----[dbo].[usd_p_group_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_group_jobs    Script Date: 12/1/2005 11:50:28 PM ******/

ALTER PROCEDURE [dbo].[usd_p_group_jobs]
(@__group_name nvarchar(155) )

as 
begin

	select group_name, agent_name, agent_type, agent_uuid, 
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_group_jobs

	where  group_name like @__group_name

	order by jobname, productname, productversion, "procedure"
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_group_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_group_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_group_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_group_jobs
	displays the jobs distributed to a group
	of targets. Jobs means the failed installation jobs
	and other usd jobs.
	
	procedure 	usd_p_group_jobs_s
	is used for security impacts

************************************************************************/




/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_group_jobs_s]
(	@__uri nvarchar(255), @__group_name nvarchar(155) )


as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_group_jobs_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name

		order by jobname, productname, productversion, "procedure"
	     
	else 

		select 	
			group_name, agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_group_jobs_a_s

		where  	user_uuid=@__user_uuid and group_name like @__group_name

		order by jobname, productname, productversion, "procedure"
	     
end
GO

GO
--SqlScripter----[dbo].[usd_p_installed_products].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_installed_products]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_installed_products] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_installed_products    Script Date: 12/1/2005 11:50:29 PM ******/


ALTER PROCEDURE [dbo].[usd_p_installed_products]
(@__agent_name nvarchar(192) )

as 
begin
	select agent_name, agent_type, agent_uuid, 
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		"procedure", procedureversion
	
	from usd_v_installed_products

	where  agent_name like @__agent_name

	order by productname, productversion, "procedure"
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_installed_products_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_installed_products_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_installed_products_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_installed_products
	displays the installed products on a system

	usd_p_installed_products_s
	is used for security impacts

************************************************************************/


/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_installed_products_s]
(@__uri nvarchar(255), @__agent_name nvarchar(192) )


as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			"procedure", procedureversion
		
		from usd_v_installed_products_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name

		order by productname, productversion, "procedure"
	
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			"procedure", procedureversion
		
		from usd_v_installed_products_a_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name

		order by productname, productversion, "procedure"
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_osim_targets].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_osim_targets]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_osim_targets] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_osim_targets    Script Date: 12/1/2005 11:50:15 PM ******/


ALTER PROCEDURE [dbo].[usd_p_osim_targets]
(	@__uri nvarchar(255) )/* @__uri is a dummy */

as 
begin
	select 	agent_name, 	/* readable name */
		agent_uuid, 	/* uuid of the computer */
	       	bootserver, 	/* readable name */
	       	mac_address
	
	from usd_v_osim_targets

end
GO

GO
--SqlScripter----[dbo].[usd_p_osim_targets_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_osim_targets_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_osim_targets_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_osim_targets
	displays the csm known computers, which are
	not managed by csm

	procedure 	usd_p_osim_targets_s
	is used for security impacts
************************************************************************/

/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_osim_targets_s]
(	@__uri nvarchar(255) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_uuid, bootserver, mac_address
		from usd_v_osim_targets_s

		where  uri=@__uri 	
	
	else 

		select 	
			agent_name, agent_uuid, bootserver, mac_address
		from usd_v_osim_targets_a_s

		where  uri=@__uri 	
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_product_fd_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_fd_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_fd_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_product_fd_jobs
	displays the failed jobs contained in a product

	usd_p_product_fd_jobs_s
	is used for security impacts
************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_product_fd_jobs]
(@__productname nvarchar(129) , @__productversion  nvarchar(129))

as 
begin
	select	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_product_jobs

	where  productname like @__productname
		and productversion like @__productversion
		and ( state = 10 or state = 5 or state = 14 )

	order by productname, productversion, "procedure", agent_name, jobname
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_product_fd_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_fd_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_fd_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure

************************************************************************/


ALTER PROCEDURE [dbo].[usd_p_product_fd_jobs_s]
(@__uri nvarchar(255), @__productname nvarchar(129) , @__productversion  nvarchar(129))

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_product_jobs_s

		where  	user_uuid=@__user_uuid 
			and productname  like @__productname 
			and productversion like @__productversion
			and ( state = 10 or state = 5 or state = 14 )

		order by productname, productversion, "procedure", agent_name, jobname
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_product_jobs_a_s

		where  	user_uuid=@__user_uuid 
			and productname  like @__productname 
			and productversion like @__productversion
			and ( state = 10 or state = 5 or state = 14 )

		order by productname, productversion, "procedure", agent_name, jobname
	     

end
GO

GO
--SqlScripter----[dbo].[usd_p_product_fd_procedures].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_fd_procedures]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_fd_procedures] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_product_fd_procedures    Script Date: 12/1/2005 11:50:29 PM ******/

ALTER PROCEDURE [dbo].[usd_p_product_fd_procedures]
(	@__productname nvarchar(129), @__procedure nvarchar(129),
	@__task integer)


as 
begin
	select	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, uninstallstate, packagetype,
		"procedure", procedureversion
	
	from usd_v_product_procedures

	where  productname like @__productname
		and ( state = 10 or state = 5 or state = 14 )
		and "procedure" like @__procedure
		and substring(cast(task as binary), 0, 4) like 
			case when @__task < 255 then substring(cast(@__task as binary), 0, 4) else '%' end

	order by productname, productversion, "procedure", agent_name
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_product_fd_procedures_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_fd_procedures_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_fd_procedures_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_product_fd_procedures
	displays the failed procedures contained in a product

	usd_p_product_fd_procedures_s
	is used for security impacts
************************************************************************/


/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_product_fd_procedures_s]
(@__uri nvarchar(255), 
						@__productname nvarchar(129), 
						@__procedure nvarchar(129),
						@__task integer)


as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, uninstallstate, packagetype,
			"procedure", procedureversion
		
		from usd_v_product_procedures_s

		where  	user_uuid=@__user_uuid 
			and productname  like @__productname 
			and ( state = 10 or state = 5 or state = 14 )
			and "procedure"  like @__procedure 
			and substring(cast(task as binary), 0, 4) like 
				case when @__task < 255 then (substring(cast(@__task as binary), 0, 4)) else '%' end

		order by productname, productversion, "procedure", agent_name
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, uninstallstate, packagetype,
			"procedure", procedureversion
		
		from usd_v_product_procedures_a_s

		where  	user_uuid=@__user_uuid 
			and productname  like @__productname 
			and ( state = 10 or state = 5 or state = 14 )
			and "procedure"  like @__procedure 
			and substring(cast(task as binary), 0, 4) like 
				case when @__task < 255 then (substring(cast(@__task as binary), 0, 4)) else '%' end

		order by productname, productversion, "procedure", agent_name
	     


end
GO

GO
--SqlScripter----[dbo].[usd_p_product_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_product_jobs    Script Date: 12/1/2005 11:50:30 PM ******/

ALTER PROCEDURE [dbo].[usd_p_product_jobs]
(@__productname nvarchar(129) , @__productversion  nvarchar(129))


as 
begin
	select	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_product_jobs

	where  productname like @__productname and productversion like @__productversion

	order by productname, productversion, "procedure", agent_name, jobname
	

end
GO

GO
--SqlScripter----[dbo].[usd_p_product_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_product_jobs
	displays the jobs contained in a product
	It contains the succeeded and failed installation jobs

	usd_p_product_jobs_s
	is used for security impacts
************************************************************************/






/************************************************************************
	procedure

************************************************************************/


ALTER PROCEDURE [dbo].[usd_p_product_jobs_s]
(	@__uri nvarchar(255), @__productname nvarchar(129), @__productversion nvarchar(129) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_product_jobs_s

		where  	user_uuid=@__user_uuid 
			and productname like @__productname 
			and productversion like @__productversion

		order by productname, productversion, "procedure", agent_name, jobname
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_product_jobs_a_s

		where  	user_uuid=@__user_uuid 
			and productname like @__productname 
			and productversion like @__productversion

		order by productname, productversion, "procedure", agent_name, jobname
	     


end
GO

GO
--SqlScripter----[dbo].[usd_p_product_procedures].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_procedures]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_procedures] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_product_procedures    Script Date: 12/1/2005 11:50:30 PM ******/

ALTER PROCEDURE [dbo].[usd_p_product_procedures]
(@__productname nvarchar(129) , 
					  @__productversion  nvarchar(129), 
					  @__procedure nvarchar(129),
					  @__task integer)


as 
begin
	select	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, uninstallstate, packagetype,
		"procedure", procedureversion
	
	from usd_v_product_procedures

	where  productname like @__productname 
		and productversion like @__productversion 
		and "procedure" like @__procedure
		and substring (cast(task as binary), 0, 4) like 
			case when @__task < 255 then substring(cast(@__task as binary), 0, 4) else '%' end

	order by productname, productversion, "procedure", agent_name
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_product_procedures_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_product_procedures_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_product_procedures_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_product_procedures
	displays the jobs contained in a product
	It contains the succeeded and failed installation jobs

	usd_p_product_procedures_s
	is used for security impacts
************************************************************************/


/************************************************************************
	procedure

************************************************************************/


ALTER PROCEDURE [dbo].[usd_p_product_procedures_s]
(@__uri nvarchar(255), 
					@__productname nvarchar(129), 
					@__productversion nvarchar(129), 
					@__procedure nvarchar(129),
					@__task integer)

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, uninstallstate, packagetype,
			"procedure", procedureversion
		
		from usd_v_product_procedures_s

		where  	user_uuid=@__user_uuid and 
			productname like @__productname 
			and productversion like @__productversion
			and "procedure" like @__procedure
			and substring(cast(task as binary), 0, 4) like 
				case when @__task < 255 then substring(cast(@__task as binary), 0, 4) else '%' end

		order by productname, productversion, "procedure", agent_name
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, uninstallstate, packagetype,
			"procedure", procedureversion
		
		from usd_v_product_procedures_a_s

		where  	user_uuid=@__user_uuid and 
			productname like @__productname 
			and productversion like @__productversion
			and "procedure" like @__procedure
			and substring(cast(task as binary), 0, 4) like 
				case when @__task < 255 then substring(cast(@__task as binary), 0, 4) else '%' end

		order by productname, productversion, "procedure", agent_name
	     


end
GO

GO
--SqlScripter----[dbo].[usd_p_sserver_clients].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_sserver_clients]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_sserver_clients] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_sserver_clients    Script Date: 12/1/2005 11:50:30 PM ******/

ALTER PROCEDURE [dbo].[usd_p_sserver_clients]
(	@__server_name nvarchar(255) )


as 
begin
	select	agent_name
	
	from usd_v_sserver_clients

	where  server_name like @__server_name 
	order by agent_name
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_sserver_clients_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_sserver_clients_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_sserver_clients_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_sserver_clients
	displays the clients (user and computer) on a staging server

	usd_p_sserver_clients
	is used for security impacts
************************************************************************/


/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_sserver_clients_s]
(	@__uri nvarchar(255), @__server_name nvarchar(129) )


as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name
		
		from usd_v_sserver_clients_s

		where  	user_uuid=@__user_uuid and 
			server_name like @__server_name 

		order by agent_name
	     
	else 
	
		select 	
			agent_name
		
		from usd_v_sserver_clients_a_s

		where  	user_uuid=@__user_uuid and 
			server_name like @__server_name 

		order by agent_name
	     


end
GO

GO
--SqlScripter----[dbo].[usd_p_target_fd_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_target_fd_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_target_fd_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_target_fd_jobs    Script Date: 12/1/2005 11:50:31 PM ******/

ALTER PROCEDURE [dbo].[usd_p_target_fd_jobs]
(@__agent_name nvarchar(192) )

as 
begin
	select 	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
		from usd_v_target_jobs

	where  agent_name like @__agent_name
		and ( state = 10 or state = 5 or state = 14 )

	order by jobname, productname, productversion, "procedure"
	
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_target_fd_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_target_fd_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_target_fd_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_target_fd_jobs
	displays the jobs on a system
	It contains the failed installation jobs

	usd_p_target_fd_jobs_s
	is used for security impacts
************************************************************************/





/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_target_fd_jobs_s]
(@__uri nvarchar(255), @__agent_name nvarchar(192) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
			
		from usd_v_target_jobs_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
			
		from usd_v_target_jobs_a_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name
			and ( state = 10 or state = 5 or state = 14 )

		order by jobname, productname, productversion, "procedure"
	     

	
end
GO

GO
--SqlScripter----[dbo].[usd_p_target_jobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_target_jobs]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_target_jobs] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_target_jobs    Script Date: 12/1/2005 11:50:31 PM ******/

ALTER PROCEDURE [dbo].[usd_p_target_jobs]
(@__agent_name nvarchar(192) )
as 
begin

	select 	agent_name, agent_type, agent_uuid,
		productname, productversion,
		object_uuid, task, state, 
		errorcause, errorparam,
		activationtime,
		creationtime, completiontime,
		userparams, packagetype,
		jobname, "procedure", procedureversion
	
	from usd_v_target_jobs

	where  agent_name like @__agent_name

	order by jobname, productname, productversion, "procedure"
	
end
GO

GO
--SqlScripter----[dbo].[usd_p_target_jobs_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_target_jobs_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_target_jobs_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_target_jobs
	displays the jobs on a system
	It contains the succeeded and failed installation jobs

	usd_p_target_jobs_s
	is used for security impacts
************************************************************************/






/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_target_jobs_s]
(@__uri nvarchar(255), @__agent_name nvarchar(192) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_target_jobs_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name

		order by jobname, productname, productversion, "procedure"
	     
	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			productname, productversion,
			object_uuid, task, state, 
			errorcause, errorparam,
			activationtime,
			creationtime, completiontime,
			userparams, packagetype,
			jobname, "procedure", procedureversion
		
		from usd_v_target_jobs_a_s

		where  	user_uuid=@__user_uuid and agent_name like @__agent_name

		order by jobname, productname, productversion, "procedure"
	     

	
end
GO

GO
--SqlScripter----[dbo].[usd_p_targets_os].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_targets_os]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_targets_os] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_p_targets_os    Script Date: 12/1/2005 11:50:31 PM ******/

ALTER PROCEDURE [dbo].[usd_p_targets_os]
AS 
begin
	select 	agent_name, agent_type, agent_uuid, 
		proc_os_name,
        	is_boot_server, is_staging_server, is_user, is_computer, server_label
	from usd_v_targets_os

	order by agent_name

end
GO

GO
--SqlScripter----[dbo].[usd_p_targets_os_s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_p_targets_os_s]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_p_targets_os_s] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/************************************************************************
	procedure 	usd_p_targets_os
	displays the usd relavant target systems
	and their OS
	
	procedure 	usd_p_targets_os_s
	is used for security impacts

************************************************************************/





/************************************************************************
	procedure

************************************************************************/

ALTER PROCEDURE [dbo].[usd_p_targets_os_s]
(@__uri nvarchar(255) )

as 
begin
declare @__is_area_enabled integer;
declare @__user_uuid binary(16);


	SELECT @__user_uuid=user_uuid, @__is_area_enabled=is_area_enabled FROM ols_v_user WHERE  uri = @__uri;

	if ( @__is_area_enabled = 0 )
	
		select 	
			agent_name, agent_type, agent_uuid,
			proc_os_name,
				is_boot_server, is_staging_server, is_user, is_computer,
			server_label
		
		from usd_v_targets_os_s

		where  uri=@__uri 	

		order by agent_name

	else 
	
		select 	
			agent_name, agent_type, agent_uuid,
			proc_os_name,
				is_boot_server, is_staging_server, is_user, is_computer,
			server_label
		
		from usd_v_targets_os_a_s

		where  uri=@__uri 	

		order by agent_name


end
GO

GO
--SqlScripter----[dbo].[usd_proc_u_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_proc_u_tbl_ver]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_proc_u_tbl_ver] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/* Start of locks for dependent tables */
 
/* End of lines added to convert to online lock */

/* ********************** 10022 begin ************************** */
/* performance relevant changes */

ALTER PROCEDURE [dbo].[usd_proc_u_tbl_ver]
@tbl_no integer, @grp_type integer, @mem_type integer, @comp_id integer
as
begin
    if(@tbl_no = 0)
    begin
        if((@mem_type = 1 or @mem_type = 4) and (@comp_id = 40 or @comp_id = 46))
	begin
            /* Increase the USD table version for target */
            update usd_class_version set modify_version = modify_version + 1 where name = 'target'
	end
    end
    else if (@tbl_no = 1)
    begin
        if(@grp_type = 1) 
	begin
            /* Increase the USD table version for asset_grp */
            update usd_class_version set modify_version = modify_version + 1 where name = 'asset_grp'
	end
        if(@grp_type = 4) 
	begin
            /* Increase the USD table version for lsg */
            update usd_class_version set modify_version = modify_version + 1 where name = 'lsg'
	end
        if(@grp_type = 7) 
	begin
            /* Increase the USD table version for server_grp */
            update usd_class_version set modify_version = modify_version + 1 where name = 'server_grp'
	end
    end
    else if (@tbl_no = 2) 
    begin
        /* Increase the USD table version for csite, ls, ownsite */
        update usd_class_version set modify_version = modify_version + 1 where name = 'csite'
        update usd_class_version set modify_version = modify_version + 1 where name = 'ls'
        update usd_class_version set modify_version = modify_version + 1 where name = 'ownsite'
    end
    else if (@tbl_no = 3) 
    begin
        if(@mem_type = 0) 
	begin
            /* Increase the USD table version for asset_grp, lsg, server_grp */
            update usd_class_version set modify_version = modify_version + 1 where name = 'asset_grp'
            update usd_class_version set modify_version = modify_version + 1 where name = 'lsg'
            update usd_class_version set modify_version = modify_version + 1 where name = 'server_grp'
	end
        if(@mem_type = 1 or @mem_type = 4 or @mem_type = 7) 
	begin
            /* Increase the USD table version for ls */
            update usd_class_version set modify_version = modify_version + 1 where name = 'target'
	end
        if(@mem_type = 5) 
	begin
            /* Increase the USD table version for ls */
            update usd_class_version set modify_version = modify_version + 1 where name = 'ls'
	end
    end
end
GO

GO
--SqlScripter----[dbo].[usd_procos_id_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_procos_id_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_procos_id_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_procos_id_allcltn    Script Date: 12/1/2005 11:50:13 PM ******/

ALTER PROCEDURE [dbo].[usd_procos_id_allcltn]
AS
begin
select objectid from usd_iprocos
order by id
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_ap_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_ap_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_ap_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_ap_name_cltn    Script Date: 12/1/2005 11:50:04 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_ap_name_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_actproc
where rsw = @key_value
-- 0=addedproc, 3=converted (enumeration in code) 
and (includedproc = 0 or includedproc = 3)
order by itemname
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_ap_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_ap_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_ap_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_ap_name_cltn_ro    Script Date: 12/1/2005 11:50:04 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_ap_name_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, creation_user, 
itemname, itemversion, apesos, subpathentered, filedby, activatedby, 
comment, creationdate, creationtime, changedate, changetime, type, 
task, subpath, proctorun, includedproc, rsw, volume, bootflags, mask, 
opmask, bootbefore, bootafter, mgmtmask, procparameter, query
from usd_actproc
where rsw = @key_value
-- 0=addedproc, 3=converted (enumeration in code) 
and (includedproc = 0 or includedproc = 3)
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_distsw_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_distsw_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_distsw_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_distsw_nosort_cltn    Script Date: 12/1/2005 11:50:04 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_distsw_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_distsw
where rsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_distsw_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_distsw_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_distsw_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_distsw_nosort_cltn_ro    Script Date: 12/1/2005 11:50:04 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_distsw_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, 
distributiondate, distributiontime, numberofinstallations, 
numberofinstsfound, numberofinstslocally, filedby, rsw, localsite
from usd_distsw
where rsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_fold_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_fold_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_fold_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_fold_name_cltn    Script Date: 12/1/2005 11:50:05 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_fold_name_cltn]
(@key_value as binary(16)) as
begin
select lswg.swg from usd_link_swg_sw lswg, usd_swfold swf
where lswg.swg = swf.objectid
and lswg.sw = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_fold_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_fold_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_fold_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_fold_name_cltn_ro    Script Date: 12/1/2005 11:50:05 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_fold_name_cltn_ro]
(@key_value as binary(16)) as
begin
select swf.objectid, swf.version, swf.creation_user, 
swf.qtask, swf.aux, swf.aux2, swf.type, swf.attributes, swf.name, 
swf.comment, swf.credate, swf.cretime, swf.chdate, swf.chtime, 
swf.propflag, swf.qcalendar, swf.qevalrate, swf.qnextevaldate, 
swf.qnextevaltime, swf.qevaldate, swf.qevaltime, swf.qtemplfold, 
swf.qtype, swf.state, swf.seal, swf.var, swf.auxtext0, swf.auxtext1, 
swf.auxtext2, swf.auxtext3, swf.queryid, swf.security_group
from usd_link_swg_sw lswg, usd_swfold swf
where lswg.swg = swf.objectid
and lswg.sw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_inclap_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_inclap_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_inclap_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_inclap_name_cltn    Script Date: 12/1/2005 11:50:05 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_inclap_name_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_actproc
where rsw = @key_value
-- 1=embeddedproc, 2=standaloneproc (enumeration in code) 
and (includedproc = 1 or includedproc = 2)
order by itemname
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_inclap_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_inclap_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_inclap_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_inclap_name_cltn_ro    Script Date: 12/1/2005 11:50:05 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_inclap_name_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, 
creation_user, itemname, itemversion, apesos, subpathentered, filedby,
activatedby, comment, creationdate, creationtime, changedate, 
changetime, type, task, subpath, proctorun, includedproc, rsw, volume,
bootflags, mask, opmask, bootbefore, bootafter, mgmtmask, 
procparameter, query
from usd_actproc
where rsw = @key_value
-- 1=embeddedproc, 2=standaloneproc (enumeration in code) 
and (includedproc = 1 or includedproc = 2)
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_name_allcltn    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_name_allcltn]
AS
begin
select objectid from usd_rsw
order by itemname, itemversion
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_nosort_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_nosort_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_nosort_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_nosort_allcltn    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_nosort_allcltn]
AS
begin
select objectid from usd_rsw
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_vol_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_vol_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_vol_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_vol_nosort_cltn    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_vol_nosort_cltn]
(@key_value as binary(16)) as
begin
select objectid from usd_volume
where rsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_rsw_vol_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_rsw_vol_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_rsw_vol_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_rsw_vol_nosort_cltn_ro    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_rsw_vol_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select objectid, version, name, comment, number, rsw 
from usd_volume
where rsw = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_srv_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_srv_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_srv_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_srv_name_cltn    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_srv_name_cltn]
(@key_value as binary(16)) as
begin
select c.objectid from ca_group_member gm, usd_v_target c, ca_server s
where gm.member_uuid = s.server_uuid
and c.objectid = s.dis_hw_uuid
and gm.group_uuid = @key_value
and gm.member_type = 7
order by c.lanname
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_srv_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_servgrp_srv_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_srv_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[usd_servgrp_srv_name_cltn_ro]
(@key_value as binary(16)) as
begin
select c.objectid, c.version, c.creation_user,
c.managementtype, c.ssname, c.lanname, c.lanaddress, c.ip_address, 
c.creationtime, c.changetime, c.regflag, c.type, c.state, c.curros, 
c.comment, c.calendar, c.ssid, c.sdver, c.uuid, c.prevls, c.agrefcnt, 
c.locks, c.download_method, c.agent_lock
from ca_group_member gm, usd_v_target c, ca_server s
where gm.member_uuid = s.server_uuid
and c.objectid = s.dis_hw_uuid
and gm.group_uuid = @key_value
and gm.member_type = 7
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_subgrp_name_cltn    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.member_uuid from ca_group_member gm, usd_v_server_grp sg
where gm.member_uuid = sg.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
--(cg.attributes & 0x00000004)
order by sg.name
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select sg.objectid, sg.version, sg.creation_user, 
sg.qtask, sg.aux, sg.aux2, sg.type, sg.attributes, sg.name, 
sg.comment, sg.credate, sg.cretime, sg.chdate, sg.chtime, sg.propflag,
sg.qcalendar, sg.qevalrate, sg.qnextevaldate, sg.qnextevaltime, 
sg.qevaldate, sg.qevaltime, sg.qtemplfold, sg.qtype, sg.state, 
sg.seal, sg.var, sg.auxtext0, sg.auxtext1, sg.auxtext2, sg.auxtext3, 
sg.queryid
from ca_group_member gm, usd_v_server_grp sg
where gm.member_uuid = sg.objectid
and gm.group_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_supgrp_name_cltn    Script Date: 12/1/2005 11:50:32 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select gm.group_uuid from ca_group_member gm, usd_v_server_grp sg
where gm.group_uuid = sg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
--(cg.attributes & 0x00000004)
order by sg.name
end
GO

GO
--SqlScripter----[dbo].[usd_servgrp_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_servgrp_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_servgrp_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_servgrp_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:33 PM ******/

ALTER PROCEDURE [dbo].[usd_servgrp_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select 
sg.objectid, sg.version, sg.creation_user, sg.qtask, sg.aux, sg.aux2, 
sg.type, sg.attributes, sg.name, sg.comment, sg.credate, sg.cretime, 
sg.chdate, sg.chtime, sg.propflag, sg.qcalendar, sg.qevalrate, 
sg.qnextevaldate, sg.qnextevaltime, sg.qevaldate, sg.qevaltime, 
sg.qtemplfold, sg.qtype, sg.state, sg.seal, sg.var, sg.auxtext0, 
sg.auxtext1, sg.auxtext2, sg.auxtext3, sg.queryid, 
sg.evaluation_location, sg.group_flag, sg.group_system
from ca_group_member gm, usd_v_server_grp sg
where gm.group_uuid = sg.objectid
and gm.member_uuid = @key_value
and gm.member_type = 0
end
GO

GO
--SqlScripter----[dbo].[usd_sgrp_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_sgrp_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_sgrp_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_sgrp_name_allcltn    Script Date: 12/1/2005 11:50:33 PM ******/


ALTER PROCEDURE [dbo].[usd_sgrp_name_allcltn]
AS
begin
select objectid from usd_v_server_grp
--(attributes & 0x00000004)
order by name
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_ap_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_ap_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_ap_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_ap_nosort_cltn    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_ap_nosort_cltn]
(@key_value as binary(16)) as
begin
select lpf.ap from usd_link_grp_proc lpf
where lpf.procgrp = @key_value
order by "order"
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_ap_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_ap_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_ap_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_ap_nosort_cltn_ro    Script Date: 12/1/2005 11:50:06 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_ap_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select ap.objectid, ap.version, 
ap.creation_user, ap.itemname, ap.itemversion, ap.apesos, 
ap.subpathentered, ap.filedby, ap.activatedby, ap.comment, 
ap.creationdate, ap.creationtime, ap.changedate, ap.changetime, 
ap.type, ap.task, ap.subpath, ap.proctorun, ap.includedproc, ap.rsw, 
ap.volume, ap.bootflags, ap.mask, ap.opmask, ap.bootbefore, 
ap.bootafter, ap.mgmtmask, ap.procparameter, ap.query
from usd_link_grp_proc lpf, usd_actproc ap
where lpf.ap = ap.objectid
and lpf.procgrp = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_rsw_nosort_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_rsw_nosort_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_rsw_nosort_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_rsw_nosort_cltn    Script Date: 12/1/2005 11:50:07 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_rsw_nosort_cltn]
(@key_value as binary(16)) as
begin
select lsw.sw from usd_link_swg_sw lsw
where lsw.swg = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_rsw_nosort_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_rsw_nosort_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_rsw_nosort_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_rsw_nosort_cltn_ro    Script Date: 12/1/2005 11:50:07 PM ******/



ALTER PROCEDURE [dbo].[usd_swfld_rsw_nosort_cltn_ro]
(@key_value as binary(16)) as
begin
select sw.objectid, sw.version, sw.creation_user, sw.packagesize,
sw.packagetype, sw.itemname, sw.itemversion, sw.itemtype, sw.sourcemedium, 
sw.productname, sw.productversion, sw.filedby, sw.supplier, 
sw.comment, sw.creationdate, sw.creationtime, 
sw.changedate, sw.changetime, sw.reportevents, sw.activationproc, 
sw.recnotification, sw.singlemediasourcepath, 
sw.singlemediasourcepathentered, sw.basedon, sw.deliverproc, 
sw.undeliverproc, sw.archtime, sw.addsize, sw.archpath, sw.archby, 
sw.archcomment, sw.archflag, sw.flags, sw.crc32, sw.software_def
from usd_link_swg_sw lsw, usd_rsw sw
where lsw.sw = sw.objectid
and lsw.swg = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_subgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_subgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_subgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_subgrp_name_cltn    Script Date: 12/1/2005 11:50:07 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_subgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lswg.grpchild from usd_link_swgrp lswg, usd_swfold swf
where lswg.grpchild = swf.objectid
and lswg.grpparent = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_subgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_subgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_subgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_subgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:07 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_subgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select swf.objectid, swf.version, 
swf.creation_user, swf.qtask, swf.aux, swf.aux2, swf.type, 
swf.attributes, swf.name, swf.comment, swf.credate, swf.cretime, 
swf.chdate, swf.chtime, swf.propflag, swf.qcalendar, swf.qevalrate, 
swf.qnextevaldate, swf.qnextevaltime, swf.qevaldate, swf.qevaltime, 
swf.qtemplfold, swf.qtype, swf.state, swf.seal, swf.var, swf.auxtext0,
swf.auxtext1, swf.auxtext2, swf.auxtext3, swf.queryid, 
swf.security_group
from usd_link_swgrp lswg, usd_swfold swf
where lswg.grpchild = swf.objectid
and lswg.grpparent = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_supgrp_name_cltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_supgrp_name_cltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_supgrp_name_cltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_supgrp_name_cltn    Script Date: 12/1/2005 11:50:07 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_supgrp_name_cltn]
(@key_value as binary(16)) as
begin
select lswg.grpparent from usd_link_swgrp lswg, usd_swfold swf
where lswg.grpparent = swf.objectid
and lswg.grpchild = @key_value
order by swf.name, (cast(swf.attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_swfld_supgrp_name_cltn_ro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfld_supgrp_name_cltn_ro]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfld_supgrp_name_cltn_ro] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfld_supgrp_name_cltn_ro    Script Date: 12/1/2005 11:50:07 PM ******/

ALTER PROCEDURE [dbo].[usd_swfld_supgrp_name_cltn_ro]
(@key_value as binary(16)) as
begin
select swf.objectid, swf.version, 
swf.creation_user, swf.qtask, swf.aux, swf.aux2, swf.type, 
swf.attributes, swf.name, swf.comment, swf.credate, swf.cretime, 
swf.chdate, swf.chtime, swf.propflag, swf.qcalendar, swf.qevalrate, 
swf.qnextevaldate, swf.qnextevaltime, swf.qevaldate, swf.qevaltime, 
swf.qtemplfold, swf.qtype, swf.state, swf.seal, swf.var, swf.auxtext0,
swf.auxtext1, swf.auxtext2, swf.auxtext3, swf.queryid, 
swf.security_group
from usd_link_swgrp lswg, usd_swfold swf
where lswg.grpparent = swf.objectid
and lswg.grpchild = @key_value
end
GO

GO
--SqlScripter----[dbo].[usd_swfold_name_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_swfold_name_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_swfold_name_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_swfold_name_allcltn    Script Date: 12/1/2005 11:50:08 PM ******/

ALTER PROCEDURE [dbo].[usd_swfold_name_allcltn]
AS
begin
-- special sort because of distributions, second level sort is dist. attr. 
select objectid from usd_swfold
order by name, (cast(attributes as int) & 0x00000004)
end
GO

GO
--SqlScripter----[dbo].[usd_task_nosort_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_task_nosort_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_task_nosort_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_task_nosort_allcltn    Script Date: 12/1/2005 11:50:08 PM ******/

ALTER PROCEDURE [dbo].[usd_task_nosort_allcltn]
AS
begin
	select objectid from usd_task order by creationtime
end
GO

GO
--SqlScripter----[dbo].[usd_vol_nosort_allcltn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_vol_nosort_allcltn]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usd_vol_nosort_allcltn] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usd_vol_nosort_allcltn    Script Date: 12/1/2005 11:50:08 PM ******/

ALTER PROCEDURE [dbo].[usd_vol_nosort_allcltn]
AS
begin
select objectid from usd_volume
end
GO

GO
--SqlScripter----[dbo].[usm_next_sequence_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usm_next_sequence_value]') IS NULL EXEC('CREATE PROCEDURE [dbo].[usm_next_sequence_value] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
/****** Object:  Stored Procedure dbo.usm_next_sequence_value    Script Date: 12/1/2005 11:50:08 PM ******/

/****************************************************************************************/
/*	Change Control									*/
/*											*/
/*	Change Date	Changes By	Comments					*/
/*	===========	==========	========					*/
/* 	25-Apr-2005	mulwi01		Star 14077222 USM - STORED PROC COUNT(*) FIX */
/*  05-Oct-2005 hopst01 	Star 14423530 - USM SQL SERVER 1.04 STORED PROC */
/*											*/
/*											*/
/****************************************************************************************/



ALTER PROCEDURE [dbo].[usm_next_sequence_value]
@name varchar(32)
as
declare @next_sequence int
set @next_sequence = -1
if exists (select top 1 '1' from usm_lastid where name=@name)
begin
update usm_lastid set @next_sequence = id = id + 1
where name = @name
end
else
begin
insert into usm_lastid (name, id) values (@name,0)
return 0
end
return @next_sequence;
GO
