
GO
--SqlScripter----[dbo].[backup_r_insert_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[backup_r_insert_job]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[backup_r_insert_job]')
GO
/*
 *********************************************
 trigger for inserting backup_job entry
*/

CREATE TRIGGER [dbo].[backup_r_insert_job]
ON backup_job
            after insert
	as
    begin
		declare @_server_id binary(16);
		select	@_server_id = (select server_id from inserted);

		execute backup_p_job_seq_number @_server_id;
	end;
GO

GO
--SqlScripter----[dbo].[bckdef_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[bckdef_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[bckdef_update]')
GO
/****** Object:  Trigger dbo.bckdef_update    Script Date: 12/1/2005 11:50:47 PM ******/

/*
 ************************************
 * after update(BCKID,DOMAINID,DBNAME,FILENAME,VERSION,BCKFLAG,EDITOR,REVNR)
 */
CREATE TRIGGER [dbo].[bckdef_update]
ON bckdef 
   after update
  

as
 if UPDATE(BCKID) or UPDATE(DOMAINID) or UPDATE(DBNAME) or UPDATE(FILENAME) or UPDATE(VERSION) or UPDATE(BCKFLAG) or UPDATE(EDITOR) or UPDATE(REVNR)
begin
    declare @domainid int,@bckid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT domainid,bckid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@bckid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        execute bckdef_server_version @domainid,@bckid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@bckid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[ca_am_polilog_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[ca_am_polilog_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ca_am_polilog_delete]')
GO
CREATE TRIGGER [dbo].[ca_am_polilog_delete]
ON polilog 
	for delete
	
as
begin
    declare @object_uuid binary(16) ;
    
    DECLARE am_polilog_del_cur CURSOR 
        FOR SELECT object_uuid
            FROM deleted
            
    OPEN am_polilog_del_cur 
    FETCH NEXT FROM am_polilog_del_cur INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        execute ca_am_update_agent_derived @object_uuid
        FETCH NEXT FROM am_polilog_del_cur INTO @object_uuid
    END 
    CLOSE am_polilog_del_cur
    DEALLOCATE am_polilog_del_cur 
    
      
end
GO

GO
--SqlScripter----[dbo].[ca_am_polilog_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_am_polilog_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ca_am_polilog_insert]')
GO
/****** Object:  Trigger dbo.ca_am_polilog_insert    Script Date: 12/1/2005 11:51:13 PM ******/


/*
 ************************************
 *
 */
CREATE TRIGGER [dbo].[ca_am_polilog_insert]
ON polilog 
	 after insert
	

as
begin
    declare @object_uuid binary(16) ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT object_uuid
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        execute ca_am_update_agent_derived @object_uuid
        FETCH NEXT FROM trans_Cursor INTO @object_uuid
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
  
      
end
GO

GO
--SqlScripter----[dbo].[ca_am_polilog_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_am_polilog_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ca_am_polilog_update]')
GO
/****** Object:  Trigger dbo.ca_am_polilog_update    Script Date: 12/1/2005 11:51:13 PM ******/

/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[ca_am_polilog_update]
ON polilog 
	 after update
	
as
begin
    declare @object_uuid binary(16) ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT object_uuid
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        execute ca_am_update_agent_derived @object_uuid
        FETCH NEXT FROM trans_Cursor INTO @object_uuid
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[ca_group_member_agent_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_group_member_agent_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ca_group_member_agent_delete]')
GO
/****** Object:  Trigger dbo.ca_group_member_agent_delete    Script Date: 12/1/2005 11:51:13 PM ******/


/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[ca_group_member_agent_delete]
ON ca_group_member 
  for delete 
as
    declare @member_uuid binary(16);
begin
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT member_uuid 
            FROM deleted 
        
        OPEN trans_Cursor 
        FETCH NEXT FROM trans_Cursor INTO @member_uuid
        WHILE @@FETCH_STATUS = 0 
        BEGIN 
            execute ca_agent_server_version_by_uuid @member_uuid;
        
            FETCH NEXT FROM trans_Cursor INTO @member_uuid;
        END 
        CLOSE trans_Cursor 
        DEALLOCATE trans_Cursor 
   
end;
GO

GO
--SqlScripter----[dbo].[ca_group_member_agent_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ca_group_member_agent_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ca_group_member_agent_insert]')
GO
/****** Object:  Trigger dbo.ca_group_member_agent_insert    Script Date: 12/1/2005 11:51:14 PM ******/


/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[ca_group_member_agent_insert]
ON ca_group_member 
    after insert
as
    declare @member_uuid binary(16);
begin
    set @member_uuid = (select member_uuid from inserted);
   execute  ca_agent_server_version_by_uuid @member_uuid;
end;
GO

GO
--SqlScripter----[dbo].[dbdel_DDTable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_DDTable]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_DDTable]')
GO
-- add it triggers for deleting FKey Refs
CREATE TRIGGER [dbo].[dbdel_DDTable]
ON DDTable FOR DELETE AS BEGIN DELETE FROM DDColumn FROM deleted WHERE DDColumn.DDTableId = deleted.DDTableId END
GO

GO
--SqlScripter----[dbo].[dbdel_Execution].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_Execution]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_Execution]')
GO
CREATE TRIGGER [dbo].[dbdel_Execution]
ON Execution FOR DELETE AS BEGIN DELETE FROM DDTable FROM deleted WHERE DDTable.ExecutionId = deleted.ExecutionId DELETE FROM DDTableModify FROM deleted WHERE DDTableModify.ExecutionId = deleted.ExecutionId DELETE FROM Error FROM deleted WHERE Error.ExecutionId = deleted.ExecutionId DELETE FROM ScriptMessageLog FROM deleted WHERE ScriptMessageLog.ExecutionId = deleted.ExecutionId END
GO

GO
--SqlScripter----[dbo].[dbdel_IPUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_IPUser]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_IPUser]')
GO
CREATE TRIGGER [dbo].[dbdel_IPUser]
ON IPUser FOR DELETE AS BEGIN DELETE FROM ipObject FROM deleted WHERE ipObject.UserId = deleted.UserId END
GO

GO
--SqlScripter----[dbo].[dbdel_LookOutServer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_LookOutServer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_LookOutServer]')
GO
CREATE TRIGGER [dbo].[dbdel_LookOutServer]
ON LookOutServer FOR DELETE AS BEGIN DELETE FROM Execution FROM deleted WHERE Execution.ServerId = deleted.ServerId DELETE FROM LookOutControl FROM deleted WHERE LookOutControl.ServerId = deleted.ServerId END
GO

GO
--SqlScripter----[dbo].[dbdel_Object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_Object]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_Object]')
GO
CREATE TRIGGER [dbo].[dbdel_Object]
ON ipObject FOR DELETE AS BEGIN DELETE FROM Permissions FROM deleted WHERE Permissions.ObjectId = deleted.ObjectId DELETE FROM ipRequest FROM deleted WHERE ipRequest.RequestId = deleted.ObjectId DELETE FROM ipProvider FROM deleted WHERE ipProvider.ProviderId = deleted.ObjectId DELETE FROM RDBMS_Provider FROM deleted WHERE RDBMS_Provider.ProviderId = deleted.ObjectId END
GO

GO
--SqlScripter----[dbo].[dbdel_Provider].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_Provider]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_Provider]')
GO
CREATE TRIGGER [dbo].[dbdel_Provider]
ON ipProvider FOR DELETE AS BEGIN DELETE FROM RequestProvider FROM deleted WHERE RequestProvider.ProviderId = deleted.ProviderId END
GO

GO
--SqlScripter----[dbo].[dbdel_Request].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[dbdel_Request]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[dbdel_Request]')
GO
CREATE TRIGGER [dbo].[dbdel_Request]
ON ipRequest FOR DELETE AS BEGIN DELETE FROM Execution FROM deleted WHERE Execution.RequestId = deleted.RequestId DELETE FROM RequestProvider FROM deleted WHERE RequestProvider.RequestId = deleted.RequestId DELETE FROM RequestQueue FROM deleted WHERE RequestQueue.RequestId = deleted.RequestId DELETE FROM SimpleRequest FROM deleted WHERE SimpleRequest.RequestId = deleted.RequestId END
GO

GO
--SqlScripter----[dbo].[del_db_Column].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Column]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Column]')
GO
-- if you delete a column - delete the info from index & flat file as well
CREATE TRIGGER [dbo].[del_db_Column]
ON db_Column FOR DELETE AS BEGIN DELETE FROM db_SeqColumn FROM deleted where db_SeqColumn.dbrep_IID = deleted.dbrep_IID DELETE FROM db_IndexCol FROM deleted where db_IndexCol.dbrep_ColumnIID = deleted.dbrep_IID  END
GO

GO
--SqlScripter----[dbo].[del_db_DataType].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_DataType]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_DataType]')
GO
-- if you delete the datatype - delete any columns that used datatype
CREATE TRIGGER [dbo].[del_db_DataType]
ON db_DataType FOR DELETE AS BEGIN DELETE FROM db_Column FROM deleted where db_Column.dbrep_DatatypeIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Gator].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Gator]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Gator]')
GO
-- if you delete an aggregation - delete from star schemas too
CREATE TRIGGER [dbo].[del_db_Gator]
ON db_Gator FOR DELETE AS BEGIN DELETE FROM db_GatorStar FROM deleted where db_GatorStar.dbrep_GatorIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Index]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Index]')
GO
-- if you delete and index - delete the columns as well
CREATE TRIGGER [dbo].[del_db_Index]
ON db_Index FOR DELETE AS BEGIN DELETE FROM db_IndexCol FROM deleted where db_IndexCol.dbrep_IndexIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Object]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Object]')
GO
--
-- create triggers on the IDB+ tables to maintain referential integrity
--
-- if you delete an object - cascade the delete to dependent tables
CREATE TRIGGER [dbo].[del_db_Object]
ON db_Object FOR DELETE AS BEGIN DELETE FROM db_Application FROM deleted where db_Application.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Parameter FROM deleted  where db_Parameter.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Op FROM deleted where db_Op.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Program FROM deleted where db_Program.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Gator FROM deleted where db_Gator.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Star FROM deleted where db_Star.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Field FROM deleted  where db_Field.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Layout FROM deleted where db_Layout.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Index FROM deleted where db_Index.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Column FROM deleted where db_Column.dbrep_IID = deleted.dbrep_IID DELETE FROM db_Table FROM deleted where db_Table.dbrep_IID = deleted.dbrep_IID DELETE FROM db_DataType FROM deleted where db_DataType.dbrep_IID = deleted.dbrep_IID DELETE FROM db_ServerType FROM deleted where db_ServerType.dbrep_IID = deleted.dbrep_IID DELETE FROM db_InfoBlob FROM deleted where db_InfoBlob.dbrep_IID = deleted.dbrep_IID DELETE FROM db_WKF FROM deleted where db_WKF.dbrep_IID = deleted.dbrep_IID DELETE FROM db_WKFConnection FROM deleted where db_WKFConnection.dbrep_IID = deleted.dbrep_IID DELETE FROM db_ProgramInstance FROM deleted  where db_ProgramInstance.dbrep_IID = deleted.dbrep_IID DELETE FROM db_ProgramType FROM deleted where db_ProgramType.dbrep_IID = deleted.dbrep_IID DELETE FROM db_ProgramTypeMisc FROM deleted where db_ProgramTypeMisc.dbrep_IID = deleted.dbrep_IID DELETE FROM db_PSAFile FROM deleted where db_PSAFile.dbrep_IID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Op].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Op]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Op]')
GO
-- if you delete an Op (RT, LOOKUP) delete the segments
CREATE TRIGGER [dbo].[del_db_Op]
ON db_Op FOR DELETE AS BEGIN DELETE FROM db_OpSegment FROM deleted where db_OpSegment.dbrep_IID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Program].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Program]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Program]')
GO
-- if you delete a program, delete the program instances from the workflow
CREATE TRIGGER [dbo].[del_db_Program]
ON db_Program FOR DELETE AS BEGIN DELETE FROM db_ProgramInstance FROM deleted where db_ProgramInstance.dbrep_ProgramIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Star].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Star]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Star]')
GO
-- if delete a star schema - delete  info about tables & aggregations in star
CREATE TRIGGER [dbo].[del_db_Star]
ON db_Star FOR DELETE AS BEGIN DELETE FROM db_StarTable FROM deleted where db_StarTable.dbrep_StarIID = deleted.dbrep_IID DELETE FROM db_GatorStar FROM deleted where db_GatorStar.dbrep_StarIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[del_db_Table].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[del_db_Table]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[del_db_Table]')
GO
-- if you delete a table - delete the info in the star schema & flat file info
CREATE TRIGGER [dbo].[del_db_Table]
ON db_Table FOR DELETE AS BEGIN DELETE FROM db_SeqTable FROM deleted where db_SeqTable.dbrep_IID = deleted.dbrep_IID DELETE FROM db_StarTable FROM deleted where db_StarTable.dbrep_TableIID = deleted.dbrep_IID END
GO

GO
--SqlScripter----[dbo].[harallchildrenpath_cverid_trigger].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[harallchildrenpath_cverid_trigger]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[harallchildrenpath_cverid_trigger]')
GO
CREATE TRIGGER [dbo].[harallchildrenpath_cverid_trigger]
ON dbo.harversions for delete as if (@@rowcount = 0) return if exists(select *           from               harallchildrenpath as e           join               deleted   as d on e.childversionobjid = d.versionobjid)   delete from harallchildrenpath   from       harallchildrenpath as e     join       deleted   as d on e.childversionobjid = d.versionobjid
GO

GO
--SqlScripter----[dbo].[HARITEMS_PID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARITEMS_PID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARITEMS_PID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARITEMS_PID_TRIGGER    Script Date: 12/1/2005 11:50:35 PM ******/


/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Version                                                     */
/*  =========== ==========  =======                                                     */
/*  17-mar-2005 mulwi01     Star 13983675 HARVEST SQLSVR TRIGGER DDL                    */
/*  12-sep-2005 hopst01     Star 14312708 HARVEST SQLSRV TRIGGER AND TABLE DDL			*/
/*  21-sep-2005 mulwi01     add DELETE CASCADE to foreign keys							*/
/*  26-sep-2005 mulwi01     Star 14406130 SQLSERVER MDB EXTRA CONSTRAINT				*/
/*                                                                                      */
/****************************************************************************************/

/* TRIGGERS */

/* HARITEMS - HARITEMS TRIGGER */

CREATE TRIGGER [dbo].[HARITEMS_PID_TRIGGER]
ON dbo.HARITEMS FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARITEMS AS E
            JOIN
              DELETED   AS D ON E.PARENTOBJID = D.ITEMOBJID)
  DELETE FROM HARITEMS
  FROM
      HARITEMS AS E
    JOIN
      DELETED   AS D ON E.PARENTOBJID = D.ITEMOBJID
GO

GO
--SqlScripter----[dbo].[HARNOTIFY_SPID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARNOTIFY_SPID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARNOTIFY_SPID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARNOTIFY_SPID_TRIGGER    Script Date: 12/1/2005 11:50:36 PM ******/



/* HARSTATEPROCESS - NOTIFY  TRIGGER */

CREATE TRIGGER [dbo].[HARNOTIFY_SPID_TRIGGER]
ON dbo.HARSTATEPROCESS FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARNOTIFY AS E
            JOIN
              DELETED   AS D ON E.STATEOBJID    = D.STATEOBJID
                             AND E.PROCESSOBJID = D.PROCESSOBJID)
  DELETE FROM HARNOTIFY
  FROM
      HARNOTIFY AS E
    JOIN
      DELETED   AS D ON E.STATEOBJID   = D.STATEOBJID
      				AND E.PROCESSOBJID = D.PROCESSOBJID
GO

GO
--SqlScripter----[dbo].[HARNOTIFYLIST_SPID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARNOTIFYLIST_SPID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARNOTIFYLIST_SPID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARNOTIFYLIST_SPID_TRIGGER    Script Date: 12/1/2005 11:50:48 PM ******/



/* HARSTATEPROCESS - NOTIFYLIST  TRIGGER */

CREATE TRIGGER [dbo].[HARNOTIFYLIST_SPID_TRIGGER]
ON dbo.HARSTATEPROCESS FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARNOTIFYLIST AS E
            JOIN
              DELETED   AS D ON E.STATEOBJID    = D.STATEOBJID
                             AND E.PROCESSOBJID = D.PROCESSOBJID)
  DELETE FROM HARNOTIFYLIST
  FROM
      HARNOTIFYLIST AS E
    JOIN
      DELETED   AS D ON E.STATEOBJID   = D.STATEOBJID
      				AND E.PROCESSOBJID = D.PROCESSOBJID
GO

GO
--SqlScripter----[dbo].[HARPKGSINGRP_PKGID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARPKGSINGRP_PKGID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARPKGSINGRP_PKGID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARPKGSINGRP_PKGID_TRIGGER    Script Date: 12/1/2005 11:51:03 PM ******/

/* HARPKGSINGRP - HARPACKAGE  TRIGGER */

CREATE TRIGGER [dbo].[HARPKGSINGRP_PKGID_TRIGGER]
ON HARPACKAGE FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARPKGSINPKGGRP AS E
            JOIN
              DELETED   AS D ON E.PACKAGEOBJID = D.PACKAGEOBJID)
  DELETE FROM HARPKGSINPKGGRP
  FROM
      HARPKGSINPKGGRP AS E
    JOIN
      DELETED   AS D ON E.PACKAGEOBJID = D.PACKAGEOBJID
GO

GO
--SqlScripter----[dbo].[HARSTATEPROC_STATEID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARSTATEPROC_STATEID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARSTATEPROC_STATEID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARSTATEPROC_STATEID_TRIGGER    Script Date: 12/1/2005 11:51:03 PM ******/


/* HARSTATEPROCESS - HARSTATE  TRIGGER */

CREATE TRIGGER [dbo].[HARSTATEPROC_STATEID_TRIGGER]
ON dbo.HARSTATE FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARSTATEPROCESS AS E
            JOIN
              DELETED   AS D ON E.STATEOBJID = D.STATEOBJID)
  DELETE FROM HARSTATEPROCESS
  FROM
      HARSTATEPROCESS AS E
    JOIN
      DELETED   AS D ON E.STATEOBJID = D.STATEOBJID
GO

GO
--SqlScripter----[dbo].[HARUDP_SPID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARUDP_SPID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARUDP_SPID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARUDP_SPID_TRIGGER    Script Date: 12/1/2005 11:50:36 PM ******/



/* HARUDP - HARSTATEPROCESS  TRIGGER */

CREATE TRIGGER [dbo].[HARUDP_SPID_TRIGGER]
ON dbo.HARSTATEPROCESS FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARUDP AS E
            JOIN
              DELETED   AS D ON E.STATEOBJID = D.STATEOBJID
                          AND E.PROCESSOBJID = D.PROCESSOBJID)
  DELETE FROM HARUDP
  FROM
      HARUDP AS E
    JOIN
      DELETED   AS D ON E.STATEOBJID = D.STATEOBJID
                    AND E.PROCESSOBJID = D.PROCESSOBJID
GO

GO
--SqlScripter----[dbo].[HARVERSIONDELTA_PARENTID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARVERSIONDELTA_PARENTID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARVERSIONDELTA_PARENTID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARVERSIONDELTA_PARENTID_TRIGGER    Script Date: 12/1/2005 11:51:04 PM ******/



/* HARVERSIONDELTA - HARVERSIONDATA  TRIGGER */

CREATE TRIGGER [dbo].[HARVERSIONDELTA_PARENTID_TRIGGER]
ON dbo.HARVERSIONDATA FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARVERSIONDELTA AS E
            JOIN
              DELETED   AS D ON E.PARENTVERSIONDATAID = D.VERSIONDATAOBJID)
  DELETE FROM HARVERSIONDELTA
  FROM
      HARVERSIONDELTA AS E
    JOIN
      DELETED   AS D ON E.PARENTVERSIONDATAID = D.VERSIONDATAOBJID
GO

