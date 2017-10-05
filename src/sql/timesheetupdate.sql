USE [projectmangementtools]
GO
/****** Object:  StoredProcedure [dbo].[editcontactperson]    Script Date: 08/01/2017 15:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[timesheetupdate]
(
 @rowid int, 
 @emp_code varchar(30), 
  @emp_name varchar(50),
  @project_code varchar(30),
  @date date,
  @start_time varchar(10),
   @end_time varchar(10),
  @day_hours varchar(10),
    @total_hours varchar(10),
      @seq_no int,
        @activity varchar(30),
          @approved_status varchar(30),
            @work_description varchar(1000)
)
AS
IF EXISTS(SELECT 'True' FROM time_sheet WHERE id = @rowid) 
BEGIN
  --This means it exists, return it to ASP and tell us
  PRINT @rowid;
UPDATE time_sheet SET  emp_code=@emp_code,emp_name=@emp_name,project_code=@project_code,date=@date,start_time=@start_time,end_time=@end_time,day_total_hours=@day_hours,total_hours=@total_hours,sequence_no=@seq_no,acitivity=@activity, approved_status= @approved_status,work_description= @work_description where id=@rowid;
END
ELSE 
BEGIN
  --This means the record isn't in there already, let's go ahead and add it
  PRINT @rowid;
  INSERT into time_sheet(emp_code,emp_name,project_code,date,start_time,end_time,day_total_hours,total_hours,sequence_no,acitivity, approved_status,work_description) VALUES(@emp_code,@emp_name,@project_code,@date,@start_time,@end_time,@day_hours,@total_hours,@seq_no,@activity,@approved_status,@work_description);
END