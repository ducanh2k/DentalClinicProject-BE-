USE [master]
GO
/****** Object:  Database [dental]    Script Date: 3/12/2024 2:41:16 PM ******/
CREATE DATABASE [dental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dental] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dental] SET ARITHABORT OFF 
GO
ALTER DATABASE [dental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dental] SET  MULTI_USER 
GO
ALTER DATABASE [dental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dental] SET QUERY_STORE = ON
GO
ALTER DATABASE [dental] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dental]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[patient_id] [int] NULL,
	[datetime] [date] NULL,
	[note] [nvarchar](100) NULL,
	[status] [nvarchar](50) NULL,
	[delete_flag] [bit] NULL,
	[doctor_id] [int] NULL,
	[medicalRecordDetail_id] [int] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas_of_expertise]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas_of_expertise](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[detail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[commentDetail] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
	[created_at] [datetime] NULL,
	[doctor_id] [int] NULL,
	[rating_star] [int] NULL,
 CONSTRAINT [PK__comment__3213E83F32FDA717] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[detail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foreign_Language]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foreign_Language](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[detail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[StaffId] [int] NULL,
	[Date] [datetime] NULL,
	[discount] [float] NULL,
	[Status] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[PaymentId] [int] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceLines]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLines](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[ServiceId] [int] NULL,
	[MaterialId] [int] NULL,
	[Quantity] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_InvoiceLines] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_name] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[unitPrice] [float] NULL,
	[quantityInStock] [int] NULL,
	[Type] [bit] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[medicalRecordId] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[medicalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord Details]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord Details](
	[mr_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[medicalRecord_id] [int] NULL,
	[service_id] [int] NULL,
	[prescription_id] [int] NULL,
	[diagnosis] [nvarchar](500) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_MedicalRecord Details] PRIMARY KEY CLUSTERED 
(
	[mr_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[manufacturer] [nvarchar](50) NULL,
	[expiry_date] [date] NULL,
	[input_day] [date] NULL,
	[price] [float] NULL,
	[quantityInStock] [int] NULL,
	[dosage] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [text] NULL,
	[brief_info] [text] NULL,
	[description] [text] NULL,
	[author] [int] NULL,
	[created_at] [date] NULL,
	[delete_flag] [bit] NULL,
	[featured] [bit] NULL,
	[img] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participating_training_courses]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participating_training_courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[detail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[prescription_id] [int] IDENTITY(1,1) NOT NULL,
	[delete_flag] [bit] NULL,
	[created_date] [datetime] NULL,
	[doctor_id] [int] NULL,
	[note] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[prescription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription Details]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription Details](
	[prescriptionDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[prescription_id] [int] NULL,
	[medicineId] [int] NULL,
	[quantity] [int] NULL,
	[dosageInstruction] [nvarchar](1000) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Prescription Details] PRIMARY KEY CLUSTERED 
(
	[prescriptionDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[brief_info] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[price] [float] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/12/2024 2:41:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[date_created] [date] NULL,
	[phone] [nchar](11) NULL,
	[email] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[description] [text] NULL,
	[salary] [float] NULL,
	[role] [int] NULL,
	[delete_flag] [bit] NULL,
	[password_hash] [varbinary](max) NULL,
	[password_salt] [varbinary](max) NULL,
	[refresh_token] [nvarchar](255) NULL,
	[token_created] [datetime] NULL,
	[token_expires] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (1, 2, 4, CAST(N'2024-03-01' AS Date), N'Routine checkup', N'2', 0, 9, 2)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (5, 2, 4, CAST(N'2024-03-09' AS Date), N'Dental filling', N'2', 0, 13, 3)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (7, 12, 4, CAST(N'2024-03-11' AS Date), N'Teeth whitening', N'2', 0, 9, 11)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (8, 16, 4, CAST(N'2024-03-12' AS Date), N'Checkup after braces', N'2', 0, NULL, 13)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (9, 2, 4, CAST(N'2024-03-13' AS Date), N'Follow-up examination', N'2', 0, 17, 15)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (11, 12, 4, CAST(N'2024-03-15' AS Date), N'Tooth extraction', N'2', 0, 9, 16)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (18, 2, 4, CAST(N'2024-03-02' AS Date), N'Routine checkup', N'2', 0, 9, 2)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Areas_of_expertise] ON 

INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (1, 3, N'Database Management')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (2, 9, N'Strategic Management')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (3, 13, N'Creative Writing')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (4, 17, N'Power Systems')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (5, 21, N'Applied Mathematics')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (6, 3, N'Database Management')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (7, 3, N'Data Analysis')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (8, 3, N'Financial Management')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (9, 9, N'Strategic Management')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (10, 9, N'Econometrics')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (11, 9, N'Financial Analysis')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (12, 13, N'Creative Writing')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (13, 13, N'Literary Criticism')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (14, 13, N'Teaching English Literature')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (15, 17, N'Power Systems')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (16, 17, N'Signal Processing')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (17, 17, N'Control Systems')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (18, 21, N'Numerical Analysis')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (19, 21, N'Probability Theory')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (20, 21, N'Statistical Modeling')
INSERT [dbo].[Areas_of_expertise] ([id], [employee_id], [detail]) VALUES (22, 22, N'string')
SET IDENTITY_INSERT [dbo].[Areas_of_expertise] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (1, 4, N'This is a comment for patient with ID 4. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (2, 10, N'This is a comment for patient with ID 10. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (3, 18, N'This is a comment for patient with ID 18. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (4, 20, N'This is a comment for patient with ID 20. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 4)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (5, 3, N'This service was excellent. Highly recommended!', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 5)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (6, 4, N'I had a great experience with the dental team. Thank you!', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), 9, 5)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (7, 10, N'The staff was friendly and professional. Very satisfied.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), 13, 4)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (8, 14, N'Highly impressed with the quality of care provided.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (9, 18, N'Outstanding service! Will definitely return for future appointments.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (10, 22, N'The dental clinic exceeded my expectations. Thank you!', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (11, 23, N'Great experience overall. Would recommend to friends and family.', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (12, 24, N'Excellent service from start to finish. Thank you!', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 4)
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (13, 11, N's22tring', 0, CAST(N'2024-03-04T16:53:35.237' AS DateTime), NULL, 4)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Degree] ON 

INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (1, 3, N'Bachelor of Science in Computer Science')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (2, 9, N'Master of Business Administration')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (3, 13, N'Bachelor of Arts in English Literature')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (4, 17, N'Bachelor of Science in Electrical Engineering')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (5, 21, N'Master of Science in Mathematics')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (6, 3, N'Bachelor of Science in Computer Science')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (7, 3, N'Master of Business Administration')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (8, 3, N'Master of Science in Data Science')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (9, 9, N'Master of Business Administration')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (10, 9, N'Bachelor of Arts in Economics')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (11, 9, N'Master of Finance')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (12, 13, N'Bachelor of Arts in English Literature')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (13, 13, N'Master of Fine Arts in Creative Writing')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (14, 13, N'Master of Education in Teaching English as a Second Language')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (15, 17, N'Bachelor of Science in Electrical Engineering')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (16, 17, N'Master of Science in Electrical Engineering')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (17, 17, N'Ph.D. in Electrical Engineering')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (18, 21, N'Bachelor of Science in Mathematics')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (19, 21, N'Master of Science in Applied Mathematics')
INSERT [dbo].[Degree] ([id], [employee_id], [detail]) VALUES (20, 21, N'Ph.D. in Statistics')
SET IDENTITY_INSERT [dbo].[Degree] OFF
GO
SET IDENTITY_INSERT [dbo].[Foreign_Language] ON 

INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (1, 3, N'Spanish')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (3, 13, N'French')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (4, 17, N'German')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (5, 21, N'Japanese')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (6, 3, N'Spanish')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (9, 9, N'Spanish')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (10, 9, N'German')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (12, 13, N'French')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (13, 13, N'Spanish')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (16, 17, N'French')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (17, 17, N'Russian')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (18, 21, N'Japanese')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (19, 21, N'Korean')
INSERT [dbo].[Foreign_Language] ([id], [employee_id], [detail]) VALUES (20, 21, N'Italian')
SET IDENTITY_INSERT [dbo].[Foreign_Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (2, 3, 2, CAST(N'2024-02-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (3, 4, 8, CAST(N'2024-03-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (4, 10, 12, CAST(N'2024-02-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (5, 3, 2, CAST(N'2025-04-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (6, 4, 8, CAST(N'2025-02-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (7, 10, 12, CAST(N'2025-12-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (8, 3, 2, CAST(N'2027-01-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (9, 4, 8, CAST(N'2027-02-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (10, 10, 12, CAST(N'2027-03-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (11, 3, 2, CAST(N'2027-04-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (12, 4, 8, CAST(N'2027-05-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (13, 10, 12, CAST(N'2027-06-28T00:00:00.000' AS DateTime), 0.1, 2, N'Sample comment', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (14, 22, 16, CAST(N'2024-05-10T19:57:56.823' AS DateTime), 0, 2, N'string', 2, 0)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceLines] ON 

INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (2, 2, 20, 10, 5, N'Sample comment', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (3, 2, 21, 11, 6, N'Sample comment', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (4, 3, 22, 12, 7, N'Sample comment', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (5, 2, 20, 10, 5, N'Sample comment 1', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (6, 2, 21, 11, 6, N'Sample comment 2', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (7, 2, 22, 12, 7, N'Sample comment 3', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (8, 3, 23, 13, 8, N'Sample comment 4', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (9, 3, 24, 14, 9, N'Sample comment 5', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (10, 3, 25, 15, 10, N'Sample comment 6', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (11, 4, 28, 11, 5, N'Sample comment 7', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (12, 4, 30, 12, 7, N'Sample comment 8', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (13, 5, 35, 13, 10, N'Sample comment 9', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (14, 5, 40, 14, 8, N'Sample comment 10', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (15, 6, 25, 11, 15, N'Sample comment 11', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (16, 6, 30, 12, 20, N'Sample comment 12', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (17, 7, 30, 12, 15, N'Sample comment 13', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (18, 7, 35, 13, 20, N'Sample comment 14', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (19, 8, 25, 11, 10, N'Sample comment 15', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (20, 8, 40, 14, 25, N'Sample comment 16', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (21, 9, 30, 12, 15, N'Sample comment 17', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (22, 9, 45, 13, 20, N'Sample comment 18', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (23, 10, 25, 11, 10, N'Sample comment for InvoiceId 10', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (24, 10, 30, 12, 15, N'Another comment for InvoiceId 10', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (25, 11, 35, 13, 20, N'Sample comment for InvoiceId 11', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (26, 11, 40, 14, 25, N'Another comment for InvoiceId 11', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (27, 12, 45, 15, 30, N'Sample comment for InvoiceId 12', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (28, 12, 50, 10, 35, N'Another comment for InvoiceId 12', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (34, 12, 22, 11, 3, N'stri22ng', 0)
SET IDENTITY_INSERT [dbo].[InvoiceLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (1, N'Thuoc giam dau', N'abc', 200, 1, 1, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (2, N'Thuoc khang sinh', N'xyz', 100, 2, 0, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (7, N'Material 1', N'Supplier 1', 10.5, 100, 1, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (8, N'Material 2', N'Supplier 2', 15.7, 150, 0, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (9, N'Material 3', N'Supplier 3', 20.3, 200, 1, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (10, N'Material 4', N'Supplier 4', 25.2, 250, 0, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (11, N'Material 5', N'Supplier 5', 30.8, 300, 1, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (12, N'Material 6', N'Supplier 6', 35.1, 350, 0, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (13, N'Material 7', N'Supplier 7', 40.2, 400, 1, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (14, N'Material 50', N'Supplier 50', 55, 550, 0, 0)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (15, N'stri345ng', N'string', 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 

INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (1, 3, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (2, 4, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (3, 10, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (4, 14, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (5, 18, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (6, 22, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (7, 23, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (8, 24, 0)
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord Details] ON 

INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (2, 2, 2, 1, N'strin2g', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (3, 2, 2, 17, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (11, 2, 37, 16, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (13, 2, 38, NULL, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (15, 2, 33, 12, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (16, 2, 34, 13, N'string', 0)
SET IDENTITY_INSERT [dbo].[MedicalRecord Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (1, N'Gan', N'abc', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 800, 30, N's 2 t 2', N'xyz', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (2, N'Than', N'xyz', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 500, 10, N'toi 2', N'abc', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (4, N'string', N'string', CAST(N'2024-02-28' AS Date), CAST(N'2024-02-28' AS Date), 0, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (5, N'Medicine 1', N'Manufacturer 1', CAST(N'2024-02-28' AS Date), CAST(N'2024-02-28' AS Date), 15.805144154056011, 72, N'Dosage 1', N'Description for Medicine 1', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (6, N'Medicine 2', N'Manufacturer 2', CAST(N'2024-02-27' AS Date), CAST(N'2024-02-27' AS Date), 25.607243040046463, 430, N'Dosage 2', N'Description for Medicine 2', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (7, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (8, N'Medicine 4', N'Manufacturer 4', CAST(N'2024-02-25' AS Date), CAST(N'2024-02-25' AS Date), 72.383006586122448, 380, N'Dosage 4', N'Description for Medicine 4', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (9, N'Medicine 5', N'Manufacturer 5', CAST(N'2024-02-24' AS Date), CAST(N'2024-02-24' AS Date), 34.3408617237881, 762, N'Dosage 5', N'Description for Medicine 5', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (10, N'Medicine 6', N'Manufacturer 6', CAST(N'2024-02-23' AS Date), CAST(N'2024-02-23' AS Date), 96.514253480938152, 188, N'Dosage 6', N'Description for Medicine 6', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (11, N'Medicine 7', N'Manufacturer 7', CAST(N'2024-02-22' AS Date), CAST(N'2024-02-22' AS Date), 99.359315222022573, 773, N'Dosage 7', N'Description for Medicine 7', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (12, N'Medicine 8', N'Manufacturer 8', CAST(N'2024-02-21' AS Date), CAST(N'2024-02-21' AS Date), 64.629008147358718, 925, N'Dosage 8', N'Description for Medicine 8', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (13, N'Medicine 9', N'Manufacturer 9', CAST(N'2024-02-20' AS Date), CAST(N'2024-02-20' AS Date), 78.178314061830463, 306, N'Dosage 9', N'Description for Medicine 9', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (14, N'Medicine 10', N'Manufacturer 10', CAST(N'2024-02-19' AS Date), CAST(N'2024-02-19' AS Date), 29.91643997425707, 487, N'Dosage 10', N'Description for Medicine 10', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (15, N'Medicine 11', N'Manufacturer 11', CAST(N'2024-02-18' AS Date), CAST(N'2024-02-18' AS Date), 75.409070967649129, 415, N'Dosage 11', N'Description for Medicine 11', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (16, N'Medicine 12', N'Manufacturer 12', CAST(N'2024-02-17' AS Date), CAST(N'2024-02-17' AS Date), 78.908132537597623, 997, N'Dosage 12', N'Description for Medicine 12', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (17, N'Medicine 13', N'Manufacturer 13', CAST(N'2024-02-16' AS Date), CAST(N'2024-02-16' AS Date), 62.516789910978524, 862, N'Dosage 13', N'Description for Medicine 13', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (18, N'Medicine 14', N'Manufacturer 14', CAST(N'2024-02-15' AS Date), CAST(N'2024-02-15' AS Date), 98.945921050186215, 844, N'Dosage 14', N'Description for Medicine 14', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (19, N'Medicine 15', N'Manufacturer 15', CAST(N'2024-02-14' AS Date), CAST(N'2024-02-14' AS Date), 43.091709875629739, 976, N'Dosage 15', N'Description for Medicine 15', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (20, N'Medicine 16', N'Manufacturer 16', CAST(N'2024-02-13' AS Date), CAST(N'2024-02-13' AS Date), 50.766485497122851, 455, N'Dosage 16', N'Description for Medicine 16', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (21, N'Medicine 17', N'Manufacturer 17', CAST(N'2024-02-12' AS Date), CAST(N'2024-02-12' AS Date), 29.696973291339638, 573, N'Dosage 17', N'Description for Medicine 17', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (22, N'Medicine 18', N'Manufacturer 18', CAST(N'2024-02-11' AS Date), CAST(N'2024-02-11' AS Date), 83.127819591060927, 167, N'Dosage 18', N'Description for Medicine 18', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (23, N'Medicine 19', N'Manufacturer 19', CAST(N'2024-02-10' AS Date), CAST(N'2024-02-10' AS Date), 26.105903521203221, 240, N'Dosage 19', N'Description for Medicine 19', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (24, N'Medicine 20', N'Manufacturer 20', CAST(N'2024-02-09' AS Date), CAST(N'2024-02-09' AS Date), 38.489941066559844, 684, N'Dosage 20', N'Description for Medicine 20', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (25, N'Medicine 21', N'Manufacturer 21', CAST(N'2024-02-08' AS Date), CAST(N'2024-02-08' AS Date), 91.237919656747764, 818, N'Dosage 21', N'Description for Medicine 21', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (26, N'Medicine 22', N'Manufacturer 22', CAST(N'2024-02-07' AS Date), CAST(N'2024-02-07' AS Date), 75.111270228618267, 524, N'Dosage 22', N'Description for Medicine 22', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (27, N'Medicine 23', N'Manufacturer 23', CAST(N'2024-02-06' AS Date), CAST(N'2024-02-06' AS Date), 99.4376973809483, 309, N'Dosage 23', N'Description for Medicine 23', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (28, N'Medicine 24', N'Manufacturer 24', CAST(N'2024-02-05' AS Date), CAST(N'2024-02-05' AS Date), 83.427653453893711, 52, N'Dosage 24', N'Description for Medicine 24', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (29, N'Medicine 25', N'Manufacturer 25', CAST(N'2024-02-04' AS Date), CAST(N'2024-02-04' AS Date), 23.801366236600423, 822, N'Dosage 25', N'Description for Medicine 25', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (30, N'Medicine 26', N'Manufacturer 26', CAST(N'2024-02-03' AS Date), CAST(N'2024-02-03' AS Date), 92.270214064431656, 316, N'Dosage 26', N'Description for Medicine 26', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (31, N'Medicine 27', N'Manufacturer 27', CAST(N'2024-02-02' AS Date), CAST(N'2024-02-02' AS Date), 55.488108446761, 648, N'Dosage 27', N'Description for Medicine 27', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (32, N'Medicine 28', N'Manufacturer 28', CAST(N'2024-02-01' AS Date), CAST(N'2024-02-01' AS Date), 83.3503632707165, 596, N'Dosage 28', N'Description for Medicine 28', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (33, N'Medicine 29', N'Manufacturer 29', CAST(N'2024-01-31' AS Date), CAST(N'2024-01-31' AS Date), 51.388517118948364, 306, N'Dosage 29', N'Description for Medicine 29', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (34, N'Medicine 30', N'Manufacturer 30', CAST(N'2024-01-30' AS Date), CAST(N'2024-01-30' AS Date), 94.182382343686655, 188, N'Dosage 30', N'Description for Medicine 30', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (35, N'Medicine 31', N'Manufacturer 31', CAST(N'2024-01-29' AS Date), CAST(N'2024-01-29' AS Date), 18.41480540012412, 11, N'Dosage 31', N'Description for Medicine 31', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (36, N'Medicine 32', N'Manufacturer 32', CAST(N'2024-01-28' AS Date), CAST(N'2024-01-28' AS Date), 84.708321680411913, 591, N'Dosage 32', N'Description for Medicine 32', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (37, N'Medicine 33', N'Manufacturer 33', CAST(N'2024-01-27' AS Date), CAST(N'2024-01-27' AS Date), 38.034680917055027, 147, N'Dosage 33', N'Description for Medicine 33', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (38, N'Medicine 34', N'Manufacturer 34', CAST(N'2024-01-26' AS Date), CAST(N'2024-01-26' AS Date), 18.066950634824, 324, N'Dosage 34', N'Description for Medicine 34', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (39, N'Medicine 35', N'Manufacturer 35', CAST(N'2024-01-25' AS Date), CAST(N'2024-01-25' AS Date), 43.737317742809736, 847, N'Dosage 35', N'Description for Medicine 35', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (40, N'Medicine 36', N'Manufacturer 36', CAST(N'2024-01-24' AS Date), CAST(N'2024-01-24' AS Date), 1.08223448663304, 889, N'Dosage 36', N'Description for Medicine 36', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (41, N'Medicine 37', N'Manufacturer 37', CAST(N'2024-01-23' AS Date), CAST(N'2024-01-23' AS Date), 7.2662300082446105, 768, N'Dosage 37', N'Description for Medicine 37', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (42, N'Medicine 38', N'Manufacturer 38', CAST(N'2024-01-22' AS Date), CAST(N'2024-01-22' AS Date), 58.394234449590265, 934, N'Dosage 38', N'Description for Medicine 38', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (43, N'Medicine 39', N'Manufacturer 39', CAST(N'2024-01-21' AS Date), CAST(N'2024-01-21' AS Date), 37.5931510703775, 60, N'Dosage 39', N'Description for Medicine 39', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (44, N'Medicine 40', N'Manufacturer 40', CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date), 13.751001285800482, 257, N'Dosage 40', N'Description for Medicine 40', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (45, N'Medicine 41', N'Manufacturer 41', CAST(N'2024-01-19' AS Date), CAST(N'2024-01-19' AS Date), 26.694991189302154, 244, N'Dosage 41', N'Description for Medicine 41', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (46, N'Medicine 42', N'Manufacturer 42', CAST(N'2024-01-18' AS Date), CAST(N'2024-01-18' AS Date), 80.4172552689168, 640, N'Dosage 42', N'Description for Medicine 42', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (47, N'Medicine 43', N'Manufacturer 43', CAST(N'2024-01-17' AS Date), CAST(N'2024-01-17' AS Date), 11.144565768689731, 30, N'Dosage 43', N'Description for Medicine 43', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (48, N'Medicine 44', N'Manufacturer 44', CAST(N'2024-01-16' AS Date), CAST(N'2024-01-16' AS Date), 70.269508293394679, 589, N'Dosage 44', N'Description for Medicine 44', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (49, N'Medicine 45', N'Manufacturer 45', CAST(N'2024-01-15' AS Date), CAST(N'2024-01-15' AS Date), 7.41859438560461, 280, N'Dosage 45', N'Description for Medicine 45', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (50, N'Medicine 46', N'Manufacturer 46', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date), 27.787632926593414, 774, N'Dosage 46', N'Description for Medicine 46', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (51, N'Medicine 47', N'Manufacturer 47', CAST(N'2024-01-13' AS Date), CAST(N'2024-01-13' AS Date), 95.731163119620348, 411, N'Dosage 47', N'Description for Medicine 47', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (52, N'Medicine 48', N'Manufacturer 48', CAST(N'2024-01-12' AS Date), CAST(N'2024-01-12' AS Date), 64.193624750444414, 206, N'Dosage 48', N'Description for Medicine 48', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (53, N'Medicine 49', N'Manufacturer 49', CAST(N'2024-01-11' AS Date), CAST(N'2024-01-11' AS Date), 73.0502845606915, 937, N'Dosage 49', N'Description for Medicine 49', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (54, N'Medicine 50', N'Manufacturer 50', CAST(N'2024-01-10' AS Date), CAST(N'2024-01-10' AS Date), 39.303930942232711, 957, N'Dosage 50', N'Description for Medicine 50', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (55, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10, 0, N's 2 t 2', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (56, N'Test Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (57, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (58, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (59, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (61, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (62, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (63, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (64, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (65, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 1, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (66, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 0, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (67, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (68, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (69, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10.99, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (70, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 1, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (71, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 1, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (72, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 0, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (73, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 0, 0, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (74, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (75, N'string', N'string', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-29' AS Date), 0, 0, N'string', N'string', 1)
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (1, N'Breaking: New Study Reveals Surprising Benefits of Green Tea', N'Researchers uncover health benefits of daily green tea consumption.', N'A groundbreaking study published in the Journal of Nutrition has unveiled exciting findings about the potential health benefits of drinking green tea. The research, conducted over five years by a team of international scientists, suggests that consuming green tea daily may reduce the risk of heart disease, promote weight loss, and boost overall well-being. Experts believe that the antioxidants present in green tea play a key role in these health benefits. The study has garnered widespread attention from health enthusiasts and researchers worldwide.', 2, CAST(N'2024-02-29' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (2, N'Tech Giants Announce Collaboration to Combat Online Misinformation', N'Facebook, Google, and Twitter join forces to address misinformation on their platforms.', N'In a groundbreaking move, leading technology companies Facebook, Google, and Twitter have announced a collaborative effort to tackle the spread of misinformation online. The initiative, named "Project Truth," aims to enhance content moderation practices, improve fact-checking mechanisms, and promote media literacy among users. The tech giants have pledged to work closely with independent fact-checkers, researchers, and policymakers to combat the proliferation of false information and promote a safer online environment for users worldwide.', 8, CAST(N'2024-02-29' AS Date), 0, 0, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (3, N'Climate Change Report Warns of Dire Consequences Without Urgent Action', N'UN report highlights the urgent need for global cooperation to address climate crisis.', N'A new report released by the United Nations Intergovernmental Panel on Climate Change (IPCC) has issued a stark warning about the escalating impacts of climate change and the urgent need for immediate action. The report, based on extensive scientific research and input from leading experts, paints a grim picture of the future if significant steps are not taken to curb greenhouse gas emissions and mitigate the effects of global warming. The findings underscore the critical importance of international cooperation and bold policy measures to address the climate crisis and safeguard the planet for future generations.', 12, CAST(N'2024-02-29' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (4, N'SpaceX Successfully Launches Next-Generation Starship Prototype', N'Elon Musk''s space company achieves major milestone in its quest for Mars colonization.', N'SpaceX, the aerospace manufacturer founded by billionaire entrepreneur Elon Musk, has achieved a significant milestone with the successful launch and landing of its next-generation Starship prototype. The Starship, a fully reusable spacecraft designed for crewed missions to Mars and beyond, completed a high-altitude test flight, demonstrating key technologies and capabilities essential for future space exploration. The successful test marks a major step forward in SpaceX''s ambitious goal of establishing a sustainable human presence on Mars and advancing the future of space travel.', 16, CAST(N'2024-02-29' AS Date), 0, 0, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (5, N'Global Economic Summit Addresses Post-Pandemic Recovery Challenges', N'World leaders gather to discuss strategies for rebuilding economies in the wake of COVID-19.', N'Leaders from around the world have convened at the Global Economic Summit to address the complex challenges of economic recovery in the aftermath of the COVID-19 pandemic. The summit, held virtually due to ongoing health concerns, focuses on developing coordinated strategies to stimulate growth, create jobs, and address disparities exacerbated by the global health crisis. Discussions center on measures to enhance international trade, strengthen healthcare systems, and promote sustainable development in a post-pandemic world. The summit comes at a critical juncture as nations seek to rebuild and revive their economies while navigating ongoing uncertainties.', 20, CAST(N'2024-02-29' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (6, N'New Research Study Finds Link Between Diet and Longevity', N'Study suggests that dietary choices may impact lifespan.', N'A new research study conducted by leading nutritionists and health experts has uncovered a potential link between diet and longevity. The study, which analyzed data from over 10,000 participants, found that individuals who adhere to a plant-based diet rich in fruits, vegetables, and whole grains may have a lower risk of chronic diseases and a longer lifespan. These findings highlight the importance of making healthy dietary choices for overall health and well-being.', 8, CAST(N'2024-02-29' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (7, N'Global Summit Addresses Climate Change Threat', N'World leaders gather to discuss urgent action on climate crisis.', N'In a landmark summit convened by the United Nations, global leaders have come together to address the escalating threat of climate change. The summit, attended by heads of state, policymakers, and environmental advocates, aims to mobilize collective action to mitigate the impacts of global warming and transition to a sustainable, low-carbon future. Discussions center on ambitious targets for reducing greenhouse gas emissions, promoting renewable energy sources, and protecting vulnerable communities from the ravages of climate change.', 12, CAST(N'2024-02-29' AS Date), 0, 0, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (8, N'Tech Giants Unveil Plans for Next-Generation Smartphone', N'Apple, Samsung, and Google reveal latest innovations in mobile technology.', N'Leading technology companies Apple, Samsung, and Google have unveiled their plans for the next-generation smartphone, promising groundbreaking features and capabilities. The highly anticipated devices, set to launch later this year, boast cutting-edge technologies such as foldable displays, advanced camera systems, and enhanced artificial intelligence. Industry analysts predict that these new smartphones will redefine the mobile experience and set new standards for innovation in the tech industry.', 20, CAST(N'2024-02-29' AS Date), 0, 0, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (9, N'Breakthrough in Medical Science: New Treatment for Alzheimers Disease', N'Researchers announce promising findings in the fight against Alzheimers.', N'In a significant breakthrough, scientists have announced the development of a potential new treatment for Alzheimers disease. The experimental therapy, which targets the underlying causes of the neurodegenerative disorder, has shown promising results in early clinical trials. If successful, the treatment could offer hope to millions of people affected by Alzheimers and revolutionize the way we approach dementia care. Researchers are cautiously optimistic about the prospects of this innovative therapy and continue to explore its efficacy and safety.', 16, CAST(N'2024-02-29' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (10, N'New Study Reveals Benefits of Meditation for Mental Health', N'Research suggests meditation can reduce stress and anxiety.', N'A recent study published in the Journal of Clinical Psychology sheds light on the mental health benefits of meditation. The study, conducted over a two-year period, found that regular meditation practice can significantly reduce symptoms of stress, anxiety, and depression. Participants who engaged in mindfulness meditation reported improved mood, better sleep quality, and enhanced overall well-being. These findings highlight the potential of meditation as a cost-effective and accessible tool for promoting mental health and resilience.', 2, CAST(N'2024-03-01' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (11, N'Major Breakthrough in Renewable Energy: New Solar Panel Technology', N'Innovative solar panels promise to revolutionize renewable energy sector.', N'Scientists have announced a major breakthrough in renewable energy with the development of a groundbreaking solar panel technology. The new panels, based on advanced photovoltaic materials and design principles, boast unprecedented efficiency and durability. Initial tests have shown that the panels can generate significantly more electricity from sunlight compared to conventional solar panels. With the potential to drive down costs and increase energy production, the innovation holds promise for accelerating the transition to a sustainable, low-carbon future.', 8, CAST(N'2024-03-01' AS Date), 0, 0, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (12, N'Global Efforts Underway to Combat Plastic Pollution', N'World leaders unite to address environmental crisis caused by plastic waste.', N'In response to mounting concerns about plastic pollution, governments and environmental organizations are stepping up efforts to curb the proliferation of single-use plastics and promote sustainable alternatives. The global campaign, spearheaded by the United Nations Environment Programme, aims to raise awareness about the environmental impacts of plastic waste and mobilize action at the local, national, and international levels. Initiatives include bans on plastic bags, recycling programs, and community clean-up drives. The concerted efforts reflect a growing recognition of the urgent need to protect the planets oceans, wildlife, and ecosystems from the scourge of plastic pollution.', 12, CAST(N'2024-03-01' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (13, N'Artificial Intelligence Revolutionizes Healthcare Industry', N'AI-powered technologies offer new possibilities for diagnosis and treatment.', N'Artificial intelligence is reshaping the healthcare landscape, with innovative technologies driving improvements in patient care, diagnosis, and treatment outcomes. Machine learning algorithms analyze vast amounts of medical data to identify patterns and insights that can inform clinical decision-making. From early disease detection to personalized treatment plans, AI-enabled solutions are revolutionizing every aspect of healthcare delivery. As the technology continues to evolve, experts predict that AI will play an increasingly prominent role in transforming the future of medicine and improving global health outcomes.', 16, CAST(N'2024-03-01' AS Date), 0, 1, N'a.png')
INSERT [dbo].[News] ([id], [tittle], [brief_info], [description], [author], [created_at], [delete_flag], [featured], [img]) VALUES (14, N'str22ing', N'string33', N'string', 2, CAST(N'2024-03-04' AS Date), 0, 1, N'a.png')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Participating_training_courses] ON 

INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (1, 3, N'SQL Fundamentals')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (2, 9, N'Project Management Professional (PMP) Certification')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (3, 13, N'Technical Writing Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (4, 17, N'Renewable Energy Training')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (5, 21, N'Statistical Analysis Techniques')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (6, 3, N'SQL Fundamentals')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (7, 3, N'Financial Modeling Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (8, 3, N'Data Visualization Techniques')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (9, 9, N'Project Management Professional (PMP) Certification')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (10, 9, N'Financial Risk Management Training')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (11, 9, N'Leadership Development Program')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (12, 13, N'Technical Writing Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (13, 13, N'Modern Poetry Seminar')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (14, 13, N'Teaching English as a Second Language (TESOL) Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (15, 17, N'Renewable Energy Training')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (16, 17, N'Electric Power Distribution Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (17, 17, N'Advanced Control Systems Seminar')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (18, 21, N'Statistical Analysis Techniques')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (19, 21, N'Mathematical Modeling Workshop')
INSERT [dbo].[Participating_training_courses] ([id], [employee_id], [detail]) VALUES (20, 21, N'Stochastic Processes Course')
SET IDENTITY_INSERT [dbo].[Participating_training_courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [PaymentName]) VALUES (1, N'Tiền mặt')
INSERT [dbo].[Payment] ([PaymentId], [PaymentName]) VALUES (2, N'Internet Banking')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription] ON 

INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (1, 0, CAST(N'2024-03-03T16:12:27.907' AS DateTime), 9, N'No special instructions')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (12, 0, CAST(N'2024-03-03T16:13:47.350' AS DateTime), 17, N'Take after breakfast')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (13, 0, CAST(N'2024-03-03T16:13:47.350' AS DateTime), 9, N'No special instructions')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (16, 0, CAST(N'2024-03-03T16:13:47.350' AS DateTime), 9, N'No special instructions')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (17, 0, CAST(N'2024-03-03T16:13:47.350' AS DateTime), 13, N'Avoid dairy products')
SET IDENTITY_INSERT [dbo].[Prescription] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription Details] ON 

INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (1, 1, 1, 2, N'Take twice daily', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (6, 12, 25, 2, N'Take one tablet daily with food', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (7, 12, 30, 1, N'Take two capsules daily before bedtime', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (8, 13, 10, 3, N'Take three times a day after meals', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (9, 13, 20, 2, N'Take as directed by the physician', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (10, 16, 15, 1, N'Take with water before meals', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (11, 17, 40, 2, N'Take one tablet twice daily', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (12, 17, 45, 1, N'Take as needed for pain relief', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (13, 1, 22, 2, N'hehe', 0)
SET IDENTITY_INSERT [dbo].[Prescription Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Doctor')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'Patient')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (1, N'Cấy ghép implant', N'abc', N'bbc', 1000, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (2, N'Chỉnh nha', N'abv', N'acs', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (3, N'Nhổ răng khôn', N'abc', N'abc', 800, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (6, N'a', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (7, N'b', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (8, N'c', N'abc', N'abc', 500, 1)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (9, N'd', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (10, N'e', N'abc', N'abc', 500, 1)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (11, N'f', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (12, N'g', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (13, N'h', N'abc', N'abc', 500, 1)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (14, N'i', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (15, N'ka', N'abc', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (16, N'alpha', N'500', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (17, N'beta', N'500', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (18, N'gammar', N'500', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (19, N'delta', N'500', N'abc', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (20, N'abc', N'abc', N'efc', 10, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (21, N'abc', N'abc', N'efc', 10, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (22, N'testhehe', N'abc', N'efc', 10, 1)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (23, N'string', N'string', N'string', 10, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (24, N'Orthodontics', N'Teeth alignment', N'Align teeth using braces or aligners', 100, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (25, N'Teeth Cleaning', N'Dental hygiene', N'Professional cleaning and plaque removal', 80, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (26, N'Dental Implants', N'Tooth replacement', N'Implanting artificial tooth roots into the jaw', 1500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (27, N'Root Canal Therapy', N'Tooth nerve treatment', N'Remove infected pulp and seal the tooth', 700, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (28, N'Dental Crowns', N'Tooth restoration', N'Cap that covers a tooth to restore its shape', 900, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (29, N'Dental Fillings', N'Tooth decay treatment', N'Filling materials to repair damaged teeth', 120, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (30, N'Dental Bridges', N'Tooth replacement', N'Bridge to replace missing teeth', 1200, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (31, N'Teeth Whitening', N'Cosmetic procedure', N'Bleaching to whiten discolored teeth', 200, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (32, N'Gum Disease Treatment', N'Periodontal therapy', N'Treatment to prevent gum diseases', 300, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (33, N'Pediatric Dentistry', N'Children dental care', N'Dental care for children and infants', 70, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (34, N'Dental Veneers', N'Cosmetic procedure', N'Thin layer of porcelain to cover teeth', 1000, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (35, N'Dental Extractions', N'Tooth removal', N'Removal of one or more teeth', 150, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (36, N'Dental Sealants', N'Tooth protection', N'Protective coating for cavity prevention', 50, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (37, N'TMJ Treatment', N'Jaw disorder therapy', N'Treatment for temporomandibular joint disorders', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (38, N'Dental X-Rays', N'Diagnostic tool', N'X-ray images for dental diagnosis', 80, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (39, N'Oral Cancer Screening', N'Early detection', N'Screening for oral cancer symptoms', 60, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (40, N'Night Guards', N'Bruxism treatment', N'Dental appliance for teeth grinding prevention', 250, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (41, N'Dentures', N'Tooth replacement', N'Removable prosthetic teeth', 800, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (42, N'Inlays and Onlays', N'Tooth restoration', N'Indirect fillings for tooth restoration', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (43, N'Emergency Dentistry', N'Urgent dental care', N'Immediate dental treatment for emergencies', 200, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (44, N'Dental Bonding', N'Tooth restoration', N'Applying composite resin to repair teeth', 150, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (45, N'Dental Inlays', N'Tooth restoration', N'Indirect fillings for tooth decay or damage', 300, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (46, N'Dental Onlays', N'Tooth restoration', N'Indirect restorations for damaged teeth', 350, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (47, N'Fluoride Treatment', N'Tooth protection', N'Application of fluoride to prevent tooth decay', 50, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (48, N'Digital Impressions', N'Dental technology', N'Digital scanning for accurate dental impressions', 100, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (49, N'Mouth Guards', N'Oral protection', N'Custom-fitted guards for sports or bruxism', 200, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (50, N'Gum Contouring', N'Cosmetic procedure', N'Reshaping gum tissue for aesthetic purposes', 500, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (51, N'Dental Exam', N'Oral health assessment', N'Comprehensive examination of dental health', 80, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (52, N'Dental Consultation', N'Professional advice', N'Discussion of dental concerns and treatment options', 50, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (53, N'Teeth Sensitivity Treatment', N'Oral discomfort relief', N'Treatment to reduce tooth sensitivity', 75, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (54, N'Dental Fillers', N'Cosmetic procedure', N'Injectable fillers for smile enhancement', 300, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (55, N'Dental Repairs', N'Tooth restoration', N'Repairs for chipped, cracked, or broken teeth', 200, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (56, N'Wisdom Teeth Extraction', N'Tooth removal', N'Extraction of impacted wisdom teeth', 400, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (57, N'Dental Hygiene Education', N'Oral care guidance', N'Education on proper oral hygiene practices', 30, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (58, N'Dental Restorations', N'Tooth repair', N'Restoration of damaged or decayed teeth', 250, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (59, N'Dental Prophylaxis', N'Preventive dental care', N'Regular teeth cleaning and gum care', 70, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (60, N'Dental Examination', N'Oral health check-up', N'Evaluation of oral health status', 60, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (61, N'Root Planing', N'Gum disease treatment', N'Deep cleaning to remove tartar and bacteria', 120, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (62, N'Dental Anesthesia', N'Pain management', N'Administration of local or general anesthesia', 100, 0)
INSERT [dbo].[Service] ([service_id], [service_name], [brief_info], [description], [price], [delete_flag]) VALUES (63, N'Dental Check-Up', N'Routine examination', N'Regular dental assessment for preventive care', 40, 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (1, N'lam', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'string', N'string', N'string', 1, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (2, N'koby', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'abv', N'acs', N'as', 2, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (3, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (4, N'lamlam', CAST(N'2024-02-22' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (5, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (6, N'eee', CAST(N'2024-02-27' AS Date), N'string     ', N'string', N'string', N'string', 10, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (7, N'John Doe', CAST(N'2024-02-01' AS Date), N'12345678901', N'john.doe@example.com', N'john_doe.jpg', N'Description for John Doe', 3000, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (8, N'Jane Smith', CAST(N'2024-02-02' AS Date), N'23456789012', N'jane.smith@example.com', N'jane_smith.jpg', N'Description for Jane Smith', 3200, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (9, N'David Johnson', CAST(N'2024-02-03' AS Date), N'34567890123', N'david.johnson@example.com', N'david_johnson.jpg', N'Description for David Johnson', 3500, 3, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (10, N'Emily Brown', CAST(N'2024-02-04' AS Date), N'45678901234', N'emily.brown@example.com', N'emily_brown.jpg', N'Description for Emily Brown', 3800, 4, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (11, N'Michael Williams', CAST(N'2024-02-05' AS Date), N'56789012345', N'michael.williams@example.com', N'michael_williams.jpg', N'Description for Michael Williams', 3200, 4, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (12, N'Emma Taylor', CAST(N'2024-02-06' AS Date), N'67890123456', N'emma.taylor@example.com', N'emma_taylor.jpg', N'Description for Emma Taylor', 3400, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (13, N'James Martinez', CAST(N'2024-02-07' AS Date), N'78901234567', N'james.martinez@example.com', N'james_martinez.jpg', N'Description for James Martinez', 3700, 3, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (14, N'Olivia Anderson', CAST(N'2024-02-08' AS Date), N'89012345678', N'olivia.anderson@example.com', N'olivia_anderson.jpg', N'Description for Olivia Anderson', 3900, 4, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (15, N'William Jackson', CAST(N'2024-02-09' AS Date), N'90123456789', N'william.jackson@example.com', N'william_jackson.jpg', N'Description for William Jackson', 3300, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (16, N'Sophia Garcia', CAST(N'2024-02-10' AS Date), N'01234567890', N'sophia.garcia@example.com', N'sophia_garcia.jpg', N'Description for Sophia Garcia', 3600, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (17, N'Benjamin Hernandez', CAST(N'2024-02-11' AS Date), N'12345678901', N'benjamin.hernandez@example.com', N'benjamin_hernandez.jpg', N'Description for Benjamin Hernandez', 3800, 3, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (18, N'Isabella Lopez', CAST(N'2024-02-12' AS Date), N'23456789012', N'isabella.lopez@example.com', N'isabella_lopez.jpg', N'Description for Isabella Lopez', 4000, 4, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (19, N'Ethan Gonzalez', CAST(N'2024-02-13' AS Date), N'34567890123', N'ethan.gonzalez@example.com', N'ethan_gonzalez.jpg', N'Description for Ethan Gonzalez', 3400, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (20, N'Mia Perez', CAST(N'2024-02-14' AS Date), N'45678901234', N'mia.perez@example.com', N'mia_perez.jpg', N'Description for Mia Perez', 3700, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (21, N'Alexander Wilson', CAST(N'2024-02-15' AS Date), N'56789012345', N'alexander.wilson@example.com', N'alexander_wilson.jpg', N'Description for Alexander Wilson', 3900, 3, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (22, N'Charlotte Carter', CAST(N'2024-02-16' AS Date), N'67890123456', N'charlotte.carter@example.com', N'charlotte_carter.jpg', N'Description for Charlotte Carter', 4200, 4, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (23, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires]) VALUES (24, N'string', CAST(N'2024-02-29' AS Date), N'67890123456', N'67890123456', N'charlotte_carter.jpg', N'string', 0, 4, 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_MedicalRecord Details] FOREIGN KEY([medicalRecordDetail_id])
REFERENCES [dbo].[MedicalRecord Details] ([mr_detail_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_MedicalRecord Details]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User1] FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User2] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User2]
GO
ALTER TABLE [dbo].[Areas_of_expertise]  WITH CHECK ADD  CONSTRAINT [FK_Areas_of_expertise_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Areas_of_expertise] CHECK CONSTRAINT [FK_Areas_of_expertise_User]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_User] FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_User]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_User1] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_User1]
GO
ALTER TABLE [dbo].[Degree]  WITH CHECK ADD  CONSTRAINT [FK_Degree_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Degree] CHECK CONSTRAINT [FK_Degree_User]
GO
ALTER TABLE [dbo].[Foreign_Language]  WITH CHECK ADD  CONSTRAINT [FK_Foreign_Language_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Foreign_Language] CHECK CONSTRAINT [FK_Foreign_Language_User]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Payment]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User1]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User2] FOREIGN KEY([StaffId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User2]
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLines_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceLines] CHECK CONSTRAINT [FK_InvoiceLines_Invoice]
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLines_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([material_id])
GO
ALTER TABLE [dbo].[InvoiceLines] CHECK CONSTRAINT [FK_InvoiceLines_Material]
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLines_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[InvoiceLines] CHECK CONSTRAINT [FK_InvoiceLines_Service]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_User] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_User]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_User1] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_User1]
GO
ALTER TABLE [dbo].[MedicalRecord Details]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord Details_MedicalRecord] FOREIGN KEY([medicalRecord_id])
REFERENCES [dbo].[MedicalRecord] ([medicalRecordId])
GO
ALTER TABLE [dbo].[MedicalRecord Details] CHECK CONSTRAINT [FK_MedicalRecord Details_MedicalRecord]
GO
ALTER TABLE [dbo].[MedicalRecord Details]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord Details_Prescription] FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([prescription_id])
GO
ALTER TABLE [dbo].[MedicalRecord Details] CHECK CONSTRAINT [FK_MedicalRecord Details_Prescription]
GO
ALTER TABLE [dbo].[MedicalRecord Details]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord Details_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[MedicalRecord Details] CHECK CONSTRAINT [FK_MedicalRecord Details_Service]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([author])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[Participating_training_courses]  WITH CHECK ADD  CONSTRAINT [FK_Participating_training_courses_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Participating_training_courses] CHECK CONSTRAINT [FK_Participating_training_courses_User]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_User] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_User]
GO
ALTER TABLE [dbo].[Prescription Details]  WITH CHECK ADD  CONSTRAINT [FK_Prescription Details_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[Prescription Details] CHECK CONSTRAINT [FK_Prescription Details_Medicine]
GO
ALTER TABLE [dbo].[Prescription Details]  WITH CHECK ADD  CONSTRAINT [FK_Prescription Details_Prescription] FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([prescription_id])
GO
ALTER TABLE [dbo].[Prescription Details] CHECK CONSTRAINT [FK_Prescription Details_Prescription]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [dental] SET  READ_WRITE 
GO
