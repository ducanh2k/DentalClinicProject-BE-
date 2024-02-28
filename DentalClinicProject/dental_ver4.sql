USE [master]
GO
/****** Object:  Database [dental]    Script Date: 2/28/2024 11:15:37 PM ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 2/28/2024 11:15:38 PM ******/
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
	[status] [bit] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas_of_expertise]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[commentDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK__comment__3213E83F32FDA717] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[Foreign_Language]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prescriptionId] [int] NULL,
	[patientId] [int] NULL,
	[appointmentId] [int] NULL,
	[discount] [float] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[recordId] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NULL,
	[appointmentId] [int] NULL,
	[serviceId] [int] NULL,
	[prescriptionId] [int] NULL,
	[diagnosis] [nvarchar](50) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[recordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 2/28/2024 11:15:38 PM ******/
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
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](50) NULL,
	[brief_info] [nvarchar](50) NULL,
	[description] [text] NULL,
	[author] [int] NULL,
	[created_at] [date] NULL,
	[delete_flag] [bit] NULL,
	[featured] [bit] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participating_training_courses]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[Prescription]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[quantity] [int] NULL,
	[dosageInstruction] [nvarchar](50) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 2/28/2024 11:15:38 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/28/2024 11:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[date_created] [date] NULL,
	[phone] [nchar](11) NULL,
	[email] [nvarchar](50) NULL,
	[img] [nvarchar](50) NULL,
	[description] [text] NULL,
	[salary] [float] NULL,
	[role] [int] NULL,
	[password] [nchar](50) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
SET IDENTITY_INSERT [dbo].[Areas_of_expertise] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [patient_id], [commentDetail]) VALUES (1, 4, N'This is a comment for patient with ID 4. Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail]) VALUES (2, 10, N'This is a comment for patient with ID 10. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail]) VALUES (3, 18, N'This is a comment for patient with ID 18. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail]) VALUES (4, 20, N'This is a comment for patient with ID 20. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
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
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (1, N'Thuoc giam dau', N'abc', 200, 1, 1, NULL)
INSERT [dbo].[Material] ([material_id], [material_name], [supplier], [unitPrice], [quantityInStock], [Type], [delete_flag]) VALUES (2, N'Thuoc khang sinh', N'xyz', 100, 2, 0, NULL)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (1, N'Gan', N'abc', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 800, 30, N's 2 t 2', N'xyz')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (2, N'Than', N'xyz', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 500, 10, N'toi 2', N'abc')
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description]) VALUES (4, N'string', N'string', CAST(N'2024-02-28' AS Date), CAST(N'2024-02-28' AS Date), 0, 0, N'string', N'string')
SET IDENTITY_INSERT [dbo].[Medicine] OFF
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

INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (1, N'lam', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'string', N'string', N'string', 1, 1, N'abac                                              ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (2, N'koby', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'abv', N'acs', N'as', 2, 2, N'asLL                                              ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (3, N'kan', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'abas', N'abv', N'sa', 3, 3, N'asd                                               ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (4, N'lamlam', CAST(N'2024-02-22' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, N'asd                                               ', 1)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (5, N'string', CAST(N'2024-02-28' AS Date), N'string     ', N'string', N'string', N'string', 0, 1, N'asd                                               ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (6, N'eee', CAST(N'2024-02-27' AS Date), N'string     ', N'string', N'string', N'string', 10, 1, N'asd                                               ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (7, N'John Doe', CAST(N'2024-02-01' AS Date), N'12345678901', N'john.doe@example.com', N'john_doe.jpg', N'Description for John Doe', 3000, 1, N'password123                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (8, N'Jane Smith', CAST(N'2024-02-02' AS Date), N'23456789012', N'jane.smith@example.com', N'jane_smith.jpg', N'Description for Jane Smith', 3200, 2, N'password456                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (9, N'David Johnson', CAST(N'2024-02-03' AS Date), N'34567890123', N'david.johnson@example.com', N'david_johnson.jpg', N'Description for David Johnson', 3500, 3, N'password789                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (10, N'Emily Brown', CAST(N'2024-02-04' AS Date), N'45678901234', N'emily.brown@example.com', N'emily_brown.jpg', N'Description for Emily Brown', 3800, 4, N'passwordabc                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (11, N'Michael Williams', CAST(N'2024-02-05' AS Date), N'56789012345', N'michael.williams@example.com', N'michael_williams.jpg', N'Description for Michael Williams', 3200, 1, N'passworddef                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (12, N'Emma Taylor', CAST(N'2024-02-06' AS Date), N'67890123456', N'emma.taylor@example.com', N'emma_taylor.jpg', N'Description for Emma Taylor', 3400, 2, N'passwordghi                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (13, N'James Martinez', CAST(N'2024-02-07' AS Date), N'78901234567', N'james.martinez@example.com', N'james_martinez.jpg', N'Description for James Martinez', 3700, 3, N'passwordjkl                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (14, N'Olivia Anderson', CAST(N'2024-02-08' AS Date), N'89012345678', N'olivia.anderson@example.com', N'olivia_anderson.jpg', N'Description for Olivia Anderson', 3900, 4, N'passwordmno                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (15, N'William Jackson', CAST(N'2024-02-09' AS Date), N'90123456789', N'william.jackson@example.com', N'william_jackson.jpg', N'Description for William Jackson', 3300, 1, N'passwordpqr                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (16, N'Sophia Garcia', CAST(N'2024-02-10' AS Date), N'01234567890', N'sophia.garcia@example.com', N'sophia_garcia.jpg', N'Description for Sophia Garcia', 3600, 2, N'passwordstu                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (17, N'Benjamin Hernandez', CAST(N'2024-02-11' AS Date), N'12345678901', N'benjamin.hernandez@example.com', N'benjamin_hernandez.jpg', N'Description for Benjamin Hernandez', 3800, 3, N'passwordvwx                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (18, N'Isabella Lopez', CAST(N'2024-02-12' AS Date), N'23456789012', N'isabella.lopez@example.com', N'isabella_lopez.jpg', N'Description for Isabella Lopez', 4000, 4, N'passwordyz                                        ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (19, N'Ethan Gonzalez', CAST(N'2024-02-13' AS Date), N'34567890123', N'ethan.gonzalez@example.com', N'ethan_gonzalez.jpg', N'Description for Ethan Gonzalez', 3400, 1, N'password123                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (20, N'Mia Perez', CAST(N'2024-02-14' AS Date), N'45678901234', N'mia.perez@example.com', N'mia_perez.jpg', N'Description for Mia Perez', 3700, 2, N'password456                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (21, N'Alexander Wilson', CAST(N'2024-02-15' AS Date), N'56789012345', N'alexander.wilson@example.com', N'alexander_wilson.jpg', N'Description for Alexander Wilson', 3900, 3, N'password789                                       ', 0)
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [password], [delete_flag]) VALUES (22, N'Charlotte Carter', CAST(N'2024-02-16' AS Date), N'67890123456', N'charlotte.carter@example.com', N'charlotte_carter.jpg', N'Description for Charlotte Carter', 4200, 4, N'passwordabc                                       ', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_User] FOREIGN KEY([patient_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_User]
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
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Appointment] FOREIGN KEY([appointmentId])
REFERENCES [dbo].[Appointment] ([appointment_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Appointment]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Prescription] FOREIGN KEY([prescriptionId])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Prescription]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Appointment] FOREIGN KEY([appointmentId])
REFERENCES [dbo].[Appointment] ([appointment_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Appointment]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Prescription] FOREIGN KEY([prescriptionId])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Prescription]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Service] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Service]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_User] FOREIGN KEY([patientId])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_User]
GO
ALTER TABLE [dbo].[Participating_training_courses]  WITH CHECK ADD  CONSTRAINT [FK_Participating_training_courses_User] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Participating_training_courses] CHECK CONSTRAINT [FK_Participating_training_courses_User]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Medicine]
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