GO
--SqlScripter----[dbo].[HARVERSIONS_ITEMID_TRIGGER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[HARVERSIONS_ITEMID_TRIGGER]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[HARVERSIONS_ITEMID_TRIGGER]')
GO
/****** Object:  Trigger dbo.HARVERSIONS_ITEMID_TRIGGER    Script Date: 12/1/2005 11:51:04 PM ******/



/* HARVERSIONS - HARITEMS  TRIGGER */

CREATE TRIGGER [dbo].[HARVERSIONS_ITEMID_TRIGGER]
ON dbo.HARITEMS FOR DELETE
AS

IF (@@ROWCOUNT = 0) RETURN

IF EXISTS(SELECT *
          FROM
              HARVERSIONS AS E
            JOIN
              DELETED   AS D ON E.ITEMOBJID = D.ITEMOBJID)
  DELETE FROM HARVERSIONS
  FROM
      HARVERSIONS AS E
    JOIN
      DELETED   AS D ON E.ITEMOBJID = D.ITEMOBJID
GO

GO
--SqlScripter----[dbo].[joborder_agent_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[joborder_agent_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[joborder_agent_delete]')
GO
CREATE TRIGGER [dbo].[joborder_agent_delete]
ON joborder 
  for delete

as
begin
    declare @domainid int,@unitid int ;
    
    DECLARE jobor_ag_del_cur CURSOR 
        FOR SELECT udomid,unitid 
            FROM deleted
            
    OPEN jobor_ag_del_cur 
    FETCH NEXT FROM jobor_ag_del_cur INTO @domainid,@unitid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_unit @domainid,@unitid 
        FETCH NEXT FROM jobor_ag_del_cur INTO @domainid,@unitid 
    END 
    CLOSE jobor_ag_del_cur 
    DEALLOCATE jobor_ag_del_cur 
  
      
end
GO

GO
--SqlScripter----[dbo].[joborder_agent_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[joborder_agent_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[joborder_agent_insert]')
GO
/****** Object:  Trigger dbo.joborder_agent_insert    Script Date: 12/1/2005 11:51:14 PM ******/

/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[joborder_agent_insert]
ON joborder
   after insert
as
begin
    declare @domainid int;
    declare @unitid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT udomid,unitid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@unitid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_unit @domainid,@unitid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@unitid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
   
      
end;
GO

GO
--SqlScripter----[dbo].[joborder_agent_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[joborder_agent_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[joborder_agent_update]')
GO
/****** Object:  Trigger dbo.joborder_agent_update    Script Date: 12/1/2005 11:51:15 PM ******/

/*
 ************************************
 * after update(UNITID,JOBID,UDOMID,JDOMID,JOORDER)
 */

CREATE TRIGGER [dbo].[joborder_agent_update]
ON joborder
    after update
    

as
 if update(UNITID) or UPDATE(JOBID) or UPDATE(UDOMID) or UPDATE(JDOMID) or UPDATE(JOORDER)
begin
    declare @domainid int,@unitid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT udomid,unitid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@unitid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_unit @domainid,@unitid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@unitid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[linkbck_agent_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[linkbck_agent_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkbck_agent_delete]')
GO
CREATE TRIGGER [dbo].[linkbck_agent_delete]
ON linkbck 
  for delete 

as
begin

    declare @object_uuid binary(16);

    DECLARE linkbck_agent_del_cur CURSOR 
    
    FOR SELECT object_uuid
            FROM deleted
        
    OPEN linkbck_agent_del_cur 
    FETCH NEXT FROM linkbck_agent_del_cur INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_uuid @object_uuid;
       
        FETCH NEXT FROM linkbck_agent_del_cur INTO @object_uuid;
    END 
    CLOSE linkbck_agent_del_cur 
    DEALLOCATE linkbck_agent_del_cur 
      
end
GO

GO
--SqlScripter----[dbo].[linkbck_agent_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkbck_agent_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkbck_agent_insert]')
GO
/****** Object:  Trigger dbo.linkbck_agent_insert    Script Date: 12/1/2005 11:51:15 PM ******/


/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[linkbck_agent_insert]
ON linkbck 
  after insert 
  
as
begin
    declare @object_uuid binary(16);

    DECLARE trans_Cursor CURSOR 
    
    FOR SELECT object_uuid
            FROM inserted
        
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_uuid @object_uuid;
       
        FETCH NEXT FROM trans_Cursor INTO @object_uuid;
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
end
GO

GO
--SqlScripter----[dbo].[linkbck_agent_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkbck_agent_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkbck_agent_update]')
GO
/****** Object:  Trigger dbo.linkbck_agent_update    Script Date: 12/1/2005 11:51:16 PM ******/


/*
 ************************************
 *   after update(object_uuid,object_type,object_domain_uuid,BCKID,BDOMID) on 
 */

CREATE TRIGGER [dbo].[linkbck_agent_update]
ON linkbck 
    after update
as
 if update(object_uuid) or UPDATE(object_type) or UPDATE(object_domain_uuid) or 
	UPDATE(BCKID) or UPDATE(BDOMID) 
begin

    declare @object_uuid binary(16);

    DECLARE trans_Cursor CURSOR 
    
    FOR SELECT object_uuid
            FROM inserted
        
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_uuid @object_uuid;
       
        FETCH NEXT FROM trans_Cursor INTO @object_uuid;
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
      
end
GO

GO
--SqlScripter----[dbo].[linkjob_agent_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[linkjob_agent_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkjob_agent_delete]')
GO
CREATE TRIGGER [dbo].[linkjob_agent_delete]
ON linkjob for DELETE 
as 
BEGIN 
    declare @object_uuid binary(16);
    
    DECLARE linkjob_ag_del_cur CURSOR 
        FOR SELECT object_uuid
            FROM deleted 
        
        OPEN linkjob_ag_del_cur 
        FETCH NEXT FROM linkjob_ag_del_cur INTO @object_uuid
        WHILE @@FETCH_STATUS = 0 
        BEGIN 
            execute ca_agent_server_version_by_uuid @object_uuid;
        
            FETCH NEXT FROM linkjob_ag_del_cur INTO @object_uuid;
        END 
        CLOSE linkjob_ag_del_cur 
        DEALLOCATE linkjob_ag_del_cur 
END
GO

GO
--SqlScripter----[dbo].[linkjob_agent_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkjob_agent_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkjob_agent_insert]')
GO
/****** Object:  Trigger dbo.linkjob_agent_insert    Script Date: 12/1/2005 11:51:16 PM ******/

CREATE TRIGGER [dbo].[linkjob_agent_insert]
ON linkjob 
after insert
as
begin
declare @object_uuid binary(16);

DECLARE trans_Cursor CURSOR 
FOR SELECT object_uuid 
FROM inserted 

OPEN trans_Cursor 
FETCH NEXT FROM trans_Cursor INTO @object_uuid
WHILE @@FETCH_STATUS = 0 
BEGIN 
execute ca_agent_server_version_by_uuid @object_uuid;

FETCH NEXT FROM trans_Cursor INTO @object_uuid;
END 
CLOSE trans_Cursor 
DEALLOCATE trans_Cursor 

end;
GO

GO
--SqlScripter----[dbo].[linkjob_agent_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkjob_agent_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkjob_agent_update]')
GO
/****** Object:  Trigger dbo.linkjob_agent_update    Script Date: 12/1/2005 11:51:16 PM ******/


/*
 ************************************
 * after update(object_uuid,object_type,object_domain_uuid,JOBID,JDOMID,JOSTATUS)
 */


CREATE TRIGGER [dbo].[linkjob_agent_update]
ON linkjob 
  after update
as
 if update(object_uuid) or UPDATE(object_type) or UPDATE(object_domain_uuid) or 
	UPDATE(JOBID) or UPDATE(JDOMID) or UPDATE(JOSTATUS)
begin
  
    declare @object_uuid binary(16);
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT object_uuid
            FROM inserted
        
        OPEN trans_Cursor 
        FETCH NEXT FROM trans_Cursor INTO @object_uuid
        WHILE @@FETCH_STATUS = 0 
        BEGIN 
            execute ca_agent_server_version_by_uuid @object_uuid;
        
            FETCH NEXT FROM trans_Cursor INTO @object_uuid;
        END 
        CLOSE trans_Cursor 
        DEALLOCATE trans_Cursor 
end;
GO

GO
--SqlScripter----[dbo].[linkmod_agent_delete].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[linkmod_agent_delete]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkmod_agent_delete]')
GO
CREATE TRIGGER [dbo].[linkmod_agent_delete]
ON linkmod 
   after delete 

   
as 
begin
    declare @object_uuid binary(16);

    DECLARE linkmod_ag_del_cur CURSOR 
    
    FOR SELECT object_uuid
            FROM deleted
        
    OPEN linkmod_ag_del_cur 
    FETCH NEXT FROM linkmod_ag_del_cur INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_uuid @object_uuid;
       
        FETCH NEXT FROM linkmod_ag_del_cur INTO @object_uuid;
    END 
    CLOSE linkmod_ag_del_cur 
    DEALLOCATE linkmod_ag_del_cur 

end
GO

GO
--SqlScripter----[dbo].[linkmod_agent_insert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkmod_agent_insert]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkmod_agent_insert]')
GO
/****** Object:  Trigger dbo.linkmod_agent_insert    Script Date: 12/1/2005 11:51:17 PM ******/

/*
 ************************************
 *
 */

CREATE TRIGGER [dbo].[linkmod_agent_insert]
ON linkmod
   after insert 
as
begin
   
        declare @object_uuid binary(16);
    
        DECLARE trans_Cursor CURSOR 
        FOR SELECT object_uuid
            FROM inserted
        
        OPEN trans_Cursor 
        FETCH NEXT FROM trans_Cursor INTO @object_uuid
        WHILE @@FETCH_STATUS = 0 
        BEGIN 
            execute ca_agent_server_version_by_uuid @object_uuid;
        
            FETCH NEXT FROM trans_Cursor INTO @object_uuid;
        END 
        CLOSE trans_Cursor 
        DEALLOCATE trans_Cursor 
end;
GO

GO
--SqlScripter----[dbo].[linkmod_agent_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[linkmod_agent_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[linkmod_agent_update]')
GO
/****** Object:  Trigger dbo.linkmod_agent_update    Script Date: 12/1/2005 11:51:17 PM ******/


/*
 ************************************
 * after update(object_uuid,object_type,object_domain_uuid,MOID,MODTYPE,MDOMID,MOSTATUS) 
 */


CREATE TRIGGER [dbo].[linkmod_agent_update]
ON linkmod 
    after update
as
 if update(object_uuid) or UPDATE(object_type) or UPDATE(object_domain_uuid) or UPDATE(MOID) or 
	UPDATE(MODTYPE) or UPDATE(MDOMID) or UPDATE(MOSTATUS) 
begin

    declare @object_uuid binary(16);

    DECLARE trans_Cursor CURSOR 
    
    FOR SELECT object_uuid
            FROM inserted
        
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @object_uuid
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ca_agent_server_version_by_uuid @object_uuid;
       
        FETCH NEXT FROM trans_Cursor INTO @object_uuid;
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
end;
GO

GO
--SqlScripter----[dbo].[ncjobcfg_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ncjobcfg_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ncjobcfg_update]')
GO
/****** Object:  Trigger dbo.ncjobcfg_update    Script Date: 12/1/2005 11:50:48 PM ******/


/*
 ************************************
 * after update(JOBID,DOMAINID,JONAME,JOTYPE,JOCONT,JOCMD,JOOS,JOCREATE,JOMODIFY,JOSDATE,JOSTIME,
 *
 * JOEDATE,JOETIME,JOFREQ,JOSCHED,JOINST,JOONCEAT,JOONCENR,JOFLAG,JOEXIT,JDDOMID,JODEPEND,JOQUEST,
 * JOQFORCE,JOQFDATE,JOLOGOFF,JOREMOVE,JODEPFIL,JODEVICE,JOSERV,JODISCON,JOICONID,JOPARTNR,REVNR,USERID,CHECKSUM) 
 *
 */
CREATE TRIGGER [dbo].[ncjobcfg_update]
ON ncjobcfg 
  after update
  
as
 if update(JOBID) or UPDATE(DOMAINID) or UPDATE(JONAME) or UPDATE(JOTYPE) or UPDATE(JOCONT) or 
	UPDATE(JOCMD) or UPDATE(JOOS) or UPDATE(JOCREATE) or UPDATE(JOMODIFY) or UPDATE(JOSDATE) or 
	UPDATE(JOSTIME) or UPDATE(JOEDATE) or UPDATE(JOETIME) or UPDATE(JOFREQ) or UPDATE(JOSCHED) or 
	UPDATE(JOINST) or UPDATE(JOONCEAT) or UPDATE(JOONCENR) or UPDATE(JOFLAG) or UPDATE(JOEXIT) or 
	UPDATE(JDDOMID) or UPDATE(JODEPEND) or UPDATE(JOQUEST) or UPDATE(JOQFORCE) or UPDATE(JOQFDATE) or 
	UPDATE(JOLOGOFF) or UPDATE(JOREMOVE) or UPDATE(JODEPFIL) or UPDATE(JODEVICE) or UPDATE(JOSERV) or 
	UPDATE(JODISCON) or UPDATE(JOICONID) or UPDATE(JOPARTNR) or UPDATE(REVNR) or UPDATE(USERID) or 
	UPDATE(CHECKSUM) 
begin
    declare @domainid int,@jobid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT domainid,jobid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@jobid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ncjobcfg_server_version @domainid,@jobid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@jobid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[ncmodcfg_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[ncmodcfg_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[ncmodcfg_update]')
GO
/****** Object:  Trigger dbo.ncmodcfg_update    Script Date: 12/1/2005 11:50:48 PM ******/



/*
 ************************************
 * after update(DOMAINID,MOID,MOTYPE,MONAME,MOCONT,MOCMD,MOOS,MOCREATE,
 * MOMODIFY,MOSDATE,MOEDATE,MOETIME,MOFREQ,MOSCHED,MOINST,MOSTIME,MOONCEAT,
 * MOONCENR,MOFLAG,JDMODID,MODEPEND,MOQUEST,MOQFORCE,MOQFDATE,MOLOGOFF,
 * MOREMOVE,MODEPFIL,MODEVICE,MOSERV,MODISCON,MOPARTNR,REVNR,USERID,CHECKSUM)
 */

CREATE TRIGGER [dbo].[ncmodcfg_update]
ON ncmodcfg 
    after update
    
as
if UPDATE(DOMAINID) or UPDATE(MOID) or UPDATE(MOTYPE) or UPDATE(MONAME) or UPDATE(MOCONT) or UPDATE(MOCMD) or UPDATE(MOOS) or UPDATE(MOCREATE) or UPDATE(MOMODIFY) or UPDATE(MOSDATE) or UPDATE(
		MOEDATE) or UPDATE(MOETIME) or UPDATE(MOFREQ) or UPDATE(MOSCHED) or UPDATE(MOINST) or UPDATE(MOSTIME) or UPDATE(MOONCEAT) or UPDATE(MOONCENR) or UPDATE(MOFLAG) or UPDATE(JDMODID) or UPDATE(
		MODEPEND) or UPDATE(MOQUEST) or UPDATE(MOQFORCE) or UPDATE(MOQFDATE) or UPDATE(MOLOGOFF) or UPDATE(MOREMOVE) or UPDATE(MODEPFIL) or UPDATE(MODEVICE) or UPDATE(MOSERV) or UPDATE(
		MODISCON) or UPDATE(MOPARTNR) or UPDATE(REVNR) or UPDATE(USERID) or UPDATE(CHECKSUM) 
begin
    declare @domainid int,@moid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT domainid,moid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@moid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN 
        execute ncmodcfg_server_version @domainid,@moid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@moid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[nctpldef_update].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[nctpldef_update]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[nctpldef_update]')
GO
/****** Object:  Trigger dbo.nctpldef_update    Script Date: 12/1/2005 11:50:49 PM ******/




/* 
 **************************************
 * after update(TPID,DOMAINID,TPNAME,TPFNAME,TPVER,TPUSERID,TPDESC)
 *
 */
CREATE TRIGGER [dbo].[nctpldef_update]
ON nctpldef
    after update
    
as
 if UPDATE(TPID) or UPDATE(DOMAINID) or UPDATE(TPNAME) or UPDATE(TPFNAME) or UPDATE(TPVER) or UPDATE(TPUSERID) or UPDATE(TPDESC)
begin
    declare @domainid int,@tpid int ;
    
    DECLARE trans_Cursor CURSOR 
        FOR SELECT domainid,tpid 
            FROM inserted
            
    OPEN trans_Cursor 
    FETCH NEXT FROM trans_Cursor INTO @domainid,@tpid 
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        execute nctpldef_server_version @domainid,@tpid 
        FETCH NEXT FROM trans_Cursor INTO @domainid,@tpid 
    END 
    CLOSE trans_Cursor 
    DEALLOCATE trans_Cursor 
    
      
end
GO

GO
--SqlScripter----[dbo].[r_am_proc_delete_unit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[r_am_proc_delete_unit]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_am_proc_delete_unit]')
GO
CREATE TRIGGER [dbo].[r_am_proc_delete_unit]
ON ca_agent
	 instead of delete
as
begin
    declare @object_uuid binary(16) ;
    declare @agent_type integer;
    declare @unit_id integer;
    declare @domain_id integer;
        
    DECLARE r_am_proc_delete_unit_cur CURSOR 
        FOR SELECT object_uuid, agent_type, unit_id, domain_id
            FROM deleted
      
    OPEN r_am_proc_delete_unit_cur 
    FETCH NEXT FROM r_am_proc_delete_unit_cur INTO @object_uuid, @agent_type, @unit_id, @domain_id
    WHILE @@FETCH_STATUS = 0 
    BEGIN

        execute ca_am_update_agent_derived @object_uuid
		execute am_proc_delete_unit @object_uuid, @agent_type, @unit_id, @domain_id
		delete from ca_agent where object_uuid=@object_uuid
        FETCH NEXT FROM r_am_proc_delete_unit_cur INTO @object_uuid, @agent_type, @unit_id, @domain_id
    END 
    CLOSE r_am_proc_delete_unit_cur 
    DEALLOCATE r_am_proc_delete_unit_cur 
    
    
end;
GO

GO
--SqlScripter----[dbo].[r_d_discovered_hardware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_d_discovered_hardware]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_d_discovered_hardware]')
GO
/****** Object:  Trigger dbo.r_d_discovered_hardware    Script Date: 12/1/2005 11:51:18 PM ******/



/*
 ************************************************
 * delete ca_discovered hardware
 */
CREATE TRIGGER [dbo].[r_d_discovered_hardware]
ON ca_discovered_hardware 
	after delete
as
   declare @old_object_uuid as binary(16);
begin
    declare cur_cl cursor for
    	select dis_hw_uuid from deleted

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
		execute  p_d_discovered_hardware @old_object_uuid;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;

end;
GO

GO
--SqlScripter----[dbo].[r_d_discovered_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_d_discovered_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_d_discovered_user]')
GO
/****** Object:  Trigger dbo.r_d_discovered_user    Script Date: 12/1/2005 11:51:18 PM ******/



/*
 ************************************************
 * delete ca_discovered user
 */

CREATE TRIGGER [dbo].[r_d_discovered_user]
ON ca_discovered_user
	after delete 
as
begin

	declare @old_object_uuid as binary(16);
    declare cur_cl cursor for
    	select user_uuid from deleted;

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
		/* no more part of ingres mdb */
		/* execute  p_integrity_d_agent @old_object_uuid ; */
		execute p_d_discovered_user @old_object_uuid;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;	

end
GO

GO
--SqlScripter----[dbo].[r_d_links_category_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[r_d_links_category_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_d_links_category_def]')
GO
CREATE TRIGGER [dbo].[r_d_links_category_def]
ON ca_category_def
	 instead of delete
as
  
begin
    
		delete ca_category_member from ca_category_member cm, deleted d WHERE  cm.category_uuid = d.category_uuid ;		
		delete ca_category_def from ca_category_def  cf, deleted d where cf.category_uuid= d.category_uuid ;
		
end;
GO

GO
--SqlScripter----[dbo].[r_d_so_removed_external_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_d_so_removed_external_device]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_d_so_removed_external_device]')
GO
/****** Object:  Trigger dbo.r_d_so_removed_external_device    Script Date: 12/1/2005 11:50:49 PM ******/

	
 


 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage OLS for external devices
 *********************************************************
 *********************************************************
 */



/*
 *********************************************
 trigger for deleting a external device object
 */
CREATE TRIGGER [dbo].[r_d_so_removed_external_device]
ON am_external_device
       after delete 
as
begin 
    declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select device_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[r_del_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_agent]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_agent]')
GO
/****** Object:  Trigger dbo.r_del_agent    Script Date: 12/1/2005 11:51:19 PM ******/


/*
 ***********************************************
 trigger on delete on ca_agent
*/
CREATE TRIGGER [dbo].[r_del_agent]
ON ca_agent
	after delete 
as
begin
	declare @old_object_uuid as binary(16);
    declare cur_cl cursor for
		select object_uuid from deleted

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
		execute  p_integrity_d_agent @old_object_uuid ;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;

end
GO

GO
--SqlScripter----[dbo].[r_del_agent_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_agent_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_agent_component]')
GO
/****** Object:  Trigger dbo.r_del_agent_component    Script Date: 12/1/2005 11:51:19 PM ******/


CREATE TRIGGER [dbo].[r_del_agent_component]
ON ca_agent_component
	after delete 
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;
begin
  select @_action		= 3;
	
	
	declare cur_del cursor for
    	select object_uuid, agent_comp_id from deleted;
       
  open cur_del;
  fetch cur_del into @_server_uuid, @_comp_id; -- get first 
  while @@fetch_status = 0
  begin
	
		execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;
		fetch cur_del into @_server_uuid, @_comp_id; -- get next 

  end; -- while
  close cur_del;
  deallocate cur_del;	
end
GO

GO
--SqlScripter----[dbo].[r_del_dir_schema_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_dir_schema_map]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_dir_schema_map]')
GO
/****** Object:  Trigger dbo.r_del_dir_schema_map    Script Date: 12/1/2005 11:51:04 PM ******/

/*
 ***********************************************
 trigger on delete on ca_directory_schema_map
*/
CREATE TRIGGER [dbo].[r_del_dir_schema_map]
ON ca_directory_schema_map
	after delete  
as
begin
	declare @old_dir_schema_uuid as binary(16);

	DECLARE mycur CURSOR
		FOR select dir_schema_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @old_dir_schema_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute p_integrity_d_dir_schema_map @old_dir_schema_uuid;
		FETCH NEXT FROM mycur INTO @old_dir_schema_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end
GO

GO
--SqlScripter----[dbo].[r_del_directory_details].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_directory_details]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_directory_details]')
GO
/****** Object:  Trigger dbo.r_del_directory_details    Script Date: 12/1/2005 11:51:05 PM ******/

/*
 ***********************************************
 trigger on delete on ca_directory_details
*/
CREATE TRIGGER [dbo].[r_del_directory_details]
ON ca_directory_details
	after delete
as
	declare @old_directory_uuid as binary(16);
begin

	DECLARE mycur CURSOR
		FOR select directory_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @old_directory_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  p_integrity_d_directory_details @old_directory_uuid ;
		FETCH NEXT FROM mycur INTO @old_directory_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end
GO

GO
--SqlScripter----[dbo].[r_del_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_engine]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_engine]')
GO
/****** Object:  Trigger dbo.r_del_engine    Script Date: 12/1/2005 11:51:20 PM ******/

/*
 ***********************************************
 trigger on delete on ca_engine
*/
CREATE TRIGGER [dbo].[r_del_engine]
ON ca_engine
	after delete
as
	declare @old_engine_uuid as binary(16);
begin
	DECLARE mycur CURSOR
		FOR select engine_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @old_engine_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute p_integrity_d_engine @old_engine_uuid ;
		FETCH NEXT FROM mycur INTO @old_engine_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end
GO

GO
--SqlScripter----[dbo].[r_del_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_group_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_group_def]')
GO
/****** Object:  Trigger dbo.r_del_group_def    Script Date: 12/1/2005 11:51:20 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and triggers to manage integrity of groups
 *********************************************************
 *********************************************************
 */

/*
 ***********************************************
 delete all entries of the ca_group_meber tabel if 
 a ca_group_def object is deleted
*/

CREATE TRIGGER [dbo].[r_del_group_def]
ON ca_group_def
	instead of delete
as
	
begin
	
 
  delete from ca_group_member   from deleted  d  where  ca_group_member.group_uuid = d.group_uuid;
  delete from ca_group_member   from deleted  d  where  ca_group_member.member_uuid = d.group_uuid;

  delete from ca_agent  from deleted d where ca_agent.object_uuid = d.group_uuid and ca_agent.agent_type = 0;
  delete from ca_group_def from deleted d where ca_group_def.group_uuid = d.group_uuid and ca_group_def.domain_uuid = d.domain_uuid;

end
GO

GO
--SqlScripter----[dbo].[r_del_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_manager]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_manager]')
GO
/****** Object:  Trigger dbo.r_del_manager    Script Date: 12/1/2005 11:51:05 PM ******/


/*
 ***********************************************
 trigger on delete on ca_manager
*/
CREATE TRIGGER [dbo].[r_del_manager]
ON ca_manager
	  instead of delete
as
	declare @old_manager_uuid as binary(16);
begin

	DECLARE cur_del_manager CURSOR
		FOR select manager_uuid from deleted

	OPEN cur_del_manager
	FETCH NEXT FROM cur_del_manager INTO @old_manager_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  p_integrity_d_manager @old_manager_uuid ;
		delete from ca_manager where manager_uuid=@old_manager_uuid
		FETCH NEXT FROM cur_del_manager INTO @old_manager_uuid;

	END

	CLOSE cur_del_manager
	DEALLOCATE cur_del_manager
	

end
GO

GO
--SqlScripter----[dbo].[r_del_manager_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_manager_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_manager_component]')
GO
/****** Object:  Trigger dbo.r_del_manager_component    Script Date: 12/1/2005 11:51:20 PM ******/


/*
 ***********************************************
 trigger for deletion of a manager_component
*/
CREATE TRIGGER [dbo].[r_del_manager_component]
ON ca_manager_component
	after delete
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;
begin
    
    select @_action		= 5;
	DECLARE mycur CURSOR
		FOR select manager_uuid, manager_comp_id from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_server_uuid, @_comp_id
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;
		FETCH NEXT FROM mycur INTO @_server_uuid, @_comp_id

	END

	CLOSE mycur
	DEALLOCATE mycur


end
GO

GO
--SqlScripter----[dbo].[r_del_proc_os].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_proc_os]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_proc_os]')
GO
/****** Object:  Trigger dbo.r_del_proc_os    Script Date: 12/1/2005 11:51:21 PM ******/


/*
 ***********************************************
 trigger on delete on ca_proc_os
*/
CREATE TRIGGER [dbo].[r_del_proc_os]
ON ca_proc_os
	after delete  
as
	declare @old_proc_os_id as integer;
begin

	DECLARE mycur CURSOR
		FOR select proc_os_id from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @old_proc_os_id
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  p_integrity_d_proc_os @old_proc_os_id ;
		FETCH NEXT FROM mycur INTO @old_proc_os_id;

	END

	CLOSE mycur
	DEALLOCATE mycur

end
GO

GO
--SqlScripter----[dbo].[r_del_query].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_query]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_query]')
GO
/****** Object:  Trigger dbo.r_del_query    Script Date: 12/1/2005 11:51:09 PM ******/


/*
 ***********************************************
 trigger on delete on ca_query_def
*/
CREATE TRIGGER [dbo].[r_del_query]
ON ca_query_def
	after delete  
as
begin
	declare @old_query_uuid as binary(16);

	DECLARE mycur CURSOR
		FOR select query_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @old_query_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  p_integrity_d_query_def @old_query_uuid ;
		FETCH NEXT FROM mycur INTO @old_query_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end
GO

GO
--SqlScripter----[dbo].[r_del_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_server]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_server]')
GO
/****** Object:  Trigger dbo.r_del_server    Script Date: 12/1/2005 11:51:21 PM ******/



/*
 ***********************************************
 trigger on delete on ca_server
*/
CREATE TRIGGER [dbo].[r_del_server]
ON ca_server
	instead of delete 
as
	declare @old_server_uuid as binary(16);
begin	
	
	DECLARE cur_del_server CURSOR
		FOR select server_uuid from deleted

	OPEN cur_del_server
	FETCH NEXT FROM cur_del_server INTO @old_server_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute p_integrity_d_server @old_server_uuid;
		delete from ca_server where server_uuid=@old_server_uuid;
		FETCH NEXT FROM cur_del_server INTO @old_server_uuid;

	END

	CLOSE cur_del_server
	DEALLOCATE cur_del_server

end
GO

GO
--SqlScripter----[dbo].[r_del_server_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_del_server_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_del_server_component]')
GO
/****** Object:  Trigger dbo.r_del_server_component    Script Date: 12/1/2005 11:51:21 PM ******/

/*
 ***********************************************
 trigger for deletion of a server_component
*/

CREATE TRIGGER [dbo].[r_del_server_component]
ON ca_server_component
	after delete 
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;
begin
    
    select @_action		= 1;
	DECLARE cur_del_server_compoent CURSOR
		FOR select server_uuid, server_comp_id from deleted

	OPEN cur_del_server_compoent
	FETCH NEXT FROM cur_del_server_compoent INTO @_server_uuid, @_comp_id
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;
		FETCH NEXT FROM cur_del_server_compoent INTO @_server_uuid, @_comp_id

	END

	CLOSE cur_del_server_compoent
	DEALLOCATE cur_del_server_compoent

	
end
GO

GO
--SqlScripter----[dbo].[r_i_dis_hw_host_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_i_dis_hw_host_uuid]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_dis_hw_host_uuid]')
GO
/****** Object:  Trigger dbo.r_i_dis_hw_host_uuid    Script Date: 12/1/2005 11:51:21 PM ******/



/*
 ************************************
 trigger : check host_uuid  of new computer
 */

CREATE TRIGGER [dbo].[r_i_dis_hw_host_uuid]
ON ca_discovered_hardware
       after insert 
as
  declare @_olduuid char(36);
  declare @_newuuid char(36);
  declare @_dom_uuid binary(16);

	
begin
    select @_olduuid= null;
    select @_newuuid= (select host_uuid from inserted);
    select @_dom_uuid = (select domain_uuid from inserted);

	
    execute p_iu_dis_hw_host_uuid @_olduuid, @_newuuid, @_dom_uuid;
	
end
GO

GO
--SqlScripter----[dbo].[r_i_inserted_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_i_inserted_group_ace]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_inserted_group_ace]')
GO
/*
 ****************************************
 rule if a new group_ace was inserted
 trigger checks for consistence of object_type
 all object_type attributes in one group must have
 the same value
*/


CREATE TRIGGER [dbo].[r_i_inserted_group_ace]
ON [dbo].[ca_group_ace]
	   after insert
as
begin
	SET NOCOUNT ON;

	declare	@_count integer;				/* number of groups */

	set @_count = ( select count(*) from ca_group_ace gace, inserted i
					where gace.group_def_uuid = i.group_def_uuid
							and gace.object_type != i.object_type )

	if ( @_count > 0 )
	begin
		raiserror ('Error 9015: insert of group_ace denied, group with different object type exists', 16,1);
		return
	end

end;
GO

GO
--SqlScripter----[dbo].[r_i_new_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[r_i_new_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_new_user]')
GO
/*
 *******************************************
  trigger if a new user was created
*/
CREATE TRIGGER [dbo].[r_i_new_user]
ON ca_discovered_user
 instead of insert
as
begin
  declare @obj_uuid binary(16);
  declare @_olduri nvarchar(255);

  declare @_newuri nvarchar(255);
  declare @_dom_uuid binary(16);
  declare @return integer;

  set nocount on;

  select @_olduri= null;
  select @_newuri= (select uri from inserted);
  select @_dom_uuid = (select domain_uuid from inserted);


  -- check of right uri
  execute @return = p_i_dis_user_uri_check @_olduri, @_newuri, @_dom_uuid;
  if (	@return = 0 )
  begin


	  -- insert into ca_discovered_user
	  insert into ca_discovered_user(user_uuid, label, user_name, domain_uuid, creation_user, creation_date,
				last_update_user, last_update_date, version_number, uri, user_type, usage_list, directory_url)
		select user_uuid, label, user_name, domain_uuid, creation_user, creation_date,
				last_update_user, last_update_date, version_number, uri, user_type, usage_list, directory_url
		from inserted;

	  -- do so updates on ca_object_ace
	  select @obj_uuid = (select user_uuid from inserted);
	  execute  proc_i_new_so_user @obj_uuid;
  end;

end;
GO

GO
--SqlScripter----[dbo].[r_i_so_new_external_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_i_so_new_external_device]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_so_new_external_device]')
GO
/****** Object:  Trigger dbo.r_i_so_new_external_device    Script Date: 12/1/2005 11:51:22 PM ******/

/*
 *********************************************
 trigger for creating a external device object
 */
CREATE TRIGGER [dbo].[r_i_so_new_external_device]
ON am_external_device
 after insert
as
begin 
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);
    
    select @_obj_uuid = (select device_uuid from inserted);
	select @_clsid = 1012;
	select @_uri = (select creation_user from inserted);
    
	execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
    
end;
GO

GO
--SqlScripter----[dbo].[r_i_urc_ab_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_i_urc_ab_computer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_urc_ab_computer]')
GO
/****** Object:  Trigger dbo.r_i_urc_ab_computer    Script Date: 12/1/2005 11:51:22 PM ******/


/*
 ***********************************************
 trigger if a new urc_ab_computer is created
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_i_urc_ab_computer]
ON urc_ab_computer
	after insert
as
begin	
    declare @uid binary(16);
    declare @domain_uuid binary(16);
    
    set @uid = (select uid from inserted);    
    set @domain_uuid = (select domain_uuid from inserted);

	execute p_urc_ab_computer_created @uid, @domain_uuid;
end
GO

GO
--SqlScripter----[dbo].[r_i_urc_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_i_urc_computer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_i_urc_computer]')
GO
/****** Object:  Trigger dbo.r_i_urc_computer    Script Date: 12/1/2005 11:51:23 PM ******/


/*
 ****************************************************
 trigger if a new urc_computer is registered/created
 ****************************************************
 */
/* doesn't happen at the enterprise, only at the domain */

CREATE TRIGGER [dbo].[r_i_urc_computer]
ON urc_computer
	after insert
as
begin	
    declare @uid binary(16);
    declare @connection_information binary(510);
    
    set @uid = (select uid from inserted);    
    set @connection_information = (select streamaddress from inserted);

	execute p_urc_computer_created @uid, @connection_information;
end
GO

GO
--SqlScripter----[dbo].[r_insert_agent_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_insert_agent_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_insert_agent_component]')
GO
/****** Object:  Trigger dbo.r_insert_agent_component    Script Date: 12/1/2005 11:51:23 PM ******/

/*
 ***********************************************
 trigger for insert a new agent_component
*/

CREATE TRIGGER [dbo].[r_insert_agent_component]
ON ca_agent_component
	after insert 
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;
begin
    select @_action		= 2;
	select @_server_uuid 	= (select object_uuid from inserted);
	select @_comp_id 	= (select agent_comp_id from inserted);
	
	execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;

end
GO

GO
--SqlScripter----[dbo].[r_insert_manager_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_insert_manager_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_insert_manager_component]')
GO
/****** Object:  Trigger dbo.r_insert_manager_component    Script Date: 12/1/2005 11:51:23 PM ******/



