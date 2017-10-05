USE [projectmangementtools]
GO
/****** Object:  StoredProcedure [dbo].[editcontactperson]    Script Date: 08/01/2017 15:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[editcontactperson]
(
  @rowid int, 
  @customer_id varchar(30),
  @name varchar(50),
  @mail varchar(50),
  @phone1 numeric(18,0),
  @phone2 numeric(18,0)
)
AS
IF EXISTS(SELECT 'True' FROM customercode_contactperson_mapping WHERE id = @rowid) 
BEGIN
  --This means it exists, return it to ASP and tell us
UPDATE customercode_contactperson_mapping SET customer_id=@customer_id,person_name=@name,contact_number1=@phone1,contact_number2=@phone2,contact_mail=@mail where id=@rowid;
END
ELSE 
BEGIN
  --This means the record isn't in there already, let's go ahead and add it
  
  INSERT into customercode_contactperson_mapping(customer_id,person_name,contact_number1,contact_number2,contact_mail) VALUES(@customer_id, @name,@phone1,@phone2,@mail);
END