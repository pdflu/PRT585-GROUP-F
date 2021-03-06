USE [school_applications_db]
GO
/****** Object:  Table [dbo].[applicant]    Script Date: 2021/05/25 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant](
	[applicant_id] [bigint] IDENTITY(1,1) NOT NULL,
	[applicant_name] [nvarchar](100) NOT NULL,
	[applicant_surname] [nvarchar](100) NOT NULL,
	[applicant_birthdate] [datetime2](7) NOT NULL,
	[contact_email] [nvarchar](250) NULL,
	[contact_number] [nvarchar](25) NOT NULL,
	[applicant_creationdate] [datetime2](7) NOT NULL,
	[applicant_modifieddate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_applicant] PRIMARY KEY CLUSTERED 
(
	[applicant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application]    Script Date: 2021/05/25 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[application_id] [bigint] IDENTITY(1,1) NOT NULL,
	[applicant_id] [bigint] NOT NULL,
	[grade_id] [bigint] NOT NULL,
	[application_status_id] [bigint] NOT NULL,
	[application_creationdate] [datetime2](7) NOT NULL,
	[application_modifieddate] [datetime2](7) NOT NULL,
	[application_schoolyear] [int] NOT NULL,
 CONSTRAINT [PK_application] PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application_status]    Script Date: 2021/05/25 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application_status](
	[application_status_id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_status_name] [nvarchar](100) NOT NULL,
	[application_status_creationdate] [datetime2](7) NOT NULL,
	[application_status_modifieddate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_application_status] PRIMARY KEY CLUSTERED 
(
	[application_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 2021/05/25 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[grade_id] [bigint] IDENTITY(1,1) NOT NULL,
	[grade_name] [nvarchar](100) NOT NULL,
	[grade_number] [int] NOT NULL,
	[grade_capacity] [int] NOT NULL,
	[grade_creationdate] [datetime2](7) NOT NULL,
	[grade_modifieddate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_grade] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[applicant] ADD  DEFAULT ('2021-05-25T19:02:01.4983060Z') FOR [applicant_creationdate]
GO
ALTER TABLE [dbo].[applicant] ADD  DEFAULT ('1900-01-01T00:00:00.0000000') FOR [applicant_modifieddate]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT ('2021-05-25T19:02:01.5209358Z') FOR [application_creationdate]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT ('1900-01-01T00:00:00.0000000') FOR [application_modifieddate]
GO
ALTER TABLE [dbo].[application_status] ADD  DEFAULT ('2021-05-25T19:02:01.5177352Z') FOR [application_status_creationdate]
GO
ALTER TABLE [dbo].[application_status] ADD  DEFAULT ('1900-01-01T00:00:00.0000000') FOR [application_status_modifieddate]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT ('2021-05-25T19:02:01.5201242Z') FOR [grade_creationdate]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT ('1900-01-01T00:00:00.0000000') FOR [grade_modifieddate]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_application_applicant_applicant_id] FOREIGN KEY([applicant_id])
REFERENCES [dbo].[applicant] ([applicant_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_application_applicant_applicant_id]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_application_application_status_application_status_id] FOREIGN KEY([application_status_id])
REFERENCES [dbo].[application_status] ([application_status_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_application_application_status_application_status_id]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_application_grade_grade_id] FOREIGN KEY([grade_id])
REFERENCES [dbo].[grade] ([grade_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_application_grade_grade_id]
GO
