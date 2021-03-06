USE [projectmangementtools]
GO
/****** Object:  StoredProcedure [dbo].[editcontactperson]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editcontactperson]
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

GO
/****** Object:  StoredProcedure [dbo].[resetpassword]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[resetpassword]
(
 
  @emp_code varchar(30),
  @reset_code int
 )
AS
IF EXISTS(SELECT 'True' FROM password_reset WHERE emp_code=@emp_code) 
BEGIN
  --This means it exists, return it to ASP and tell us
UPDATE password_reset SET reset_code=@reset_code where emp_code= @emp_code;
END
ELSE 
BEGIN
  --This means the record isn't in there already, let's go ahead and add it
  
  INSERT into password_reset(emp_code,reset_code) VALUES(@emp_code, @reset_code);
END

GO
/****** Object:  StoredProcedure [dbo].[timesheetupdate]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[timesheetupdate]
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
UPDATE time_sheet SET  emp_code=@emp_code,emp_name=@emp_name,project_code=@project_code,date=@date,start_time=@start_time,end_time=@end_time,day_total_hours=@day_hours,total_hours=@total_hours,sequence_no=@seq_no,acitivity=@activity, approved_status= @approved_status,work_description= @work_description where id=@rowid;
END
ELSE 
BEGIN
  --This means the record isn't in there already, let's go ahead and add it
  
  INSERT into time_sheet(emp_code,emp_name,project_code,date,start_time,end_time,day_total_hours,total_hours,sequence_no,acitivity, approved_status,work_description) VALUES(@emp_code,@emp_name,@project_code,@date,@start_time,@end_time,@day_hours,@total_hours,@seq_no,@activity,@approved_status,@work_description);
END

GO
/****** Object:  Table [dbo].[activity_table]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_table](
	[id] [int] NOT NULL,
	[activity] [nvarchar](100) NOT NULL,
	[codeid] [nvarchar](30) NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [date] NULL,
	[updated_by] [nvarchar](50) NULL,
	[updated_date] [date] NULL,
	[remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_activity_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [varchar](30) NOT NULL,
	[AddressType] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[DoorNo] [varchar](10) NULL,
	[Street1] [varchar](200) NULL,
	[street2] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Pincode] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](30) NULL,
	[UpdatedDate] [date] NULL,
	[UpdatedBy] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_portfolio_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_portfolio_details](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_code] [varchar](30) NOT NULL,
	[company_name] [varchar](200) NOT NULL,
	[contact_person] [varchar](50) NULL,
	[contact_phone1] [numeric](18, 0) NULL,
	[area_code] [varchar](10) NULL,
	[contact_phone2] [numeric](18, 0) NULL,
	[website_name] [varchar](50) NULL,
	[customer_mail] [varchar](50) NULL,
	[customer_door] [varchar](50) NULL,
	[customer_street1] [varchar](50) NULL,
	[customer_street2] [varchar](50) NULL,
	[customer_city] [varchar](50) NULL,
	[customer_state] [varchar](50) NULL,
	[customer_country] [varchar](50) NULL,
	[customer_zipcode] [varchar](20) NULL,
	[created_date] [date] NULL,
	[create_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
	[customer_type] [nvarchar](50) NULL,
 CONSTRAINT [PK__customer__CD65CB851367E606] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customercode_contactperson_mapping]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customercode_contactperson_mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_code] [varchar](50) NULL,
	[customer_id] [int] NOT NULL,
	[person_name] [varchar](50) NOT NULL,
	[contact_number1] [numeric](18, 0) NULL,
	[contact_number2] [numeric](18, 0) NULL,
	[contact_mail] [varchar](50) NULL,
	[status] [int] NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](50) NULL,
	[update_date] [date] NULL,
	[updated_by] [varchar](50) NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK_customercode_contactperson_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customercontactperson_project_mapping]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customercontactperson_project_mapping](
	[int] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[contact_person_id] [int] NULL,
	[status] [int] NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](50) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](50) NULL,
	[remark] [varchar](2000) NULL,
 CONSTRAINT [PK_customercontactperson_project_mapping] PRIMARY KEY CLUSTERED 
(
	[int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](30) NOT NULL,
	[Departmentname] [varchar](250) NOT NULL,
	[CreatedDate] [date] NULL,
	[Createdby] [varchar](100) NULL,
	[Updateddate] [date] NULL,
	[Updatedby] [varchar](100) NULL,
	[Effectivedate] [date] NULL,
	[EffectiveStatus] [varchar](50) NOT NULL,
	[Timestamp] [timestamp] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationCode] [varchar](50) NOT NULL,
	[DesignationName] [varchar](200) NOT NULL,
	[Createddate] [date] NOT NULL,
	[Createdby] [varchar](100) NULL,
	[Effectivedate] [date] NOT NULL,
	[Effectivestatus] [varchar](30) NOT NULL,
	[updateddate] [date] NULL,
	[updatedby] [varchar](100) NULL,
	[Timestamp] [timestamp] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EducationDetails]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EducationDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [varchar](30) NOT NULL,
	[Graduation] [varchar](20) NULL,
	[Degree] [varchar](50) NULL,
	[BoardOrUniversity] [varchar](100) NULL,
	[Institution] [varchar](100) NULL,
	[Specialization] [varchar](100) NULL,
	[YearPassed] [date] NULL,
	[MediumOfEducation] [varchar](20) NULL,
	[PercentageOfMarks] [decimal](4, 2) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](30) NULL,
	[UpdatedDate] [date] NULL,
	[UpdatedBy] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [varchar](30) NOT NULL,
	[first_name] [varchar](30) NULL,
	[last_name] [varchar](30) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[conatct_no1] [numeric](18, 0) NULL,
	[mail] [varchar](100) NULL,
	[location] [varchar](30) NULL,
	[designation] [varchar](30) NULL,
	[created_date] [date] NULL,
	[create_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK__employee__3213E83F1A14E395] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeProfile]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobReferenceNumber] [varchar](30) NULL,
	[Hire] [varchar](30) NULL,
	[Reason] [varchar](max) NULL,
	[EmpId] [varchar](30) NULL,
	[FirstName] [varchar](20) NULL,
	[MiddleName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[DateOfJoining] [date] NULL,
	[Company] [varchar](100) NULL,
	[Location] [varchar](30) NULL,
	[Department] [varchar](30) NULL,
	[Designation] [varchar](30) NULL,
	[Grade] [varchar](20) NULL,
	[Salary] [decimal](12, 2) NULL,
	[PayGroup] [varchar](20) NULL,
	[DOB] [date] NULL,
	[Gender] [varchar](20) NULL,
	[EmailId] [varchar](100) NULL,
	[EffectiveDate] [date] NULL,
	[EffectiveStatus] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](30) NULL,
	[UpdatedDate] [date] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[Timestamp] [timestamp] NULL,
	[Manager] [varchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login_details](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[emp_id] [varchar](30) NOT NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK__login_de__B9BE370F462B2AD3] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_table_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_table_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](30) NULL,
	[item] [varchar](30) NULL,
	[item_description] [varchar](30) NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[password_reset]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[password_reset](
	[row] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [varchar](30) NOT NULL,
	[reset_code] [int] NOT NULL,
	[status] [varchar](100) NULL,
 CONSTRAINT [PK_passwor_reset] PRIMARY KEY CLUSTERED 
(
	[row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_code] [varchar](30) NOT NULL,
	[project_name] [varchar](50) NOT NULL,
	[project_description] [varchar](200) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[center] [varchar](50) NULL,
	[location] [varchar](50) NULL,
	[contract_type] [varchar](50) NULL,
	[project_status] [varchar](50) NULL,
	[technology] [varchar](200) NULL,
	[customer_portfolio] [varchar](200) NULL,
	[customer_id] [int] NULL,
	[services_offered] [varchar](200) NULL,
	[total_effort] [varchar](50) NULL,
	[onsite_effort] [varchar](50) NULL,
	[offshore_effort] [varchar](50) NULL,
	[project_manager] [varchar](30) NULL,
	[delivery_manager] [varchar](30) NULL,
	[onsite_coordinator] [varchar](30) NULL,
	[manager_remark] [varchar](200) NULL,
	[filename] [varchar](50) NULL,
	[file_description] [varchar](200) NULL,
	[general_remark] [varchar](200) NULL,
	[created_date] [date] NULL,
	[create_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK__project___3213E83F0CBAE877] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_emp_mapping_details]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project_emp_mapping_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [varchar](30) NOT NULL,
	[project_code] [varchar](30) NOT NULL,
	[emp_name] [varchar](50) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[percentage_allocation] [int] NULL,
	[project_manager] [varchar](30) NULL,
	[view_status] [int] NOT NULL,
	[location] [varchar](50) NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[remark] [varchar](200) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_project_emp_mapping_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[projectid_file_mapping]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projectid_file_mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [varchar](50) NOT NULL,
	[project_id] [int] NOT NULL,
	[file_descrption] [varchar](2000) NULL,
 CONSTRAINT [PK_projectid_file_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sample]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sample](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[age] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[time_sheet]    Script Date: 10/17/2017 10:51:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[time_sheet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [varchar](30) NOT NULL,
	[emp_name] [varchar](50) NULL,
	[project_code] [varchar](30) NULL,
	[date] [date] NULL,
	[start_time] [varchar](10) NULL,
	[end_time] [varchar](10) NULL,
	[day_total_hours] [varchar](10) NULL,
	[total_hours] [varchar](10) NULL,
	[work_description] [varchar](1000) NULL,
	[sequence_no] [int] NULL,
	[acitivity] [varchar](30) NULL,
	[work_remark] [varchar](200) NULL,
	[approved_status] [varchar](30) NULL,
	[approved_by] [varchar](30) NULL,
	[rejected_reason] [varchar](2000) NULL,
	[created_by] [varchar](30) NULL,
	[created_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK_time_sheet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (1, N'Coding', N'CODE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (2, N'Testing', N'TSTG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (3, N'Documentation-Technical', N'DOCT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (4, N'Documentation-Functional', N'DOCF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (5, N'Documentation-Estimation', N'DOCE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (6, N'Documentation-Testcase', N'DOTC', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (7, N'Documentation-Testscript', N'DOTS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (8, N'Review', N'RIVW', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (9, N'Migration', N'MIGR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (10, N'Leave', N'LEAV', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (11, N'Meeting-Internal', N'MIIN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (12, N'Meeting-Client', N'MICL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[activity_table] ([id], [activity], [codeid], [created_by], [created_date], [updated_by], [updated_date], [remarks]) VALUES (13, N'Training', N'TRNG', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer_portfolio_details] ON 

INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (14, N'cus-003', N'EnnVee Solutions', NULL, CAST(9852447 AS Numeric(18, 0)), N'+91', NULL, N'CUS.edu', NULL, NULL, N'Chennai', N'', N'Chennai', N'New York', N'America', N'600012', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (15, N'cus-004', N'Bayerische Motoren Werke AG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Paris', N'Frances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (61, N'Enn001', N'ennvee ', NULL, CAST(94444944143443 AS Numeric(18, 0)), N'+91', NULL, N'ennvee.com', NULL, N'', N'dssfds', N'sdsdfs', N'sdfsdf', N'dfsd', N'sdfdsf', N'600015', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (62, N'AAM', N'American alex  manufacture', NULL, CAST(1234567890 AS Numeric(18, 0)), N'+1', NULL, N'www.aam.com', NULL, N'', N'OneDauchdrive', N'asd', N'datorit', N'Mi', N'USA', N'45678', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (1062, N'chn003', N'ennVee Solution @ pvt', NULL, CAST(1234656789 AS Numeric(18, 0)), N'+91', NULL, N'ennVee.com', NULL, N'', N'#51,VSI ', N'', N'chneenai', N'Tamilnadu', N'india', N'1234-665', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (2063, N'6346', N'reut', NULL, CAST(5354 AS Numeric(18, 0)), N'4343', NULL, N'ufgf.edu', NULL, N'', N'dfgght', N'', N'bfdh', N'sdsv', N'gth', N'3465', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (2064, N'Wellesley', N'Wellesley', NULL, CAST(7812831000 AS Numeric(18, 0)), N'+1', NULL, N'ww.Wellesley.edu', NULL, N'', N' Wellesley College', N'106,Central Street,', N'Wellesley', N'MA', N'USA', N'02481', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (2065, N'PamCEF', N'Pampered Chef', NULL, CAST(8886872433 AS Numeric(18, 0)), N'+1', NULL, N'www.PamperedChef.com', NULL, N'', N'Addision', N'', N'Addision', N'Illinois', N'USA', N'60101', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (2066, N'c001', N'St.Whiz', NULL, CAST(9685214732 AS Numeric(18, 0)), N'+91', NULL, N'hd.edu', NULL, N'', N'Thirumangalam', N'', N'Thirumangalam', N'TamilNadu', N'India', N'600008', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer_portfolio_details] OFF
SET IDENTITY_INSERT [dbo].[customercode_contactperson_mapping] ON 

INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1, N'', 12, N'Ram ku,mar', CAST(999964596 AS Numeric(18, 0)), CAST(9444494414 AS Numeric(18, 0)), N'ram.k@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (5, N'', 12, N'rahul', CAST(644654656 AS Numeric(18, 0)), CAST(564555666 AS Numeric(18, 0)), N'rahul.m@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (6, N'', 12, N'ranjith', CAST(213342423 AS Numeric(18, 0)), CAST(956554566 AS Numeric(18, 0)), N'ranjith.r@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (7, N'', 13, N'mohan', CAST(234242343 AS Numeric(18, 0)), CAST(234324324 AS Numeric(18, 0)), N'mohan.n@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (42, NULL, 61, N'sathiya', CAST(9444494414 AS Numeric(18, 0)), CAST(9444494414 AS Numeric(18, 0)), N'sathiyam503@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (43, NULL, 62, N'Bob Patak', CAST(1234567890 AS Numeric(18, 0)), CAST(1234567890 AS Numeric(18, 0)), N'bobpatak@aam.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1042, NULL, 1062, N'thiru', CAST(9554555544 AS Numeric(18, 0)), CAST(12345667895 AS Numeric(18, 0)), N'thiru.m@ennvee.net', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1043, NULL, 2063, N'xxx', CAST(4385964 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'xxx@dc.edu', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1044, NULL, 2064, N'Tony Dipesa', CAST(7812831000 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'tony.dipesa@wellesley.edu', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1045, NULL, 2065, N'J Myers', CAST(8886872433 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'jmyers@pamperedchef.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1046, NULL, 2066, N'ghjhg', CAST(45435 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'ghj@bhh.df', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1047, NULL, 14, N'gfhfg', CAST(87687 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'ghgfh@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customercode_contactperson_mapping] OFF
SET IDENTITY_INSERT [dbo].[customercontactperson_project_mapping] ON 

INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (72, 151, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (146, 154, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (147, 155, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (148, 157, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (149, 157, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (150, 158, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (151, 159, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (152, 160, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (153, 161, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (154, 162, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (155, 163, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (156, 164, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (159, 165, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (160, 165, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (164, 166, 39, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (165, 167, 54, 35, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (166, 168, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (167, 169, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (168, 170, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (169, 171, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (170, 172, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (171, 173, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (172, 174, 41, 40, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (173, 175, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (174, 176, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (175, 177, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (176, 178, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (177, 179, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (178, 180, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (180, 181, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (181, 182, 42, 13, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (182, 183, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (183, 184, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (184, 186, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (185, 187, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (186, 188, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (187, 189, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (188, 190, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (189, 191, 39, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (190, 193, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (192, 195, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (193, 196, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (194, 197, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (195, 198, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (196, 199, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (197, 200, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (198, 201, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (199, 202, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (200, 203, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (201, 204, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (202, 205, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (203, 206, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (204, 207, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (205, 208, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (206, 209, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (207, 210, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (208, 211, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (209, 212, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (210, 213, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (211, 214, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (212, 215, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (213, 216, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (214, 218, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (215, 220, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (216, 221, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (217, 222, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (218, 223, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (219, 224, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (220, 225, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (221, 226, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (232, 144, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (233, 144, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (244, 153, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (246, 194, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (250, 227, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (251, 120, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (4260, 2228, 2064, 1044, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (4263, 2230, 62, 43, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (6275, 3230, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (6314, 148, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (6319, 2231, 61, 42, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (6320, 2231, 61, 42, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (6324, 3232, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (7322, 145, 2064, 1044, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (7324, 3231, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (8321, 146, 2065, 1045, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (9321, 3233, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (9322, 3238, 61, 42, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (9323, 3239, 61, 42, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (10321, 4233, 14, 1047, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (10325, 228, 62, 43, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (10328, 1228, 62, 43, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (10329, 2229, 2065, 1045, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customercontactperson_project_mapping] OFF
SET IDENTITY_INSERT [dbo].[employee_details] ON 

INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (3, N'CHN015', N'Thirumalaikumari', N'E', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (5, N'CHN006', N'Anitha', N'P', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (25, N'Emp009', N'Alex', N'Kurian', NULL, NULL, NULL, NULL, N'Banaglore', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (29, N'Emp010', N'Anwar', N'M', NULL, NULL, NULL, NULL, N'Banaglore', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (30, N'Emp011', N'Santhosh', N'Kumar', NULL, NULL, NULL, NULL, N'Banaglore', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (31, N'Emp012', N'Avanthika', N'Rajesh', NULL, NULL, NULL, NULL, N'Banaglore', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (34, N'BNG004', N'Shahid Pathan', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (35, N'BNG010', N'Venkatesh', N'P', NULL, NULL, NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (36, N'BNG013', N'Sreekanth Dharmavaram', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (37, N'BNG023', N'Krishna Kishore', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (38, N'BNG026', N'Arun Yaligar', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (39, N'BNG027', N'Bhavish', N' D A', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (44, N'BNG028', N'Maruthi ', N' M L', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (46, N'BNG029', N'Neethi', N'N', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (47, N'BNG030', N'Prashanth Kumar', N' Y B', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (48, N'BNG038', N'Rajesh Killamsetti', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (49, N'BNG040', N'Jyothi  Lekshmi', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (50, N'BNG041', N'Sandeep', N'M G', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (51, N'BNG042', N'Sushma', N' G S', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (52, N'BNG043', N'Venkata Narayana', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (53, N'BNG044', N'Rama Mohan Nukala', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (54, N'BNG045', N'Madhusudhan  Reddy ', N' K', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (55, N'BNG047', N'Mahesh Ayyalasomayajula', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (56, N'BNG050', N'Krantinath Ananthaneni', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (57, N'BNG052', N'Mallikarjun', N'G', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (58, N'BNG056', N'Suresh Kumar', N'P R', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (59, N'BNG059', N'Srinivasan Kannan', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (60, N'BNG065', N'Bhaskar Wanjari', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (61, N'BNG070', N'Ashwini. R. Balanaik', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (62, N'BNG069', N'Nagarjuna Reddy', N'K', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (63, N'BNG068', N'Vinod godi', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (64, N'BNG071', N'Janardhan', N'S', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (65, N'BNG073', N'Tharun Yadav', N'J', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (66, N'BNG072', N'Deepa Narayankar', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (67, N'BNG074', N'Meghashree', N'J M', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (68, N'BNG076', N'Shruti Pitagi', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (69, N'BNG078', N'Suriya', N'S', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (70, N'BNG075', N'Lavanya', N'M', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (71, N'BNG077', N'Anushree', N'B P', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (72, N'BNG079', N'Nithya Srinivasan', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (73, N'BNG083', N'Senthil  Murugan', N'D', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (74, N'BNG084', N'Usha Rani', N'Rani', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (75, N'BNG085', N'HeenaKousar M Sutar', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (76, N'BNG086', N'Pavan Kumar', N'R', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (77, N'BNG087', N'Divya.K.Desai', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (78, N'BNG088', N'Chaitra.R.Gowder', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (79, N'BNG089', N'Avvarri Rajesh', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (80, N'BNG091', N'Padma Priya ', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (81, N'CHN005', N'Parveen Taj', N'', NULL, NULL, NULL, NULL, N'chennai', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (82, N'CHN007', N'Yogesh Kumar', N'', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (83, N'CHN008', N'Mani Arasan', N'', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (84, N'CHN009', N'Rathinavelan', NULL, NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (85, N'BNG092', N'Palukuri Jambulaiah', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (86, N'BNG093', N'Raju', N'N', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (87, N'BNG094', N'Jayalaxmi Ashok Jeeragod ', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (88, N'BNG095', N'Ananthaneni Yamuna', N'', NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (89, N'BNG096', N'Jyothi Vasantrao Bachipale ', NULL, NULL, NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (90, N'CHN010', N'Ganga', N'S', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (91, N'CHN011', N'Sathiyanathan', N'M', NULL, NULL, CAST(9444494414 AS Numeric(18, 0)), N'sathiyanathan.m@ennvee.net', N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (92, N'CHN012', N'Yurekha', N'S', NULL, NULL, CAST(9597426044 AS Numeric(18, 0)), N'yurekha.s@ennvee.net', N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (93, N'CHN013', N'Arun Raj Kumar', N'B', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (94, N'CHN014', N'Karthikeyan', N'M A', NULL, NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (96, N'CHN001', N'Thirumavalavan Raj', NULL, NULL, NULL, NULL, N'thirumalaikumari52@gmail.com', N'chennai', N'admin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (97, N'BNG062', N'Sudheendra Rao', NULL, NULL, NULL, NULL, N'thirumalaikumarimca@gmail.com', N'Banaglore', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (2098, N'chn016', N'Siva', NULL, NULL, NULL, NULL, N'siva@ennvee.net', NULL, N'project_manager', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [conatct_no1], [mail], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (2099, N'chn017', N'Malarvizhi', NULL, NULL, NULL, NULL, N'malarvizhi@ennvee.net', NULL, N'associate', NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[employee_details] OFF
SET IDENTITY_INSERT [dbo].[login_details] ON 

INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (1, N'sathiya', N'261376', N'associate', N'CHN011', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (3, N'yurekha', N'248', N'associate', N'CHN012', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (5, N'anitha', N'CHN006', N'associate', N'CHN006', CAST(0x5B950A00 AS Date), N'', CAST(0x5B950A00 AS Date), N'', 0, N'')
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (6, N'mani', N'CHN008', N'associate', N'CHN008', CAST(0x5B950A00 AS Date), N'', CAST(0x5B950A00 AS Date), N'', 0, N'')
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (7, N'taj', N'CHN005', N'project_manager', N'CHN005', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (8, N'admin', N'123', N'admin', N'CHN001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (9, N'BNG062', N'BNG062', N'admin', N'BNG062', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (10, N'Rajesh Killamsetti', N'BNG038', N'associate', N'BNG038', CAST(0x5B950A00 AS Date), N'', CAST(0x5B950A00 AS Date), N'', 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (11, N'Santhosh', N'Emp011', N'associate', N'Emp011', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (12, N'Avanthika', N'Emp012', N'associate', N'Emp012', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (13, N'Sushma', N'BNG042', N'associate', N'BNG042', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (14, N'Sreekanth Dharmavaram', N'BNG013', N'associate', N'BNG013', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (15, N'Arun Yaligar', N'BNG026', N'project_manager', N'BNG026', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (17, N'Ram Mohan Nakala', N'BNG044', N'project_manager', N'BNG044', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (18, N'Nithya Srinivasan', N'bng079', N'project_manager', N'BNG079', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (19, N'Mahesh Ayyalasomayajula', N'bng047', N'associate', N'BNG047', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (20, N'Ashwini. R. Balanaik', N'bng070', N'associate', N'BNG070', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (21, N'Meghashree', N'bng074', N'associate', N'BNG074', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (22, N'Jyothi  Lekshmi', N'bng040', N'associate', N'BNG040', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (23, N'Raju', N'bng093', N'associate', N'BNG093', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (24, N'Chaitra.R.Gowder', N'bng088', N'associate', N'BNG088', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (25, N'Divya.K.Desai', N'bng087', N'associate', N'BNG087', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (26, N'Nagarjuna Reddy', N'bng069', N'associate', N'BNG069', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (27, N'Tharun Yadav', N'bng073', N'associate', N'BNG073', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (28, N'Krishna Kishore', N'bng023', N'project_manager', N'BNG023', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (29, N'Venkatesh', N'bng010', N'project_manager', N'BNG010', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (1019, N'Venkata Narayana', N'bng043', N'project_manager', N'BNG043', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (1020, N'Thirumalaikumari', N'chn015', N'associate', N'CHN015', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (2020, N'Siva', N'chn016', N'project_manager', N'chn016', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (2022, N'Malarvizhi', N'chn017', N'associate', N'chn017', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [role], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (3020, N'Padma Priya ', N'bng091', N'associate', N'BNG091', NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[login_details] OFF
SET IDENTITY_INSERT [dbo].[master_table_details] ON 

INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (1, N'services_offered', N'Development', N'service offer', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (2, N'services_offered', N'AMS', N'service offer', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (3, N'technology', N'Java', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (4, N'technology', N'Html', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (5, N'technology', N'Javascript', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (6, N'technology', N'CSS', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (7, N'contract_type', N'T&M', N'contract_type', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (8, N'contract_type', N'Fixed', N'contract_type', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (9, N'project_manager', N'Enn-07', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (10, N'project_manager', N'Enn-08', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (11, N'delivery_manager', N'Enn-66', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (12, N'delivery_manager', N'Enn-68', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (13, N'onsite_coordinator', N'Enn-04', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (14, N'onsite_coordinator', N'Enn-45', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (15, N'technology', N'Dot net', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (16, N'technology', N'C++', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (17, N'center', N'Offshore', N'center', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (18, N'center', N'Onsite', N'center', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (19, N'location', N'Bangalore', N'Offshore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (20, N'location', N'Chennai', N'Offshore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (21, N'status', N'Open', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (22, N'status', N'Approved', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (23, N'status', N'Completed', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (24, N'status', N'In-progress', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (25, N'status', N'Closed', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (26, N'center', N'Both', N'status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (27, N'technology', N'Oracle EBS', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (28, N'technology', N'MuleSoft', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (29, N'customer_portfolio', N'Manufacturing ', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (30, N'customer_portfolio', N'Health Services', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (31, N'customer_portfolio', N'Retail', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (32, N'customer_portfolio', N'Auto', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (33, N'customer_portfolio', N'Spare Parts', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (34, N'customer_portfolio', N'Textile', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (35, N'customer_portfolio', N'Engineering', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (36, N'customer_portfolio', N'Hospitals', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (37, N'customer_portfolio', N'Government Agencies', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (38, N'customer_portfolio', N'Banking & Financial', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (39, N'services_offered', N'Training', N'services_offered', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (40, N'technology', N'Power BI', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (41, N'technology', N'Tableau', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (42, N'technology', N'Workday', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (43, N'location', N'Chicago', N'Onsite', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (44, N'location', N'Napeville', N'Onsite', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (45, N'activitycode', N'CODE', N'Coding', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (46, N'activitycode', N'TSTG', N'Testing', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (47, N'activitycode', N'DOCT', N'Documentation_Technical', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (48, N'activitycode', N'DOCF', N'Documentation_Functional', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (49, N'activitycode', N'DOCE', N'Documentation_Estimation ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (50, N'activitycode', N'DOTC', N'Documentation_TestCase', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (51, N'activitycode', N'DOTS', N'Documentation_TestScript', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (52, N'activitycode', N'RIVW', N'Review', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (53, N'activitycode', N'MIGR', N'Migration', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (54, N'activitycode', N'LEAV', N'Leave', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (55, N'activitycode', N'MIIN', N'Meeting_Internal', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (56, N'activitycode', N'MICL', N'Meeting_Client', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (57, N'activitycode', N'TRNG', N'Training', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (58, N'approve_status', N'Approved', N'Approved timesheet', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (59, N'approve_status', N'Rejected', N'Rejected timesheet', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (60, N'approve_status', N'Pending', N'Pending timesheet', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (61, N'approve_status', N'Saved', N'Save the status', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (62, N'customer_portfolio', N'Food Industries', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (63, N'customer_portfolio', N'Education', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (64, N'customer_portfolio', N'Others', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (65, N'technology', N'SSRS', N'technology', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[master_table_details] OFF
SET IDENTITY_INSERT [dbo].[password_reset] ON 

INSERT [dbo].[password_reset] ([row], [emp_code], [reset_code], [status]) VALUES (1, N'CHN012', 9231869, NULL)
INSERT [dbo].[password_reset] ([row], [emp_code], [reset_code], [status]) VALUES (2, N'CHN011', 9652086, NULL)
INSERT [dbo].[password_reset] ([row], [emp_code], [reset_code], [status]) VALUES (3, N'rtyr', 8385477, NULL)
INSERT [dbo].[password_reset] ([row], [emp_code], [reset_code], [status]) VALUES (4, N'chn001', 7797790, NULL)
INSERT [dbo].[password_reset] ([row], [emp_code], [reset_code], [status]) VALUES (5, N'chn015', 5316165, NULL)
SET IDENTITY_INSERT [dbo].[password_reset] OFF
SET IDENTITY_INSERT [dbo].[project_details] ON 

INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (146, N'PES002', N'Panduit EBS Support', N'EBS 11i support and enhancement', CAST(0x453C0B00 AS Date), CAST(0xB13D0B00 AS Date), N'Offshore', N'Chennai', N'T&M', N'Closed', N'Oracle EBS', N'Network', 2065, N'AMS', N'8', N'0', N'8', N'BNG044', N'Emp009', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (147, N'PMS001', N'Panduit MuleSoft Support', N'MuleSoft Integration', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'MuleSoft', N'Network Infrastructure Manufacturer', NULL, N'AMS', N'8', N'0', N'8', N'BNG043', N'Emp009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (148, N'BES001', N'BPI EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'In-progress', N'Oracle EBS', N'Automotive', 14, N'AMS', N'8', N'0', N'8', N'CHN005', N'Emp010', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (149, N'BES002', N'BPI EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Chennai', N'T&M', N'Open', N'Oracle EBS', N'Automotive Ancillary Manufacturer', NULL, N'AMS', N'8', N'0', N'8', N'CHN005', N'Emp010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (228, N'UPGA1', N'R12 Upgrade Assessment', N'Oracle EBS custom object assessment for R12 upgrade', CAST(0x623D0B00 AS Date), CAST(0x993D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle', N'Manufacturing', 62, N'Development', N'20', N'0', N'20', N'BNG023', N'BNG062', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (1228, N'Ennvee001', N'R12 Upgrade  AAM', N'', CAST(0x623D0B00 AS Date), CAST(0x9A3D0B00 AS Date), N'Offshore', N'Bangalore', N'Fixed', N'Open', N'Oracle', N'Manufacturing', 62, N'Development', N'352', N'0', N'352', N'BNG023', N'BNG062', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (2228, N'EnnVee003', N'Wellesley', N'Wellesley – Discoverer to SSRS Reports Conversion – ', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle', N'Others', 2064, N'AMS', N'312', N'0', N'312', N'BNG023', N'BNG062', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (2229, N'EnnVee002', N'R12 upgrade assessment', N'Pampered Chef – R12 upgrade assessment', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle', N'Others', 2065, N'Development', N'352', N'0', N'352', N'BNG023', N'BNG062', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (3233, N'PMT005', N'PMT', N'', CAST(0x5A3D0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Java', N'Engineering', 14, N'Development', N'520', N'0', N'520', N'chn016', N'Emp010', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[project_details] OFF
SET IDENTITY_INSERT [dbo].[project_emp_mapping_details] ON 

INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (92, N'BNG047', N'Ennvee001', N'Mahesh Ayyalasomayajula', CAST(0x603D0B00 AS Date), CAST(0x983D0B00 AS Date), 100, N'BNG023', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (93, N'BNG070', N'Ennvee001', N'Ashwini. R. Balanaik', CAST(0x623D0B00 AS Date), CAST(0x9A3D0B00 AS Date), 100, N'BNG023', 0, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1092, N'BNG074', N'EnnVee003', N'Meghashree', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG026', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1093, N'BNG096', N'EnnVee003', N'Jyothi Vasantrao Bachipale ', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG026', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1094, N'BNG093', N'EnnVee003', N'Raju', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG026', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1095, N'BNG088', N'EnnVee003', N'Chaitra.R.Gowder', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG026', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1096, N'BNG087', N'EnnVee003', N'Divya.K.Desai', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG026', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1097, N'BNG069', N'EnnVee002', N'Nagarjuna Reddy', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG010', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (1098, N'BNG073', N'EnnVee002', N'Tharun Yadav', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 100, N'BNG010', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (2094, N'BNG010', N'EnnVee002', N'Venkatesh', CAST(0x543D0B00 AS Date), CAST(0x903D0B00 AS Date), 50, N'BNG023', 0, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (2095, N'BNG023', N'EnnVee003', N'Krishna Kishore ', CAST(0x523D0B00 AS Date), CAST(0x6A3D0B00 AS Date), 50, N'BNG062', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (2096, N'CHN005', N'PES002', N'Parveen Taj', CAST(0x553D0B00 AS Date), CAST(0x583D0B00 AS Date), 50, N'BNG062', 1, N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (5099, N'BNG043', N'EnnVee002', N'Venkata Narayana', CAST(0x543D0B00 AS Date), CAST(0x8E3D0B00 AS Date), 100, N'BNG010', 0, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (6107, N'chn017', N'PMT005', N'Malarvizhi', CAST(0x663D0B00 AS Date), CAST(0x6D3D0B00 AS Date), 50, N'chn016', 0, N'', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (7100, N'CHN007', N'Ennvee001', N'Yogesh Kumar', CAST(0x613D0B00 AS Date), CAST(0x6A3D0B00 AS Date), 40, N'BNG023', 0, N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (7101, N'CHN014', N'PMT005', N'Karthikeyan', CAST(0x693D0B00 AS Date), CAST(0x6A3D0B00 AS Date), 30, N'chn016', 0, N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (7102, N'BNG042', N'EnnVee002', N'Sushma', CAST(0x673D0B00 AS Date), CAST(0x863D0B00 AS Date), 30, N'BNG010', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [view_status], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (7103, N'BNG028', N'EnnVee002', N'Maruthi ', CAST(0x693D0B00 AS Date), CAST(0x883D0B00 AS Date), 30, N'BNG010', 1, N'Banaglore', NULL, NULL, NULL, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[project_emp_mapping_details] OFF
SET IDENTITY_INSERT [dbo].[projectid_file_mapping] ON 

INSERT [dbo].[projectid_file_mapping] ([id], [file_name], [project_id], [file_descrption]) VALUES (103, N'Capture1.PNG', 148, NULL)
INSERT [dbo].[projectid_file_mapping] ([id], [file_name], [project_id], [file_descrption]) VALUES (104, N'Capture1.PNG', 148, NULL)
INSERT [dbo].[projectid_file_mapping] ([id], [file_name], [project_id], [file_descrption]) VALUES (1103, N'Weekly Timesheet.xlsx', 2231, NULL)
INSERT [dbo].[projectid_file_mapping] ([id], [file_name], [project_id], [file_descrption]) VALUES (1104, N'script.sql', 146, NULL)
SET IDENTITY_INSERT [dbo].[projectid_file_mapping] OFF
SET IDENTITY_INSERT [dbo].[sample] ON 

INSERT [dbo].[sample] ([id], [name], [age]) VALUES (1, N'sathiya', 24)
SET IDENTITY_INSERT [dbo].[sample] OFF
SET IDENTITY_INSERT [dbo].[time_sheet] ON 

INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (109, N'CHN011', N'Sathiyanathan', N'PES001', CAST(0xEE930A00 AS Date), N'06:54', N'10:55', N'05:02', N'04:01', N'check', 1, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (110, N'CHN011', N'Sathiyanathan', N'PES001', CAST(0xEE930A00 AS Date), N'14:55', N'15:56', N'05:02', N'01:01', N'check', 2, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1109, N'BNG010', N'Venkatesh', N'EnnVee002', CAST(0x543D0B00 AS Date), N'10:00', N'11:46', N'01:46', N'01:46', N'check', 1, N'CODE', NULL, N'Pending ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1110, N'BNG023', N'Krishna Kishore', N'Ennvee001', CAST(0x543D0B00 AS Date), N'10:00', N'12:55', N'04:56', N'02:55', N'sdf', 1, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1112, N'BNG026', N'Arun Yaligar', N'EnnVee003', CAST(0x553D0B00 AS Date), N'10:00', N'16:00', N'09:00', N'06:00', N'test', 1, N'TSTG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1113, N'BNG026', N'Arun Yaligar', N'P004', CAST(0x553D0B00 AS Date), N'17:00', N'20:00', N'09:00', N'03:00', N'coding', 2, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1114, N'BNG026', N'Arun Yaligar', N'EnnVee003', CAST(0x4E3D0B00 AS Date), N'10:00', N'12:00', N'02:00', N'02:00', N'test', 1, N'CODE', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1115, N'BNG026', N'Arun Yaligar', N'EnnVee003', CAST(0x543D0B00 AS Date), N'10:00', N'16:00', N'06:00', N'06:00', N'asdd', 1, N'TSTG', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1116, N'BNG023', N'Krishna Kishore', N'Ennvee001', CAST(0x543D0B00 AS Date), N'12:59', N'15:00', N'04:56', N'02:01', N'ff', 2, N'TSTG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (1117, N'BNG044', N'Rama Mohan Nukala', N'PES001', CAST(0x573D0B00 AS Date), N'11:00', N'18:00', N'07:00', N'07:00', N'12', 1, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2116, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x623D0B00 AS Date), N'10:15', N'12:00', N'08:15', N'01:45', N'Preparing Document', 1, N'DOCT', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2117, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x623D0B00 AS Date), N'12:00', N'13:30', N'08:15', N'01:30', N'Project Traning', 2, N'TRNG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2118, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x623D0B00 AS Date), N'13:30', N'16:00', N'08:15', N'02:30', N'Project Training', 3, N'TRNG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2119, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x623D0B00 AS Date), N'16:20', N'18:50', N'08:15', N'02:30', N'Preparing Document', 4, N'DOCT', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2120, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5C3D0B00 AS Date), N'10:15', N'13:00', N'07:45', N'02:45', N'Preparing Document', 1, N'DOCT', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2121, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5C3D0B00 AS Date), N'14:00', N'17:00', N'07:45', N'03:00', N'Project Training', 2, N'TRNG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2122, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5C3D0B00 AS Date), N'17:00', N'19:00', N'07:45', N'02:00', N'Preparing Document', 3, N'DOCT', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2123, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5B3D0B00 AS Date), N'10:05', N'13:00', N'07:55', N'02:55', N'Training', 1, N'TRNG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2124, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5B3D0B00 AS Date), N'14:00', N'17:00', N'07:55', N'03:00', N'Training', 2, N'TRNG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2125, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5B3D0B00 AS Date), N'17:00', N'19:00', N'07:55', N'02:00', N'Prepared document', 3, N'DOCT', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2126, N'chn017', N'Malarvizhi', N'PMT005', CAST(0x5D3D0B00 AS Date), N'10:00', N'13:00', N'03:00', N'03:00', N'Tst', 1, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2127, N'BNG023', N'Krishna Kishore', N'EnnVee002', CAST(0x4A3C0B00 AS Date), N'11:48', N'13:49', N'02:01', N'02:01', N'', 1, N'TSTG', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (2128, N'BNG026', N'Arun Yaligar', N'EnnVee003', CAST(0x0A950A00 AS Date), N'08:22', N'09:23', N'01:01', N'01:01', N'testing', 1, N'TSTG', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (3116, N'CHN015', N'Thirumalaikumari', N'PMT001', CAST(0x5A3D0B00 AS Date), N'10:00', N'15:00', N'05:00', N'05:00', N'code', 1, N'CODE', NULL, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (3117, N'BNG093', N'Raju', N'EnnVee003', CAST(0x5E3D0B00 AS Date), N'09:00', N'18:00', N'09:00', N'09:00', N'hhh', 1, N'CODE', NULL, N'Approved', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (3118, N'BNG073', N'Tharun Yadav', N'EnnVee002', CAST(0x603D0B00 AS Date), N'09:00', N'16:10', N'07:10', N'07:10', N'hhh', 1, N'CODE', NULL, N'Approved', NULL, N'Good', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[time_sheet] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__customer__6A9E4CB7164452B1]    Script Date: 10/17/2017 10:51:45 AM ******/
ALTER TABLE [dbo].[customer_portfolio_details] ADD  CONSTRAINT [UQ__customer__6A9E4CB7164452B1] UNIQUE NONCLUSTERED 
(
	[customer_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__employee__B1056ABC1CF15040]    Script Date: 10/17/2017 10:51:45 AM ******/
ALTER TABLE [dbo].[employee_details] ADD  CONSTRAINT [UQ__employee__B1056ABC1CF15040] UNIQUE NONCLUSTERED 
(
	[emp_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__login_de__1299A8603371D62E]    Script Date: 10/17/2017 10:51:45 AM ******/
ALTER TABLE [dbo].[login_details] ADD  CONSTRAINT [UQ__login_de__1299A8603371D62E] UNIQUE NONCLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__login_de__7C9273C40899D4FC]    Script Date: 10/17/2017 10:51:45 AM ******/
ALTER TABLE [dbo].[login_details] ADD  CONSTRAINT [UQ__login_de__7C9273C40899D4FC] UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unqiue key]    Script Date: 10/17/2017 10:51:45 AM ******/
ALTER TABLE [dbo].[project_details] ADD  CONSTRAINT [unqiue key] UNIQUE NONCLUSTERED 
(
	[project_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[project_emp_mapping_details] ADD  CONSTRAINT [DF_project_emp_mapping_details_view_status]  DEFAULT ((0)) FOR [view_status]
GO
