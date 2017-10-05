USE [projectmangementtools]
GO
/****** Object:  StoredProcedure [dbo].[editcontactperson]    Script Date: 08/01/2017 15:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[resetpassword]
(
 
  @emp_code varchar(30),
  @reset_code varchar(50),
 
AS
IF EXISTS(SELECT 'True' FROM password_reset WHERE emp_code= @emp_code) 
BEGIN
  --This means it exists, return it to ASP and tell us
UPDATE password_reset SET reset_code=@reset_code where emp_code= @emp_code;
END
ELSE 
BEGIN
  --This means the record isn't in there already, let's go ahead and add it
  
  INSERT into password_reset(emp_code,reset_code) VALUES(@emp_code, @reset_code);
END