/*
 ***********************************************
 trigger for insert a new manager_component
*/
CREATE TRIGGER [dbo].[r_insert_manager_component]
ON ca_manager_component
	after insert 
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;

begin
    select @_action		= 4;
	select @_server_uuid 	= (select manager_uuid from inserted);
	select @_comp_id 	= (select manager_comp_id from inserted);
	
	execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;

end
GO

GO
--SqlScripter----[dbo].[r_insert_server_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_insert_server_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_insert_server_component]')
GO
/****** Object:  Trigger dbo.r_insert_server_component    Script Date: 12/1/2005 11:51:23 PM ******/



/*
 ***********************************************
 trigger for insert a new server_component
*/
CREATE TRIGGER [dbo].[r_insert_server_component]
ON ca_server_component
	after insert 
as
    declare @_action 	as integer;
    declare @_server_uuid as binary(16);
    declare @_comp_id as integer;
begin
    
    select @_action		= 0;
	select @_server_uuid 	= (select server_uuid from inserted);
	select @_comp_id 	= (select server_comp_id from inserted);
	
	execute p_integrity_component_reg @_action, @_server_uuid ,@_comp_id;
	
end
GO

GO
--SqlScripter----[dbo].[r_iu_computer_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_iu_computer_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_iu_computer_user]')
GO
/****** Object:  Trigger dbo.r_iu_computer_user    Script Date: 12/1/2005 11:51:24 PM ******/

/*
 ************************************************
 * insert/update computer user
 */
CREATE TRIGGER [dbo].[r_iu_computer_user]
ON ca_link_dis_hw_user
	after insert,update 
as
  declare @_user_uuid binary(16);
  declare @_dis_hw_uuid binary(16);
begin
     select @_user_uuid = (select user_uuid from inserted);
     select @_dis_hw_uuid = (select dis_hw_uuid from inserted);
		     
     execute  p_iu_computer_user @_user_uuid, @_dis_hw_uuid;
		
end
GO

GO
--SqlScripter----[dbo].[r_iu_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_iu_group_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_iu_group_member]')
GO
/****** Object:  Trigger dbo.r_iu_group_member    Script Date: 12/1/2005 11:51:24 PM ******/



/*
 ************************************************
 * update or insert group membership
 */
CREATE TRIGGER [dbo].[r_iu_group_member]
ON ca_group_member
	after insert, update 
as
     declare @_member_uuid binary(16);
     declare @_group_uuid  binary(16);

begin
     
   select @_member_uuid =(select member_uuid from inserted);
   select @_group_uuid = (select group_uuid from inserted);
			
   execute p_iu_group_member @_member_uuid, @_group_uuid ;
		
end
GO

GO
--SqlScripter----[dbo].[r_ssf_versionupdate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_ssf_versionupdate]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_ssf_versionupdate]')
GO
/****** Object:  Trigger dbo.r_ssf_versionupdate    Script Date: 12/1/2005 11:51:24 PM ******/


/*
 ************************************************
 * update or insert into ca_software_signature
 */
CREATE TRIGGER [dbo].[r_ssf_versionupdate]
ON ca_software_signature 
	 after update,insert
as
begin
		execute  p_sp_ssf_versionupdate
end
GO

GO
--SqlScripter----[dbo].[r_ssf_versionupdate_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[r_ssf_versionupdate_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_ssf_versionupdate_def]')
GO
/* Start of locks for dependent tables */
 
/* End of lines added to convert to online lock */

/* ************** 10970 begin ************************************* */

CREATE TRIGGER [dbo].[r_ssf_versionupdate_def]
ON ca_software_def
after update,insert
as
begin
execute p_sp_ssf_versionupdate
end
GO

GO
--SqlScripter----[dbo].[r_ssf_versionupdate_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[r_ssf_versionupdate_link]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_ssf_versionupdate_link]')
GO
CREATE TRIGGER [dbo].[r_ssf_versionupdate_link]
ON ca_link_sw_def
after update,insert
as
begin
execute p_sp_ssf_versionupdate
end
GO

GO
--SqlScripter----[dbo].[r_u_ca_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_ca_agent]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_ca_agent]')
GO
/****** Object:  Trigger dbo.r_u_ca_agent    Script Date: 12/1/2005 11:51:24 PM ******/


/*
 **********************************************************
	trigger on after update (description)
	on ca_agent to track all changes in the 
	ca_agent about the description
 **********************************************************
 */
CREATE TRIGGER [dbo].[r_u_ca_agent]
ON ca_agent
	after update
as
	if update(description) 
begin	
	declare @object_uuid binary(16);
	declare @description nvarchar(255);
	declare @domain_id integer;

	declare cursor_ca_agent cursor local for 
		select object_uuid, description, domain_id from inserted

	open cursor_ca_agent;
	fetch next from cursor_ca_agent into @object_uuid, @description, @domain_id; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_agent_updated @object_uuid, @description, @domain_id;
		fetch next from cursor_ca_agent into @object_uuid, @description, @domain_id; -- get first 

	end; -- while
	close cursor_ca_agent;
	deallocate cursor_ca_agent;

end
GO

GO
--SqlScripter----[dbo].[r_u_ca_discovered_hardware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_ca_discovered_hardware]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_ca_discovered_hardware]')
GO
/****** Object:  Trigger dbo.r_u_ca_discovered_hardware    Script Date: 12/1/2005 11:51:25 PM ******/


/*
 **********************************************************
	trigger on after update (host_name, host_uuid)
	on ca_discovered_hardware to track all changes in the 
	ca_discovered_hardware about host_name
 **********************************************************
 */
CREATE TRIGGER [dbo].[r_u_ca_discovered_hardware]
ON ca_discovered_hardware
	after update 
as	
	if update(host_name) or update(host_uuid) 
begin

    declare @dis_hw_uuid binary(16);
    declare @host_name nvarchar(255);
    declare @domain_uuid binary(16);
	declare @host_uuid char(36);

	declare cursor_ca_discovered_hardware cursor local for 
		select dis_hw_uuid, host_name, domain_uuid, host_uuid from inserted

	open cursor_ca_discovered_hardware;
	fetch next from cursor_ca_discovered_hardware into @dis_hw_uuid, @host_name, @domain_uuid, @host_uuid; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_discvd_hw_updated @dis_hw_uuid, @host_name, @domain_uuid, @host_uuid;
		fetch next from cursor_ca_discovered_hardware into @dis_hw_uuid, @host_name, @domain_uuid, @host_uuid;

	end; -- while
	close cursor_ca_discovered_hardware;
	deallocate cursor_ca_discovered_hardware;

end
GO

GO
--SqlScripter----[dbo].[r_u_ca_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_ca_group_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_ca_group_def]')
GO
/****** Object:  Trigger dbo.r_u_ca_group_def    Script Date: 12/1/2005 11:51:25 PM ******/


/*
 ***********************************************
	trigger on after update (label, description) 
	on ca_group_def to track all changes in 
	ca_group_def about label and description
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_u_ca_group_def]
ON ca_group_def
	after update
as
	if update(label) or update(description) 
begin
    declare @group_uuid binary(16);
    declare @label nvarchar(255);
    declare @description nvarchar(255);    
    declare @domain_uuid binary(16);

	declare cursor_ca_group_def cursor local for 
		select group_uuid, label, description, domain_uuid from inserted

	open cursor_ca_group_def;
	fetch next from cursor_ca_group_def into @group_uuid, @label, @description, @domain_uuid; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_group_def_updated @group_uuid, @label, @description, @domain_uuid;
		fetch next from cursor_ca_group_def into @group_uuid, @label, @description, @domain_uuid;

	end; -- while
	close cursor_ca_group_def;
	deallocate cursor_ca_group_def;

end
GO

GO
--SqlScripter----[dbo].[r_u_ca_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_ca_group_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_ca_group_member]')
GO
/****** Object:  Trigger dbo.r_u_ca_group_member    Script Date: 12/1/2005 11:51:25 PM ******/


/*
 ***********************************************
 trigger after update (group_uuid) on 
 ca_group_member (= move)
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_u_ca_group_member]
ON ca_group_member 
	after update 
as
	if update(group_uuid)
begin
    declare @member_uuid binary(16);
    declare @old_group_uuid binary(16);
    declare @new_group_uuid binary(16);
    declare @new_group_domain_uuid binary(16);
    declare @member_type integer;
    declare @member_domain_uuid binary(16);
    declare @old_group_domain_uuid binary(16);
    
	declare cursor_ca_group_member cursor local for 
		select i.member_uuid, i.group_uuid, i.group_domain_uuid, i.member_type, i.member_domain_uuid,
			   d.group_uuid, d.group_domain_uuid from inserted i, deleted d
		       where i.member_uuid = d.member_uuid

	open cursor_ca_group_member;
	fetch next from cursor_ca_group_member into @member_uuid, @new_group_uuid, @new_group_domain_uuid, @member_type, @member_domain_uuid, @old_group_uuid, @old_group_domain_uuid; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_group_member_updated @member_uuid, @old_group_uuid, @new_group_uuid,
												@new_group_domain_uuid, @member_type, @member_domain_uuid, @old_group_domain_uuid;
		fetch next from cursor_ca_group_member into @member_uuid, @new_group_uuid, @new_group_domain_uuid, @member_type, @member_domain_uuid, @old_group_uuid, @old_group_domain_uuid; -- get first 

	end; -- while
	close cursor_ca_group_member;
	deallocate cursor_ca_group_member;

end
GO

GO
--SqlScripter----[dbo].[r_u_ca_n_tier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_ca_n_tier]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_ca_n_tier]')
GO
/****** Object:  Trigger dbo.r_u_ca_n_tier    Script Date: 12/1/2005 11:51:26 PM ******/


/*
 **************************************************
 trigger on
 after update (label, description) on ca_n_tier
 used to track changes / handover of changes made 
 for the address book server node entry
 **************************************************
 */

CREATE TRIGGER [dbo].[r_u_ca_n_tier]
ON ca_n_tier
	after update
as	
	if update(label) or update(description)
begin	 

	declare @domain_uuid binary(16);
    declare @label nvarchar(255);
    declare @description nvarchar(255);

	declare cursor_ca_n_tier cursor local for 
		select domain_uuid, label, description from inserted
    
    open cursor_ca_n_tier;
    fetch next from cursor_ca_n_tier into @domain_uuid, @label, @description; -- get first 
    while @@fetch_status = 0
    begin
	
     	execute p_urc_ab_ca_n_tier_updated @domain_uuid, @label, @description;
		fetch next from cursor_ca_n_tier into @domain_uuid, @label, @description;

    end; -- while
    close cursor_ca_n_tier;
    deallocate cursor_ca_n_tier;

end
GO

GO
--SqlScripter----[dbo].[r_u_dis_hw_host_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_dis_hw_host_uuid]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_dis_hw_host_uuid]')
GO
CREATE TRIGGER [dbo].[r_u_dis_hw_host_uuid]
ON ca_discovered_hardware
after update
as
declare @_olduuid char(36);
declare @_newuuid char(36);
declare @_dom_uuid binary(16);

begin

	if update(host_uuid)
		begin

			DECLARE cur_r_u_dis_hw_host_uuid CURSOR LOCAL
			FOR select deleted.host_uuid, inserted.host_uuid, deleted.domain_uuid 
			from deleted, inserted
			where deleted.dis_hw_uuid= inserted.dis_hw_uuid	/* itrac 12093*/
					and deleted.domain_uuid= inserted.domain_uuid	/* itrac 12093*/

			OPEN cur_r_u_dis_hw_host_uuid
			FETCH NEXT FROM cur_r_u_dis_hw_host_uuid INTO @_olduuid, @_newuuid, @_dom_uuid;
			WHILE @@FETCH_STATUS = 0
				BEGIN

					execute p_iu_dis_hw_host_uuid @_olduuid, @_newuuid, @_dom_uuid;
					FETCH NEXT FROM cur_r_u_dis_hw_host_uuid INTO @_olduuid, @_newuuid, @_dom_uuid;

				END

				CLOSE cur_r_u_dis_hw_host_uuid
				DEALLOCATE cur_r_u_dis_hw_host_uuid

			end
end
GO

GO
--SqlScripter----[dbo].[r_u_dis_user_uri_check].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_dis_user_uri_check]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_dis_user_uri_check]')
GO
CREATE TRIGGER [dbo].[r_u_dis_user_uri_check]
ON ca_discovered_user
after update
as
declare @_olduri nvarchar(255);
declare @_newuri nvarchar(255);
declare @_dom_uuid binary(16);

begin
if update(uri)
	BEGIN
		DECLARE mycur CURSOR LOCAL
		FOR select deleted.uri, inserted.uri, deleted.domain_uuid 
		from deleted, inserted
		where deleted.user_uuid=inserted.user_uuid /* itrac 12093*/
				and deleted.domain_uuid=inserted.domain_uuid /* itrac 12093*/

		OPEN mycur
		FETCH NEXT FROM mycur INTO @_olduri,@_newuri,@_dom_uuid;
		WHILE @@FETCH_STATUS = 0
			BEGIN

				execute p_iu_dis_user_uri_check @_olduri,@_newuri,@_dom_uuid;
				FETCH NEXT FROM mycur INTO @_olduri,@_newuri,@_dom_uuid;

			END

			CLOSE mycur
			DEALLOCATE mycur

		end
end
GO

GO
--SqlScripter----[dbo].[r_u_urc_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_urc_computer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_urc_computer]')
GO
/****** Object:  Trigger dbo.r_u_urc_computer    Script Date: 12/1/2005 11:51:27 PM ******/


/*
 **********************************************************
	trigger on after update (streamaddress)
	on urc_computer to track all changes made 
	during the registration of an urc computer
 **********************************************************
 */

CREATE TRIGGER [dbo].[r_u_urc_computer]
ON urc_computer
	after update 
as	
	if update(streamaddress) 
begin
	declare @uid binary(16);
	declare @streamaddress binary(510);

	declare cursor_urc_computer cursor local for 
		select uid, streamaddress from inserted

	open cursor_urc_computer;
	fetch next from cursor_urc_computer into @uid, @streamaddress; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_computer_updated @uid, @streamaddress;
		fetch next from cursor_urc_computer into @uid, @streamaddress; -- get first 

	end; -- while
	close cursor_urc_computer;
	deallocate cursor_urc_computer;

end
GO

GO
--SqlScripter----[dbo].[r_u_urc_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_u_urc_group_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_u_urc_group_def]')
GO
/****** Object:  Trigger dbo.r_u_urc_group_def    Script Date: 12/1/2005 11:50:36 PM ******/



/*
 **************************************************
 **************************************************
 * install URC specific database definitions
 **************************************************
 **************************************************
 */


/*
 The following procedures are executed only
 on the originating manager machine (own domain_uuid):
*/


/*
 ***********************************************
 urc_ab_update_version - trigger and procedure
 (used to update the urc_ab_group_def entry for the viewer)
 ***********************************************
 */
CREATE TRIGGER [dbo].[r_u_urc_group_def]
ON urc_ab_group_def 
	 after update 
as	 
	declare @rowcnt integer;
	set @rowcnt = @@ROWCOUNT;
	
	if update(inheritance) or update(sub_root_item) or update(update_children)
	begin

		declare @domain_uuid binary(16);
		
		/* retrieve own domain_uuid */
		set @domain_uuid = (select set_val_uuid
							from ca_settings
							where set_id = 1)
							
		if @rowcnt = 1
		begin
			update urc_ab_group_def set update_viewer_version = update_viewer_version+1
				where urc_ab_group_def.uid = (select uid from inserted)
					and urc_ab_group_def.domain_uuid = @domain_uuid;
		end
		else
		begin
			update urc_ab_group_def set update_viewer_version = update_viewer_version+1
				where urc_ab_group_def.uid IN (select uid from inserted)
					and urc_ab_group_def.domain_uuid = @domain_uuid;
		end

	end
GO

GO
--SqlScripter----[dbo].[r_upd_verno_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_agent]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_agent]')
GO
/****** Object:  Trigger dbo.r_upd_verno_agent    Script Date: 12/1/2005 11:51:27 PM ******/





/*
 ***********************************************
 trigger on update on ca_agent
*/

CREATE TRIGGER [dbo].[r_upd_verno_agent]
ON ca_agent
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
				FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno ,  @new_verno ;
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno ,  @new_verno ;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_approved_licenses].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_approved_licenses]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_approved_licenses]')
GO
/****** Object:  Trigger dbo.r_upd_verno_approved_licenses    Script Date: 12/1/2005 11:50:37 PM ******/


/*
 ***********************************************
 trigger on update on am_approved_licenses
*/
CREATE TRIGGER [dbo].[r_upd_verno_approved_licenses]
ON am_approved_licenses
		after update		
		as
		begin
			if update (version_number)
			begin
				declare @old_verno as int;
				declare @new_verno as int;
				
				DECLARE cur_upd_verno_approved_licenses CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN cur_upd_verno_approved_licenses
				FETCH NEXT FROM cur_upd_verno_approved_licenses INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM cur_upd_verno_approved_licenses INTO @old_verno,@new_verno;

				END

				CLOSE cur_upd_verno_approved_licenses
				DEALLOCATE cur_upd_verno_approved_licenses

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_dir_schema_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_dir_schema_map]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_dir_schema_map]')
GO
/****** Object:  Trigger dbo.r_upd_verno_dir_schema_map    Script Date: 12/1/2005 11:50:37 PM ******/


/*
 ***********************************************
 trigger on update on ca_directory_schema_map
*/
CREATE TRIGGER [dbo].[r_upd_verno_dir_schema_map]
ON ca_directory_schema_map
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin
				
				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_dis_hw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_dis_hw]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_dis_hw]')
GO
/****** Object:  Trigger dbo.r_upd_verno_dis_hw    Script Date: 12/1/2005 11:51:27 PM ******/



/*
 ***********************************************
 trigger on update on computer
*/
CREATE TRIGGER [dbo].[r_upd_verno_dis_hw]
ON ca_discovered_hardware
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number  from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno ,  @new_verno ;
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno ,  @new_verno ;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_dis_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_dis_sw]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_dis_sw]')
GO
/****** Object:  Trigger dbo.r_upd_verno_dis_sw    Script Date: 12/1/2005 11:51:28 PM ******/



/*
 ***********************************************
 trigger on update on ca_discovered_software
*/
CREATE TRIGGER [dbo].[r_upd_verno_dis_sw]
ON ca_discovered_software
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin
				
				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_dis_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_dis_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_dis_user]')
GO
/****** Object:  Trigger dbo.r_upd_verno_dis_user    Script Date: 12/1/2005 11:51:28 PM ******/


/*
 ***********************************************
 trigger on update on ca_discovered_user
*/
CREATE TRIGGER [dbo].[r_upd_verno_dis_user]
ON ca_discovered_user
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_engine]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_engine]')
GO
/****** Object:  Trigger dbo.r_upd_verno_engine    Script Date: 12/1/2005 11:51:29 PM ******/

/*
 ***********************************************
 trigger on update on ca_engine
*/
CREATE TRIGGER [dbo].[r_upd_verno_engine]
ON ca_engine
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_group_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_group_def]')
GO
/****** Object:  Trigger dbo.r_upd_verno_group_def    Script Date: 12/1/2005 11:51:29 PM ******/



/*
 ***********************************************
 trigger on update on ca_group_def
*/
CREATE TRIGGER [dbo].[r_upd_verno_group_def]
ON ca_group_def
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_group_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_group_member]')
GO
/****** Object:  Trigger dbo.r_upd_verno_group_member    Script Date: 12/1/2005 11:51:29 PM ******/




/*
 ***********************************************
 trigger on update on ca_group_member
*/
CREATE TRIGGER [dbo].[r_upd_verno_group_member]
ON ca_group_member
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_dir_details_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_dir_details_map]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_dir_details_map]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_dir_details_map    Script Date: 12/1/2005 11:50:50 PM ******/




/*
 ***********************************************
 trigger on update on ca_link_dir_details_map
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_dir_details_map]
ON ca_link_dir_details_map
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_dis_hw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_dis_hw]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_dis_hw]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_dis_hw    Script Date: 12/1/2005 11:51:30 PM ******/




/*
 ***********************************************
 trigger on update on ca_link_dis_hw
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_dis_hw]
ON ca_link_dis_hw
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_dis_hw_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_dis_hw_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_dis_hw_user]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_dis_hw_user    Script Date: 12/1/2005 11:51:30 PM ******/


/*
 ***********************************************
 trigger on update on ca_link_dis_hw_user
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_dis_hw_user]
ON ca_link_dis_hw_user
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_dis_usr_sec_prof].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_dis_usr_sec_prof]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_dis_usr_sec_prof]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_dis_usr_sec_prof    Script Date: 12/1/2005 11:51:30 PM ******/

/*
 ***********************************************
 trigger on update on ca_link_dis_user_sec_profile
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_dis_usr_sec_prof]
ON ca_link_dis_user_sec_profile
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_object_owner].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_object_owner]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_object_owner]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_object_owner    Script Date: 12/1/2005 11:50:37 PM ******/


/*
 ***********************************************
 trigger on update on ca_link_object_owner
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_object_owner]
ON ca_link_object_owner
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_lnk_sw_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_lnk_sw_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_lnk_sw_def]')
GO
/****** Object:  Trigger dbo.r_upd_verno_lnk_sw_def    Script Date: 12/1/2005 11:51:31 PM ******/






/*
 ***********************************************
 trigger on update on ca_link_sw_def
*/
CREATE TRIGGER [dbo].[r_upd_verno_lnk_sw_def]
ON ca_link_sw_def
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_manager]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_manager]')
GO
/****** Object:  Trigger dbo.r_upd_verno_manager    Script Date: 12/1/2005 11:50:38 PM ******/


/*
 ***********************************************
 trigger on update on ca_manager
*/
CREATE TRIGGER [dbo].[r_upd_verno_manager]
ON ca_manager
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_manager_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_manager_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_manager_component]')
GO
/****** Object:  Trigger dbo.r_upd_verno_manager_component    Script Date: 12/1/2005 11:50:50 PM ******/




/*
 ***********************************************
 trigger on update on ca_manager_component
*/
CREATE TRIGGER [dbo].[r_upd_verno_manager_component]
ON ca_manager_component
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_n_tier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_n_tier]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_n_tier]')
GO
/****** Object:  Trigger dbo.r_upd_verno_n_tier    Script Date: 12/1/2005 11:51:31 PM ******/


/*
 ***********************************************
 trigger on update on ca_n_tier
*/
CREATE TRIGGER [dbo].[r_upd_verno_n_tier]
ON ca_n_tier
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_query_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_query_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_query_def]')
GO
/****** Object:  Trigger dbo.r_upd_verno_query_def    Script Date: 12/1/2005 11:50:38 PM ******/


/*
 ***********************************************
 trigger on update on ca_query_def
*/
CREATE TRIGGER [dbo].[r_upd_verno_query_def]
ON ca_query_def
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_query_result].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_query_result]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_query_result]')
GO
/****** Object:  Trigger dbo.r_upd_verno_query_result    Script Date: 12/1/2005 11:51:05 PM ******/


/*
 ***********************************************
 trigger on update on ca_query_result
*/
CREATE TRIGGER [dbo].[r_upd_verno_query_result]
ON ca_query_result
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_query_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_query_version]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_query_version]')
GO
/****** Object:  Trigger dbo.r_upd_verno_query_version    Script Date: 12/1/2005 11:50:50 PM ******/


/*
 ***********************************************
 trigger on update on ca_directory_schema_map
*/
CREATE TRIGGER [dbo].[r_upd_verno_query_version]
ON ca_query_version
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_replic_conf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_replic_conf]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_replic_conf]')
GO
/****** Object:  Trigger dbo.r_upd_verno_replic_conf    Script Date: 12/1/2005 11:50:39 PM ******/

/*
 ***********************************************
 trigger on update on ca_replication_conf
*/
CREATE TRIGGER [dbo].[r_upd_verno_replic_conf]
ON ca_replication_conf
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_server]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_server]')
GO
/****** Object:  Trigger dbo.r_upd_verno_server    Script Date: 12/1/2005 11:51:32 PM ******/

/*
 ***********************************************
 trigger on update on ca_server
*/
CREATE TRIGGER [dbo].[r_upd_verno_server]
ON ca_server
		after update		
		as
				declare @old_verno as int;
				declare @new_verno as int;
		begin
			if update (version_number)
			begin

				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_upd_verno_server_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_upd_verno_server_component]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_upd_verno_server_component]')
GO
/****** Object:  Trigger dbo.r_upd_verno_server_component    Script Date: 12/1/2005 11:51:32 PM ******/



/*
 ***********************************************
 trigger on update on ca_server_component
*/
CREATE TRIGGER [dbo].[r_upd_verno_server_component]
ON ca_server_component
		after update		
		as
		begin
			if update (version_number)
			begin
				declare @old_verno as int;
				declare @new_verno as int;
				
				DECLARE mycur CURSOR
					FOR select deleted.version_number, inserted.version_number from inserted, deleted

				OPEN mycur
				FETCH NEXT FROM mycur INTO @old_verno,@new_verno
				WHILE @@FETCH_STATUS = 0
				BEGIN

					execute  p_integrity_version_number @old_verno ,  @new_verno ;
					FETCH NEXT FROM mycur INTO @old_verno,@new_verno;

				END

				CLOSE mycur
				DEALLOCATE mycur

				
			end;
		end;
GO

GO
--SqlScripter----[dbo].[r_urc_ab_ca_group_def_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_ab_ca_group_def_deleted]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_ab_ca_group_def_deleted]')
GO
/****** Object:  Trigger dbo.r_urc_ab_ca_group_def_deleted    Script Date: 12/1/2005 11:50:51 PM ******/

/*
 ***********************************************
 an entry in urc_ab_group_def is deleted	
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_urc_ab_ca_group_def_deleted]
ON urc_ab_group_def
	after delete
as	
begin
	declare @uid  binary(16);
	declare @domain_uuid binary(16);
	
	declare cursor_urc_ab_group_def cursor local for 
		select uid, domain_uuid from deleted

	open cursor_urc_ab_group_def;
	fetch next from cursor_urc_ab_group_def into @uid, @domain_uuid; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_group_def_deleted @uid, @domain_uuid;
		fetch next from cursor_urc_ab_group_def into @uid, @domain_uuid;

	end; -- while
	close cursor_urc_ab_group_def;
	deallocate cursor_urc_ab_group_def;
	
end
GO

GO
--SqlScripter----[dbo].[r_urc_ab_ca_group_member_created].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_ab_ca_group_member_created]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_ab_ca_group_member_created]')
GO
/****** Object:  Trigger dbo.r_urc_ab_ca_group_member_created    Script Date: 12/1/2005 11:51:32 PM ******/


/*
 ************************************************
 trigger : a new common object group member was
 created
 ************************************************
 */
 
CREATE TRIGGER [dbo].[r_urc_ab_ca_group_member_created]
ON ca_group_member
	after insert
as	
begin
    declare @member_uuid binary(16);
	declare @member_type integer;
	declare @group_domain_uuid binary(16);
	declare @group_uuid  binary(16);
	declare @member_domain_uuid binary(16);

    set @member_uuid = (select member_uuid from inserted);
    set @member_type = (select member_type from inserted);
    set @group_domain_uuid = (select group_domain_uuid from inserted);
	set @group_uuid  = (select group_uuid from inserted);
	set @member_domain_uuid = (select member_domain_uuid from inserted);

	execute p_urc_ab_ca_group_member_created @member_uuid, @member_type, @group_domain_uuid, @group_uuid, @member_domain_uuid;

end
GO

GO
--SqlScripter----[dbo].[r_urc_ab_ca_group_member_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_ab_ca_group_member_deleted]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_ab_ca_group_member_deleted]')
GO
/****** Object:  Trigger dbo.r_urc_ab_ca_group_member_deleted    Script Date: 12/1/2005 11:51:33 PM ******/


/*
 ************************************************
 trigger : a new common object group member was
 deleted
 ************************************************
 */
 
