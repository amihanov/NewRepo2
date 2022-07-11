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
