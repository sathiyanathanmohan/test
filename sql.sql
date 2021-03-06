USE [projectmangementtools]
GO
/****** Object:  Table [dbo].[time_sheet]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[time_sheet] ON
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (43, N'0', N'sathiya', N'ECB00002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (71, N'0', N'sathiya', N'ECB00002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (80, N'CHN011', N'Sathiyanathan', N'ECB00002', NULL, N'10:00', N'11:00', N'01:00', N'01:00', N'fedfefer', 1, N'CODE', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (81, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2A3D0B00 AS Date), N'10:00', N'11:00', N'04:00', N'01:00', N'efsd', 1, N'CODE', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (82, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2A3D0B00 AS Date), N'10:00', N'12:00', N'04:00', N'02:00', N'fbvdb', 2, N'CODE', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (83, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2B3D0B00 AS Date), N'10:00', N'12:00', N'08:00', N'02:00', N'nothing', 1, N'CODE', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (84, N'CHN011', N'Sathiyanathan', N'Pro01223', CAST(0x2B3D0B00 AS Date), N'13:00', N'16:00', N'08:00', N'03:00', N'Testing', 2, N'TSTG', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (85, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2B3D0B00 AS Date), N'16:00', N'19:00', N'08:00', N'03:00', N'nothing', 3, N'DOCT', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (86, N'CHN012', N'Yurekha', N'ECB00002', CAST(0x2A3D0B00 AS Date), N'10:14', N'11:42', N'01:28', N'01:28', N'oracle', 1, N'CODE', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (87, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2A3D0B00 AS Date), N'11:15', N'12:15', N'04:00', N'01:00', N'Documentation', 3, N'DOCT', NULL, N'Approved ', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (88, N'CHN011', N'Sathiyanathan', N'ECB00002', CAST(0x2E3D0B00 AS Date), N'10:00', N'11:00', N'01:00', N'01:00', N'nothing', 1, N'DOCT', NULL, N'Saved', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (89, N'CHN012', N'Yurekha', N'ECB00002', CAST(0x2C3D0B00 AS Date), N'10:00', N'11:52', N'03:44', N'01:52', N'check', 1, N'CODE', NULL, N'Approved', NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[time_sheet] ([id], [emp_code], [emp_name], [project_code], [date], [start_time], [end_time], [day_total_hours], [total_hours], [work_description], [sequence_no], [acitivity], [work_remark], [approved_status], [approved_by], [rejected_reason], [created_by], [created_date], [updated_by], [updated_date], [remark]) VALUES (90, N'CHN012', N'Yurekha', N'PES002', CAST(0x2C3D0B00 AS Date), N'12:00', N'13:52', N'03:44', N'01:52', N'check', 2, N'TSTG', NULL, N'Approved', NULL, N'', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[time_sheet] OFF
/****** Object:  Table [dbo].[sample]    Script Date: 08/17/2017 16:14:26 ******/
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
SET IDENTITY_INSERT [dbo].[sample] ON
INSERT [dbo].[sample] ([id], [name], [age]) VALUES (1, N'sathiya', 24)
SET IDENTITY_INSERT [dbo].[sample] OFF
/****** Object:  Table [dbo].[projectid_file_mapping]    Script Date: 08/17/2017 16:14:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projectid_file_mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_code] [varchar](50) NULL,
	[file_name] [varchar](50) NOT NULL,
	[project_id] [int] NULL,
 CONSTRAINT [PK_projectid_file_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_emp_mapping_details]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[project_emp_mapping_details] ON
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (62, N'BNG004', N'PES001', N'Shahid Pathan', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG044', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (67, N'BNG013', N'PES001', N'Sreekanth Dharmavaram', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG044', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (69, N'BNG027', N'PES001', N'Bhavish D A', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG044', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (70, N'BNG059', N'PES002', N'Srinivasan Kannan', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG044', N'Chennai', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (71, N'BNG065', N'PES002', N'Bhaskar Wanjari', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG044', N'Chennai', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (72, N'BNG026', N'PMS001', N'Arun Yaligar', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG043', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (73, N'BNG043', N'PMS001', N'Venkata Narayana', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'BNG043', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (74, N'BNG052', N'BES001', N'Mallikarjun G', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'CHN005', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (77, N'BNG084', N'BES001', N'Usha Rani', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'CHN005', N'Bangalore', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (79, N'CHN005', N'BES002', N'Parveen Taj', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), 100, N'CHN005', N'Chennai', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (80, N'CHN015', N'ECB00002', N'Thirumalaikumarai', CAST(0x2E3D0B00 AS Date), CAST(0x3B3D0B00 AS Date), 30, N'BNG043', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (81, N'CHN006', N'ECB00002', N'Anitha', CAST(0x253D0B00 AS Date), CAST(0x3B3D0B00 AS Date), 60, N'CHN005', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (82, N'CHN011', N'ECB00002', N'Sathiyanathan', CAST(0x253D0B00 AS Date), CAST(0x3A3D0B00 AS Date), 50, N'BNG043', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (83, N'CHN015', N'Pro01223', N'Thirumalaikumari', CAST(0x253D0B00 AS Date), CAST(0x3B3D0B00 AS Date), 30, N'BNG043', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (84, N'CHN011', N'Pro01223', N'Sathiyanathan', CAST(0x253D0B00 AS Date), CAST(0x3A3D0B00 AS Date), 30, N'CHN005', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (85, N'CHN012', N'ECB00002', N'Yurekha', CAST(0x1E3D0B00 AS Date), CAST(0x263D0B00 AS Date), 50, N'CHN005', N'chennai', NULL, NULL, NULL, N'', N'', 0)
INSERT [dbo].[project_emp_mapping_details] ([id], [emp_code], [project_code], [emp_name], [start_date], [end_date], [percentage_allocation], [project_manager], [location], [created_date], [created_by], [updated_date], [updated_by], [remark], [status]) VALUES (86, N'CHN012', N'PES002', N'Yurekha', CAST(0x263D0B00 AS Date), CAST(0x3B3D0B00 AS Date), 25, N'BNG044', N'chennai', NULL, NULL, NULL, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[project_emp_mapping_details] OFF
/****** Object:  Table [dbo].[project_details]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unqiue key] UNIQUE NONCLUSTERED 
(
	[project_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[project_details] ON
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (120, N'ECB00002', N'Oracle EBiz Support - Hyundai', N'Oracle Production support project for Hyundai Client Oracle Version R12', CAST(0x1D3D0B00 AS Date), CAST(0xB43D0B00 AS Date), N'Offshore', N'Chennai', N'fixed', N'Open', N'java', N'Manufacturing', 13, N'development', N'180', N'180', N'0', N'Emp007', N'enn66', N'enn04', N'Project handled at chennai and managed by Nithiya and supervised by Thiru', N'New Microsoft Excel Worksheet.xlsx', N'checking', N'Client Contact person : JEff Arch and contact detail - 512=010-8901 Location :chicago', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (144, N'Pro01223', N'Project add checking', N'Project add checking', CAST(0xFE3C0B00 AS Date), CAST(0x3B3D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Java', N'Manufacturing', 13, N'Development', N'100', N'0', N'100', N'Enn-07', N'Enn-68', N'Enn-04', N'Project add checking', N'README.txt', N'check', N'Project add checking', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (145, N'PES001', N'Panduit EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle EBS', N'Network', 12, N'AMS', N'64', N'0', N'64', N'BNG044', N'Emp009', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (146, N'PES002', N'Panduit EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Chennai', N'T&M', N'Open', N'Oracle EBS', N'Network', 12, N'AMS', N'8', N'0', N'8', N'BNG044', N'Emp009', N'undefined', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (147, N'PMS001', N'Panduit MuleSoft Support', N'MuleSoft Integration', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'MuleSoft', N'Network Infrastructure Manufacturer', NULL, N'AMS', N'8', N'0', N'8', N'BNG043', N'Emp009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (148, N'BES001', N'BPI EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle EBS', N'Automotive', 12, N'AMS', N'8', N'0', N'8', N'CHN005', N'Emp010', N'Emp011', N'', NULL, N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (149, N'BES002', N'BPI EBS Support', N'EBS 11i support and enhancement', CAST(0x493C0B00 AS Date), CAST(0xB53D0B00 AS Date), N'Offshore', N'Chennai', N'T&M', N'Open', N'Oracle EBS', N'Automotive Ancillary Manufacturer', NULL, N'AMS', N'8', N'0', N'8', N'CHN005', N'Emp010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (150, N'ERP2131', N'asddadfsdf', N'safsf', CAST(0xFE3C0B00 AS Date), CAST(0x1B3D0B00 AS Date), N'Offshore', N'Bangalore', N'T&M', N'Open', N'Oracle,MuleSoft', N'Manufacturing', NULL, N'Development', N'200', N'0', N'200', N'BNG043', N'Emp010', N'Emp012', N'', N'index.html', N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (151, N'sdcsd3223', N'sfdsfcsdaf', N'sdfsdfsf', CAST(0xFE3C0B00 AS Date), CAST(0x1C3D0B00 AS Date), N'Offshore', N'Bangalore', N'Fixed', N'Open', N'Oracle', N'Spare', 12, N'AMS', N'200', N'0', N'200', N'BNG044', N'Emp010', N'Emp012', N'', N'THIRDPARTYLICENSEREADME-JAVAFX.txt', N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[project_details] ([id], [project_code], [project_name], [project_description], [start_date], [end_date], [center], [location], [contract_type], [project_status], [technology], [customer_portfolio], [customer_id], [services_offered], [total_effort], [onsite_effort], [offshore_effort], [project_manager], [delivery_manager], [onsite_coordinator], [manager_remark], [filename], [file_description], [general_remark], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (153, N'CHNMF01', N'Catalog  ', N'check', CAST(0x1D3D0B00 AS Date), CAST(0x963D0B00 AS Date), N'Both', N'Chennai', N'T&M', N'Open', N'Java,CSS,C++,MuleSoft', N'Manufacturing', 12, N'Development', N'180', N'90', N'90', N'CHN005', N'Emp010', N'Emp012', N'', N'project.xlsx', N'', N'', NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[project_details] OFF
/****** Object:  Table [dbo].[master_table_details]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (36, N'customer_portfolio', N'Stospitals', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (37, N'customer_portfolio', N'Government Agencies', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (38, N'customer_portfolio', N'Banking & Financial', N'customer_portfolio', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (39, N'services_offered', N'Training', N'services_offered', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (40, N'technology', N'Power BI', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (41, N'technology', N'Tableau', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[master_table_details] ([id], [category], [item], [item_description], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (42, N'technology', N'Workday', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[master_table_details] OFF
/****** Object:  Table [dbo].[login_details]    Script Date: 08/17/2017 16:14:26 ******/
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
	[emp_id] [varchar](30) NOT NULL,
	[created_date] [date] NULL,
	[created_by] [varchar](30) NULL,
	[updated_date] [date] NULL,
	[updated_by] [varchar](30) NULL,
	[status] [int] NULL,
	[remark] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[login_details] ON
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (1, N'sathiya', N'261376', N'CHN011', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (3, N'yurekha', N'123456', N'CHN012', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (5, N'anitha', N'123654', N'CHN006', CAST(0x5B950A00 AS Date), N'', CAST(0x5B950A00 AS Date), N'', 0, N'')
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (6, N'mani', N'mani', N'CHN008', CAST(0x5B950A00 AS Date), N'', CAST(0x5B950A00 AS Date), N'', 0, N'')
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (7, N'taj', N'123456', N'CHN005', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[login_details] ([user_id], [user_name], [password], [emp_id], [created_date], [created_by], [updated_date], [updated_by], [status], [remark]) VALUES (8, N'admin', N'admin', N'CHN001', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[login_details] OFF
/****** Object:  Table [dbo].[employee_details]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__employee__B1056ABC1CF15040] UNIQUE NONCLUSTERED 
(
	[emp_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[employee_details] ON
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (3, N'CHN015', N'Thirumalaikumari', N'E', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (5, N'CHN006', N'Anitha', N'P', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (25, N'Emp009', N'Alex', N'Kurian', NULL, NULL, N'Banaglore', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (29, N'Emp010', N'Anwar', N'M', NULL, NULL, N'Banaglore', N'delivery_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (30, N'Emp011', N'Santhosh', N'Kumar', NULL, NULL, N'Banaglore', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (31, N'Emp012', N'Avanthika', N'Rajesh', NULL, NULL, N'Banaglore', N'onsite_coordinator', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (34, N'BNG004', N'Shahid Pathan', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (35, N'BNG010', N'Venkatesh', N'P', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (36, N'BNG013', N'Sreekanth Dharmavaram', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (37, N'BNG023', N'Krishna Kishore', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (38, N'BNG026', N'Arun Yaligar', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (39, N'BNG027', N'Bhavish', N' D A', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (44, N'BNG028', N'Maruthi ', N' M L', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (46, N'BNG029', N'Neethi', N'N', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (47, N'BNG030', N'Prashanth Kumar', N' Y B', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (48, N'BNG038', N'Rajesh Killamsetti', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (49, N'BNG040', N'Jyothi  Lekshmi', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (50, N'BNG041', N'Sandeep', N'M G', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (51, N'BNG042', N'Sushma', N' G S', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (52, N'BNG043', N'Venkata Narayana', N'', NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (53, N'BNG044', N'Rama Mohan Nukala', N'', NULL, NULL, N'Banaglore', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (54, N'BNG045', N'Madhusudhan  Reddy ', N' K', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (55, N'BNG047', N'Mahesh Ayyalasomayajula', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (56, N'BNG050', N'Krantinath Ananthaneni', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (57, N'BNG052', N'Mallikarjun', N'G', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (58, N'BNG056', N'Suresh Kumar', N'P R', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (59, N'BNG059', N'Srinivasan Kannan', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (60, N'BNG065', N'Bhaskar Wanjari', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (61, N'BNG070', N'Ashwini. R. Balanaik', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (62, N'BNG069', N'Nagarjuna Reddy', N'K', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (63, N'BNG068', N'Vinod godi', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (64, N'BNG071', N'Janardhan', N'S', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (65, N'BNG073', N'Tharun Yadav', N'J', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (66, N'BNG072', N'Deepa Narayankar', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (67, N'BNG074', N'Meghashree', N'J M', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (68, N'BNG076', N'Shruti Pitagi', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (69, N'BNG078', N'Suriya', N'S', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (70, N'BNG075', N'Lavanya', N'M', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (71, N'BNG077', N'Anushree', N'B P', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (72, N'BNG079', N'Nithya Srinivasan', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (73, N'BNG083', N'Senthil  Murugan', N'D', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (74, N'BNG084', N'Usha Rani', N'Rani', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (75, N'BNG085', N'HeenaKousar M Sutar', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (76, N'BNG086', N'Pavan Kumar', N'R', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (77, N'BNG087', N'Divya.K.Desai', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (78, N'BNG088', N'Chaitra.R.Gowder', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (79, N'BNG089', N'Avvarri Rajesh', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (80, N'BNG091', N'Padma Priya ', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (81, N'CHN005', N'Parveen Taj', N'', NULL, NULL, N'chennai', N'project_manager', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (82, N'CHN007', N'Yogesh Kumar', N'', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (83, N'CHN008', N'Mani Arasan', N'', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (84, N'CHN009', N'Rathinavelan', NULL, NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (85, N'BNG092', N'Palukuri Jambulaiah', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (86, N'BNG093', N'Raju', N'N', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (87, N'BNG094', N'Jayalaxmi Ashok Jeeragod ', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (88, N'BNG095', N'Ananthaneni Yamuna', N'', NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (89, N'BNG096', N'Jyothi Vasantrao Bachipale ', NULL, NULL, NULL, N'Banaglore', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (90, N'CHN010', N'Ganga', N'S', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (91, N'CHN011', N'Sathiyanathan', N'M', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (92, N'CHN012', N'Yurekha', N'S', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (93, N'CHN013', N'Arun Raj Kumar', N'B', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (94, N'CHN014', N'Karthikeyan', N'M A', NULL, NULL, N'chennai', N'associate', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee_details] ([id], [emp_code], [first_name], [last_name], [start_date], [end_date], [location], [designation], [created_date], [create_by], [updated_date], [updated_by], [status], [remark]) VALUES (96, N'CHN001', N'Thirumavallavan Raj', NULL, NULL, NULL, N'chennai', N'admin', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[employee_details] OFF
/****** Object:  Table [dbo].[customercontactperson_project_mapping]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[customercontactperson_project_mapping] ON
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (72, 151, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (98, 120, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (99, 145, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (100, 145, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (101, 144, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (102, 146, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (108, 153, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercontactperson_project_mapping] ([int], [project_id], [customer_id], [contact_person_id], [status], [created_date], [created_by], [updated_date], [updated_by], [remark]) VALUES (109, 148, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customercontactperson_project_mapping] OFF
/****** Object:  Table [dbo].[customercode_contactperson_mapping]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[customercode_contactperson_mapping] ON
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (1, N'', 12, N'Ram ku,mar', CAST(999964596 AS Numeric(18, 0)), CAST(9444494414 AS Numeric(18, 0)), N'ram.k@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (5, N'', 12, N'rahul', CAST(644654656 AS Numeric(18, 0)), CAST(564555666 AS Numeric(18, 0)), N'rahul.m@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (6, N'', 12, N'ranjith', CAST(213342423 AS Numeric(18, 0)), CAST(956554566 AS Numeric(18, 0)), N'ranjith.r@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (7, N'', 13, N'mohan', CAST(234242343 AS Numeric(18, 0)), CAST(234324324 AS Numeric(18, 0)), N'mohan.n@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (11, NULL, 39, N'sdaf', CAST(9444552342 AS Numeric(18, 0)), CAST(944455234 AS Numeric(18, 0)), N'asfsdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (12, NULL, 39, N'asdasdd', CAST(465442423 AS Numeric(18, 0)), CAST(4654423423 AS Numeric(18, 0)), N'adasdsad', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (13, NULL, 42, N'sdsasa', CAST(3123 AS Numeric(18, 0)), CAST(3123 AS Numeric(18, 0)), N'asdsad', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (14, NULL, 42, N'dddd', CAST(23432 AS Numeric(18, 0)), CAST(23432 AS Numeric(18, 0)), N'fgfgfg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (15, NULL, 42, N'sdfds', CAST(234324 AS Numeric(18, 0)), CAST(234324 AS Numeric(18, 0)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (16, NULL, 43, N'sfdsd', CAST(23 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), N'sfs', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (17, NULL, 43, N'fsdfdf', CAST(44 AS Numeric(18, 0)), CAST(44 AS Numeric(18, 0)), N'dfs', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (24, NULL, 50, N'Sathiyanathan.M', CAST(9347295864 AS Numeric(18, 0)), CAST(9446545775 AS Numeric(18, 0)), N'www.sathiya.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (25, NULL, 51, N'safasdf', CAST(234324 AS Numeric(18, 0)), CAST(124124 AS Numeric(18, 0)), N'asfdasf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (26, NULL, 51, N'dfadsfaf', CAST(652343 AS Numeric(18, 0)), CAST(132245 AS Numeric(18, 0)), N'rfgresgreg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (27, NULL, 52, N'sdfsdfd', CAST(3243234532 AS Numeric(18, 0)), CAST(523523445 AS Numeric(18, 0)), N'ghghh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (28, NULL, 52, N' ddew', CAST(2343243 AS Numeric(18, 0)), CAST(423432424 AS Numeric(18, 0)), N'assdfdsf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (29, NULL, 53, N'vdfvgdfd', CAST(2434234242 AS Numeric(18, 0)), CAST(2423423423 AS Numeric(18, 0)), N'dfgfgfd', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (30, NULL, 53, N'dsfdsfdsf', CAST(2342342342 AS Numeric(18, 0)), CAST(2424234432 AS Numeric(18, 0)), N'3fsfsdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (31, NULL, 53, N'sdsdfsfs', CAST(2343242342 AS Numeric(18, 0)), CAST(2424234234 AS Numeric(18, 0)), N' fsefsfsdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (32, NULL, 53, N'vvvvvv', CAST(2344234443 AS Numeric(18, 0)), CAST(2234234324 AS Numeric(18, 0)), N'rrrr', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (33, NULL, 53, N'dsfdsf', CAST(3242343232 AS Numeric(18, 0)), CAST(5353453443 AS Numeric(18, 0)), N'vvvvvvvs', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (34, NULL, 54, N'aaaaaaa', CAST(2222222222 AS Numeric(18, 0)), CAST(2222223 AS Numeric(18, 0)), N'aaaaaaa', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (35, NULL, 54, N'bbbbbbbbbb', CAST(33333333 AS Numeric(18, 0)), CAST(33333435 AS Numeric(18, 0)), N'bbbbbbb', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (36, NULL, 55, N'ajay', CAST(987654624 AS Numeric(18, 0)), CAST(9444465822 AS Numeric(18, 0)), N'AJAY@GMAIL.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (37, NULL, 56, N'Dass', CAST(8097876565 AS Numeric(18, 0)), CAST(9087098760 AS Numeric(18, 0)), N'dass@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (38, NULL, 57, N'dfgfdg', CAST(6543534 AS Numeric(18, 0)), CAST(543543 AS Numeric(18, 0)), N'dff@hg.fg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (39, NULL, 58, N'siva', CAST(8766756456 AS Numeric(18, 0)), CAST(74534543 AS Numeric(18, 0)), N'siva@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (40, NULL, 41, N'ramm', CAST(213342423 AS Numeric(18, 0)), CAST(2234234324 AS Numeric(18, 0)), N'anu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customercode_contactperson_mapping] ([id], [customer_code], [customer_id], [person_name], [contact_number1], [contact_number2], [contact_mail], [status], [created_date], [created_by], [update_date], [updated_by], [remark]) VALUES (41, NULL, 41, N'veera', CAST(2222222222 AS Numeric(18, 0)), CAST(2423423423 AS Numeric(18, 0)), N'anu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customercode_contactperson_mapping] OFF
/****** Object:  Table [dbo].[customer_portfolio_details]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__customer__6A9E4CB7164452B1] UNIQUE NONCLUSTERED 
(
	[customer_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[customer_portfolio_details] ON
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (12, N'cus-001', N'HT', N'Siva', CAST(9444494414 AS Numeric(18, 0)), N'+91', NULL, N'siva.com', NULL, NULL, N'Mumbai', N'', N'Mumbai', N'Tamil Nadu', N'India', N'606901', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (13, N'cus-002', N'Break parts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Kerla', N'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (14, N'cus-003', N'EnnVee Solutions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'New York', N'America', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (15, N'cus-004', N'Bayerische Motoren Werke AG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Paris', N'Frances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (39, N'sdfsdf', N'dfsdfsd', NULL, CAST(213213 AS Numeric(18, 0)), NULL, NULL, N'sfdsdf', N'sdcsaa', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (40, N'YT474', N'EnnVee Solution', NULL, CAST(0 AS Numeric(18, 0)), NULL, NULL, N'www.ennVee.com', N'', N'', N'NO.36,VSI Estate', N'Thiruvanmiyur', N'Chennai', N'Tamilnadu', N'India', N'600048', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (41, N'rup-002', N'hello', NULL, CAST(234234322 AS Numeric(18, 0)), NULL, NULL, N'www.cc.com', NULL, N'', N'asdsad', N'adsad', N'Mumbai', N'asdasd', N'sdfsdf', N'606901', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (42, N'fffe222', N'adasdasdsad', NULL, CAST(954555855 AS Numeric(18, 0)), NULL, NULL, N'adasdsad', N'adad', N'', N'adsadsad', N'adsad', N'adsada', N'aaa', N'adsad', N'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (43, N'vsSDVdsv', N'sdd', NULL, CAST(234324 AS Numeric(18, 0)), NULL, NULL, N'sdvsdv', N'sds', N'', N'sfsdf', N'sfs', N'sdfsdf', N'sdf', N'sdf', N'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (45, N'5654', N'21363', NULL, CAST(0 AS Numeric(18, 0)), NULL, NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (48, N'bh', N'nbhj   ', NULL, CAST(0 AS Numeric(18, 0)), NULL, NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (49, N'CC09', N'EnnVee Solution', NULL, CAST(9048464564 AS Numeric(18, 0)), NULL, NULL, N'www.ennVee.com', N'ennvee@gmail.com', N'', N'NO.36,VSI Estate', N'Thiruvanmiyur', N'Chennai', N'Tamilnadu', N'India', N'600048', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (50, N'Cus09', N'', NULL, CAST(0 AS Numeric(18, 0)), NULL, NULL, N'www.ennVee.com', N'', N'', N'NO.36,VSI Estate', N'Thiruvanmiyur', N'Chennai', N'Tamilnadu', N'India', N'600048', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (51, N'tatae', N'asdgfsdfg', NULL, CAST(0 AS Numeric(18, 0)), NULL, NULL, N'gd', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (52, N'rrrrrrr', N'rrrrrrrr', NULL, CAST(23424234 AS Numeric(18, 0)), NULL, NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (53, N'd21312', N'sfsdfsd', NULL, CAST(23423424 AS Numeric(18, 0)), NULL, NULL, N'sdfsdfds', N'sdfsfdsf', N'', N'sdfsfsf', N'fsdfsd', N'sfsdfs', N'sdfsdf', N'sdfsdf', N'sdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (54, N'ttttttt', N'bbbbbbbb', NULL, CAST(234234322 AS Numeric(18, 0)), NULL, NULL, N'cccccccccc', N'eeeeeeee', N'', N'ggggggg', N'hhhhhhhhhh', N'iiiiiiiiii', N'jjjjjjjjj', N'kkkkkkkkkk', N'lllllllll', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (55, N'365464', N'sds6546', NULL, CAST(1478985669 AS Numeric(18, 0)), NULL, NULL, N'sdfsdf6548', N'asdkjh@sds.com', N'', N'asd', N'asd', N'asd', N'asd', N'sd', N'546', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (56, N'122', N'siva', NULL, CAST(9807651234 AS Numeric(18, 0)), NULL, NULL, N'www.siva.com', N'', N'', N'12,Sivan Kovil St', N'', N'Ayikudy.', N'Tamil Nadu', N'India', N'627852', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (57, N'CST0111', N'fgfd', NULL, CAST(4534543 AS Numeric(18, 0)), NULL, NULL, N'www.fg.ffg', NULL, N'', N'gfdg', N'', N'dgfdg', N'dfgdf', N'gfdg', N'6345', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (58, N'CST01234', N'gbox', NULL, CAST(9084534343 AS Numeric(18, 0)), NULL, NULL, N'www.gbox.com', NULL, N'', N'gbox', N'', N'chennai', N'Tamil nadu', N'india', N'600004', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (59, N'gfdgd', N'ffd df', NULL, CAST(576756 AS Numeric(18, 0)), NULL, NULL, N'fg.bnn', NULL, N'', N'hjghj12', N'', N'bvcb', N'gfhgf', N'vcbvc', N'5645645', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer_portfolio_details] ([customer_id], [customer_code], [company_name], [contact_person], [contact_phone1], [area_code], [contact_phone2], [website_name], [customer_mail], [customer_door], [customer_street1], [customer_street2], [customer_city], [customer_state], [customer_country], [customer_zipcode], [created_date], [create_by], [updated_date], [updated_by], [status], [remark], [customer_type]) VALUES (60, N'dfgfd', N'fgdf fdf.fd', NULL, CAST(4543 AS Numeric(18, 0)), N'', NULL, N'sd.gfgf', NULL, N'', N'sdfdsf', N'', N'sdfdsf', N'sdfsd', N'sdfdsf', N'32454', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer_portfolio_details] OFF
/****** Object:  Table [dbo].[activity_table]    Script Date: 08/17/2017 16:14:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[timesheetupdate]    Script Date: 08/17/2017 16:14:25 ******/
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
/****** Object:  StoredProcedure [dbo].[editcontactperson]    Script Date: 08/17/2017 16:14:25 ******/
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