CREATE TRIGGER [dbo].[r_urc_ab_ca_group_member_deleted]
ON ca_group_member
	after delete
as
begin	
    declare @member_uuid binary(16);
	declare @member_type integer;
	declare @group_uuid  binary(16);
	declare @group_domain_uuid binary(16);

	declare cursor_urc_ab_ca_group_member cursor local for 
		select member_uuid, member_type, group_uuid, group_domain_uuid from deleted

	open cursor_urc_ab_ca_group_member;
	fetch next from cursor_urc_ab_ca_group_member into @member_uuid, @member_type, @group_uuid, @group_domain_uuid; -- get first 
	while @@fetch_status = 0
	begin
	
		execute p_urc_ab_ca_group_member_deleted @member_uuid, @member_type, @group_uuid, @group_domain_uuid;
		fetch next from cursor_urc_ab_ca_group_member into @member_uuid, @member_type, @group_uuid, @group_domain_uuid;

	end; -- while
	close cursor_urc_ab_ca_group_member;
	deallocate cursor_urc_ab_ca_group_member;

end
GO

GO
--SqlScripter----[dbo].[r_urc_ab_group_def_created].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_ab_group_def_created]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_ab_group_def_created]')
GO
/****** Object:  Trigger dbo.r_urc_ab_group_def_created    Script Date: 12/1/2005 11:51:33 PM ******/

												

/*
 ***********************************************
 an entry in urc_ab_group_def has been created

 includes:
 - p_urc_ab_group_def_create - procedure:
   creates an urc_ab_group_def entry
 - p_urc_ab_group_def_created:
   a new entry in urc_ab_group_def is created
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_urc_ab_group_def_created]
ON urc_ab_group_def
	after insert
as
begin	
	declare @uid  binary(16);
	declare @domain_uuid binary(16);

	set @uid  = (select uid from inserted);
	set @domain_uuid = (select domain_uuid from inserted);

	-- execute p_urc_ab_group_def_created @uid, @domain_uuid;	

	declare @member_uuid binary(16);
	declare @group_uuid binary(16);
	declare @member_type integer; 
	declare @group_domain_uuid binary(16);
	declare @member_domain_uuid binary(16);
	declare @urcObjCnt integer;
	declare @own_domain_uuid binary(16);
	declare @nTierDomainType integer;


	/* retrieve own domain_uuid */
	set @own_domain_uuid = (select set_val_uuid
							from ca_settings
							where set_id = 1)
	/* execute procedure only for own domain_uuid */
	if (@domain_uuid = @own_domain_uuid)
	begin

		declare cursor_ca_group_member cursor local
		for 
			select member_uuid, group_uuid, member_type, group_domain_uuid , member_domain_uuid
			from ca_group_member
			where group_uuid = @uid
			order by member_type desc

		open cursor_ca_group_member
		fetch next from cursor_ca_group_member into @member_uuid, @group_uuid, @member_type, @group_domain_uuid, @member_domain_uuid
		while @@fetch_status = 0
		begin

			if (@member_type = 0) 
			begin
			
				/* type = groupDef --> computer group */
				/* check if the child itself is part of urc_ab_group_def table */
				set @urcObjCnt = 0;
				set rowcount 1;
				set @urcObjCnt = (select count(*) from urc_ab_group_def where uid = @member_uuid);
				set rowcount 0;
					
				if (@urcObjCnt = 0) 
				begin
					/* create an urc_ab_group_def entry: */
					-- execute p_urc_ab_group_def_create @member_uuid, @domain_uuid;
					insert into urc_ab_group_def (uid, domain_uuid, label, description, sub_root_item, inheritance, update_children, update_viewer_version)
								(select @member_uuid, @member_domain_uuid, label, description, cast('0' as binary(1)), cast('1' as binary(1)), cast('0' as binary(1)), 1
									from ca_group_def where group_uuid = @member_uuid);

				end
				else
				begin
					/* if it is, update the entry: */
					/* the statement below will  update the version field for the viewer because of possibly new inherited permissions */
					update urc_ab_group_def set update_children = (cast('1' as binary(1))) where uid = @member_uuid;
				end
					
				/*	create a new urc_ab_group_member entry */
				execute p_urc_ab_group_member_create @member_uuid, @group_uuid, @member_type, @group_domain_uuid, @member_domain_uuid;

			end
			else
			begin
			
				if (@member_type = 1)
				begin
				
					/* type = discoveredAsset --> computer */
					/* check if member_uuid is part of the urc_ab_computer table */
					/* of the own domain  */
					set @urcObjCnt = 0;
					set rowcount 1;
					set @urcObjCnt = (select count(*) from urc_ab_computer where (uid = @member_uuid and domain_uuid = @domain_uuid));
					set rowcount 0;

					if (@urcObjCnt > 0) 
					begin
						/* it is --> */
						/* create a new urc_ab_group_member entry */
						/* with the member_domain_uuid of the own domain ! */					
						execute p_urc_ab_group_member_create @member_uuid, @group_uuid, @member_type, @group_domain_uuid, @group_domain_uuid;
					end						
					else
					begin
						/* :_urcObjCnt = 0 */
						/* check if we are at an enterprise manager, get domain_type */
						set @nTierDomainType = 0;
						set @nTierDomainType = (select domain_type from ca_n_tier where domain_uuid = @own_domain_uuid)

						if (@nTierDomainType = 1)
						begin
							/* we are an enterprise manager,		          */
							/* entpr. urc_ab_computer entry doesn't exist yet */
							/* --> create it with the enterprise domain_uuid  */	
							insert into urc_ab_computer (uid, domain_uuid, label, 
												host_name, connection_information, host_uuid)
												(select uid, @own_domain_uuid, label, 
												 host_name, connection_information, host_uuid
												 from urc_ab_computer
												 where (uid = @member_uuid and domain_uuid = @member_domain_uuid));

							/* --> p_urc_ab_computer_created is executed */
							/* --> that will add the member entry and    */
							/*     update the parents                    */
						end
						
					end

				end -- if (@member_type = 1)
			end

	
			fetch next from cursor_ca_group_member into @member_uuid, @group_uuid, @member_type, @group_domain_uuid, @member_domain_uuid

		end	-- cursor loop
		
		close cursor_ca_group_member
		deallocate cursor_ca_group_member
		
	end -- if (@domain_uuid = @own_domain_uuid)

end
GO

GO
--SqlScripter----[dbo].[r_urc_ab_update_children].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_ab_update_children]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_ab_update_children]')
GO
/****** Object:  Trigger dbo.r_urc_ab_update_children    Script Date: 12/1/2005 11:50:39 PM ******/


/*
 ***********************************************
 urc_ab_update_children - trigger - and procedure

 used to update the children of an urc_ab_group_def, 
 through repeated activation of the trigger the whole 
 children tree will be updated recursively
 ***********************************************
 */

CREATE TRIGGER [dbo].[r_urc_ab_update_children]
ON urc_ab_group_def 
	after update 
as
	if update(update_children)	
	begin
	
		declare	@domain_uuid binary(16);

		/* retrieve own domain_uuid */
		set @domain_uuid = (select set_val_uuid
							from ca_settings
							where set_id = 1)

		declare @uid binary(16);
		declare @upd_children binary(1);
		declare @group_domain_uuid binary(16);

		declare cursor_urc_ab_group_def cursor local for 
			select uid, domain_uuid, update_children from inserted
    
		open cursor_urc_ab_group_def;
		fetch next from cursor_urc_ab_group_def into @uid, @group_domain_uuid, @upd_children; -- get first 
		while @@fetch_status = 0
		begin
		
			--execute p_urc_ab_update_children @uid, @upd_children, @group_domain_uuid;
			/* for all group children set update_children = '1' */
			if (@group_domain_uuid = @domain_uuid) and (@upd_children = (cast('1' as binary(1))))
			begin
				update urc_ab_group_def 
					set update_children = (cast('1' as binary(1)))
					where uid IN (select member_uuid
								  from urc_ab_group_member
								  where group_uuid =@uid and member_type = 0)
			end
			
			fetch next from cursor_urc_ab_group_def into @uid, @group_domain_uuid, @upd_children;

		end; -- while
		close cursor_urc_ab_group_def;
		deallocate cursor_urc_ab_group_def;

	end
GO

GO
--SqlScripter----[dbo].[r_urc_computer_deleted].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[r_urc_computer_deleted]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[r_urc_computer_deleted]')
GO
/****** Object:  Trigger dbo.r_urc_computer_deleted    Script Date: 12/1/2005 11:51:33 PM ******/


/*
 **********************************************************
	trigger after deletion of an urc_computer
 **********************************************************
 */

CREATE TRIGGER [dbo].[r_urc_computer_deleted]
ON urc_computer
	after delete
as
begin	
	declare @uid binary(16);

	declare cursor_urc_computer cursor local for 
		select uid from deleted
    
    open cursor_urc_computer;
    fetch next from cursor_urc_computer into @uid; -- get first 
    while @@fetch_status = 0
    begin
	
     	execute p_urc_computer_deleted @uid;
		fetch next from cursor_urc_computer into @uid;

     end; -- while
     close cursor_urc_computer;
     deallocate cursor_urc_computer;

end
GO

GO
--SqlScripter----[dbo].[rule_d_so_del_ebased_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_del_ebased_policy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_del_ebased_policy]')
GO
/****** Object:  Trigger dbo.rule_d_so_del_ebased_policy    Script Date: 12/1/2005 11:50:51 PM ******/


/*
 *********************************************
 trigger for deleteing a event based policy
*/
CREATE TRIGGER [dbo].[rule_d_so_del_ebased_policy]
ON amepdef
 after delete
as
begin
  	declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select policy_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_del_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_del_job]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_del_job]')
GO
/****** Object:  Trigger dbo.rule_d_so_del_job    Script Date: 12/1/2005 11:50:51 PM ******/

/*
 *********************************************
 trigger for deleting a job
*/
CREATE TRIGGER [dbo].[rule_d_so_del_job]
ON ncjobcfg
	 after delete
as
begin
	declare @ddis_hw_uuid binary(16);


	DECLARE mycur CURSOR
		FOR select job_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid 
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_del_module].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_del_module]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_del_module]')
GO
/****** Object:  Trigger dbo.rule_d_so_del_module    Script Date: 12/1/2005 11:50:52 PM ******/


/*
 *********************************************
 trigger for deleteing a  module object
*/
CREATE TRIGGER [dbo].[rule_d_so_del_module]
ON ncmodcfg
	 after delete
as
begin
	declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select module_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_del_qbased_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_del_qbased_policy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_del_qbased_policy]')
GO
/****** Object:  Trigger dbo.rule_d_so_del_qbased_policy    Script Date: 12/1/2005 11:50:52 PM ******/


/*
 *********************************************
 trigger for deleteing a query base policy
*/
CREATE TRIGGER [dbo].[rule_d_so_del_qbased_policy]
ON polidef
 after delete
as
begin
	declare @ddis_hw_uuid  binary(16);

	DECLARE cur_d_so_del_qbased_policy CURSOR
		FOR select policy_uuid from deleted

	OPEN cur_d_so_del_qbased_policy
	FETCH NEXT FROM cur_d_so_del_qbased_policy INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM cur_d_so_del_qbased_policy INTO @ddis_hw_uuid;

	END

	CLOSE cur_d_so_del_qbased_policy
	DEALLOCATE cur_d_so_del_qbased_policy

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_del_query].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_del_query]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_del_query]')
GO
/****** Object:  Trigger dbo.rule_d_so_del_query    Script Date: 12/1/2005 11:50:53 PM ******/
	

/*
 *********************************************
 trigger for deleteing a query
*/
CREATE TRIGGER [dbo].[rule_d_so_del_query]
ON ca_query_def
	 after delete
as
begin
    declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select query_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

							
end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_area].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_area]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_area]')
GO
/*
 ****************************************************
 trigger for deleting a area definition
	step 1) delete the object permission
	step 2) re-calculate&set new area mask
 */
CREATE TRIGGER [dbo].[rule_d_so_removed_area]
ON ols_area_def
  after delete

as
begin
	declare @area_uuid binary(16);
	declare @area_id int;
	set nocount on;

	DECLARE cur_rsoa CURSOR
		FOR select area_uuid, area_id from deleted

	OPEN cur_rsoa
	FETCH NEXT FROM cur_rsoa INTO @area_uuid, @area_id
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @area_uuid

		-- update area permissons because a raea was deleted/unused now
		execute ols_sp_area_changed 0, @area_id;

		FETCH NEXT FROM cur_rsoa INTO @area_uuid, @area_id;

	END

	CLOSE cur_rsoa
	DEALLOCATE cur_rsoa

	-- apply area mask
	execute ols_sp_applyAreaMask @obj_uuid=null;
	
	

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_computer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_computer]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_computer    Script Date: 12/1/2005 11:51:34 PM ******/




/*
 ******************************************
  trigger if a computer is deleted
*/
CREATE TRIGGER [dbo].[rule_d_so_removed_computer]
ON ca_discovered_hardware
 after delete
as

begin
	declare @old_object_uuid as binary(16);

    declare cur_cl cursor for
  		select dis_hw_uuid from deleted;

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
  		execute  proc_d_so_removed_object @old_object_uuid ;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_computer_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_computer_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_computer_user]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_computer_user    Script Date: 12/1/2005 11:51:34 PM ******/



/*
 ****************************************************
 trigger for deleting a computer user object
 */
CREATE TRIGGER [dbo].[rule_d_so_removed_computer_user]
ON ca_link_dis_hw_user
after delete 

as
begin
  declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select link_dis_hw_user_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_domain]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_domain]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_domain    Script Date: 12/1/2005 11:51:34 PM ******/



/*
 *********************************************
 trigger fro removing a domain
 */
CREATE TRIGGER [dbo].[rule_d_so_removed_domain]
ON ca_n_tier
 after delete
as	
begin
   declare @ddis_hw_uuid binary(16);
  
	DECLARE mycur CURSOR
		FOR select domain_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_engine]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_engine]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_engine    Script Date: 12/1/2005 11:51:35 PM ******/


/*
 *********************************************
 trigger for deleting an engine
 */

CREATE TRIGGER [dbo].[rule_d_so_removed_engine]
ON ca_engine 
    after delete 
as
begin 
    declare @ddis_hw_uuid  binary(16);

	DECLARE mycur CURSOR
		FOR select engine_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute proc_d_so_removed_object  @ddis_hw_uuid 
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_group]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_group]')
GO
/*
 **********************************************
 procedure runs if a group entity was deleted
 delete assigned entries in
 ca_group_ace
 ca_object_ace
 ca_link_object_owner
 */

/*
 **********************************************
 * cleanup OLS if a group entity was deleted
 */
CREATE TRIGGER [dbo].[rule_d_so_removed_group]
ON ca_group_def
 after delete
as
begin

  set nocount on;
  delete ca_group_ace
	from deleted d
	where ca_group_ace.group_def_uuid = d.group_uuid;

  delete ca_object_ace
	from deleted d
  	where ca_object_ace.object_def_uuid = d.group_uuid;

  delete ca_link_object_owner
	from deleted d
	where object_uuid = d.group_uuid;

  delete ols_area_ace
	from deleted d
	where object_def_uuid = d.group_uuid;

end
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_manager]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_manager]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_manager    Script Date: 12/1/2005 11:50:53 PM ******/

 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage manager
 *********************************************************
 *********************************************************
 */




/*
 *********************************************
 trigger for deleting a manager object
 */
CREATE TRIGGER [dbo].[rule_d_so_removed_manager]
ON ca_manager
 after delete
as
begin
	declare @ddis_hw_uuid  binary(16);

	DECLARE cur_d_so_removed_manager CURSOR
		FOR select manager_uuid from deleted 

	OPEN cur_d_so_removed_manager
	FETCH NEXT FROM cur_d_so_removed_manager INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM cur_d_so_removed_manager INTO @ddis_hw_uuid;

	END

	CLOSE cur_d_so_removed_manager
	DEALLOCATE cur_d_so_removed_manager

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_security_prof].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_security_prof]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_security_prof]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_security_prof    Script Date: 12/1/2005 11:51:36 PM ******/
CREATE TRIGGER [dbo].[rule_d_so_removed_security_prof]
ON ca_security_profile
 instead of delete
as
begin

	declare @old_object_uuid as binary(16);
    declare cur_cl cursor for
		select security_profile_uuid from deleted;

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
     	execute  proc_d_so_removed_security_prof @old_object_uuid ;
		delete from ca_security_profile where security_profile_uuid = @old_object_uuid;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_server]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_server]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_server    Script Date: 12/1/2005 11:51:36 PM ******/

 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage server objects
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 trigger for removing server
*/
CREATE TRIGGER [dbo].[rule_d_so_removed_server]
ON ca_server
 after delete
as
begin
  declare @ddis_hw_uuid binary(16);

  	DECLARE mycur CURSOR
		FOR select server_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_removed_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_removed_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_removed_user]')
GO
/****** Object:  Trigger dbo.rule_d_so_removed_user    Script Date: 12/1/2005 11:51:36 PM ******/


/*
 *******************************************
  trigger if a user is removed user
*/


CREATE TRIGGER [dbo].[rule_d_so_removed_user]
ON ca_discovered_user
 after delete
as
begin
	declare @old_object_uuid as binary(16);
    declare cur_cl cursor for
		select user_uuid from deleted;

    open cur_cl;
    fetch cur_cl into @old_object_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
  		execute  proc_d_so_removed_user @old_object_uuid ;
		fetch cur_cl into @old_object_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;


end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_software_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_software_definition]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_software_definition]')
GO
/****** Object:  Trigger dbo.rule_d_so_software_definition    Script Date: 12/1/2005 11:51:37 PM ******/
/*
 ******************************************
  trigger if a software defintion is deleted
*/
CREATE TRIGGER [dbo].[rule_d_so_software_definition]
ON ca_software_def
	 after delete
as
begin
	declare @d_sw_def_uuid binary(16);
	

	declare cur_del cursor for
    select sw_def_uuid
    from deleted;
    
    open cur_del;
    fetch cur_del into @d_sw_def_uuid; -- get first 
    while @@fetch_status = 0
    begin
  
        execute  proc_d_so_removed_object @d_sw_def_uuid;
        
        fetch cur_del into @d_sw_def_uuid; -- get next

     end; -- while
     close cur_del;
     deallocate cur_del;
	

end;
GO

GO
--SqlScripter----[dbo].[rule_d_so_sw_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_d_so_sw_category]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_d_so_sw_category]')
GO
/****** Object:  Trigger dbo.rule_d_so_sw_category    Script Date: 12/1/2005 11:50:53 PM ******/
CREATE TRIGGER [dbo].[rule_d_so_sw_category]
ON ca_category_def
	 after delete
as
  declare @ddis_hw_uuid binary(16);
begin
     
    declare cur_cl cursor for
    	select category_uuid from deleted;

    open cur_cl;
    fetch cur_cl into @ddis_hw_uuid; -- get first 
    while @@fetch_status = 0
    begin
	
		execute  proc_d_so_removed_object @ddis_hw_uuid;
		fetch cur_cl into @ddis_hw_uuid;

     end; -- while
     close cur_cl;
     deallocate cur_cl;

end;
GO

GO
--SqlScripter----[dbo].[rule_del_agent_check_busr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_del_agent_check_busr]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_del_agent_check_busr]')
GO
/****** Object:  Trigger dbo.rule_del_agent_check_busr    Script Date: 12/1/2005 11:51:37 PM ******/

/*
 *********************************************
 trigger for deleting a ca_agent
*/

CREATE TRIGGER [dbo].[rule_del_agent_check_busr]
ON ca_agent
            after delete
            as
            begin
		declare @_object_uuid binary(16);

		declare lst_obj_uuid cursor for
	       		select object_uuid from deleted;

		-- get first inserted group ace
		open lst_obj_uuid;
		fetch from lst_obj_uuid into @_object_uuid;

		while @@fetch_status = 0
  		begin
	 		execute backup_p_del_agent @_object_uuid;
   		     	-- fetch next
   			fetch from lst_obj_uuid into @_object_uuid;
   
		end;  -- end of loop over inserted grozp aces
  	   
		close lst_obj_uuid;
		deallocate lst_obj_uuid;
                
	   end;
GO

GO
--SqlScripter----[dbo].[rule_del_job_check_active].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_del_job_check_active]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_del_job_check_active]')
GO
/****** Object:  Trigger dbo.rule_del_job_check_active    Script Date: 12/1/2005 11:50:39 PM ******/

/*
 *********************************************
 trigger for deleting a backup_job
*/

CREATE TRIGGER [dbo].[rule_del_job_check_active]
ON backup_job
            after delete
            as
            begin
		declare @_job_status integer;

		declare lst_job_stat cursor for
	       		select status from deleted;

		-- get first inserted group ace
		open lst_job_stat;
		fetch from lst_job_stat into @_job_status;

		while @@fetch_status = 0
  		begin
	 		execute backup_p_del_job @_job_status;
   		     	-- fetch next
   			fetch from lst_job_stat into @_job_status;
   
		end;  -- end of loop over inserted grozp aces
  	   
		close lst_job_stat;
		deallocate lst_job_stat;
                
	   end;
GO

GO
--SqlScripter----[dbo].[rule_del_so_procgrp_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_del_so_procgrp_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_del_so_procgrp_member]')
GO
/****** Object:  Trigger dbo.rule_del_so_procgrp_member    Script Date: 12/1/2005 11:51:37 PM ******/
	

/*
 **********************************************
 * trigger to maintain deletion of a procedure from a 
 * procedure group
 */

CREATE TRIGGER [dbo].[rule_del_so_procgrp_member]
ON usd_link_grp_proc
	 after delete
as
begin
	declare @_object_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select ap from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_object_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_group_member @_object_uuid
		FETCH NEXT FROM mycur INTO @_object_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_del_so_swgrp_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_del_so_swgrp_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_del_so_swgrp_member]')
GO
/****** Object:  Trigger dbo.rule_del_so_swgrp_member    Script Date: 12/1/2005 11:51:38 PM ******/
	

/*
 **********************************************
 * trigger to maintain deletion of software package member 
 * of a sofware package group
 */

CREATE TRIGGER [dbo].[rule_del_so_swgrp_member]
ON usd_link_swg_sw
	 after delete
as
begin
    declare @_object_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select sw from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_object_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_group_member @_object_uuid
		FETCH NEXT FROM mycur INTO @_object_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_del_so_swpkg_hierarchy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_del_so_swpkg_hierarchy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_del_so_swpkg_hierarchy]')
GO
/****** Object:  Trigger dbo.rule_del_so_swpkg_hierarchy    Script Date: 12/1/2005 11:51:38 PM ******/
	

/*
 **********************************************
 * trigger to maintain deletion of a child of a 
 * softare package parent group
 */

CREATE TRIGGER [dbo].[rule_del_so_swpkg_hierarchy]
ON usd_link_swgrp
	after delete 
as
begin
    declare @_object_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select grpchild from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_object_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_d_so_removed_group_member @_object_uuid
		FETCH NEXT FROM mycur INTO @_object_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_du_so_removed_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_du_so_removed_group_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_du_so_removed_group_member]')
GO
CREATE TRIGGER [dbo].[rule_du_so_removed_group_member]
ON ca_group_member
	after delete,update 
as
begin 
	declare @_object_uuid binary(16);
   
	declare cur_del cursor
	for select member_uuid
		from  deleted;
		
	open cur_del;
	fetch cur_del into @_object_uuid;     -- get first 
	while @@fetch_status = 0
	begin
	   execute  proc_d_so_removed_group_member @_object_uuid;
	   fetch cur_del into @_object_uuid;     -- get next
	end; -- while
	
	close cur_del;
	deallocate cur_del;

end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_csm_object]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_csm_object]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_csm_object    Script Date: 12/1/2005 11:51:06 PM ******/


/*
 *********************************************
 trigger for deleteing a CSM object
*/
CREATE TRIGGER [dbo].[rule_i_del_so_csm_object]
ON csm_object
	 after delete
as
begin
    declare @_obj_uuid  binary(16);
	declare @_cms_class_id integer;

	DECLARE mycur CURSOR
		FOR select class, uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_cms_class_id, @_obj_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_i_del_so_csm_object @_obj_uuid, @_cms_class_id;
		FETCH NEXT FROM mycur INTO @_cms_class_id, @_obj_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

							
end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_rptree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_rptree]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_rptree]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_rptree    Script Date: 12/1/2005 11:50:54 PM ******/


/*
 *********************************************
 trigger for deleteing a reporter object
*/

CREATE TRIGGER [dbo].[rule_i_del_so_rptree]
ON rptree
	 after delete
as
begin
  	declare @ddis_hw_uuid binary(16);

	DECLARE mycur CURSOR
		FOR select object_uuid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

							
end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_actproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_actproc]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_actproc]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_actproc    Script Date: 12/1/2005 11:50:54 PM ******/

 

CREATE TRIGGER [dbo].[rule_i_del_so_usd_actproc]
ON usd_actproc
	 after delete
as
begin
  declare @ddis_hw_uuid binary(16);
  
	DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_container]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_container    Script Date: 12/1/2005 11:50:54 PM ******/




/*
 *********************************************
 trigger for a USD container
*/
CREATE TRIGGER [dbo].[rule_i_del_so_usd_container]
ON usd_cont
	 after delete
as
begin 
    declare @ddis_hw_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_dis_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_dis_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_dis_container]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_dis_container    Script Date: 12/1/2005 11:50:55 PM ******/




/*
 *********************************************
 trigger fro a USD dist. container
*/
CREATE TRIGGER [dbo].[rule_i_del_so_usd_dis_container]
ON usd_contfold
	after delete 
as
begin
    declare @ddis_hw_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_job]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_job]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_job    Script Date: 12/1/2005 11:50:55 PM ******/


/*
 *********************************************
 trigger fro a USD job
*/
CREATE TRIGGER [dbo].[rule_i_del_so_usd_job]
ON usd_activity
	after delete 
as
begin
    declare @ddis_hw_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_job_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_job_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_job_container]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_job_container    Script Date: 12/1/2005 11:50:56 PM ******/

/*
 *********************************************
 trigger fro a USD job container
*/


CREATE TRIGGER [dbo].[rule_i_del_so_usd_job_container]
ON usd_job_cont
	 after delete
as
begin
    declare @ddis_hw_uuid binary(16);

    DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_software].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_software]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_software]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_software    Script Date: 12/1/2005 11:50:56 PM ******/


/*
 *********************************************
 trigger for a USD software
*/
CREATE TRIGGER [dbo].[rule_i_del_so_usd_software]
ON usd_rsw
	 after delete
as 
begin
   declare @ddis_hw_uuid binary(16);
   
   	DECLARE mycur CURSOR
		FOR select objectid from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @ddis_hw_uuid
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_d_so_removed_object @ddis_hw_uuid
		FETCH NEXT FROM mycur INTO @ddis_hw_uuid;

	END

	CLOSE mycur
	DEALLOCATE mycur

end;
GO

GO
--SqlScripter----[dbo].[rule_i_del_so_usd_sw_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_del_so_usd_sw_group]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_del_so_usd_sw_group]')
GO
/****** Object:  Trigger dbo.rule_i_del_so_usd_sw_group    Script Date: 12/1/2005 11:51:39 PM ******/






/*
 *********************************************
 trigger fro a USD sw group
*/
CREATE TRIGGER [dbo].[rule_i_del_so_usd_sw_group]
ON usd_swfold 
	after delete 
as 
begin
   declare @_obj_uuid binary(16);
   declare @_type integer;


	DECLARE mycur CURSOR
		FOR select objectid, type from deleted

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_obj_uuid, @_type
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute   proc_i_del_so_usd_group  @_obj_uuid, @_type
		FETCH NEXT FROM mycur INTO @_obj_uuid, @_type;

	END

	CLOSE mycur
	DEALLOCATE mycur

							
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_area].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_area]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_area]')
GO
/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage area objects
 *********************************************************
 *********************************************************
 */




/*
 ****************************************************
 trigger for creating a new area
	step 1) create the object permission
	step 2) calculate&set new area mask and
 */
CREATE TRIGGER [dbo].[rule_i_new_so_area]
ON ols_area_def
 after insert
as
begin
	declare @_obj_uuid 	binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);
	declare @area_id int;

	set nocount on;
	select @_clsid = 3;

	DECLARE cur_nsoa CURSOR
		FOR select area_uuid, creation_user, area_id  from inserted

	OPEN cur_nsoa
	FETCH NEXT FROM cur_nsoa INTO @_obj_uuid, @_uri, @area_id	-- get first

	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;

		-- update area permissions because a new area was created
		execute ols_sp_area_changed 1, @area_id;

		FETCH NEXT FROM cur_nsoa INTO @_obj_uuid, @_uri, @area_id;	  -- get next

	END

	CLOSE cur_nsoa
	DEALLOCATE cur_nsoa

	-- apply area mask
	execute ols_sp_applyAreaMask @obj_uuid=null;

end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_computer]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_computer]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_computer    Script Date: 12/1/2005 11:51:39 PM ******/



/*
 **********************************************
 rule for insert of Class Discoverd Hardware
*/
CREATE TRIGGER [dbo].[rule_i_new_so_computer]
ON ca_discovered_hardware
	after insert 
as	
begin
    declare @_obj_uuid 	binary(16);
    declare @_clsid integer;
    declare @_uri nvarchar(255);
 
    select @_obj_uuid 	= (select dis_hw_uuid from inserted);
    select @_clsid = 1000;
    select @_uri = (select creation_user from inserted);
	         
    execute  proc_i_new_so_object  @_obj_uuid, @_clsid, @_uri;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_computer_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_computer_user]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_computer_user]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_computer_user    Script Date: 12/1/2005 11:51:39 PM ******/



 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage computer user objects
 *********************************************************
 *********************************************************
 */


/*
 ****************************************************
 trigger for creating a new computer user
 */
CREATE TRIGGER [dbo].[rule_i_new_so_computer_user]
ON ca_link_dis_hw_user
 after insert
as
begin 
	declare @_obj_uuid 	binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);
	
    select @_obj_uuid 	= (select link_dis_hw_user_uuid from inserted);
	select @_clsid = 1001;
	select @_uri = (select creation_user from inserted);

	execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_csm_object]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_csm_object]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_csm_object    Script Date: 12/1/2005 11:51:40 PM ******/


/*
 *********************************************
 trigger for inserting a new cs object
*/
CREATE TRIGGER [dbo].[rule_i_new_so_csm_object]
ON csm_object
	 after insert
as
  declare @_obj_uuid binary(16);
  declare @_cms_class_id integer;
  declare @_user nvarchar(255);

begin
     select @_obj_uuid = (select uuid from inserted);
     select @_cms_class_id = (select class from inserted);
	 select @_user = (select creation_user from inserted);

	execute   proc_i_new_so_csm_object @_obj_uuid, @_cms_class_id, @_user;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_domain]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_domain]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_domain    Script Date: 12/1/2005 11:51:40 PM ******/


 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage domain objects
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 trigger for creating a new domain represented
 by an entryi in the ca_n_tier table
 */

CREATE TRIGGER [dbo].[rule_i_new_so_domain]
ON ca_n_tier
 after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);

  select @_obj_uuid = (select domain_uuid from inserted);
  select @_clsid = 1006;
  select @_uri = (select creation_user from inserted);
	
 execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
 
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_engine]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_engine]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_engine    Script Date: 12/1/2005 11:51:40 PM ******/
 
/*
 *********************************************************
 *********************************************************
 * Procedures and rule to manage OLS for engine objects
 ********************************************************* 
 *********************************************************
 */

/*
 *********************************************
 trigger for creating an engine
 */

CREATE TRIGGER [dbo].[rule_i_new_so_engine]
ON ca_engine 
    after insert
as
begin
    declare @_obj_uuid binary(16);
    declare @_uri nvarchar(255);
    
    select @_obj_uuid = (select engine_uuid from inserted);
    select @_uri = (select creation_user from inserted );
    
    execute proc_i_new_so_object  @_obj_uuid, 3005, @_uri ;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_group]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_group]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_group    Script Date: 12/1/2005 11:51:41 PM ******/




/*
 ********************************************
 trigger for creating a new group
*/
CREATE TRIGGER [dbo].[rule_i_new_so_group]
ON ca_group_def
    after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_security_group integer;
  declare @_grp_type  integer;
  declare @_uri  nvarchar(255);


    select @_obj_uuid = (select group_uuid from inserted);
	select @_security_group = (select security_group from inserted);
	select @_grp_type = (select member_type from inserted);
    select @_uri = (select creation_user from inserted);


	execute  proc_i_new_so_group @_obj_uuid, @_security_group, @_grp_type, @_uri;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_group_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_group_member]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_group_member    Script Date: 12/1/2005 11:51:41 PM ******/


/*
 ***********************************************
 trigger for creating a new group_member
 */
CREATE TRIGGER [dbo].[rule_i_new_so_group_member]
ON ca_group_member
 after insert
as
begin
	declare @ngmem_uuid binary(16);
    declare @nggroup_uuid binary(16);
    
	select @ngmem_uuid = (Select member_uuid from inserted);
    select @nggroup_uuid = (select group_uuid from inserted);

	execute  proc_i_new_so_group_member @ngmem_uuid, @nggroup_uuid;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_manager]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_manager]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_manager    Script Date: 12/1/2005 11:51:41 PM ******/

/*
 *********************************************
 trigger for creating a manager object
 */
CREATE TRIGGER [dbo].[rule_i_new_so_manager]
ON ca_manager
 after insert
as
begin
	declare @_obj_uuid binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);
    
	select @_obj_uuid = (select manager_uuid from  inserted);
	select @_clsid = 1003;
	select @_uri = (select creation_user from inserted);
 
	execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
    
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_rptree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_rptree]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_rptree]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_rptree    Script Date: 12/1/2005 11:51:42 PM ******/






/*
 *********************************************
 trigger for inserting a new reporter object
*/

CREATE TRIGGER [dbo].[rule_i_new_so_rptree]
ON rptree
	after insert 
as
begin
  declare @_obj_uuid binary(16);
  declare @_type integer;
  declare @_user nvarchar(255);

     select @_obj_uuid = (select object_uuid from inserted);
     select @_type = (select type from inserted);
     select @_user = (select creation_user from inserted);

	execute   proc_i_new_so_rptree @_obj_uuid, @_type, @_user;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_security_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_security_profile]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_security_profile]')
GO
/*
 ***********************************************
 rule for insert a new security profile
*/
CREATE TRIGGER [dbo].[rule_i_new_so_security_profile]
ON ca_security_profile
	after insert
as
begin
	declare  @_obj_uuid binary(16);
	declare  @_type integer;
	declare  @_default_ace	integer;
	declare  @_default_area	integer;
	declare  @_area_enabled	integer;

	set nocount on;
	select @_obj_uuid = (select security_profile_uuid from inserted);
	select @_type	 = (select type from inserted);
	select @_default_ace	= (select default_ace from inserted);
	select @_default_area	= (select area_ace from inserted);
	select @_area_enabled	= (select area_enabled from inserted);

	execute  proc_i_new_so_security_profile  @_obj_uuid,  @_type,  @_default_ace;

end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_software_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_software_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_software_def]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_software_def    Script Date: 12/1/2005 11:51:42 PM ******/

/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage Sofware Definitions
 *********************************************************
 *********************************************************
 */
/*
 **********************************************
 rule for insert of Class software definition
*/
CREATE TRIGGER [dbo].[rule_i_new_so_software_def]
ON ca_software_def
	after insert 
as
begin 
	declare @_obj_uuid binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);

	
    set @_clsid = 1008;

    declare cur_cl cursor for
    select sw_def_uuid, creation_user
    from inserted;
    
    open cur_cl;
    fetch cur_cl into @_obj_uuid, @_uri; -- get first 
    while @@fetch_status = 0
    begin
  
        execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
        
        fetch cur_cl into @_obj_uuid, @_uri; -- get next

     end; -- while
     close cur_cl;
     deallocate cur_cl;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_sw_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_sw_category]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_sw_category]')
GO
/****************************************************************************************/
/*                                                                                      */
/* Star 14843483 DSM: Alter rule rule_i_new_so_sw_category for ca_category_def */
/*                                                                                      */
/****************************************************************************************/

/* lock objects...  */
 
/* Start of lines added to convert to online lock */
 
 
/* Start of locks for dependent tables */
 
/* End of lines added to convert to online lock */

/* ********************** 10437 begin  ******************* */

/**
 ***********************************************
 ***********************************************
  bug fix : inserting multiple categories
  Sample : UPM does a query like 

	INSERT INTO ca_category_def 
	(category_uuid, ...) 
	SELECT t.category_uuid, .. 
	FROM #ca_category_def t 
	WHERE t.category_uuid NOT IN ( SELECT category_uuid FROM ca_category_def ) ;


 ***********************************************
 ***********************************************
 */

/*
 **********************************************
 rule for insert of Class software category
*/
CREATE TRIGGER [dbo].[rule_i_new_so_sw_category]
ON ca_category_def
	after insert 
as
begin
	  declare @_obj_uuid   binary(16);
    declare @_clsid      integer;
    declare @_uri        nvarchar(255);

    select @_clsid = 1009;

    declare curCatIns cursor for
    	select category_uuid, creation_user from inserted;

    open curCatIns;
    fetch curCatIns into @_obj_uuid, @_uri; -- get first 
    while @@fetch_status = 0
    begin
		execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
		fetch curCatIns into @_obj_uuid, @_uri; -- get next 

     end; -- while
     close curCatIns;
     deallocate curCatIns;


end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_actproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_actproc]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_actproc]')
GO
-- Old trigger that will call a new procedure for special behaviour with regards to area codes
CREATE TRIGGER [dbo].[rule_i_new_so_usd_actproc]
ON usd_actproc
	 after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);

set nocount on;

  select @_obj_uuid = (select objectid from inserted);
  select @_clsid = 2001;
  select @_uri = (select creation_user from inserted);

  execute proc_i_new_so_procedure_object	@_obj_uuid, @_clsid, @_uri;
		
end
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_container]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_usd_container    Script Date: 12/1/2005 11:51:43 PM ******/






/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage USD container
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 trigger for inserting a new USD container
*/
CREATE TRIGGER [dbo].[rule_i_new_so_usd_container]
ON usd_cont
	 after insert
as
begin 
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);

      select @_obj_uuid = (select objectid from inserted);
	  select @_clsid = 2008;
	  select @_uri = (select creation_user from inserted);


	execute   proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_dis_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_dis_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_dis_container]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_usd_dis_container    Script Date: 12/1/2005 11:51:44 PM ******/


/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage USD dist. container
 *********************************************************
 *********************************************************
 */

/*
 *********************************************
 trigger for inserting a new USD dist. container
*/
CREATE TRIGGER [dbo].[rule_i_new_so_usd_dis_container]
ON usd_contfold
	 after insert
as 
begin
    declare @_obj_uuid binary(16);
    declare @_clsid integer;
    declare @_uri nvarchar(255);

    select @_obj_uuid = (select objectid from inserted);
    select @_clsid = 2006;
    select @_uri = (select creation_user from inserted);


    execute   proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
						
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_job]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_job]')
GO
-- Old trigger that will call a new procedure for special behaviour with regards to area codes
CREATE TRIGGER [dbo].[rule_i_new_so_usd_job]
ON usd_activity
	 after insert
as 
begin
    declare @_obj_uuid binary(16)
    declare @_clsid integer
    declare @_uri nvarchar(255)
   
set nocount on;

    select @_obj_uuid = (select objectid from inserted)
    select @_clsid = 2005
    select @_uri = (select creation_user from inserted)
							
    execute   proc_i_new_so_activity_object @_obj_uuid, @_clsid, @_uri
							
end
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_job_container].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_job_container]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_job_container]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_usd_job_container    Script Date: 12/1/2005 11:51:44 PM ******/




/*
 *********************************************
 trigger for inserting a new USD job container
*/


CREATE TRIGGER [dbo].[rule_i_new_so_usd_job_container]
ON usd_job_cont 
	 after insert
as
begin
    declare @_obj_uuid  binary(16);
    declare @_type integer;
    declare @_uri nvarchar(255);


    select @_obj_uuid = (select objectid from inserted);
    select @_type = (select type from inserted);
    select @_uri = (select creation_user from inserted);


    execute   proc_i_new_so_usd_job_container @_obj_uuid, @_type, @_uri;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_software].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_software]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_software]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_usd_software    Script Date: 12/1/2005 11:51:45 PM ******/


/*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage USD Software
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 trigger for inserting a new USD software
*/
CREATE TRIGGER [dbo].[rule_i_new_so_usd_software]
ON usd_rsw
	 after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);


     select @_obj_uuid = (select objectid from inserted);
     select @_clsid = 2000;
	 select @_uri = (select creation_user from inserted);

	execute   proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
							
end;
GO

GO
--SqlScripter----[dbo].[rule_i_new_so_usd_sw_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_new_so_usd_sw_group]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_new_so_usd_sw_group]')
GO
/****** Object:  Trigger dbo.rule_i_new_so_usd_sw_group    Script Date: 12/1/2005 11:51:45 PM ******/




/*
 *********************************************
 trigger for inserting a new USD SW Group
*/



CREATE TRIGGER [dbo].[rule_i_new_so_usd_sw_group]
ON usd_swfold 
	 after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_type integer;
  declare @_security_group integer;
  declare @_user nvarchar(255);

     select @_obj_uuid = (select objectid from inserted);
     select @_type = (select type from inserted);
     select @_security_group = (select security_group from inserted);
     select @_user = (select creation_user from inserted);


	execute   proc_i_new_so_usd_group @_obj_uuid, @_type, @_security_group, @_user;
							
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_class_def]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_class_def]')
GO
/****** Object:  Trigger dbo.rule_i_so_class_def    Script Date: 12/1/2005 11:51:06 PM ******/



/************************************************/
/*  trigger if a new class definition is added */

CREATE TRIGGER [dbo].[rule_i_so_class_def]
ON ca_security_class_def
	after insert 
as
begin
  declare @_cd_uuid binary(16);
  declare @_classId integer;
	
  select @_cd_uuid = (select class_def_uuid from inserted);
  select @_classId = (select class_id from inserted);
		
  execute  proc_i_so_class_def @_cd_uuid, @_classId;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_inserted_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_inserted_group_ace]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_inserted_group_ace]')
GO
/****** Object:  Trigger dbo.rule_i_so_inserted_group_ace    Script Date: 12/1/2005 11:51:46 PM ******/


/*
 ****************************************
 rule if a new group_ace was inserted
*/

CREATE TRIGGER [dbo].[rule_i_so_inserted_group_ace]
ON ca_group_ace
       after insert 
as
begin
	declare	@_group_uuid binary(16);		/* new.group_def_uuid */
	declare	@_sp_uuid binary(16);			/* new.security_profile_uuid */
	declare	@_group_ace  integer;			/* new.ace */
	declare	@_group_enable_inheritance integer;	/* new.enable_inheritance */
  
	declare lst_igace cursor for
		select  group_def_uuid, security_profile_uuid ,ace, enable_inheritance 
		from inserted;

	-- get first inserted group ace
	open lst_igace;
	fetch from lst_igace into @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance;
	while @@fetch_status = 0
	begin
		execute  proc_i_so_inserted_group_ace @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance;
		-- fetch next
		fetch from lst_igace into @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance;
	
	end;  -- end of loop over inserted grozp aces
	close lst_igace;
	deallocate lst_igace;

end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_ebased_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_ebased_policy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_ebased_policy]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_ebased_policy    Script Date: 12/1/2005 11:51:46 PM ******/

/*
 *********************************************
 trigger for creating event based policy
*/
CREATE TRIGGER [dbo].[rule_i_so_new_ebased_policy]
ON amepdef
	 after insert
as
begin
  declare @_obj_uuid binary(16);
  declare @_clsid integer;
  declare @_uri nvarchar(255);
	
	
	select @_obj_uuid = (select policy_uuid  from inserted);
	select @_clsid = 3301;
	select @_uri = (select creation_user from inserted);
	

	execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_job]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_job]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_job    Script Date: 12/1/2005 11:51:47 PM ******/


/*
 *********************************************
 trigger for creating jobs
 */


CREATE TRIGGER [dbo].[rule_i_so_new_job]
ON  ncjobcfg
	after insert
as
begin
	declare @_obj_uuid binary(16);
	declare @_uri nvarchar(255);
	declare @_job_category integer;


	select @_obj_uuid = (select job_uuid from inserted);
	select @_uri = (select creation_user from inserted);
	select @_job_category = (select job_category from inserted);


	execute  proc_i_so_new_job 	@_obj_uuid, @_uri, @_job_category;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_module].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_module]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_module]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_module    Script Date: 12/1/2005 11:51:47 PM ******/



/*
 *********************************************
 trigger for creating  module object
*/
CREATE TRIGGER [dbo].[rule_i_so_new_module]
ON ncmodcfg
	 after insert
as
begin
	declare @_obj_uuid binary(16);
	declare @_uri nvarchar(255);
	declare @_motype integer;


	select @_obj_uuid = (select module_uuid from inserted);
	select @_uri = (select creation_user from inserted);
	select @_motype = (select motype from inserted);


	execute  proc_i_so_new_module @_obj_uuid, @_uri, @_motype;
	
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_qbased_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_qbased_policy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_qbased_policy]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_qbased_policy    Script Date: 12/1/2005 11:51:47 PM ******/



 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage policies
 *********************************************************
 *********************************************************
 */

/*
 *********************************************
 trigger for creating query based policy
*/
CREATE TRIGGER [dbo].[rule_i_so_new_qbased_policy]
ON polidef
	 after insert
as
begin
	declare @_obj_uuid binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);

	select @_obj_uuid = (select policy_uuid from inserted);
	select @_clsid = 3300;
	select @_uri = (select creation_user from inserted);

	execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_query].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_query]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_query]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_query    Script Date: 12/1/2005 11:51:48 PM ******/

 /*
 *********************************************************
 *********************************************************
 * Procedures and rules to manage query
 *********************************************************
 *********************************************************
 */


/*
 *********************************************
 trigger for creating a query
*/
CREATE TRIGGER [dbo].[rule_i_so_new_query]
ON ca_query_def
	 after insert
as
begin
	declare @_obj_uuid binary(16);
	declare @_clsid integer;
	declare @_uri nvarchar(255);
	
	select @_obj_uuid = (select query_uuid from inserted);
	select @_clsid = 1007;
	select @_uri = (select creation_user from inserted);
	
    execute  proc_i_new_so_object @_obj_uuid, @_clsid, @_uri;
						
end;
GO

GO
--SqlScripter----[dbo].[rule_i_so_new_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_i_so_new_server]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_i_so_new_server]')
GO
/****** Object:  Trigger dbo.rule_i_so_new_server    Script Date: 12/1/2005 11:51:48 PM ******/


/*
 *********************************************
 trigger for creating a new server
*/
CREATE TRIGGER [dbo].[rule_i_so_new_server]
ON ca_server
 after insert
as 
begin
   declare @_obj_uuid binary(16);
   declare @_clsid integer;
   declare @_uri nvarchar(255);
   

   select @_obj_uuid = (select server_uuid from inserted);
   select @_clsid = 1004;
   select @_uri = (select creation_user from inserted);    
     
	execute  proc_i_new_so_object	@_obj_uuid, @_clsid, @_uri ;
     
end;
GO

GO
--SqlScripter----[dbo].[rule_new_so_procgrp_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_new_so_procgrp_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_new_so_procgrp_member]')
GO
/****** Object:  Trigger dbo.rule_new_so_procgrp_member    Script Date: 12/1/2005 11:51:48 PM ******/
 
 
 
 
/*
 ***********************************************
 * trigger to maintain a new procedure of a 
 * procedure group
 */

CREATE TRIGGER [dbo].[rule_new_so_procgrp_member]
ON usd_link_grp_proc
	 after insert
as
begin
  declare @ngmem_uuid binary(16);
  declare @nggroup_uuid  binary(16);

     select @ngmem_uuid = (select ap from inserted);
     select @nggroup_uuid = (select procgrp from inserted);


	execute  proc_i_new_so_group_member @ngmem_uuid, @nggroup_uuid;
end;
GO

GO
--SqlScripter----[dbo].[rule_new_so_swgrp_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_new_so_swgrp_member]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_new_so_swgrp_member]')
GO
/****** Object:  Trigger dbo.rule_new_so_swgrp_member    Script Date: 12/1/2005 11:51:49 PM ******/




 
 /*
 ***********************************************
 * trigger to maintain a new software package member 
 * of a sofware package group
 */

CREATE TRIGGER [dbo].[rule_new_so_swgrp_member]
ON usd_link_swg_sw
	after insert 
as
begin
   declare @ngmem_uuid binary(16);
   declare @nggroup_uuid binary(16);
	 
     select @ngmem_uuid = (select sw from inserted);
	 select @nggroup_uuid = (select swg from inserted);
      
	
	execute  proc_i_new_so_group_member @ngmem_uuid, @nggroup_uuid;

end;
GO

GO
--SqlScripter----[dbo].[rule_new_so_swpkg_hierarchy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_new_so_swpkg_hierarchy]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_new_so_swpkg_hierarchy]')
GO
/****** Object:  Trigger dbo.rule_new_so_swpkg_hierarchy    Script Date: 12/1/2005 11:51:49 PM ******/
 
 /*
 ***********************************************
 * trigger to maintain a new  child of a 
 * softare package parent group
 */

CREATE TRIGGER [dbo].[rule_new_so_swpkg_hierarchy]
ON usd_link_swgrp
	after insert 
as
begin
  declare @ngmem_uuid binary(16);
  declare @nggroup_uuid binary(16);

     select @ngmem_uuid = (select grpchild from inserted);
     select @nggroup_uuid = (select grpparent from inserted);

	execute  proc_i_new_so_group_member @ngmem_uuid, @nggroup_uuid;
end;
GO

GO
--SqlScripter----[dbo].[rule_reset_agent_backup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_reset_agent_backup_status]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_reset_agent_backup_status]')
GO
/****** Object:  Trigger dbo.rule_reset_agent_backup_status    Script Date: 12/1/2005 11:51:50 PM ******/


/*
 *********************************************
 trigger for deleting backup_user
*/

CREATE TRIGGER [dbo].[rule_reset_agent_backup_status]
ON backup_user		
            	after delete
		as            
		begin


		declare @_user_uuid binary(16);
		declare @_dis_hw_uuid binary(16);
		declare @_link_dis_hw_user_uuid binary(16);

		declare lst_user cursor for
	       		select user_uuid, dis_hw_uuid, link_dis_hw_user_uuid from deleted;

		-- get first deleted user
		open lst_user;
		fetch from lst_user into @_user_uuid, @_dis_hw_uuid, @_link_dis_hw_user_uuid;

		while @@fetch_status = 0
  		begin
	 		execute backup_p_reset_agent_backup_stat @_user_uuid, @_dis_hw_uuid, @_link_dis_hw_user_uuid;
   		     	-- fetch next
   			fetch from lst_user into @_user_uuid, @_dis_hw_uuid, @_link_dis_hw_user_uuid;

   
		end;  -- end of loop over inserted grozp aces
  	   
		close lst_user;
		deallocate lst_user;



	end;
GO

GO
--SqlScripter----[dbo].[rule_set_agent_backup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_set_agent_backup_status]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_set_agent_backup_status]')
GO
/*
 ***********************************************************
 Issue: 15458839    Title: ENG_BACKUP STATUS IS WRONG
 ***********************************************************
*/
CREATE TRIGGER [dbo].[rule_set_agent_backup_status]
ON [dbo].[backup_user]
	after insert, update
	
	as
	begin

		declare @_user_uuid binary(16),
			@_dis_hw_uuid binary(16),
			@_link_dis_hw_user_uuid binary(16);
		   
		select @_user_uuid = (select user_uuid from inserted);
		select @_dis_hw_uuid = (select dis_hw_uuid from inserted);
		select @_link_dis_hw_user_uuid = (select link_dis_hw_user_uuid from inserted);

		declare @_last_login_date_new integer;
		select @_last_login_date_new = (select last_login_date from inserted);

		if	(@_last_login_date_new > 0)	
		begin
			execute backup_p_set_agent_backup_status @_user_uuid, @_dis_hw_uuid, @_link_dis_hw_user_uuid;
		end;
	end;
GO

GO
--SqlScripter----[dbo].[rule_set_backup_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_set_backup_status]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_set_backup_status]')
GO
/****** Object:  Trigger dbo.rule_set_backup_status    Script Date: 12/1/2005 11:51:50 PM ******/

/*
 *********************************************
 trigger for creating ca_agent_component
*/

CREATE TRIGGER [dbo].[rule_set_backup_status]
ON ca_agent_component
	    after insert
	as
	begin
		declare @_object_uuid binary(16);
   
		select @_object_uuid = (select object_uuid from inserted);
        
		execute  backup_p_set_backup_status  @_object_uuid;

	end;
GO

GO
--SqlScripter----[dbo].[rule_so_area_setting].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_so_area_setting]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_so_area_setting]')
GO
/**
 ********************************************
  trigger to manage configuration updates
	e.g area permission
 */

CREATE TRIGGER [dbo].[rule_so_area_setting]
ON ca_settings
 after update
as
begin

	set nocount on;
	if update(set_val_lng)
	begin
		declare @cnt int;

		select @cnt = (select count(*) from inserted where set_id = 900);
		if( @cnt <> 0 )
		begin
			-- config value for area permissons is changed
			update ols_area_ace set area_ace = s.set_val_lng
					from ca_settings s
					where security_level = 4
						and s.set_id = 900;
		end;
	end;

end
GO

GO
--SqlScripter----[dbo].[rule_u_so_area_updated].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_u_so_area_updated]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_area_updated]')
GO
-- Trigger for updating an area ace and moving related objects too
CREATE TRIGGER [dbo].[rule_u_so_area_updated]
ON ols_area_ace
 after update
as
begin 
	
    if update(area_ace)
    begin 
	declare @objCount integer

set nocount on;

	set @objCount = (select count(*) from inserted where object_type = 2000)

	-- If classid is sw package, move the procedures too
	if(@objCount > 0)
	begin
		-- Move all procedures for these sw packages too
		update ols_area_ace set area_ace = inserted.area_ace, security_level = inserted.security_level
		from inserted, usd_actproc
		where usd_actproc.rsw = inserted.object_def_uuid
		and ols_area_ace.object_def_uuid = usd_actproc.objectid
	end

	set @objCount = (select count(*) from inserted where object_type = 2004)

	-- If classid is job cont, move the activities too
	if(@objCount > 0)
	begin
		-- Move all procedures for these sw packages too
		update ols_area_ace set area_ace = inserted.area_ace
		from inserted, usd_link_jc_act
		where usd_link_jc_act.jcont = inserted.object_def_uuid
		and ols_area_ace.object_def_uuid = usd_link_jc_act.activity

	end
    end
end
GO

GO
--SqlScripter----[dbo].[rule_u_so_class_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_u_so_class_ace]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_class_ace]')
GO
/****** Object:  Trigger dbo.rule_u_so_class_ace    Script Date: 12/1/2005 11:50:56 PM ******/



/************************************************/
/*  trigger if class ace is updated */

CREATE TRIGGER [dbo].[rule_u_so_class_ace]
ON [dbo].[ca_class_ace]
 after update
as                                        
begin                                  

   declare @new_ace 	integer;
   declare @new_access		integer;
   declare @old_ace 		integer;
   declare @sp_uuid 		binary(16);
   declare @class_uuid		binary(16);

/*
   select @new_ace 	= (select ace from inserted);                             
   select @new_access	= (select access from inserted);                        
   select @old_ace 	= (select ace from deleted);                              
   select @sp_uuid 	= (select security_profile_uuid from inserted);           
   select @class_uuid	= (select class_def_uuid from inserted);                
                                                                      
   execute  proc_u_so_class_ace @new_ace, @new_access, @old_ace , @sp_uuid , @class_uuid;
*/


-- Create a class ACE for this class
    declare c_ins cursor local
   	for select i.ace, i.access, i.security_profile_uuid, i.class_def_uuid, d.ace
    from inserted as i, deleted as d 
	where i.security_profile_uuid = d.security_profile_uuid and i.class_def_uuid = d.class_def_uuid ;
 								/* itrac 12093*/
 
   
    open c_ins
    fetch from c_ins into @new_ace, @new_access, @sp_uuid, @class_uuid, @old_ace --get first row
    
    while @@fetch_status = 0
    begin
   
      execute  proc_u_so_class_ace @new_ace, @new_access, @old_ace , @sp_uuid , @class_uuid;
      fetch from c_ins into @new_ace, @new_access, @sp_uuid, @class_uuid, @old_ace --get next row
    
    end
    close c_ins;
    deallocate c_ins;

end;
GO

GO
--SqlScripter----[dbo].[rule_u_so_updated_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_u_so_updated_group]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_updated_group]')
GO
/****** Object:  Trigger dbo.rule_u_so_updated_group    Script Date: 12/1/2005 11:51:50 PM ******/



/*
 ************************************
 trigger for updating a group definition
 and the column security_group  was changed
  update of (security_group)
 */
CREATE TRIGGER [dbo].[rule_u_so_updated_group]
ON [dbo].[ca_group_def]
          after update
as
begin
	declare @ugrp_uuid binary(16);
	declare @old_grpinheritance integer;
    declare @new_grpinheritance integer;
	
	DECLARE cur_u_so_updated_group cursor local
		FOR select deleted.group_uuid, deleted.security_group, inserted.security_group from deleted, inserted
			where inserted.group_uuid = deleted.group_uuid /* itrac 12093*/

	OPEN cur_u_so_updated_group
	FETCH NEXT FROM cur_u_so_updated_group INTO @ugrp_uuid, @old_grpinheritance, @new_grpinheritance;	
	WHILE @@FETCH_STATUS = 0
	BEGIN

		execute  proc_u_so_updated_group	@ugrp_uuid, @old_grpinheritance, @new_grpinheritance;	
		FETCH NEXT FROM cur_u_so_updated_group INTO @ugrp_uuid, @old_grpinheritance, @new_grpinheritance;	

	END

	CLOSE cur_u_so_updated_group
	DEALLOCATE cur_u_so_updated_group

end;
GO

GO
--SqlScripter----[dbo].[rule_u_so_updated_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_u_so_updated_group_ace]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_updated_group_ace]')
GO
/*
 ************************************************
 trigger for updating a group ace
*/
CREATE TRIGGER [dbo].[rule_u_so_updated_group_ace]
ON [dbo].[ca_group_ace]
 after update
as
begin
	if update(ace)
	begin
		declare @_group_uuid binary(16);
		declare @_sp_uuid binary(16);
		declare @_group_ace integer;
		declare @_group_enable_inheritance integer;
		declare @_group_old_ace integer;
		declare @_group_old_enable_inheritance integer;

		set nocount on;

		DECLARE mycur cursor local
			FOR select inserted.group_def_uuid, inserted.security_profile_uuid, inserted.ace,
					inserted.enable_inheritance, deleted.ace, deleted.enable_inheritance from deleted, inserted
					where inserted.group_def_uuid = deleted.group_def_uuid
						  and inserted.security_profile_uuid = deleted.security_profile_uuid /* itrac 12093*/

		OPEN mycur
		FETCH NEXT FROM mycur INTO @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance, @_group_old_ace, @_group_old_enable_inheritance
		WHILE @@FETCH_STATUS = 0
		BEGIN

			execute  proc_u_so_updated_group_ace @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance, @_group_old_ace, @_group_old_enable_inheritance
			FETCH NEXT FROM mycur INTO @_group_uuid, @_sp_uuid, @_group_ace, @_group_enable_inheritance, @_group_old_ace, @_group_old_enable_inheritance

		END

		CLOSE mycur
		DEALLOCATE mycur
	end
end
GO

GO
--SqlScripter----[dbo].[rule_u_so_updated_group_area].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[rule_u_so_updated_group_area]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_updated_group_area]')
GO
/* Start of locks for dependent tables */
 
/* End of lines added to convert to online lock */


/*
 ************************************************
 trigger for updating a area ace
 - either area_ace of a group object
 - security level ( reverting)
*/
CREATE TRIGGER [dbo].[rule_u_so_updated_group_area]
ON [dbo].[ols_area_ace]
 after update
as
begin

	if update(area_ace)
	begin
		

		declare @_inherit_ace integer;
		declare @_group_uuid  binary(16);
		declare @_member_uuid binary(16);

		declare @_group_area_ace_new integer;
		declare @_member_area_ace 	 integer;
		declare @_group_area_ace_old integer;

		declare @_object_level integer;
		declare @_object_type  integer;
		declare @_temp_ace     integer;


		set nocount on;
		DECLARE gcur_aace CURSOR LOCAL
			FOR select inserted.object_def_uuid, inserted.area_ace, g.security_group,
						 deleted.area_ace from deleted, inserted, ca_group_def g
				where deleted.object_def_uuid = inserted.object_def_uuid
					and g.group_uuid = inserted.object_def_uuid -- only valid for group updates

		OPEN gcur_aace
		FETCH NEXT FROM gcur_aace INTO @_group_uuid, @_group_area_ace_new, @_inherit_ace, @_group_area_ace_old
		WHILE @@FETCH_STATUS = 0
		BEGIN

				-- check if it's a security group

				if(@_inherit_ace = 1)
				begin
					-- it is a security group

					-- for update area_ace for all members of the group
					declare cur_gace cursor LOCAL
						for select gm.member_uuid, oa.area_ace, oa.security_level, oa.object_type
						from ca_group_member gm, ols_area_ace ga, ols_area_ace oa
						where ga.object_def_uuid = @_group_uuid
							AND ga.object_def_uuid = gm.group_uuid
							and oa.object_def_uuid = gm.member_uuid;

					open cur_gace
					fetch cur_gace into  @_member_uuid, @_member_area_ace, @_object_level, @_object_type;
					while @@fetch_status = 0
					begin
						-- Calculate a new ace from the new parent
						if (@_object_level != 2)-- not object level
						begin

							--select @_temp_ace = (@_group_area_ace_old & ~(@_member_area_ace)  ) | @_group_area_ace_new;

							--if(@_temp_ace <> @_member_area_ace  )
							--begin
							--	update ols_area_ace
							--		set area_ace = @_temp_ace,
							--			security_level = 1    -- now group level
							--		where object_def_uuid = @_member_uuid

		   					--execute  proc_u_so_area_revert @_level, @_object_uuid, @_level_before/* 3 !!! */, @_object_type;
							if(@_group_area_ace_new <> @_member_area_ace  )
							begin
		   						execute  proc_u_so_area_revert 3, @_member_uuid, 2 /* object_level temp */, @_object_type;
									
							end;


						end;

					fetch cur_gace into  @_member_uuid, @_member_area_ace, @_object_level, @_object_type;
				end;	-- end while
				close cur_gace;
				deallocate cur_gace;

		end
		FETCH NEXT FROM gcur_aace INTO @_group_uuid, @_group_area_ace_new, @_inherit_ace, @_group_area_ace_old ;

		END -- while end
		CLOSE gcur_aace
		DEALLOCATE gcur_aace

	end;


   if update(security_level)
   begin
	IF ( (SELECT trigger_nestlevel( object_ID('rule_u_so_updated_group_area') ) ) < 2 )
	begin
		declare 	@_level 		integer;
		declare 	@_object_uuid	binary(16);
		declare 	@_level_before	integer;

		declare c_aace_upd cursor LOCAL for 
		select i.security_level, i.object_def_uuid, d.security_level, d.object_type
		from inserted as i, deleted as d where
						i.object_def_uuid = d.object_def_uuid ;
						--	and i.object_type = d.object_type;


		open c_aace_upd
		fetch from c_aace_upd into @_level, @_object_uuid, @_level_before,@_object_type --get first row

		while @@fetch_status = 0
		begin

		   execute  proc_u_so_area_revert @_level, @_object_uuid, @_level_before, @_object_type;
		   fetch from c_aace_upd into @_level, @_object_uuid,  @_level_before,@_object_type  --get next row

		end
		close c_aace_upd;
		deallocate c_aace_upd;
	end
   end;


end;
GO

GO
--SqlScripter----[dbo].[rule_u_so_updated_object_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_u_so_updated_object_ace]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_u_so_updated_object_ace]')
GO
/* End of lines added to convert to online lock */

CREATE TRIGGER [dbo].[rule_u_so_updated_object_ace]
ON ca_object_ace
	 after update
as 
begin
  
   declare 	@_level 	integer;
   declare 	@_object_uuid	binary(16);
   declare 	@_sp_uuid	binary(16);
   declare 	@_level_before	integer;
   declare 	@_object_type 	integer;
/*	
   select @_level 		=  (select security_level from inserted);
   select @_object_uuid	= (select object_def_uuid from deleted);
   select @_sp_uuid	= (select security_profile_uuid from deleted);
   select @_level_before	= (select security_level from  deleted);
   select @_object_type 	= (select object_type from deleted);	
--    execute  proc_u_so_updated_object_ace @_level, @_object_uuid, @_sp_uuid, @_level_before, @_object_type;

*/
	IF ( (SELECT trigger_nestlevel( object_ID('rule_u_so_updated_object_ace') ) ) < 2 )
	begin

		declare c_oace_upd cursor local
		for select i.security_level, i.object_def_uuid, d.security_profile_uuid, d.security_level, d.object_type
		from inserted as i, deleted as d 
		where i.security_profile_uuid = d.security_profile_uuid 
						and i.object_def_uuid = d.object_def_uuid ;/* itrac 12093*/
	--					and i.object_type = d.object_type;
	 
	   
		open c_oace_upd
		fetch from c_oace_upd into @_level, @_object_uuid, @_sp_uuid, @_level_before,@_object_type --get first row
		
		while @@fetch_status = 0
		begin
	   
		execute  proc_u_so_updated_object_ace @_level, @_object_uuid, @_sp_uuid, @_level_before, @_object_type;
			fetch from c_oace_upd into @_level, @_object_uuid, @_sp_uuid, @_level_before,@_object_type  --get next row
		
		end
		close c_oace_upd;
		deallocate c_oace_upd;
	end

end
GO

GO
--SqlScripter----[dbo].[rule_upd_so_csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_upd_so_csm_object]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_upd_so_csm_object]')
GO
CREATE TRIGGER [dbo].[rule_upd_so_csm_object]
ON csm_object
after update
as
begin
	declare @_old_uuid binary(16);
	declare @_new_uuid binary(16);
	declare @_new_csm_class_id integer;
	declare @_old_cms_class_id integer;
	declare @_user nvarchar(255);

	DECLARE mycur CURSOR LOCAL
	FOR select deleted.uuid, inserted.uuid, inserted.class, deleted.class, inserted.creation_user
	from inserted, deleted
	where inserted.id= deleted.id /* itrac 12093*/

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_old_uuid, @_new_uuid, @_new_csm_class_id,
	@_old_cms_class_id, @_user;
	WHILE @@FETCH_STATUS = 0
		BEGIN

			execute proc_upd_so_csm_object @_old_uuid, @_new_uuid, @_new_csm_class_id,
			@_old_cms_class_id, @_user;
			FETCH NEXT FROM mycur INTO @_old_uuid, @_new_uuid, @_new_csm_class_id,
			@_old_cms_class_id, @_user;

		END

		CLOSE mycur
		DEALLOCATE mycur

	end;
GO

GO
--SqlScripter----[dbo].[rule_upd_so_usd_group_sec_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[rule_upd_so_usd_group_sec_grp]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[rule_upd_so_usd_group_sec_grp]')
GO
CREATE TRIGGER [dbo].[rule_upd_so_usd_group_sec_grp]
ON usd_swfold
after update
as
begin
	declare @_obj_uuid binary(16);
	declare @_type integer;
	declare @_old_security_group integer;
	declare @_new_security_group integer;

	DECLARE mycur CURSOR LOCAL
	FOR select deleted.objectid, deleted.type, deleted.security_group, inserted.security_group
	from inserted, deleted
	where inserted.objectid= deleted.objectid /* itrac 12093*/

	OPEN mycur
	FETCH NEXT FROM mycur INTO @_obj_uuid, @_type, @_old_security_group,
	@_new_security_group
	WHILE @@FETCH_STATUS = 0
		BEGIN

			execute proc_upd_so_usd_group_sec_grp @_obj_uuid, @_type,
			@_old_security_group, @_new_security_group;
			FETCH NEXT FROM mycur INTO @_obj_uuid, @_type, @_old_security_group,
			@_new_security_group

		END

		CLOSE mycur
		DEALLOCATE mycur

	end;
GO

GO
--SqlScripter----[dbo].[t_d_ca_discovered_hw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[t_d_ca_discovered_hw]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[t_d_ca_discovered_hw]')
GO
/****** Object:  Trigger dbo.t_d_ca_discovered_hw    Script Date: 12/1/2005 11:51:52 PM ******/
--GRANT EXECUTE ON ca_merge_class_for_logical_asset TO PUBLIC;
--GO

/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Version                                                     */
/*  =========== ==========  =======                                                     */
/*  17-mar-2005 mulwi01     Star 14015015 CAMDB - UAPM SQL PROC                         */
/*                                                                                      */
/****************************************************************************************/


CREATE TRIGGER [dbo].[t_d_ca_discovered_hw]
ON ca_discovered_hardware 
FOR DELETE AS
    
    /* Check whether any Reconciliation tasks are tracking discovery deletions. */
    /* If none are, then don't continue.                                        */
        
    if (SELECT count(*) FROM arg_reconcile_task WHERE discovery_deleted_indicator <> 0) = 0
        return
    
    declare @own_resource_uuid binary(16)
    declare @max_id integer
    declare @mod_rec_count integer
    declare @sys_name varchar(30)
    declare @date_in_seconds integer
    declare @dis_hw_uuid binary(16)
    declare @update_user varchar(30)
    declare @host_name nvarchar(255)
    declare @serial_number nvarchar(64)
    declare @vendor_name nvarchar(255)
    
    set @mod_rec_count = 0
    set @date_in_seconds = 0
    set @sys_name = 'Unicenter AM'
    set @update_user = 't_d_ca_discovered_hw'
    
    declare delete_list cursor for
      select dis_hw_uuid, host_name, serial_number, vendor_name from deleted
       
    open delete_list
    
    fetch next from delete_list into @dis_hw_uuid, @host_name, @serial_number, @vendor_name
    
    while @@fetch_status = 0
        begin
    
            /* Check whether the discovered asset record is linked to an owned resource record. */
	    /* If not, skip this record.                                                        */
	    
	    select @own_resource_uuid = (SELECT oa.own_resource_uuid 
	    	       			   FROM ca_asset_source ds 
	    	    		     INNER JOIN ca_asset_source os 
	    	    			     ON os.logical_asset_uuid = ds.logical_asset_uuid and os.subschema_id = 1
	    	    		     INNER JOIN ca_owned_resource oa 
	    	    			     ON oa.asset_source_uuid = os.asset_source_uuid
	    	     			  WHERE ds.asset_source_uuid = @dis_hw_uuid)
	    		
	    if @own_resource_uuid is null
	        goto Skip_Record
	        
	    /* Check whether an arg_reconcile_modification record already exists for this asset. */
	    /* If so, skip this record.                                                          */
		
	    select @mod_rec_count = (SELECT count(*)
				       FROM arg_reconcile_modification
				      WHERE dis_hw_uuid = @dis_hw_uuid)
		   
	    if @mod_rec_count > 0
	        goto Skip_Record
      
            /* Set up creation_date, last_update_date  */
        
            set @date_in_seconds = (SELECT DATEDIFF(second, cast('1/1/1970' as datetime), getdate()))
        
	    /* Get value to put into reconcile_modification_id. */
	
	    select @max_id = (SELECT max(reconcile_modification_id)
			        FROM arg_reconcile_modification
			       WHERE sys_name = @sys_name)
	
	    if @max_id is null
	        set @max_id = 0
	    else
	        set @max_id = @max_id + 1
	        
	  
	    /* Create the arg_reconcile_modification record. */
			
	    INSERT INTO arg_reconcile_modification
		       (sys_name, 
		        reconcile_modification_id,
		        reconcile_action,
		        own_resource_uuid,
		        dis_hw_uuid,
		        discovery_asset_name,
		        discovery_asset_serial_num,
		        discovery_asset_sys_vendor,
		        creation_user,
		        creation_date,
		        last_update_user,
		        last_update_date,
		        version_number)
			
		   VALUES
		       (@sys_name, 
		        @max_id,
		        3,
		        @own_resource_uuid,
		        @dis_hw_uuid,
		        @host_name,
		        @serial_number,
		        @vendor_name,
		        @update_user,
		        @date_in_seconds,
		        @update_user,
		        @date_in_seconds,
		        0)
		        
	    Skip_Record:
    
            fetch next from delete_list into @dis_hw_uuid, @host_name, @serial_number, @vendor_name
            
        end
    	
    close delete_list
    
    deallocate delete_list
GO

GO
--SqlScripter----[dbo].[t_d_ca_discovered_hw_ext_sys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[t_d_ca_discovered_hw_ext_sys]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[t_d_ca_discovered_hw_ext_sys]')
GO
/****** Object:  Trigger dbo.t_d_ca_discovered_hw_ext_sys    Script Date: 12/1/2005 11:51:52 PM ******/



CREATE TRIGGER [dbo].[t_d_ca_discovered_hw_ext_sys]
ON ca_discovered_hardware_ext_sys 
FOR DELETE AS

    /* Check whether any Reconciliation tasks are tracking discovery deletions. */
    /* If none are, then don't continue.                                        */
        
    if (SELECT count(*) FROM arg_reconcile_task WHERE discovery_deleted_indicator <> 0) = 0
        return

    declare @own_resource_uuid binary(16)
    declare @max_id integer
    declare @mod_rec_count integer
    declare @external_sys_name varchar(30)
    declare @date_in_seconds integer
    declare @dis_hw_uuid binary(16)
    declare @update_user varchar(30)
    declare @host_name nvarchar(255)
    declare @serial_number nvarchar(64)
    declare @vendor_name nvarchar(255)
    
    set @mod_rec_count = 0
    set @date_in_seconds = 0
    set @update_user = 't_d_ca_discovered_hw_ext_sys'
    
    declare delete_list cursor for select dis_hw_uuid, external_sys_name from deleted
           
    open delete_list
        
    fetch next from delete_list into @dis_hw_uuid, @external_sys_name
        
    while @@fetch_status = 0
        begin
    
            /* Check whether the discovered asset record is linked to an owned resource record. */
	    /* If not, skip this record.                                                        */
	    
	    select @own_resource_uuid = (SELECT oa.own_resource_uuid 
	    	       			   FROM ca_asset_source ds 
	    	    		     INNER JOIN ca_asset_source os 
	    	    			     ON os.logical_asset_uuid = ds.logical_asset_uuid and os.subschema_id = 1
	    	    		     INNER JOIN ca_owned_resource oa 
	    	    			     ON oa.asset_source_uuid = os.asset_source_uuid
	    	     			  WHERE ds.asset_source_uuid = @dis_hw_uuid)
	    		
	    if @own_resource_uuid is null
	        goto Skip_Record
	        
	    /* Check whether an arg_reconcile_modification record already exists for this asset. */
	    /* If so, skip this record.                                                          */
		
	    select @mod_rec_count = (SELECT count(*)
				       FROM arg_reconcile_modification
				      WHERE dis_hw_uuid = @dis_hw_uuid)
		   
	    if @mod_rec_count > 0
	        goto Skip_Record
	  
	    /* Get information from ca_discovered_hardware record to pass to arg_reconcile_modification. */
	
	    SELECT @host_name = host_name, @serial_number = serial_number, @vendor_name = vendor_name
	      FROM ca_discovered_hardware
	     WHERE dis_hw_uuid = @dis_hw_uuid
	
	    /* Set up creation_date, last_update_date  */
        
            set @date_in_seconds = (SELECT DATEDIFF(second, cast('1/1/1970' as datetime), getdate()))
        
	    /* Get value to put into reconcile_modification_id. */
	
	    select @max_id = (SELECT max(reconcile_modification_id)
			        FROM arg_reconcile_modification
			       WHERE sys_name = @external_sys_name)
	
	    if @max_id is null
	        set @max_id = 0
	    else
	        set @max_id = @max_id + 1
	  
	    /* Create the arg_reconcile_modification record. */
			
	    INSERT INTO arg_reconcile_modification
		       (sys_name, 
		        reconcile_modification_id,
		        reconcile_action,
		        own_resource_uuid,
		        dis_hw_uuid,
		        discovery_asset_name,
		        discovery_asset_serial_num,
		        discovery_asset_sys_vendor,
		        creation_user,
		        creation_date,
		        last_update_user,
		        last_update_date,
		        version_number)
			
		    VALUES
		       (@external_sys_name, 
		        @max_id,
		        3,
		        @own_resource_uuid,
		        @dis_hw_uuid,
		        @host_name,
		        @serial_number,
		        @vendor_name,
		        @update_user,
		        @date_in_seconds,
		        @update_user,
		        @date_in_seconds,
		        0)
		        
	    Skip_Record:
    
            fetch next from delete_list into @dis_hw_uuid, @external_sys_name
            
        end
    	
    close delete_list
    
    deallocate delete_list
GO

GO
--SqlScripter----[dbo].[t_u_ca_discovered_hw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[t_u_ca_discovered_hw]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[t_u_ca_discovered_hw]')
GO
CREATE TRIGGER [dbo].[t_u_ca_discovered_hw]
ON ca_discovered_hardware 
FOR UPDATE AS

/*  Only run if host_name has been updated. */

if update (host_name)
    begin
    
        declare @dis_hw_uuid binary(16)
        declare @new_host_name nvarchar(255)
        declare @old_host_name nvarchar(255)

        declare change_list cursor for
          select inserted.dis_hw_uuid, inserted.host_name, deleted.host_name from inserted, deleted
           where inserted.discovery_changes_switch = 0 and inserted.dis_hw_uuid = deleted.dis_hw_uuid
   
        open change_list

        fetch next from change_list into @dis_hw_uuid, @new_host_name, @old_host_name

        while @@fetch_status = 0
            begin

               /*  Only process if the host_name value has changed to something different. */

	       if @new_host_name <> @old_host_name
                   begin

                       /* Set the discovery_changes_switch "on". */

                       update ca_discovered_hardware
	                  set discovery_changes_switch = 1
                        where dis_hw_uuid = @dis_hw_uuid
                   end

                fetch next from change_list into @dis_hw_uuid, @new_host_name, @old_host_name
        
            end
	
        close change_list

        deallocate change_list

    end
GO

GO
--SqlScripter----[dbo].[t_u_inv_generalinventory_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[t_u_inv_generalinventory_item]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[t_u_inv_generalinventory_item]')
GO
CREATE TRIGGER [dbo].[t_u_inv_generalinventory_item]
ON inv_generalinventory_item
FOR UPDATE AS

/* Only execute if item_value_text or item_value_double has been updated. */

if update (item_value_text) or update (item_value_double)
    begin
    
        declare @object_uuid binary(16)
	declare @discovery_changes_switch smallint
    
        declare change_list cursor for
          select object_uuid from inserted
           where (item_parent_name_id = 2  and item_name_id = 7 and item_value_double <> item_previous_value_double)
              or (item_parent_name_id = 5  and item_name_id = 17 and item_value_text <> item_previous_value_text)
              or (item_parent_name_id = 31 and item_name_id = 132 and item_value_double <> item_previous_value_double)
       
        open change_list
    
        fetch next from change_list into @object_uuid
    
        while @@fetch_status = 0
            begin
            
                /*  Check whether the discovery_changes_switch for the associated  */
	        /*  ca_discovered_hardware record is already set "on".             */
	        /*  If not, then update it.                                        */ 
	
                select @discovery_changes_switch = 
			(SELECT discovery_changes_switch
			   FROM ca_discovered_hardware
	                  WHERE dis_hw_uuid = @object_uuid)
	                  
	        if @discovery_changes_switch = 0
                    update ca_discovered_hardware
    	               set discovery_changes_switch = 1
                     where dis_hw_uuid = @object_uuid
    
                fetch next from change_list into @object_uuid
            
            end
    	
            close change_list
    
            deallocate change_list
    
    end
GO

GO
--SqlScripter----[dbo].[TD_GLA_AGENTS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TD_GLA_AGENTS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TD_GLA_AGENTS]')
GO
/****** Object:  Trigger dbo.TD_GLA_AGENTS    Script Date: 12/1/2005 11:50:57 PM ******/

CREATE TRIGGER [dbo].[TD_GLA_AGENTS]
ON GLA_AGENTS AFTER DELETE
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_SDAMAPS
   where agent_id = gla_sdamaps.agent_id;
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot DELETE gla_agents because gla_sdamaps exists.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TD_GLA_OBJECTS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TD_GLA_OBJECTS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TD_GLA_OBJECTS]')
GO
/****** Object:  Trigger dbo.TD_GLA_OBJECTS    Script Date: 12/1/2005 11:51:10 PM ******/

CREATE TRIGGER [dbo].[TD_GLA_OBJECTS]
ON GLA_OBJECTS AFTER DELETE 
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_HOURS
   where gla_hours.obj_id = obj_id
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot DELETE gla_objects because gla_hours exists.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TD_GLA_SDAMAPS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TD_GLA_SDAMAPS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TD_GLA_SDAMAPS]')
GO
/****** Object:  Trigger dbo.TD_GLA_SDAMAPS    Script Date: 12/1/2005 11:51:07 PM ******/

CREATE TRIGGER [dbo].[TD_GLA_SDAMAPS]
ON GLA_SDAMAPS AFTER DELETE
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_OBJECTS
   where    
     gla_objects.scan_index = scan_index and
      gla_objects.agent_id = agent_id;
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot DELETE gla_sdamaps because gla_objects exists.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TI_GLA_HOURS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TI_GLA_HOURS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TI_GLA_HOURS]')
GO
/****** Object:  Trigger dbo.TI_GLA_HOURS    Script Date: 12/1/2005 11:51:10 PM ******/


/****************************************************************************************/
/*  Change Control                                                                      */
/*                                                                                      */
/*  Change Date Changes By  Version                                                     */
/*  =========== ==========  =======                                                     */
/*  16-sep-2005 hopst01     Star 14391939 Unicenter DAS triggers 						*/
/*                                                                                      */
/****************************************************************************************/

CREATE TRIGGER [dbo].[TI_GLA_HOURS]
ON GLA_HOURS AFTER INSERT 
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_OBJECTS
   where obj_id = gla_objects.obj_id
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot INSERT gla_hours because gla_objects does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TI_GLA_OBJECTS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TI_GLA_OBJECTS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TI_GLA_OBJECTS]')
GO
/****** Object:  Trigger dbo.TI_GLA_OBJECTS    Script Date: 12/1/2005 11:51:08 PM ******/

CREATE TRIGGER [dbo].[TI_GLA_OBJECTS]
ON GLA_OBJECTS AFTER INSERT 
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_SDAMAPS
   where
        scan_index = gla_sdamaps.scan_index and
        agent_id = gla_sdamaps.agent_id
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot INSERT gla_objects because gla_sdamaps does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TI_GLA_SDAMAPS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TI_GLA_SDAMAPS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TI_GLA_SDAMAPS]')
GO
/****** Object:  Trigger dbo.TI_GLA_SDAMAPS    Script Date: 12/1/2005 11:50:57 PM ******/


CREATE TRIGGER [dbo].[TI_GLA_SDAMAPS]
ON GLA_SDAMAPS AFTER INSERT
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_AGENTS
   where agent_id = gla_agents.agent_id;
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot INSERT gla_sdamaps because gla_agents does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[tng_td_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_class]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_class]')
GO
/****** Object:  Trigger dbo.tng_td_class    Script Date: 12/1/2005 11:50:40 PM ******/

CREATE TRIGGER [dbo].[tng_td_class]
ON tng_class FOR DELETE AS
set nocount on

if not exists (select * from deleted )
    return

  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'D',   name,  0, 		0,  	   0, getdate(),HOST_NAME() 
						 from deleted
  
  return
GO

GO
--SqlScripter----[dbo].[tng_td_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_inclusion]')
GO
/****** Object:  Trigger dbo.tng_td_inclusion    Script Date: 12/1/2005 11:50:40 PM ******/


CREATE TRIGGER [dbo].[tng_td_inclusion]
ON tng_inclusion for delete as
set nocount on

  if not exists ( select * from deleted )
    return
  /*05/28/96*/
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,   object_id2, portnum2,          object_id3 ,timestamp,user_name)
                         select  	   'd', 'Inclusion',  uuid, child_sequence_no,child_uuid,parent_sequence_no, parent_uuid,getdate(),HOST_NAME()
						 from deleted

  return
GO

GO
--SqlScripter----[dbo].[tng_td_jii_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_jii_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_jii_inclusion]')
GO
/****** Object:  Trigger dbo.tng_td_jii_inclusion    Script Date: 12/1/2005 11:50:40 PM ******/


CREATE TRIGGER [dbo].[tng_td_jii_inclusion]
ON tng_Jii_Inclusion for delete as
set nocount on

  if not exists ( select * from deleted )
    return

  insert into tng_change_history ( operation, class_name, object_id1, portnum1, object_id2, timestamp,user_name)
                         select 'd', 'Jii_Inclusion', uuid, parent_sequence_no, parent_uuid, getdate(),HOST_NAME()
			 from deleted

  return
GO

GO
--SqlScripter----[dbo].[tng_td_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_link]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_link]')
GO
/****** Object:  Trigger dbo.tng_td_link    Script Date: 12/1/2005 11:50:41 PM ******/


CREATE TRIGGER [dbo].[tng_td_link]
ON tng_link for delete as
set nocount on

  if not exists (select * from deleted)
    return

  /*05/28/96*/
  insert into tng_change_history ( operation, class_name, object_id1, portnum1, object_id2, portnum2, object_id3,timestamp, source_seq, dest_seq )
                         select  	   'd',   class_name,  uuid,   source_port,source_uuid,dest_port, dest_uuid, getdate(), source_seq, dest_seq
						 from deleted

  /* delete implied links too */
  if not exists (select * from deleted where implied = 0)
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1, object_id2, portnum2, object_id3,timestamp, source_seq, dest_seq )
                         select  'd', l.class_name, l.uuid, l.source_port,l.source_uuid,l.dest_port, l.dest_uuid, getdate(), l.source_seq, l.dest_seq
						 from tng_link l, deleted d where (d.implied = 0 and l.parent_link = d.uuid)

  delete from tng_link from tng_link l, deleted d where (d.implied = 0 and l.parent_link = d.uuid)

  return
GO

GO
--SqlScripter----[dbo].[tng_td_managedobject].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_managedobject]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_managedobject]')
GO
/****** Object:  Trigger dbo.tng_td_managedobject    Script Date: 12/1/2005 11:50:41 PM ******/

CREATE TRIGGER [dbo].[tng_td_managedobject]
ON dbo.tng_managedobject for delete as
set nocount on


  if not exists (select * from deleted )
    return
  
  insert into dbo.tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2, timestamp, user_name )
                         select  	   'd',   class_name,  uuid, 		0,  	   0 , getdate(),Host_Name()
						 from deleted



/* Below two deletes are used to delete the links between the inclusions for that parent*/
delete from dbo.tng_link
	from tng_link a,tng_inclusion b,deleted c
        where (a.source_uuid = b.child_uuid 
		and b.parent_uuid = c.uuid 
		and a.source_seq  = b.child_sequence_no)
		
	delete from dbo.tng_link
		from tng_link a,tng_inclusion b,deleted c
		where (a.dest_uuid = b.child_uuid 
		and b.parent_uuid = c.uuid 
		and a.dest_seq =b.child_sequence_no)


  delete from dbo.tng_inclusion
        where parent_uuid in (select uuid from deleted ) or 
                child_uuid in (select uuid from deleted )

/*1/30/96 since removed tng_dependency table and class Dependency	
  delete from dbo.tng_dependency
        where dependent_uuid in (select uuid from deleted ) or 
              target_uuid    in (select uuid from deleted )
*/
  
/*remove records for corresponding common_ancestor_class along with others*/
  
delete from dbo.tng_link
        where source_uuid in (select uuid from deleted ) or 
                dest_uuid in (select uuid from deleted ) or
		common_ancestor_uuid in (select uuid from deleted)

/* This is exclusively for dynbpv objects. We should remove them from dbpvqueryinfo.*/

delete from dbo.wtdbpvqueryinfo
	where query_name in (select name from deleted)
	if @@error != 0
		RAISERROR ('Deletion from DBPVQueryInfo table failed',16,1)

  return
GO

GO
--SqlScripter----[dbo].[tng_td_popupmenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_td_popupmenu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_td_popupmenu]')
GO
/****** Object:  Trigger dbo.tng_td_popupmenu    Script Date: 12/1/2005 11:50:42 PM ******/

CREATE TRIGGER [dbo].[tng_td_popupmenu]
ON tng_popup_menu 
FOR  DELETE 
AS
BEGIN
select *,'ENU' AS 'Locale'
INTO  ##temp_deleted
from deleted 
	
END
GO

GO
--SqlScripter----[dbo].[tng_ti_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_class]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_class]')
GO
/****** Object:  Trigger dbo.tng_ti_class    Script Date: 12/1/2005 11:50:42 PM ******/


/* Insert trigger when a class is created*/


CREATE TRIGGER [dbo].[tng_ti_class]
ON tng_class FOR INSERT AS
set nocount on
declare @timestamp datetime
  if not exists (select * from inserted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'I',   name,  0, 		0,  	   0, getdate(),HOST_NAME() 
						 from inserted
 
 
  return
GO

GO
--SqlScripter----[dbo].[tng_ti_class_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_class_prop]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_class_prop]')
GO
/****** Object:  Trigger dbo.tng_ti_class_prop    Script Date: 12/1/2005 11:50:57 PM ******/


CREATE TRIGGER [dbo].[tng_ti_class_prop]
ON tng_class_ext FOR INSERT AS
set nocount on
declare @timestamp datetime
  if not exists (select * from inserted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'C',   b.name,  0, 		0,  	   0, getdate(),HOST_NAME()
						 from inserted a, tng_class b
							where a.class_id = b.class_id
GO

GO
--SqlScripter----[dbo].[tng_ti_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[tng_ti_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_inclusion]')
GO
CREATE TRIGGER [dbo].[tng_ti_inclusion]
ON tng_inclusion FOR INSERT AS
set nocount on
declare @uuid UUID

  if not exists ( select * from inserted )
    return

/* 7/29/96
   insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2, timestamp, user_name )
                         select  	   'i', 'Inclusion',  uuid, 		0,  	   0  , getdate(),HOST_NAME()
						 from inserted
*/

  select @uuid=uuid from inserted
  
  if(@uuid is not null)
  begin
    insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2, timestamp,user_name )
				            values (       'i', 'Inclusion',  @uuid, 		0,  	   0  , getdate(),HOST_NAME() )
  end
  
  return
GO

GO
--SqlScripter----[dbo].[tng_ti_jii_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_jii_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_jii_inclusion]')
GO
/****** Object:  Trigger dbo.tng_ti_jii_inclusion    Script Date: 12/1/2005 11:50:43 PM ******/

CREATE TRIGGER [dbo].[tng_ti_jii_inclusion]
ON tng_Jii_Inclusion for insert as
  set nocount on

  declare @uuid                  UUID
  declare @parent_uuid           UUID
  declare @parent_sequence_no    int

  if not exists ( select * from inserted )
    return

  select @parent_sequence_no=null, @parent_uuid=null
  select @uuid=uuid, @parent_sequence_no=parent_sequence_no, @parent_uuid=parent_uuid from inserted
  
  if( @uuid is not null )
    insert into tng_change_history ( operation,      class_name, object_id1, portnum1,  object_id2, portnum2, timestamp,user_name )
                            values (       'i', 'Jii_Inclusion', @uuid, 0, @parent_uuid, @parent_sequence_no, getdate(),HOST_NAME() )
  return
GO

GO
--SqlScripter----[dbo].[tng_ti_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_link]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_link]')
GO
/****** Object:  Trigger dbo.tng_ti_link    Script Date: 12/1/2005 11:50:43 PM ******/


CREATE TRIGGER [dbo].[tng_ti_link]
ON tng_link FOR INSERT AS
set nocount on

  if not exists ( select * from inserted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2, timestamp, user_name )
                         select  	   'i',   class_name,  uuid, 		0,  	   0  	 , getdate(),HOST_NAME()
						 from inserted
  return
GO

GO
--SqlScripter----[dbo].[tng_ti_managedobject].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_managedobject]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_managedobject]')
GO
/****** Object:  Trigger dbo.tng_ti_managedobject    Script Date: 12/1/2005 11:50:43 PM ******/

CREATE TRIGGER [dbo].[tng_ti_managedobject]
ON tng_managedobject FOR INSERT AS
set nocount on
declare @timestamp datetime
declare @Max_Sev int
declare @sev int
declare @prop_sev int

  if not exists (select * from inserted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
            select  	   'i',   class_name,  uuid,0,  0, getdate(), Host_Name()
						 from inserted
  
  select @timestamp=getdate()
  
  select @sev = severity from inserted
  select @prop_sev = propagated_sev from inserted
	if( @sev > @prop_sev)
		select @Max_Sev = @sev
	else
		select @Max_Sev = @prop_sev		

  /*5/2/96 force local time(SQL Server time to install time)*/
  update tng_managedobject set date_ins=@timestamp,weighted_severity = i.weight * i.severity,max_sev =@Max_Sev
	  from inserted i, tng_managedobject m     
  	  where m.uuid=i.uuid and i.date_ins = NULL  /*10/31/96*/



 return
GO

GO
--SqlScripter----[dbo].[tng_ti_popupmenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_popupmenu]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_popupmenu]')
GO
/****** Object:  Trigger dbo.tng_ti_popupmenu    Script Date: 12/1/2005 11:50:44 PM ******/


CREATE TRIGGER [dbo].[tng_ti_popupmenu]
ON tng_popup_menu
FOR  INSERT
AS
declare @rowcount int
IF EXISTS (select * from tempdb..sysobjects
         WHERE name = '##temp_deleted' AND type = 'U')
BEGIN
	select @rowcount = count(*) from inserted a,##temp_deleted b
		where a.label != b.label
		and a.sequence_no = b.sequence_no
	if (@rowcount > 0)
		begin
			update tng_locale_info
				set locale_name = a.label
				from inserted a, tng_locale_info b,##temp_deleted c	
				where b.key_name = c.label
				 and b.property_name = 'label'
				and a.name = c.name
				and a.sequence_no = c.sequence_no
		
				update tng_popup_menu
					set label = a.label
					from ##temp_deleted a, tng_popup_menu b
					where a.sequence_no = b.sequence_no
					and a.name = b.name

		end
END
GO

GO
--SqlScripter----[dbo].[tng_ti_tng_ip_discovery_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_ti_tng_ip_discovery_history]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_ti_tng_ip_discovery_history]')
GO
/****** Object:  Trigger dbo.tng_ti_tng_ip_discovery_history    Script Date: 12/1/2005 11:50:44 PM ******/



CREATE TRIGGER [dbo].[tng_ti_tng_ip_discovery_history]
ON tng_ip_discovery_history FOR INSERT AS
set nocount on
declare @timestamp datetime

  if not exists (select * from inserted )
    return
  
  select @timestamp=getdate()
  
  update tng_ip_discovery_history set date_ins=@timestamp
	  from inserted i, tng_ip_discovery_history h    
  	  where h.object_uuid = i.object_uuid
  
  return
GO

GO
--SqlScripter----[dbo].[tng_trigger_ipsubnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_trigger_ipsubnet]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_trigger_ipsubnet]')
GO
/****** Object:  Trigger dbo.tng_trigger_ipsubnet    Script Date: 12/1/2005 11:51:11 PM ******/
CREATE TRIGGER [dbo].[tng_trigger_ipsubnet]
ON tng_discovery_ipsubnet
FOR UPDATE	
AS
BEGIN
DECLARE	@name           char(20),
	@subnet_addr    binary(4),
	@subnet_mask    binary(4),
	@gateway1       binary(4),
	@gateway2       binary(4),
	@managed        int,
	@uuid1			UUID,
	@uuid2			UUID,
	@uuid3			UUID,
	@uuid4			UUID,
	@uuid5			UUID,
	@uuid6			UUID,
	@call_noniu	int


select @name = t.name, @subnet_addr = t.subnet_addr,
@subnet_mask = t.subnet_mask, @gateway1 = t.gateway1,
@gateway2 = t.gateway2, @managed = t.managed
from
inserted i, deleted d, tng_discovery_ipsubnet t
where 
t.name = i.name and
t.name = d.name

select @uuid1 = convert(binary(16),newid())
select @uuid2 = convert(binary(16),newid())
select @uuid3 = convert(binary(16),newid())
select @uuid4 = convert(binary(16),newid())
select @uuid5 = convert(binary(16),newid())
select @uuid6 = convert(binary(16),newid())

IF @name is NOT NULL
BEGIN
EXEC tng_ca_add_subnet1 @name, @subnet_addr, @subnet_mask, @gateway1, @gateway2,
@managed, @uuid1, @uuid2, @uuid3, @uuid4, @uuid5, @uuid6
END

END
GO

GO
--SqlScripter----[dbo].[tng_tu_class_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_tu_class_instance]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_tu_class_instance]')
GO
/****** Object:  Trigger dbo.tng_tu_class_instance    Script Date: 12/1/2005 11:50:58 PM ******/

CREATE TRIGGER [dbo].[tng_tu_class_instance]
ON tng_property_definition FOR INSERT AS
set nocount on
declare @timestamp datetime
  if not exists (select * from inserted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'U',   b.name,  0, 		0,  	   0, getdate(),HOST_NAME() 
						 from inserted a, tng_class b
							where a.class_id = b.class_id
GO

GO
--SqlScripter----[dbo].[tng_tu_class_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_tu_class_prop]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_tu_class_prop]')
GO
/****** Object:  Trigger dbo.tng_tu_class_prop    Script Date: 12/1/2005 11:50:58 PM ******/
 

CREATE TRIGGER [dbo].[tng_tu_class_prop]
ON tng_class_ext FOR UPDATE AS
set nocount on
declare @timestamp datetime
  if not exists (select * from deleted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'U',   b.name,  0, 		0,  	   0, getdate(),HOST_NAME() 
						 from inserted a, tng_class b
							where a.class_id = b.class_id
GO

GO
--SqlScripter----[dbo].[tng_tu_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_tu_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_tu_inclusion]')
GO
/****** Object:  Trigger dbo.tng_tu_inclusion    Script Date: 12/1/2005 11:50:45 PM ******/


CREATE TRIGGER [dbo].[tng_tu_inclusion]
ON tng_inclusion for update as
set nocount on

  if not exists ( select * from deleted )
    return

  /*create update entry in tng_change_history except update child_sequence_no*/
  if(update(child_uuid) or update(child_class) or update(child_repository) or update(hidden) or 
        update(parent_uuid) or update(parent_class) or update(parent_repository) or
		update(coord_type) or
		update(position_x) or
		update(position_y) or 
		update(position_z) or 
		update(size_cx) or
		update(size_cy) or
		update(size_cz)
    )
    insert into tng_change_history ( operation, class_name, object_id1, portnum1,			portnum2, timestamp,user_name )
                         select  	   'u', 'Inclusion',  uuid, child_sequence_no, parent_sequence_no, getdate(),HOST_NAME()
						 from deleted
  return
GO

GO
--SqlScripter----[dbo].[tng_tu_jii_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_tu_jii_inclusion]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_tu_jii_inclusion]')
GO
/****** Object:  Trigger dbo.tng_tu_jii_inclusion    Script Date: 12/1/2005 11:50:45 PM ******/


CREATE TRIGGER [dbo].[tng_tu_jii_inclusion]
ON tng_Jii_Inclusion for update as
  set nocount on

  if not exists ( select * from deleted )
    return

  insert into tng_change_history ( operation, class_name, object_id1, timestamp,user_name )
                                   select 'u', 'Jii_Inclusion', uuid, getdate(),HOST_NAME()
                                   from   deleted
  return
GO

GO
--SqlScripter----[dbo].[tng_tu_prop_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tng_tu_prop_instance]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tng_tu_prop_instance]')
GO
/****** Object:  Trigger dbo.tng_tu_prop_instance    Script Date: 12/1/2005 11:50:59 PM ******/

CREATE TRIGGER [dbo].[tng_tu_prop_instance]
ON tng_property_definition FOR UPDATE AS
set nocount on
declare @timestamp datetime
  if not exists (select * from deleted )
    return
  insert into tng_change_history ( operation, class_name, object_id1, portnum1,  portnum2,    timestamp,user_name )
                         select  	   'U',   b.name,  0, 		0,  	   0, getdate(),HOST_NAME()
						 from inserted a,tng_class b
							where a.class_id = b.class_id
GO

GO
--SqlScripter----[dbo].[TU_GLA_AGENTS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TU_GLA_AGENTS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TU_GLA_AGENTS]')
GO
/****** Object:  Trigger dbo.TU_GLA_AGENTS    Script Date: 12/1/2005 11:50:59 PM ******/

CREATE TRIGGER [dbo].[TU_GLA_AGENTS]
ON GLA_AGENTS AFTER UPDATE
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_SDAMAPS
   where agent_id = gla_sdamaps.agent_id;
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot UPDATE gla_agents because gla_sdamaps exists.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TU_GLA_HOURS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TU_GLA_HOURS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TU_GLA_HOURS]')
GO
/****** Object:  Trigger dbo.TU_GLA_HOURS    Script Date: 12/1/2005 11:51:11 PM ******/

CREATE TRIGGER [dbo].[TU_GLA_HOURS]
ON GLA_HOURS AFTER UPDATE 
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_OBJECTS
   where obj_id = gla_objects.obj_id
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot INSERT gla_hours because gla_objects does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TU_GLA_OBJECTS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TU_GLA_OBJECTS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TU_GLA_OBJECTS]')
GO
/****** Object:  Trigger dbo.TU_GLA_OBJECTS    Script Date: 12/1/2005 11:51:11 PM ******/

CREATE TRIGGER [dbo].[TU_GLA_OBJECTS]
ON GLA_OBJECTS AFTER UPDATE
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_HOURS
   where gla_hours.obj_id = obj_id
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot UPDATE gla_objects because gla_hours exists.', 16, 1)
END

select @numrows = count(*)
   from gla_sdamaps
   where 
      scan_index = gla_sdamaps.scan_index and
      agent_id = gla_sdamaps.agent_id;
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot UPDATE gla_sdamaps because gla_agents does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[TU_GLA_SDAMAPS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[TU_GLA_SDAMAPS]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[TU_GLA_SDAMAPS]')
GO
/****** Object:  Trigger dbo.TU_GLA_SDAMAPS    Script Date: 12/1/2005 11:51:08 PM ******/


CREATE TRIGGER [dbo].[TU_GLA_SDAMAPS]
ON GLA_AGENTS AFTER UPDATE
AS
declare @numrows INTEGER
select @numrows = count(*)
   from GLA_OBJECTS
   where 
        gla_objects.scan_index = scan_index and
        gla_objects.agent_id = agent_id
IF @numrows > 0
BEGIN
   RAISERROR ('Cannot UPDATE gla_sdamaps because gla_objects exists.', 16, 1)
END

select @numrows = count(*)
   from GLA_AGENTS
   where agent_id = gla_agents.agent_id
IF @numrows = 0
BEGIN
   RAISERROR ('Cannot UPDATE gla_sdamaps because gla_agents does not exist.', 16, 1)
END
GO

GO
--SqlScripter----[dbo].[usd_trg_d_agent_comp_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_trg_d_agent_comp_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_agent_comp_usd_rel]')
GO
/* Start of locks for dependent tables */
 
/* End of lines added to convert to online lock */

/* ********************** 10622 begin  ******************* */
CREATE TRIGGER [dbo].[usd_trg_d_agent_comp_usd_rel]
ON ca_agent_component
for delete as
declare
    @counted int
begin
    -- Does the agent exist?
    set @counted = (select count (*)
    from ca_agent where object_uuid in (select object_uuid from deleted))
    if(@counted = 0)
    begin
	-- It doesn't then just allow this as we are about to remove the whole computer
        return
    end

    set @counted = (select count(*)
    from deleted d, usd_applic app, usd_activity act
    where app.target = d.object_uuid 
    and app.activity = act.objectid
    and (d.agent_comp_id = 40 or d.agent_comp_id = 46))
    if(@counted > 0)
    begin
        rollback transaction
        raiserror('Error 9018: Cannot remove the USD agent component because of Software Delivery jobs', 16, 1 )
	return
    end

    -- else update class version
    update usd_class_version set modify_version = modify_version + 1 where name = 'target'
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_agent_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_trg_d_agent_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_agent_usd_rel]')
GO
/* End of lines added to convert to online lock */
CREATE TRIGGER [dbo].[usd_trg_d_agent_usd_rel]
ON ca_agent
for delete as
declare
    @counted int
begin
    -- Only work with usd agents
    set @counted = (select count(*) from deleted where agent_type = 1 or agent_type = 4) 
    if(@counted = 0)
    begin
	-- No USD agents exit
	return
    end

    -- If we are involved in an active job, raise error
    set @counted = (select count(*)
    from usd_v_nr_of_active_applics aa, deleted d
    where aa.target = d.object_uuid 
    and activity <> 0x00000000000000000000000000000000)
    if(@counted > 0)
    begin
	raiserror('Error 9011: Cannot remove the computer because of active Software Delivery jobs', 16, 1 )
        rollback transaction
	return
    end

    -- Get all the activities related to this computer
            
    -- Store some of the data of the activities involved in the deleted computer(s)
    -- We must store away this as we need to delete applics early on.
    -- If we delete the applics first then we would not find the relevant activities
    select act.objectid, act.actproc into #activity
    from usd_applic a, usd_activity act, deleted d
    where a.activity = act.objectid
    and a.target = d.object_uuid

    set @counted = (select count(*) from #activity)
    if(@counted = 0)
    begin
	-- Not involved in any job only cleanup some objects
    	delete from usd_link_grp_cmp from deleted where comp = object_uuid
    	delete from usd_applic from deleted where target = object_uuid
    	delete from usd_target from deleted where objectid = object_uuid

	update usd_class_version set modify_version = modify_version + 1
	where name = 'link_grp_cmp'
	or name = 'usd_applic'
	or name = 'target'
	return
    end
    
    -- Cleanup 1
    -- Delete the following: usd_link_grp_cmp,usd_target
    -- usd_link_act_cmp,usd_link_jc_srv,usd_link_act_inst
    delete from usd_link_grp_cmp from deleted where comp = object_uuid
    delete from usd_link_act_cmp from deleted where comp = object_uuid
    delete from usd_link_jc_srv from deleted where server = object_uuid
    delete from usd_link_act_inst 
    from deleted d inner join usd_applic a on d.object_uuid = a.target
    where usd_link_act_inst.installation = a.objectid
    delete from usd_target from deleted where objectid = object_uuid

    -- Update the class version
    update usd_class_version set modify_version = modify_version + 1
    where name = 'link_grp_cmp'
    or name = 'link_act_cmp'
    or name = 'link_jc_srv'
    or name = 'link_act_inst'
    or name = 'target'
    
   
    -- We must now remove all the applics of these computer as we need to recalculate counters
    -- Cleanup 2
    delete from usd_applic 
    from deleted 
    where target = object_uuid

    -- Now store the activities from #activity that only targeted the applics deleted above
    -- We only want to keep activites that involve other computers than the ones we deleted.
    -- For these kept activities we need to update counters and masks
    select objectid into #activity_deleted
    from #activity
    where objectid not in (select appl.activity
    from usd_applic appl, #activity act
    where appl.activity = act.objectid)

    -- Remove the unwanted activities        
    delete from #activity
    from #activity_deleted ad
    where #activity.objectid = ad.objectid

    -- Update the class version
    update usd_class_version set modify_version = modify_version + 1 where name = 'applic'

    -- Create a temp table to hold the new counters
    create table #actcount(oid binary(16), totcnt int default 0, waitcnt int default 0, actcnt int default 0, okcnt int default 0, errcnt int default 0,
                      totrencnt int default 0, waitrencnt int default 0, actrencnt int default 0, okrencnt int default 0, errrencnt int default 0)

    -- Be careful understanding how the counterid is used, this table is used for many things
    -- and you must not mix up objects taken from this table.
    create table #interm_count(oid binary(16), cnt int, counterid int)

    -- Insert the tot counters, use the temp table above
    insert into #actcount(oid, totcnt)
    select act.objectid, count(*)
    from usd_applic app, #activity act
    where app.activity = act.objectid
    group by act.objectid

    -- Update the renew tot counters
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*), 1
    from usd_applic appv, #activity act
    where appv.activity = act.objectid
    and renewstatus <> 0
    group by act.objectid

    update #actcount set totrencnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 1

    -- Update the wait counters, use the temp table above and also store 
    -- temp data in a new temp table
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 2
    from usd_v_nr_of_waiting_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid
    
    update #actcount set waitcnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 2

    -- Update the renew wait counters
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 3
    from usd_v_nr_of_renew_wait_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid

    update #actcount set waitrencnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 3

    -- Update the active counters, use the temp table above and also store 
    -- temp data in a new temp table
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 4
    from usd_v_nr_of_active_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid
    
    update #actcount set actcnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 4

    -- Update the renew active counters
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 5
    from usd_v_nr_of_renew_active_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid

    update #actcount set actrencnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 5

    -- Update the ok counters, use the temp table above and also store 
    -- temp data in a new temp table
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 6
    from usd_v_nr_of_ok_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid
    
    update #actcount set okcnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 6

    -- Update the renew ok counters
    insert into #interm_count(oid, cnt, counterid)
    select act.objectid, count(*) cnt, 7
    from usd_v_nr_of_renew_ok_applics appv, #activity act
    where appv.activity = act.objectid
    group by act.objectid

    update #actcount set okrencnt = cnt 
    from #interm_count
    where #actcount.oid = #interm_count.oid and #interm_count.counterid = 7

    -- Update the error counters, use the temp table above
    update #actcount set errcnt = totcnt - waitcnt - actcnt - okcnt
    
    -- Update the renew error counters, use the temp table above

    update #actcount set errrencnt = totrencnt - waitrencnt - actrencnt - okrencnt

    -- Go and do the big update to the real activity table
    update usd_activity set
    waitingcnt = waitcnt,
    activecnt = actcnt,
    okcnt = #actcount.okcnt,
    errorcnt = errcnt,
    waitingrenewcnt = waitrencnt,
    activerenewcnt = actrencnt,
    okrenewcnt = okrencnt,
    errorrenewcnt = errrencnt
    from #actcount
    where objectid = oid

    -- set the new states
    update usd_activity set state = 1 -- INPROGRESS
    from #actcount
    where objectid = oid
    and #actcount.actcnt > 0
    
    update usd_activity set state = 0 -- WAITING
    from #actcount
    where objectid = oid
    and #actcount.actcnt = 0
    and #actcount.waitcnt > 0
    
    update usd_activity set state = 2 -- ACTOK
    from #actcount
    where objectid = oid
    and #actcount.actcnt = 0
    and #actcount.waitcnt = 0
    and #actcount.totcnt = #actcount.okcnt
    and state <> 7
    
    update usd_activity set state = 3 -- ACTERROR
    from #actcount
    where objectid = oid
    and #actcount.actcnt = 0
    and #actcount.waitcnt = 0
    and #actcount.totcnt <> #actcount.okcnt
    and state <> 7

    -- set the new renew states
    update usd_activity set renewstate = 1 -- INPROGRESS
    from #actcount
    where objectid = oid
    and #actcount.actrencnt > 0
    and renewstate <> 8

    update usd_activity set renewstate = 0 -- WAITING
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt > 0
    and renewstate <> 8

    update usd_activity set renewstate = 8 -- NOT_YET_RENEWED
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt = 0
    and #actcount.okrencnt+#actcount.errrencnt+#actcount.actrencnt+#actcount.waitrencnt = 0
    and renewstate <> 8

    update usd_activity set renewstate = 3 --  ACTERROR
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt = 0
    and #actcount.okrencnt+#actcount.errrencnt+#actcount.actrencnt+#actcount.waitrencnt <> 0
    and #actcount.errrencnt > 0
    and renewstate <> 8

    update usd_activity set renewstate = 2 --  ACTOK
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt = 0
    and #actcount.okrencnt+#actcount.errrencnt+#actcount.actrencnt+#actcount.waitrencnt <> 0
    and #actcount.errrencnt = 0
    and #actcount.actcnt = 0
    and #actcount.waitcnt = 0
    and #actcount.totrencnt = #actcount.errcnt
    and renewstate <> 8

    update usd_activity set renewstate = 50 --  ACT_PARTIALLY_RENEWED_OK
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt = 0
    and #actcount.okrencnt+#actcount.errrencnt+#actcount.actrencnt+#actcount.waitrencnt <> 0
    and #actcount.errrencnt = 0
    and #actcount.actcnt = 0
    and #actcount.waitcnt = 0
    and #actcount.totrencnt <> #actcount.errcnt
    and renewstate <> 8

    update usd_activity set renewstate = 50 --  ACT_PARTIALLY_RENEWED_OK
    from #actcount
    where objectid = oid
    and #actcount.actrencnt = 0
    and #actcount.waitrencnt = 0
    and #actcount.okrencnt+#actcount.errrencnt+#actcount.actrencnt+#actcount.waitrencnt <> 0
    and #actcount.errrencnt = 0
    and (#actcount.actcnt <> 0 or #actcount.waitcnt <> 0)
    and renewstate <> 8

    -- now, this can cause the permission mask to change...
    
    -- Set bit SDAPI_JOB_CANCEL_ALLOWED
    update usd_activity set permmask = permmask | 2
    from #activity b
    where usd_activity.objectid = b.objectid
    and state in (0,2,3) -- ACTOK or ACTERROR

    -- Clear bit SDAPI_JOB_CANCEL_ALLOWED
    update usd_activity set permmask = permmask & ~2
    from #activity b
    where usd_activity.objectid = b.objectid
    and state not in (0,2,3) -- WAITING, ACTOK or ACTERROR

    -- Set bit SDAPI_JOB_RESCHEDULE_ALLOWED if activity waiting and no applics exists
    update usd_activity set usd_activity.permmask = usd_activity.permmask | 8
    from #activity b, usd_applic appl
    where usd_activity.objectid = b.objectid
    and usd_activity.state = 0 -- WAITING
    and appl.activity = b.objectid

    -- Clear bit SDAPI_JOB_RESCHEDULE_ALLOWED if activity not waiting
    update usd_activity set permmask = permmask & ~8
    from #activity b
    where usd_activity.objectid = b.objectid
    and usd_activity.state <> 0 -- WAITING

    -- Figure out the recover bit
    
    -- Count the recovery procs for each activity
    
    -- Get the rsw for each activity
    select act.objectid as actoid, rsw.objectid as rswoid into #actrsw
    from #activity act,usd_actproc ap, usd_rsw rsw
    where act.actproc = ap.objectid
    and rsw.objectid = ap.rsw
    
    -- Get the uninst procs for each rsw
    insert into #interm_count(oid, cnt, counterid)
    select rsw.rswoid oid, count(ap.objectid) cnt, 9
    from usd_actproc ap, #actrsw rsw
    where ap.rsw = rsw.rswoid
    and ap.task = 1 -- UNINSTALL
    and (ap.includedproc = 0 or ap.includedproc = 1 or ap.includedproc = 3) -- ADDEDPROC, EMBEDDEDPROC, CONVERTED
    group by rsw.rswoid

    -- Remove the activities where there are no recovery procs        
    delete from #actrsw
    where rswoid not in (select oid from #interm_count where counterid = 9)
    
    -- We now have a list of activites (#actrsw) with recovery procs
    
    -- Let us now see if we are go for recovery, check other existing applics...
    
    -- We should only consider these activities for recovery
    select objectid, activity, actproc, target into #act_valid_for_rec
    from usd_applic
    where(renewstatus = 0 -- UNDEFINED
    or renewstatus = 10) -- EXECUTION_ERROR
    and actproc <> 0x00000000000000000000000000000000
    and status = 10
    and task = 0x00000001
    and errorcause in (228001, 228002, 228003, 228004, 228005)
    and objectid in (select
        case
        when AP.firstrenew <> 0x00000000000000000000000000000000 then AP.firstrenew
        else AP.objectid
        end as objid
        from usd_applic AP, #activity ACT
        where AP.activity = ACT.objectid)
        
    -- Get rid of activities that have no recovery procs
    delete from #act_valid_for_rec
    where #act_valid_for_rec.activity not in (select #actrsw.actoid from #actrsw)

    -- Are there any other activites that (using the same proc and targeting the same comp)
    -- have succeeded applics?
    select AP.objectid, AP.activity, AP.target, AP.actproc into #act_not_valid_for_rec
    from usd_applic AP, #act_valid_for_rec AVFR
    where AP.target = AVFR.target
    and AP.actproc = AVFR.actproc
    and (
    /* task=install and status!=execution_error and status!=already_installed and status!=manipulation_not_allowed */
    (AP.task = 0x01 and AP.status != 10 and AP.status != 15 and AP.status != 16) or
    /* task=deliver and status!=delivery_error and status!=already_delivered */
    (AP.task = 0x10 and AP.status != 5 and AP.status != 6)
    )
    /* not uninstalled */
    and AP.uninstallstate <> 2
    and (AP.status = 9 or AP.status = 4)
    
    -- Get rid of them
    delete from #act_valid_for_rec
    from #act_not_valid_for_rec
    where #act_valid_for_rec.target = #act_not_valid_for_rec.target
    and #act_valid_for_rec.actproc = #act_not_valid_for_rec.actproc
    
    -- Last a check if there are any ongoing uninstalls
    select a.installation into #ongoing_uninstall_appl
    from usd_applic a, #act_valid_for_rec avfr
    where installation = avfr.objectid
    and  a.installation <> a.objectid /* do not read myself */
    and a.task = 0x02 -- UNINSTALL
    and status <> 10 -- EXECUTION_ERROR
    and status <> 5 -- DELIVERY_ERROR

    -- Get rid of them
    delete from #act_valid_for_rec
    from #ongoing_uninstall_appl
    where #act_valid_for_rec.objectid = #ongoing_uninstall_appl.installation

    -- Set bit SDAPI_JOB_RECOVER_ALLOWED
    update usd_activity set permmask = permmask | 4
    from #act_valid_for_rec avfr
    where usd_activity.objectid = avfr.activity
    and state in (3,1) -- ACTERROR or INPROGRESS

    -- Clear bit SDAPI_JOB_RECOVER_ALLOWED 1
    update usd_activity set permmask = permmask & ~4
    from #act_valid_for_rec avfr
    where usd_activity.objectid = avfr.activity
    and state not in (3,1) -- ACTERROR or INPROGRESS

    -- Clear bit SDAPI_JOB_RECOVER_ALLOWED 2
    update usd_activity set permmask = permmask & ~4
    from #activity
    where #activity.objectid not in (select activity from #act_valid_for_rec)
    and usd_activity.objectid = #activity.objectid

    -- Do the update, it is also time to update the version number
    -- This may be too much, can optimize it?
    update usd_activity set version = version + 1
    from #activity
    where usd_activity.objectid = #activity.objectid
    
    -- Time to delete objects...#activity_deleted
    -- Cleanup 3
    delete from usd_activity from #activity_deleted ad where usd_activity.objectid = ad.objectid
    delete from usd_link_jc_act from #activity_deleted ad where activity = ad.objectid

    -- Update the class versions
    update usd_class_version set modify_version = modify_version + 1 where name = 'link_jc_act'
    update usd_class_version set modify_version = modify_version + 1 where name = 'activity'

    -- Activities DONE!
    
    -- Get all the job container views related to this computer
    select distinct JCV.objectid as jcvoid, JC.objectid as jcoid into #jcview_jc
    from usd_jcappgr APG, usd_jcview JCV, usd_job_cont JC, deleted d
    where APG.jobtarget = d.object_uuid
    and APG.jobcontview = JCV.objectid
    and JC.objectid = JCV.jobcont

    -- We must now remove all the jcappgr of this computer as we need to recalculate
    
    -- Cleanup 4
    delete from usd_jcappgr from deleted where jobtarget = object_uuid
    -- Update the class version
    update usd_class_version set modify_version = modify_version + 1 where name = 'jcappgr'
    
    -- Now remove the jcviews from #jcview_jc that only targeted the jcappgr deleted above
    -- We only want to keep jcviews that involve other computers than the ones we deleted.
    -- For these kept jcviews we need to update counters
    select jcvoid, jcoid into #jcview_jc_deleted
    from #jcview_jc 
    where jcvoid not in (select japg.jobcontview
     			 from usd_jcappgr japg, #jcview_jc jv
        		 where japg.jobcontview = jv.jcvoid)
        
    -- Remove the unwanted jcviews
    delete from #jcview_jc
    from #jcview_jc_deleted jjd
    where #jcview_jc.jcvoid = jjd.jcvoid

    -- Update class version
    update usd_class_version set modify_version = modify_version + 1 where name = 'jcappgr'
    
    -- Create a temp table to hold the new counters
    create table #jcvcount(jcvoid binary(16), waitcnt int default 0, actcnt int default 0, okcnt int default 0, errcnt int default 0,
                                waitrencnt int default 0, actrencnt int default 0, okrencnt int default 0, errrencnt int default 0)

    -- Insert all the objects to count for the views
    insert into #jcvcount(jcvoid)
    select distinct jcv.jcvoid
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid

    -- Update the counters for the view (JOBWAITING)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 17
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and jobstatus = 0
    group by jcv.jcvoid

    update #jcvcount set waitcnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 17

    -- Update the counters for the view (JOBACTIVE)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 10
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and jobstatus = 1
    group by jcv.jcvoid

    update #jcvcount set actcnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 10

    -- Update the counters for the view (JOBOK)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 11
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and jobstatus = 2
    group by jcv.jcvoid

    update #jcvcount set okcnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 11

    -- Update the counters for the view (JOBERROR)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 12
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and jobstatus = 3
    group by jcv.jcvoid

    update #jcvcount set errcnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 12

    -- Update the counters for the view (JOBWAITING RENEWED)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 13
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and renewedjobstatus = 0
    group by jcv.jcvoid

    update #jcvcount set waitrencnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 13

    -- Update the counters for the view (JOBACTIVE RENEWED)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 14
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and renewedjobstatus = 1
    group by jcv.jcvoid

    update #jcvcount set actrencnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 14

    -- Update the counters for the view (JOBOK RENEWED)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 15
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and renewedjobstatus = 2
    group by jcv.jcvoid

    update #jcvcount set okrencnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 15

    -- Update the counters for the view (JOBERROR RENEWED)
    insert into #interm_count(oid, cnt, counterid)
    select jcv.jcvoid, count(*) cnt, 16
    from usd_jcappgr jcap, #jcview_jc jcv
    where jcap.jobcontview = jcv.jcvoid
    and renewedjobstatus = 3
    group by jcv.jcvoid

    update #jcvcount set errrencnt = cnt 
    from #interm_count
    where #jcvcount.jcvoid = #interm_count.oid and #interm_count.counterid = 16

    -- Go and do the big update to the real jcview table
    update usd_jcview set
    waitingcnt = waitcnt,
    activecnt = actcnt,
    okcnt = #jcvcount.okcnt,
    errorcnt = errcnt,
    waitingrenewcnt = waitrencnt,
    activerenewcnt = actrencnt,
    okrenewcnt = okrencnt,
    errorrenewcnt = errrencnt
    from #jcvcount
    where objectid = jcvoid
    
    -- Cleanup 5
    -- Delete usd_jcview,usd_job_cont,usd_link_jc
    delete from usd_jcview from #jcview_jc_deleted where objectid = jcvoid
    delete from usd_link_jc from #jcview_jc_deleted where jcparent = jcoid
    delete from usd_link_jc from #jcview_jc_deleted where jcchild = jcoid
    delete from usd_job_cont from #jcview_jc_deleted where objectid = jcoid
    -- Update the class version
    update usd_class_version set modify_version = modify_version + 1
    where name = 'link_jc'
    or name = 'job_cont'
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_ca_agent_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_trg_d_ca_agent_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_ca_agent_tbl_ver]')
GO
CREATE TRIGGER [dbo].[usd_trg_d_ca_agent_tbl_ver]
ON ca_agent
for delete as
declare
	@agent_type int
begin
	set @agent_type = (select top 1 agent_type from inserted)
	exec usd_proc_u_tbl_ver 0, -1, @agent_type, 40
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_ca_group_def_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_ca_group_def_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_ca_group_def_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_d_ca_group_def_tbl_ver    Script Date: 12/1/2005 11:51:55 PM ******/
/* Rule on ca_group_def, on delete change USD table version */
CREATE TRIGGER [dbo].[usd_trg_d_ca_group_def_tbl_ver]
ON ca_group_def
for delete as 
declare
    @i_member_type int
begin
        set @i_member_type = (select top 1 member_type from deleted)
        exec usd_proc_u_tbl_ver 1, @i_member_type, -1, -1
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_ca_man_comp_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_ca_man_comp_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_ca_man_comp_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_d_ca_man_comp_tbl_ver    Script Date: 12/1/2005 11:51:00 PM ******/
/* Rule on ca_manager_component, on insert, update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_d_ca_man_comp_tbl_ver]
ON ca_manager_component
for delete as
begin
    exec usd_proc_u_tbl_ver 2, -1, -1, -1
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_ca_manger_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_ca_manger_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_ca_manger_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_d_ca_manger_tbl_ver    Script Date: 12/1/2005 11:51:00 PM ******/
/* Rule on ca_manager, on delete change USD table version */
CREATE TRIGGER [dbo].[usd_trg_d_ca_manger_tbl_ver]
ON ca_manager
for delete as 
begin
    exec usd_proc_u_tbl_ver 2, -1, -1, -1
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_ca_n_tier_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_ca_n_tier_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_ca_n_tier_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_d_ca_n_tier_tbl_ver    Script Date: 12/1/2005 11:51:55 PM ******/
/* Rule on ca_n_tier, on insert, update, delete change USD table version */
CREATE TRIGGER [dbo].[usd_trg_d_ca_n_tier_tbl_ver]
ON ca_n_tier
for delete as 
begin
    exec usd_proc_u_tbl_ver 2, -1, -1, -1
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_domain_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_domain_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_domain_usd_rel]')
GO
/****** Object:  Trigger dbo.usd_trg_d_domain_usd_rel    Script Date: 12/1/2005 11:51:55 PM ******/
CREATE TRIGGER [dbo].[usd_trg_d_domain_usd_rel]
ON ca_n_tier
for delete as
begin
    -- A check will be made by the CO API before starting to unlink the domain, so do not do it here
    --select count(objectid) from usd_cc where boundto = <domain_uuid>

    -- Go ahead and delete

    -- Delete distributed procedure and software template to the local domain object
    delete from usd_distap
    from usd_distsw dsw, deleted d
    where dsw.localsite = d.domain_uuid
    and distsw = dsw.objectid
   
    delete from usd_distsw 
    from deleted d
    where localsite = d.domain_uuid
    
    delete from usd_disttempl
    from deleted d
    where domain = d.domain_uuid

    -- Delete fetch item orders and fetched items from domain object
    delete from usd_fio
    from usd_fitem fi, deleted d
    where fi.localsite = d.domain_uuid
    and usd_fio.objectid = fi.fio

    delete from usd_fitem 
    from deleted d
    where localsite = d.domain_uuid

    /* Delete relation from carrier to domain object (local domain) */
    update usd_carrier set version = version + 1,
    boundto = 0x00000000000000000000000000000000
    from deleted d
    where boundto = d.domain_uuid

    /* Make sure we update the class version for the above operations */
    update usd_class_version set modify_version = modify_version + 1
    where name = 'distap'
    or name = 'distsw'
    or name = 'disttempl'
    or name = 'fio'
    or name = 'fitem'
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_group_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_group_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_group_usd_rel]')
GO
/****** Object:  Trigger dbo.usd_trg_d_group_usd_rel    Script Date: 12/1/2005 11:51:56 PM ******/
CREATE TRIGGER [dbo].[usd_trg_d_group_usd_rel]
ON ca_group_def 
for delete as
declare
    @countedTempl integer,
    @myDomainUuid binary(16)
begin
    -- Check templates

    -- Check if the group about to be deleted is a replicated group
    -- If it is then go ahead and unseal and allow the deletion of the group
    -- If not check if it is linked to a sealed template, if it is
    -- then raise error, that will then result in a warning message to the user
    set @myDomainUuid  = (select set_val_uuid from ca_settings where set_id = 1)
    set @countedTempl = (select count(*)
    from usd_job_cont jc, deleted d
    where jc.qtemplfold = d.group_uuid 
    and seal = 1
    and d.domain_uuid = @myDomainUuid)
    if(@countedTempl > 0)
    begin
        -- This is a local group, raise error
	raiserror('Error 9012: Cannot remove the group because it is linked to a sealed Software Policy', 16, 1 )
        rollback transaction
	return
    end
    else
    begin
        -- Delete relation from catalog folder(s) to asset groups
        update usd_swfold set auxtext2 = '',
        aux = 0x00000000000000000000000000000000,
        version = version + 1
        from deleted d
        where aux = d.group_uuid

        -- Delete relation from job container (template) to asset groups and unseal it
        update usd_job_cont set auxtext2 = '',
        qtemplfold = 0x00000000000000000000000000000000,
        seal = 0,
        version = version + 1
        from deleted d
        where qtemplfold = d.group_uuid

        -- Delete relation from usd_link_act_grp (target groups) to asset groups
        delete from usd_link_act_grp 
        from deleted d
        where grp = d.group_uuid

        -- Make sure we update the class version for the above operations
        update usd_class_version set modify_version = modify_version + 1
        where name = 'swfold'
        or name = 'job_cont'
        or name = 'link_act_grp'
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_query_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_query_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_query_usd_rel]')
GO
/****** Object:  Trigger dbo.usd_trg_d_query_usd_rel    Script Date: 12/1/2005 11:50:46 PM ******/
CREATE TRIGGER [dbo].[usd_trg_d_query_usd_rel]
ON ca_query_def
for delete as
begin
    /* Go ahead and delete */

    /* Delete relation from Procedure to query def object */
    update usd_actproc set version = version + 1,
    query = 0x00000000000000000000000000000000
    from deleted d
    where query = d.query_uuid

    /* Make sure we update the class version for the above operations */
    update usd_class_version set modify_version = modify_version + 1
    where name = 'actproc'
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_swdef_usd_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_swdef_usd_rel]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_swdef_usd_rel]')
GO
/****** Object:  Trigger dbo.usd_trg_d_swdef_usd_rel    Script Date: 12/1/2005 11:51:56 PM ******/
CREATE TRIGGER [dbo].[usd_trg_d_swdef_usd_rel]
ON ca_software_def
for delete as
begin
    /* Go ahead and delete */

    /* Delete relation from Software to software def object */
    update usd_rsw set version = version + 1,
    software_def = 0x00000000000000000000000000000000 
    from deleted d
    where software_def = d.sw_def_uuid
end
GO

GO
--SqlScripter----[dbo].[usd_trg_d_target_ag_comp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_d_target_ag_comp]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_d_target_ag_comp]')
GO
/****** Object:  Trigger dbo.usd_trg_d_target_ag_comp    Script Date: 12/1/2005 11:50:47 PM ******/
CREATE TRIGGER [dbo].[usd_trg_d_target_ag_comp]
ON usd_target
for delete as
begin
    /* Delete agent components */
    delete from ca_agent_component
    from deleted d
    where object_uuid = d.objectid 
    and (agent_comp_id = 40 or agent_comp_id = 46)
end
GO

GO
--SqlScripter----[dbo].[usd_trg_i_new_usd_target].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_i_new_usd_target]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_i_new_usd_target]')
GO
/****** Object:  Trigger dbo.usd_trg_i_new_usd_target    Script Date: 12/1/2005 11:50:47 PM ******/
CREATE TRIGGER [dbo].[usd_trg_i_new_usd_target]
ON ca_agent_component
for insert as
declare
    @tcount int
begin
    /* The USD component may have been temporarily removed, that is */
    /* why the target may still exist */

    /* Optimize */
    if(@@ROWCOUNT = 1)
    begin
    	set @tcount = (select count(*) from inserted where (agent_comp_id = 40 or agent_comp_id = 46))
	    if (@tcount > 0)
	    begin
            set @tcount = (select count(*) from usd_target where objectid = (select object_uuid from inserted where (agent_comp_id = 40 or agent_comp_id = 46)))
	        if (@tcount = 0)
	        begin
                /* Insert the new row, we know there is only one */
	            insert into usd_target(objectid, calendar, download_method)
                select object_uuid, '', 0 
	            from inserted
		        where (agent_comp_id = 40 or agent_comp_id = 46)

	            /* Make sure we update the class version for the above operations */
                update usd_class_version set modify_version = modify_version + 1
	            where name = 'target'
	        end
        end
    end
    else
    begin
        /* Handle multirow */
        insert into usd_target(objectid, calendar, download_method)
        select object_uuid, '', 0 
        from inserted
        where (agent_comp_id = 40 or agent_comp_id = 46)
        and object_uuid not in (select objectid from usd_target)

        /* Make sure we update the class version for the above operations */
        update usd_class_version set modify_version = modify_version + 1
        where name = 'target'
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_ag_comp_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_ag_comp_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_ag_comp_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_ag_comp_tbl_ver    Script Date: 12/1/2005 11:51:00 PM ******/
/* Rule on ca_agent_component, on insert, update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_ag_comp_tbl_ver]
ON ca_agent_component
for insert, update as
declare
    @i_comp_id int
begin
    if update(agent_component_version)
    begin
        set @i_comp_id = (select top 1 agent_comp_id from inserted)
        exec usd_proc_u_tbl_ver 0, -1, -1, @i_comp_id
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_agent_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_agent_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_agent_tbl_ver]')
GO
CREATE TRIGGER [dbo].[usd_trg_u_ca_agent_tbl_ver]
ON ca_agent
for update as
declare
	@agent_type int
begin
    if update(creation_user) or update(agent_name) or update(ip_address) or update(creation_date) or update(last_run_date) or update(registration_type) or update(agent_type) or update(proc_os_id) or update(description) or update(prev_manager) or update(agent_ref_count)
    begin
	set @agent_type = (select top 1 agent_type from inserted)
        exec usd_proc_u_tbl_ver 0, -1, @agent_type, 40
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_dis_hw_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_dis_hw_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_dis_hw_tbl_ver]')
GO
/* Start of locks for dependent tables */

/* End of lines added to convert to online lock */

/* ************************** 11682 begin  **************/

CREATE TRIGGER [dbo].[usd_trg_u_ca_dis_hw_tbl_ver]
ON ca_discovered_hardware
for update as
begin
    if update(primary_network_address) or update(host_uuid)
    begin
        exec usd_proc_u_tbl_ver 0, -1, 1, 40
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_group_def_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_group_def_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_group_def_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_group_def_tbl_ver    Script Date: 12/1/2005 11:51:57 PM ******/
/* Rule on ca_group_def, on update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_group_def_tbl_ver]
ON ca_group_def
for insert, update as 
declare
    @i_member_type int
begin
    if update(version_number) or update(creation_user) or update(evaluation_uuid) or update(label) or update(description) or update(creation_date) or update(last_update_date) or update(eval_freq) or update(last_eval_date_time) or update(query_uuid) or update(evaluation_location) or update(group_flag) or update(group_system)
    begin
        set @i_member_type = (select top 1 member_type from inserted)
        exec usd_proc_u_tbl_ver 1, @i_member_type, -1, -1
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_grp_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_grp_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_grp_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_grp_tbl_ver    Script Date: 12/1/2005 11:51:58 PM ******/
/* Rule on ca_agent, on insert change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_grp_tbl_ver]
ON ca_group_member
for insert as
declare
    @i_member_type int
begin
    set @i_member_type = (select top 1 member_type from inserted)
    exec usd_proc_u_tbl_ver 3, -1, @i_member_type, -1
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_man_comp_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_man_comp_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_man_comp_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_man_comp_tbl_ver    Script Date: 12/1/2005 11:51:01 PM ******/
/* Rule on ca_manager_component, on insert, update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_man_comp_tbl_ver]
ON ca_manager_component
for insert, update as
begin
    if update(manager_comp_version)
    begin
        exec usd_proc_u_tbl_ver 2, -1, -1, -1
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_manger_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_manger_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_manger_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_manger_tbl_ver    Script Date: 12/1/2005 11:51:01 PM ******/
/* Rule on ca_manager, on insert, update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_manger_tbl_ver]
ON ca_manager
for insert, update as 
begin
    if (update(host_name) or update(host_uuid))
    begin
        exec usd_proc_u_tbl_ver 2, -1, -1, -1
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_n_tier_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_n_tier_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_n_tier_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_n_tier_tbl_ver    Script Date: 12/1/2005 11:51:58 PM ******/
/* Rule on ca_n_tier, on insert, update, delete change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_n_tier_tbl_ver]
ON ca_n_tier
for insert, update as 
begin
    if (update(version_number) or update(creation_user) or update(label) or update(contact_information) or update(creation_date) or update(last_update_date) or update(description))
    begin
        exec usd_proc_u_tbl_ver 2, -1, -1, -1
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_ca_server_tbl_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_ca_server_tbl_ver]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_ca_server_tbl_ver]')
GO
/****** Object:  Trigger dbo.usd_trg_u_ca_server_tbl_ver    Script Date: 12/1/2005 11:51:58 PM ******/
/* Rule on ca_server, on update change USD table version */
CREATE TRIGGER [dbo].[usd_trg_u_ca_server_tbl_ver]
ON ca_server
for update as
begin
    if update(label) or update(dis_hw_uuid)
    begin
        exec usd_proc_u_tbl_ver 0, -1, -1, 40
    end
end
GO

GO
--SqlScripter----[dbo].[usd_trg_u_usd_target_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[usd_trg_u_usd_target_status]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[usd_trg_u_usd_target_status]')
GO
/****** Object:  Trigger dbo.usd_trg_u_usd_target_status    Script Date: 12/1/2005 11:51:59 PM ******/

CREATE TRIGGER [dbo].[usd_trg_u_usd_target_status]
ON usd_target
for update as
begin
    if update(locks)
    begin
        /* Remove some bits that we do not want */
        update ca_agent set derived_status_sd = locks & 0x87
        from inserted
        where object_uuid = inserted.objectid
    end
end
GO
