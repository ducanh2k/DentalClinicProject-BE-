USE [master]
GO
/****** Object:  Database [dental]    Script Date: 3/24/2024 1:07:50 AM ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Areas_of_expertise]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Degree]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Foreign_Language]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[InvoiceLines]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[MedicalRecord Details]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Medicine]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Participating_training_courses]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Prescription]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Prescription Details]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 3/24/2024 1:07:51 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2024 1:07:51 AM ******/
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
	[gender] [bit] NULL,
	[address] [nvarchar](max) NULL,
	[dob] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (1, 2, 4, CAST(N'2024-03-01' AS Date), N'Routine checkup', N'Doned', 0, 9, 2)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (5, 2, 4, CAST(N'2024-03-09' AS Date), N'Dental filling', N'Doned', 0, 13, 3)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (7, 12, 4, CAST(N'2024-03-11' AS Date), N'Teeth whitening', N'Doned', 0, 9, 11)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (8, 16, 4, CAST(N'2024-03-12' AS Date), N'Checkup after braces', N'Doned', 0, NULL, 13)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (9, 2, 4, CAST(N'2024-03-13' AS Date), N'Follow-up examination', N'Doned', 0, 17, 15)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (11, 12, 4, CAST(N'2024-03-15' AS Date), N'Tooth extraction', N'Doned', 0, 9, 16)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (18, 2, 4, CAST(N'2024-03-02' AS Date), N'Routine checkup', N'Doned', 0, 9, 2)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (19, 90, 32, CAST(N'2021-10-13' AS Date), N'Open fracture of C1-C4 level with other specified spinal cord injury', N'Doned', 0, 87, 102)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (20, 97, 39, CAST(N'2023-11-28' AS Date), N'History of emotional abuse', N'Doned', 0, 82, 199)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (21, 97, 60, CAST(N'2022-08-27' AS Date), N'Family history of malignant neoplasm, bladder', N'Doned', 0, 77, 199)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (22, 90, 28, CAST(N'2023-06-25' AS Date), N'Onychia and paronychia of finger', N'Doned', 0, 84, 297)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (23, 90, 53, CAST(N'2023-01-06' AS Date), N'Malignant neoplasm of submandibular gland', N'Doned', 0, 77, 266)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (24, 91, 52, CAST(N'2021-05-31' AS Date), N'Necrotizing fasciitis', N'Doned', 0, 82, 171)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (25, 93, 45, CAST(N'2021-03-18' AS Date), N'Other vitreous opacities', N'Doned', 0, 81, 255)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (26, 95, 44, CAST(N'2022-04-13' AS Date), N'Prophylactic breast removal', N'Doned', 0, 82, 181)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (27, 89, 44, CAST(N'2021-11-04' AS Date), N'Glaucoma stage, unspecified', N'Doned', 0, 78, 259)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (28, 97, 42, CAST(N'2021-07-06' AS Date), N'Erythema [first degree] of upper arm', N'Doned', 0, 84, 32)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (30, 96, 71, CAST(N'2021-02-23' AS Date), N'Unspecified disorder of adrenal glands', N'Doned', 0, 87, 102)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (31, 91, 66, CAST(N'2022-10-28' AS Date), N'Blisters, epidermal loss [second degree], unspecified site', N'Doned', 0, 87, 240)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (32, 94, 27, CAST(N'2021-06-08' AS Date), N'Longitudinal deficiency of upper limb, not elsewhere classified', N'Doned', 0, 83, 185)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (33, 98, 65, CAST(N'2022-08-04' AS Date), N'Other specified causes of urethral stricture', N'Doned', 0, 79, 31)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (34, 91, 74, CAST(N'2021-05-22' AS Date), N'Malignant neoplasm of other specified sites of pleura', N'Doned', 0, 85, 259)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (35, 97, 42, CAST(N'2021-12-20' AS Date), N'Postphlebetic syndrome without complications', N'Doned', 0, 82, 262)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (36, 92, 65, CAST(N'2021-01-03' AS Date), N'Rubella in the mother, delivered, with mention of postpartum complication', N'Doned', 0, 80, 153)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (37, 89, 43, CAST(N'2023-05-22' AS Date), N'Other closed fractures of distal end of radius (alone)', N'Doned', 0, 79, 20)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (38, 98, 54, CAST(N'2023-02-11' AS Date), N'Contracture of joint, site unspecified', N'Doned', 0, 84, 102)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (39, 93, 48, CAST(N'2021-09-06' AS Date), N'Chorioretinal degeneration, congenital', N'Doned', 0, 85, 109)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (40, 99, 45, CAST(N'2021-10-08' AS Date), N'Arthropathy associated with helminthiasis, pelvic region and thigh', N'Doned', 0, 87, 125)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (41, 90, 75, CAST(N'2023-06-21' AS Date), N'Acute nasopharyngitis [common cold]', N'Doned', 0, 76, 206)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (42, 99, 47, CAST(N'2021-08-20' AS Date), N'Fourth-degree perineal laceration, unspecified as to episode of care or not applicable', N'Doned', 0, 82, 21)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (43, 89, 36, CAST(N'2023-04-28' AS Date), N'Burn [any degree] involving 70-79 percent of body surface with third degree burn, 50-59%', N'Doned', 0, 87, 237)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (44, 88, 67, CAST(N'2023-10-22' AS Date), N'Burn [any degree] involving 80-89 percent of body surface with third degree burn, 30-39%', N'Doned', 0, 79, 90)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (45, 93, 54, CAST(N'2024-01-01' AS Date), N'Third-stage postpartum hemorrhage, unspecified as to episode of care or not applicable', N'Doned', 0, 86, 247)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (46, 91, 68, CAST(N'2021-05-24' AS Date), N'Benign neoplasm of lacrimal gland', N'Doned', 0, 77, 115)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (47, 96, 64, CAST(N'2024-02-06' AS Date), N'Disturbances of tooth formation', N'Doned', 0, 86, 209)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (48, 89, 35, CAST(N'2024-01-09' AS Date), N'Other specified paralytic syndrome', N'Doned', 0, 83, 311)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (49, 91, 28, CAST(N'2021-04-03' AS Date), N'Other specified paranoid states', N'Doned', 0, 79, 230)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (50, 99, 55, CAST(N'2022-08-16' AS Date), N'Late effect of burn of wrist and hand', N'Doned', 0, 87, 96)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (52, 90, 75, CAST(N'2022-10-05' AS Date), N'Diabetic macular edema', N'Doned', 0, 80, 292)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (53, 88, 40, CAST(N'2023-04-08' AS Date), N'Chronic pyelonephritis without lesion of renal medullary necrosis', N'Doned', 0, 87, 165)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (54, 88, 59, CAST(N'2022-11-01' AS Date), N'Major anomalies of jaw size, macrogenia', N'Doned', 0, 79, 171)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (55, 88, 61, CAST(N'2023-10-01' AS Date), N'Other specified disorders of uterus, not elsewhere classified', N'Doned', 0, 78, 133)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (56, 88, 32, CAST(N'2023-07-14' AS Date), N'Suicide and self-inflicted injury by electrocution', N'Doned', 0, 77, 94)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (57, 92, 49, CAST(N'2021-01-23' AS Date), N'Immunodeficiency with predominant T-cell defect, unspecified', N'Doned', 0, 86, 178)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (58, 92, 42, CAST(N'2021-01-20' AS Date), N'Threatened abortion, antepartum condition or complication', N'Doned', 0, 76, 72)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (59, 96, 48, CAST(N'2023-08-26' AS Date), N'Benign neoplasm of respiratory and intrathoracic organs, site unspecified', N'Doned', 0, 79, 100)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (60, 89, 60, CAST(N'2023-12-24' AS Date), N'Obesity, unspecified', N'Doned', 0, 82, 283)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (61, 90, 51, CAST(N'2022-01-03' AS Date), N'Lesion of ulnar nerve', N'Doned', 0, 86, 193)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (62, 95, 47, CAST(N'2022-07-04' AS Date), N'Postherpetic polyneuropathy', N'Doned', 0, 84, 162)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (63, 88, 54, CAST(N'2021-07-24' AS Date), N'Chronic congestive splenomegaly', N'Doned', 0, 84, 41)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (65, 94, 52, CAST(N'2021-04-18' AS Date), N'Infertility due to extratesticular causes', N'Doned', 0, 82, 252)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (66, 92, 41, CAST(N'2024-03-08' AS Date), N'Dissection of iliac artery', N'Doned', 0, 81, 37)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (67, 94, 47, CAST(N'2023-04-24' AS Date), N'Hepatorenal syndrome', N'Doned', 0, 80, 118)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (68, 88, 52, CAST(N'2022-01-24' AS Date), N'Disturbances in tooth eruption', N'Doned', 0, 78, 265)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (69, 92, 48, CAST(N'2023-03-01' AS Date), N'Other benign neoplasm of connective and other soft tissue of head, face, and neck', N'Doned', 0, 84, 254)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (70, 97, 34, CAST(N'2023-04-28' AS Date), N'Influenza with other manifestations', N'Doned', 0, 79, 35)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (71, 97, 29, CAST(N'2023-10-03' AS Date), N'Coronary atherosclerosis of native coronary artery', N'Doned', 0, 77, 35)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (72, 96, 65, CAST(N'2022-01-20' AS Date), N'Solitary pulmonary nodule', N'Doned', 0, 86, 87)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (74, 89, 44, CAST(N'2023-03-10' AS Date), N'Allergic arthritis, other specified sites', N'Doned', 0, 82, 59)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (75, 91, 56, CAST(N'2022-01-12' AS Date), N'Legally induced abortion, without mention of complication, incomplete', N'Doned', 0, 78, 66)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (76, 88, 60, CAST(N'2022-05-11' AS Date), N'Other specified vaccinations against hemophilus influenza, type B [Hib]', N'Doned', 0, 85, 293)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (78, 97, 33, CAST(N'2021-08-21' AS Date), N'Venomous snakes and lizards causing poisoning and toxic reactions', N'Doned', 0, 82, 300)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (79, 98, 68, CAST(N'2023-07-10' AS Date), N'Rheumatic chorea with heart involvement', N'Doned', 0, 79, 221)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (80, 92, 41, CAST(N'2022-05-10' AS Date), N'Syphilis, unspecified', N'Doned', 0, 80, 231)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (81, 94, 51, CAST(N'2021-10-24' AS Date), N'Syphilitic disseminated retinochoroiditis', N'Doned', 0, 78, 128)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (82, 99, 43, CAST(N'2022-01-22' AS Date), N'Bed confinement status', N'Doned', 0, 80, 228)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (83, 98, 68, CAST(N'2023-06-12' AS Date), N'Extreme immaturity, 2,500 grams and over', N'Doned', 0, 87, 19)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (84, 98, 69, CAST(N'2023-10-18' AS Date), N'Arthroscopic surgical procedure converted to open procedure', N'Doned', 0, 86, 307)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (85, 95, 49, CAST(N'2022-04-05' AS Date), N'Poisoning by butyrophenone-based tranquilizers', N'Doned', 0, 87, 69)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (86, 95, 48, CAST(N'2023-11-29' AS Date), N'Inactive Ménière''s disease', N'Doned', 0, 84, 287)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (87, 91, 59, CAST(N'2023-09-08' AS Date), N'Hidden penis', N'Doned', 0, 85, 311)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (88, 96, 60, CAST(N'2022-08-13' AS Date), N'Closed dislocation, sixth cervical vertebra', N'Doned', 0, 86, 231)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (89, 89, 68, CAST(N'2022-09-18' AS Date), N'Staphyloma posticum', N'Doned', 0, 82, 281)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (90, 91, 70, CAST(N'2023-08-09' AS Date), N'Tuberculous laryngitis, bacteriological or histological examination not done', N'Doned', 0, 84, 314)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (91, 92, 36, CAST(N'2021-01-23' AS Date), N'Other motor vehicle nontraffic accident of other and unspecified nature injuring unspecified person', N'Doned', 0, 78, 132)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (92, 95, 52, CAST(N'2022-05-30' AS Date), N'Accidents caused by earth moving, scraping, and other excavating machines', N'Doned', 0, 78, 294)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (93, 96, 52, CAST(N'2021-03-03' AS Date), N'Vogt-koyanagi syndrome', N'Doned', 0, 80, 259)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (94, 98, 50, CAST(N'2023-12-01' AS Date), N'Adhesive capsulitis of shoulder', N'Doned', 0, 87, 240)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (95, 96, 58, CAST(N'2022-08-04' AS Date), N'Injury to blood vessels of unspecified site', N'Doned', 0, 87, 148)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (96, 88, 28, CAST(N'2022-10-01' AS Date), N'Toxic effect of venom', N'Doned', 0, 81, 24)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (98, 91, 40, CAST(N'2023-03-16' AS Date), N'Other ovarian hyperfunction', N'Doned', 0, 77, 52)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (99, 95, 63, CAST(N'2023-07-11' AS Date), N'Dissection of aorta, unspecified site', N'Doned', 0, 85, 269)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (100, 91, 33, CAST(N'2023-05-28' AS Date), N'Malunion of fracture', N'Doned', 0, 76, 216)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (101, 91, 45, CAST(N'2022-03-01' AS Date), N'Neoplasm of uncertain behavior of other and unspecified respiratory organs', N'Doned', 0, 83, 23)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (102, 97, 65, CAST(N'2024-02-11' AS Date), N'Acute myocardial infarction of other anterior wall, initial episode of care', N'Doned', 0, 86, 135)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (103, 88, 35, CAST(N'2022-03-30' AS Date), N'Other specific developmental learning difficulties', N'Doned', 0, 87, 230)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (104, 89, 42, CAST(N'2023-06-21' AS Date), N'Basal cell carcinoma of skin of lower limb, including hip', N'Doned', 0, 81, 296)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (105, 96, 40, CAST(N'2024-02-22' AS Date), N'Outlet contraction of pelvis, delivered, with or without mention of antepartum condition', N'Doned', 0, 76, 233)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (106, 98, 36, CAST(N'2021-08-07' AS Date), N'Other and unspecified diseases of appendix', N'Doned', 0, 85, 254)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (107, 99, 73, CAST(N'2022-08-22' AS Date), N'Personal history of perinatal problems', N'Doned', 0, 84, 232)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (109, 88, 32, CAST(N'2022-09-18' AS Date), N'Gingival recession, generalized', N'Doned', 0, 86, 124)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (110, 95, 43, CAST(N'2023-07-20' AS Date), N'Other specified conditions involving the integument of fetus and newborn', N'Doned', 0, 80, 252)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (111, 96, 53, CAST(N'2021-05-21' AS Date), N'True posterior wall infarction, initial episode of care', N'Doned', 0, 80, 54)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (112, 94, 74, CAST(N'2021-07-11' AS Date), N'Other household maintenance', N'Doned', 0, 86, 110)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (114, 97, 51, CAST(N'2021-03-07' AS Date), N'Other specified malignant neoplasm of skin of upper limb, including shoulder', N'Doned', 0, 82, 226)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (115, 89, 41, CAST(N'2023-09-07' AS Date), N'Deep seated dermatophytosis', N'Doned', 0, 84, 315)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (116, 96, 45, CAST(N'2021-03-30' AS Date), N'Catatonic type schizophrenia, subchronic', N'Doned', 0, 85, 298)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (117, 88, 62, CAST(N'2021-01-14' AS Date), N'Arthritis due to rubella', N'Doned', 0, 82, 296)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (118, 95, 51, CAST(N'2023-01-17' AS Date), N'Closed fracture of malar and maxillary bones', N'Doned', 0, 76, 46)
GO
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (119, 94, 52, CAST(N'2021-10-10' AS Date), N'Activities involving baseball', N'Doned', 0, 82, 18)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (120, 97, 58, CAST(N'2022-09-19' AS Date), N'Personal history of malignant neoplasm of large intestine', N'Doned', 0, 78, 187)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (121, 99, 33, CAST(N'2023-11-01' AS Date), N'Iatrogenic pneumothorax', N'Doned', 0, 82, 267)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (122, 95, 32, CAST(N'2023-01-21' AS Date), N'Congenital cardiovascular disorders of mother, delivered, with mention of postpartum complication', N'Doned', 0, 85, 98)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (123, 99, 45, CAST(N'2023-02-24' AS Date), N'Other specified noninflammatory disorders of vagina', N'Doned', 0, 84, 153)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (124, 88, 43, CAST(N'2023-02-19' AS Date), N'Plasma cell leukemia, in relapse', N'Doned', 0, 83, 35)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (125, 89, 59, CAST(N'2021-11-19' AS Date), N'Status of other artificial opening of gastrointestinal tract', N'Doned', 0, 79, 64)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (126, 93, 56, CAST(N'2021-01-31' AS Date), N'Congenital adhesions of tongue', N'Doned', 0, 85, 280)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (127, 92, 52, CAST(N'2021-11-14' AS Date), N'Abdominal rigidity, left lower quadrant', N'Doned', 0, 87, 214)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (128, 97, 56, CAST(N'2021-06-06' AS Date), N'Hemarthrosis, hand', N'Doned', 0, 83, 157)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (129, 88, 59, CAST(N'2023-05-18' AS Date), N'Chondrocalcinosis, unspecified, shoulder region', N'Doned', 0, 85, 134)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (130, 97, 35, CAST(N'2024-03-04' AS Date), N'Optic atrophy, unspecified', N'Doned', 0, 80, 281)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (131, 89, 68, CAST(N'2021-08-30' AS Date), N'Mycosis fungoides, intrathoracic lymph nodes', N'Doned', 0, 85, 22)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (132, 89, 71, CAST(N'2023-05-13' AS Date), N'Open fracture of unspecified part of neck of femur', N'Doned', 0, 87, 288)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (133, 95, 51, CAST(N'2021-01-25' AS Date), N'Closed fracture of sixth cervical vertebra', N'Doned', 0, 85, 261)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (134, 92, 59, CAST(N'2023-07-16' AS Date), N'Chronic venous hypertension with inflammation', N'Doned', 0, 79, 76)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (135, 88, 47, CAST(N'2023-02-15' AS Date), N'Outlet contraction of pelvis, antepartum condition or complication', N'Doned', 0, 87, 214)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (136, 92, 45, CAST(N'2022-01-26' AS Date), N'Congenital hydrocephalus', N'Doned', 0, 86, 202)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (137, 98, 70, CAST(N'2023-06-13' AS Date), N'Overexertion from sudden strenuous movement', N'Doned', 0, 81, 72)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (138, 94, 75, CAST(N'2022-05-30' AS Date), N'Idiopathic peripheral autonomic neuropathy, unspecified', N'Doned', 0, 78, 172)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (140, 94, 28, CAST(N'2023-06-03' AS Date), N'Hypertrophic obstructive cardiomyopathy', N'Doned', 0, 87, 217)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (142, 97, 67, CAST(N'2022-06-10' AS Date), N'Arthropathy associated with other infectious and parasitic diseases, other specified sites', N'Doned', 0, 83, 244)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (143, 94, 53, CAST(N'2023-11-04' AS Date), N'Varicose veins of lower extremities with ulcer and inflammation', N'Doned', 0, 77, 21)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (144, 97, 27, CAST(N'2022-02-23' AS Date), N'Acute upper respiratory infections of other multiple sites', N'Doned', 0, 86, 60)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (145, 99, 73, CAST(N'2022-07-01' AS Date), N'Injury to kidney with open wound into cavity, unspecified injury', N'Doned', 0, 84, 292)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (146, 93, 67, CAST(N'2023-02-19' AS Date), N'Abdominal or pelvic swelling, mass, or lump, right upper quadrant', N'Doned', 0, 81, 71)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (147, 99, 54, CAST(N'2021-05-28' AS Date), N'Ankylosis of joint, site unspecified', N'Doned', 0, 85, 270)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (148, 89, 55, CAST(N'2023-05-05' AS Date), N'Acute sinusitis, unspecified', N'Doned', 0, 85, 303)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (149, 91, 45, CAST(N'2022-06-26' AS Date), N'Injury to ovarian artery', N'Doned', 0, 77, 227)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (151, 93, 61, CAST(N'2023-12-03' AS Date), N'Need for prophylactic vaccination and inoculation against other viral diseases', N'Doned', 0, 85, 226)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (153, 98, 53, CAST(N'2021-12-31' AS Date), N'Subarachnoid hemorrhage following injury with open intracranial wound, with concussion, unspecified', N'Doned', 0, 79, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (155, 96, 42, CAST(N'2022-10-11' AS Date), N'Acquired absence of breast and nipple', N'Doned', 0, 81, 212)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (156, 98, 36, CAST(N'2021-02-11' AS Date), N'Spasmodic torticollis', N'Doned', 0, 87, 182)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (157, 97, 50, CAST(N'2021-09-21' AS Date), N'Acute myocardial infarction of inferoposterior wall, initial episode of care', N'Doned', 0, 82, 153)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (158, 88, 34, CAST(N'2023-02-11' AS Date), N'Failed attempted abortion complicated by damage to pelvic organs or tissues', N'Doned', 0, 84, 274)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (159, 91, 33, CAST(N'2023-04-27' AS Date), N'Prolonged second stage of labor, delivered, with or without mention of antepartum condition', N'Doned', 0, 84, 292)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (160, 94, 41, CAST(N'2022-07-18' AS Date), N'Persistent vegetative state', N'Doned', 0, 84, 87)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (161, 90, 42, CAST(N'2023-05-20' AS Date), N'Secondary diabetes mellitus without mention of complication, uncontrolled', N'Doned', 0, 85, 142)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (163, 88, 57, CAST(N'2022-09-10' AS Date), N'Other specified menopausal and postmenopausal disorders', N'Doned', 0, 78, 116)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (164, 92, 39, CAST(N'2023-10-06' AS Date), N'Maternal distress complicating labor and delivery, antepartum condition or complication', N'Doned', 0, 82, 126)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (165, 88, 73, CAST(N'2022-04-06' AS Date), N'Nonspecific (abnormal) findings on radiological and other examination of biliary tract', N'Doned', 0, 78, 189)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (166, 99, 43, CAST(N'2023-01-13' AS Date), N'Microphthalmos associated with other anomalies of eye and adnexa', N'Doned', 0, 84, 313)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (167, 89, 49, CAST(N'2021-04-05' AS Date), N'Unspecified perineal laceration, postpartum condition or complication', N'Doned', 0, 86, 81)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (169, 96, 37, CAST(N'2021-05-03' AS Date), N'Irregular menstrual cycle', N'Doned', 0, 77, 106)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (170, 88, 61, CAST(N'2021-09-16' AS Date), N'Sezary''s disease, intra-abdominal lymph nodes', N'Doned', 0, 83, 76)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (171, 99, 43, CAST(N'2023-05-14' AS Date), N'Malignant neoplasm of main bronchus', N'Doned', 0, 84, 81)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (172, 93, 55, CAST(N'2022-01-19' AS Date), N'Injury to unspecified site of nerve roots and spinal plexus', N'Doned', 0, 82, 308)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (173, 89, 26, CAST(N'2022-12-05' AS Date), N'Benign carcinoid tumor of the appendix', N'Doned', 0, 77, 147)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (174, 92, 28, CAST(N'2023-04-17' AS Date), N'Acute myocardial infarction of other inferior wall, episode of care unspecified', N'Doned', 0, 79, 138)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (176, 97, 49, CAST(N'2024-01-08' AS Date), N'Malignant carcinoid tumor of foregut, not otherwise specified', N'Doned', 0, 82, 266)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (177, 98, 46, CAST(N'2022-01-30' AS Date), N'Recent retinal detachment, partial, with multiple defects', N'Doned', 0, 78, 272)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (178, 94, 28, CAST(N'2021-06-22' AS Date), N'Family history of psychiatric condition', N'Doned', 0, 78, 222)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (179, 99, 51, CAST(N'2022-04-20' AS Date), N'Traumatic arthropathy, shoulder region', N'Doned', 0, 86, 304)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (180, 88, 44, CAST(N'2023-10-26' AS Date), N'Mechanical strabismus, unspecified', N'Doned', 0, 78, 79)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (181, 92, 46, CAST(N'2021-01-11' AS Date), N'Injury to multiple and unspecified intrathoracic organs, with open wound into cavity', N'Doned', 0, 78, 58)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (183, 93, 63, CAST(N'2021-12-02' AS Date), N'Neoplasm of uncertain behavior of bone and articular cartilage', N'Doned', 0, 84, 189)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (184, 91, 36, CAST(N'2022-08-25' AS Date), N'Chondrocalcinosis, due to pyrophosphate crystals, hand', N'Doned', 0, 81, 206)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (185, 92, 52, CAST(N'2022-07-05' AS Date), N'Infertility, female, of uterine origin', N'Doned', 0, 85, 247)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (187, 89, 37, CAST(N'2021-06-10' AS Date), N'Hodgkin''s paragranuloma, intra-abdominal lymph nodes', N'Doned', 0, 80, 204)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (188, 93, 35, CAST(N'2021-03-12' AS Date), N'Aseptic necrosis of bone, other', N'Doned', 0, 85, 250)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (189, 91, 33, CAST(N'2022-07-11' AS Date), N'Open fracture of upper end of tibia alone', N'Doned', 0, 86, 74)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (190, 89, 70, CAST(N'2022-06-12' AS Date), N'Closed fracture of other specified part of pelvis', N'Doned', 0, 80, 88)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (191, 91, 39, CAST(N'2023-05-07' AS Date), N'Other specified crystal arthropathies, upper arm', N'Doned', 0, 87, 120)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (192, 94, 74, CAST(N'2022-02-21' AS Date), N'Liveborn, unspecified whether single, twin or multiple, born outside hospital and not hospitalized', N'Doned', 0, 79, 235)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (193, 90, 60, CAST(N'2023-11-12' AS Date), N'Poisoning by other and unspecified vaccines and biological substances', N'Doned', 0, 79, 173)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (194, 91, 55, CAST(N'2023-08-15' AS Date), N'Glanders', N'Doned', 0, 78, 291)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (196, 89, 69, CAST(N'2021-10-06' AS Date), N'Arenaviral hemorrhagic fever', N'Doned', 0, 79, 275)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (197, 89, 39, CAST(N'2023-06-18' AS Date), N'Other and unspecified superficial injury of fingers without mention of infection', N'Doned', 0, 83, 104)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (198, 99, 51, CAST(N'2023-06-01' AS Date), N'Influenza due to identified 2009 H1N1 influenza virus with other respiratory manifestations', N'Doned', 0, 78, 212)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (199, 88, 55, CAST(N'2024-02-16' AS Date), N'African trypanosomiasis, unspecified', N'Doned', 0, 85, 95)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (200, 93, 54, CAST(N'2021-03-15' AS Date), N'Extrinsic asthma, unspecified', N'Doned', 0, 78, 236)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (201, 99, 65, CAST(N'2021-02-24' AS Date), N'Microphthalmos, unspecified', N'Doned', 0, 86, 212)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (202, 95, 61, CAST(N'2022-03-08' AS Date), N'Other specified glaucoma', N'Doned', 0, 85, 243)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (203, 89, 72, CAST(N'2021-01-29' AS Date), N'Observation and evaluation for other specified suspected conditions', N'Doned', 0, 78, 276)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (205, 96, 57, CAST(N'2022-08-12' AS Date), N'Suicide and self-inflicted injury by suffocation by plastic bag', N'Doned', 0, 78, 172)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (206, 96, 62, CAST(N'2022-08-13' AS Date), N'Other noxious influences affecting fetus or newborn via placenta or breast milk', N'Doned', 0, 85, 58)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (207, 90, 53, CAST(N'2021-07-19' AS Date), N'Assault by unspecified means', N'Doned', 0, 85, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (208, 89, 53, CAST(N'2023-09-06' AS Date), N'Lordosis associated with other conditions', N'Doned', 0, 84, 154)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (209, 99, 42, CAST(N'2024-02-10' AS Date), N'Damage to pelvic organs and tissues following abortion or ectopic and molar pregnancies', N'Doned', 0, 85, 23)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (210, 95, 55, CAST(N'2022-10-15' AS Date), N'Other closed fracture of upper end of humerus', N'Doned', 0, 77, 21)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (211, 92, 47, CAST(N'2021-11-13' AS Date), N'Open dislocation, lumbar vertebra', N'Doned', 0, 80, 283)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (212, 96, 61, CAST(N'2022-11-20' AS Date), N'Impacted cerumen', N'Doned', 0, 82, 33)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (213, 88, 72, CAST(N'2021-02-06' AS Date), N'Injury due to war operations from fire caused indirectly from conventional weapon', N'Doned', 0, 83, 55)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (214, 96, 50, CAST(N'2022-01-09' AS Date), N'Eclampsia, unspecified as to episode of care or not applicable', N'Doned', 0, 80, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (215, 91, 48, CAST(N'2022-11-29' AS Date), N'Diabetes with hyperosmolarity, type II or unspecified type, uncontrolled', N'Doned', 0, 81, 73)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (216, 91, 37, CAST(N'2021-01-10' AS Date), N'Menstrual migraine, without mention of intractable migraine without mention of status migrainosus', N'Doned', 0, 77, 112)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (217, 97, 55, CAST(N'2023-01-21' AS Date), N'Chondromalacia', N'Doned', 0, 78, 92)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (218, 98, 47, CAST(N'2023-01-05' AS Date), N'Anterior scleritis', N'Doned', 0, 77, 61)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (219, 93, 47, CAST(N'2024-01-28' AS Date), N'Other transfusion reaction', N'Doned', 0, 84, 202)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (220, 99, 53, CAST(N'2022-09-26' AS Date), N'Burkitt''s tumor or lymphoma, unspecified site, extranodal and solid organ sites', N'Doned', 0, 76, 178)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (221, 94, 65, CAST(N'2022-08-15' AS Date), N'Other specified diphtheria', N'Doned', 0, 82, 307)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (222, 98, 72, CAST(N'2022-01-06' AS Date), N'Focal retinitis and retinochoroiditis, peripheral', N'Doned', 0, 79, 253)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (223, 96, 46, CAST(N'2022-06-02' AS Date), N'Fourth or trochlear nerve palsy', N'Doned', 0, 76, 187)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (224, 88, 46, CAST(N'2021-07-09' AS Date), N'Progressive bulbar palsy', N'Doned', 0, 78, 108)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (225, 88, 58, CAST(N'2023-05-31' AS Date), N'Tension type headache, unspecified', N'Doned', 0, 77, 50)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (226, 97, 71, CAST(N'2023-02-22' AS Date), N'Arthropathy associated with hypersensitivity reaction', N'Doned', 0, 76, 44)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (227, 89, 49, CAST(N'2022-02-19' AS Date), N'Benign neoplasm of thyroid glands', N'Doned', 0, 76, 49)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (228, 88, 69, CAST(N'2024-02-02' AS Date), N'Other postablative hypothyroidism', N'Doned', 0, 82, 179)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (231, 94, 62, CAST(N'2023-10-09' AS Date), N'Closed fracture of one rib', N'Doned', 0, 84, 278)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (232, 91, 33, CAST(N'2021-06-30' AS Date), N'Lipoma of other skin and subcutaneous tissue', N'Doned', 0, 80, 182)
GO
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (233, 99, 63, CAST(N'2022-08-27' AS Date), N'Hodgkin''s disease, lymphocytic-histiocytic predominance, intra-abdominal lymph nodes', N'Doned', 0, 76, 196)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (234, 93, 27, CAST(N'2021-04-13' AS Date), N'T7-T12 level with central cord syndrome', N'Doned', 0, 83, 190)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (235, 92, 48, CAST(N'2023-04-15' AS Date), N'Hemiplegic migraine, with intractable migraine, so stated, without mention of status migrainosus', N'Doned', 0, 79, 70)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (238, 93, 72, CAST(N'2021-08-15' AS Date), N'Unspecified hemorrhagic conditions', N'Doned', 0, 79, 103)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (240, 94, 71, CAST(N'2022-10-08' AS Date), N'Other disorders of iris and ciliary body', N'Doned', 0, 87, 71)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (241, 92, 37, CAST(N'2023-01-04' AS Date), N'Poisoning by selective serotonin reuptake inhibitors', N'Doned', 0, 81, 83)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (244, 90, 58, CAST(N'2023-08-25' AS Date), N'Accidental poisoning by other specified analgesics and antipyretics', N'Doned', 0, 78, 238)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (245, 99, 30, CAST(N'2023-05-05' AS Date), N'Anticoagulants causing adverse effects in therapeutic use', N'Doned', 0, 87, 158)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (246, 89, 36, CAST(N'2022-06-02' AS Date), N'Hand, except finger injury', N'Doned', 0, 82, 155)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (248, 89, 47, CAST(N'2021-05-27' AS Date), N'Carcinoma in situ of skin of lower limb, including hip', N'Doned', 0, 84, 247)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (249, 89, 37, CAST(N'2021-03-24' AS Date), N'Febrile nonhemolytic transfusion reaction', N'Doned', 0, 79, 281)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (250, 88, 39, CAST(N'2023-07-06' AS Date), N'Closed fracture of epiphysis (separation) (upper) of neck of femur', N'Doned', 0, 76, 237)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (251, 93, 68, CAST(N'2022-10-19' AS Date), N'Acute alcoholic hepatitis', N'Doned', 0, 83, 314)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (252, 88, 70, CAST(N'2021-02-21' AS Date), N'Erythema [first degree] of other and multiple sites of trunk', N'Doned', 0, 79, 184)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (253, 94, 44, CAST(N'2023-08-02' AS Date), N'Other congenital anomalies of abdominal wall', N'Doned', 0, 83, 193)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (254, 97, 73, CAST(N'2022-05-08' AS Date), N'Injury due to war operations by vehicle-borne improvised explosive device [IED]', N'Doned', 0, 81, 291)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (255, 92, 53, CAST(N'2023-08-16' AS Date), N'Contaminated substance transfused or infused', N'Doned', 0, 86, 201)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (256, 90, 51, CAST(N'2021-09-02' AS Date), N'Atresia and stenosis of large intestine, rectum, and anal canal', N'Doned', 0, 77, 183)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (257, 90, 71, CAST(N'2022-09-10' AS Date), N'Open wound of shoulder region, without mention of complication', N'Doned', 0, 77, 218)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (258, 96, 31, CAST(N'2023-07-27' AS Date), N'Atherosclerosis of native arteries of the extremities, unspecified', N'Doned', 0, 84, 253)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (259, 94, 71, CAST(N'2023-12-24' AS Date), N'Acquired deformity of pelvis', N'Doned', 0, 83, 236)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (260, 88, 52, CAST(N'2021-12-09' AS Date), N'Conjunctival hemorrhage', N'Doned', 0, 80, 166)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (261, 98, 35, CAST(N'2022-12-12' AS Date), N'Other gouty nephropathy', N'Doned', 0, 84, 245)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (262, 99, 51, CAST(N'2023-06-27' AS Date), N'Late effects of cerebrovascular disease, aphasia', N'Doned', 0, 85, 135)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (263, 91, 54, CAST(N'2023-10-30' AS Date), N'Anemia in neoplastic disease', N'Doned', 0, 85, 256)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (264, 96, 38, CAST(N'2023-07-14' AS Date), N'Other tenosynovitis of hand and wrist', N'Doned', 0, 85, 170)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (265, 99, 35, CAST(N'2023-05-06' AS Date), N'Disseminated chorioretinitis, unspecified', N'Doned', 0, 81, 274)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (266, 97, 41, CAST(N'2023-11-08' AS Date), N'Acute miliary tuberculosis, bacteriological or histological examination not done', N'Doned', 0, 78, 258)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (267, 89, 33, CAST(N'2023-11-03' AS Date), N'Neutropenic splenomegaly', N'Doned', 0, 78, 203)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (268, 88, 32, CAST(N'2023-08-21' AS Date), N'Scarlet fever', N'Doned', 0, 87, 157)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (269, 99, 31, CAST(N'2023-01-12' AS Date), N'Other specified air transport accidents injuring occupant of unpowered aircraft, except parachutist', N'Doned', 0, 77, 226)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (270, 94, 72, CAST(N'2021-03-21' AS Date), N'Unspecified inflammation of eyelid', N'Doned', 0, 87, 235)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (271, 92, 32, CAST(N'2024-02-01' AS Date), N'Coronary atherosclerosis of nonautologous biological bypass graft', N'Doned', 0, 83, 136)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (273, 92, 44, CAST(N'2024-01-05' AS Date), N'Better eye: severe vision impairment; lesser eye: total vision impairment', N'Doned', 0, 76, 219)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (274, 92, 32, CAST(N'2023-05-11' AS Date), N'Effusion of joint, multiple sites', N'Doned', 0, 76, 141)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (275, 99, 50, CAST(N'2024-02-04' AS Date), N'Other disorders of lens', N'Doned', 0, 86, 20)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (276, 92, 28, CAST(N'2021-08-02' AS Date), N'Manic affective disorder, recurrent episode, mild', N'Doned', 0, 86, 131)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (277, 91, 62, CAST(N'2023-05-10' AS Date), N'Tuberculoma of meninges, bacteriological or histological examination unknown (at present)', N'Doned', 0, 85, 219)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (278, 89, 34, CAST(N'2022-05-12' AS Date), N'Stiffness of joint, not elsewhere classified, multiple sites', N'Doned', 0, 78, 274)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (280, 99, 71, CAST(N'2023-01-18' AS Date), N'Diverticulosis of colon (without mention of hemorrhage)', N'Doned', 0, 81, 183)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (281, 96, 68, CAST(N'2023-12-30' AS Date), N'Thoracoabdominal aortic ectasia', N'Doned', 0, 83, 127)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (282, 98, 54, CAST(N'2023-05-01' AS Date), N'Convalescence following surgery', N'Doned', 0, 83, 272)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (283, 92, 67, CAST(N'2022-06-10' AS Date), N'Endometriosis of uterus', N'Doned', 0, 86, 133)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (284, 98, 38, CAST(N'2022-11-27' AS Date), N'Varicose veins of lower extremities with ulcer and inflammation', N'Doned', 0, 81, 152)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (285, 94, 26, CAST(N'2022-06-25' AS Date), N'Acute angle-closure glaucoma', N'Doned', 0, 86, 312)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (286, 97, 60, CAST(N'2023-11-29' AS Date), N'Undersocialized conduct disorder, unaggressive type, moderate', N'Doned', 0, 85, 194)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (288, 91, 67, CAST(N'2022-01-30' AS Date), N'Unspecified disorder of joint, pelvic region and thigh', N'Doned', 0, 77, 310)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (289, 97, 29, CAST(N'2023-07-28' AS Date), N'Unspecified fall', N'Doned', 0, 81, 29)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (290, 99, 75, CAST(N'2023-05-29' AS Date), N'Body Mass Index 39.0-39.9, adult', N'Doned', 0, 78, 85)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (291, 93, 62, CAST(N'2023-12-17' AS Date), N'Malignant neoplasm of other specified sites of nasopharynx', N'Doned', 0, 76, 135)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (292, 92, 26, CAST(N'2022-07-10' AS Date), N'Burkitt''s tumor or lymphoma, unspecified site, extranodal and solid organ sites', N'Doned', 0, 85, 255)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (293, 95, 57, CAST(N'2021-07-20' AS Date), N'Prolapse of vaginal vault after hysterectomy', N'Doned', 0, 78, 117)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (294, 96, 47, CAST(N'2021-10-19' AS Date), N'Injury due to war operations by indirect blast effect of nuclear weapon', N'Doned', 0, 78, 120)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (295, 98, 30, CAST(N'2022-01-30' AS Date), N'Secondary iridocyclitis, infectious', N'Doned', 0, 76, 169)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (296, 94, 57, CAST(N'2023-08-16' AS Date), N'Alveolar maxillary hypoplasia', N'Doned', 0, 85, 88)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (297, 90, 47, CAST(N'2023-06-02' AS Date), N'Late metabolic acidosis of newborn', N'Doned', 0, 77, 287)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (298, 92, 51, CAST(N'2023-07-15' AS Date), N'Human immunodeficiency virus [HIV] disease', N'Doned', 0, 78, 110)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (299, 95, 56, CAST(N'2022-06-22' AS Date), N'Unspecified infective arthritis, forearm', N'Doned', 0, 84, 262)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (300, 92, 46, CAST(N'2022-09-26' AS Date), N'Abrasion or friction burn of elbow, forearm, and wrist, without mention of infection', N'Doned', 0, 87, 74)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (301, 99, 51, CAST(N'2023-03-19' AS Date), N'Diabetes with other specified manifestations, type I [juvenile type], uncontrolled', N'Doned', 0, 83, 103)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (302, 96, 75, CAST(N'2021-07-12' AS Date), N'Chronic subinvolution of uterus', N'Doned', 0, 78, 28)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (303, 97, 67, CAST(N'2021-10-26' AS Date), N'Diffuse cystic mastopathy', N'Doned', 0, 76, 245)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (304, 95, 42, CAST(N'2022-09-20' AS Date), N'Nonspecific abnormal findings in cerebrospinal fluid', N'Doned', 0, 81, 235)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (305, 89, 68, CAST(N'2023-01-13' AS Date), N'Unspecified monoarthritis, pelvic region and thigh', N'Doned', 0, 84, 106)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (306, 92, 52, CAST(N'2022-12-09' AS Date), N'Hypoactive sexual desire disorder', N'Doned', 0, 83, 209)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (307, 92, 56, CAST(N'2023-10-11' AS Date), N'Curvature of spine, unspecified, associated with other conditions', N'Doned', 0, 86, 222)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (308, 91, 32, CAST(N'2021-12-23' AS Date), N'Personal history of urinary calculi', N'Doned', 0, 77, 289)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (309, 95, 54, CAST(N'2021-12-26' AS Date), N'Other abnormal Papanicolaou smear of cervix and cervical HPV', N'Doned', 0, 78, 189)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (310, 96, 32, CAST(N'2023-10-05' AS Date), N'Tuberculosis of lung with cavitation, bacteriological or histological examination not done', N'Doned', 0, 80, 203)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (311, 99, 27, CAST(N'2023-08-23' AS Date), N'Other cardiorespiratory problems', N'Doned', 0, 83, 114)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (312, 95, 70, CAST(N'2023-08-12' AS Date), N'Family history of other blood disorders', N'Doned', 0, 80, 232)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (313, 88, 47, CAST(N'2023-10-08' AS Date), N'Other forms of progressive coccidioidomycosis', N'Doned', 0, 79, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (314, 89, 32, CAST(N'2022-09-03' AS Date), N'Other infections involving bone in diseases classified elsewhere, other specified sites', N'Doned', 0, 76, 253)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (315, 97, 60, CAST(N'2023-11-18' AS Date), N'Accident to watercraft causing other injury to other specified person', N'Doned', 0, 82, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (316, 93, 58, CAST(N'2021-12-07' AS Date), N'Noncollision motor vehicle traffic accident while boarding or alighting injuring unspecified person', N'Doned', 0, 85, 241)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (317, 89, 67, CAST(N'2023-04-21' AS Date), N'Polyneuropathy in malignant disease', N'Doned', 0, 80, 152)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (318, 89, 60, CAST(N'2023-03-26' AS Date), N'Other specified disorders of esophagus', N'Doned', 0, 77, 181)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (319, 99, 30, CAST(N'2021-04-22' AS Date), N'Cystitis in diseases classified elsewhere', N'Doned', 0, 86, 165)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (321, 95, 29, CAST(N'2023-04-10' AS Date), N'Hematemesis and melena of newborn due to swallowed maternal blood', N'Doned', 0, 85, 41)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (322, 96, 46, CAST(N'2021-02-21' AS Date), N'Crushing injury of axillary region', N'Doned', 0, 78, 303)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (323, 89, 69, CAST(N'2023-08-14' AS Date), N'Pleurisy without mention of effusion or current tuberculosis', N'Doned', 0, 85, 45)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (324, 95, 58, CAST(N'2022-12-12' AS Date), N'Selective IgA immunodeficiency', N'Doned', 0, 80, 241)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (325, 94, 72, CAST(N'2021-10-27' AS Date), N'Prolapse or hernia of ovary and fallopian tube', N'Doned', 0, 78, 226)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (326, 96, 52, CAST(N'2022-11-10' AS Date), N'Other specified diseases of the jaws', N'Doned', 0, 84, 209)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (327, 89, 41, CAST(N'2023-03-15' AS Date), N'Congenital mitral stenosis', N'Doned', 0, 82, 262)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (328, 97, 34, CAST(N'2022-04-06' AS Date), N'Tonic pupillary reaction', N'Doned', 0, 78, 48)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (329, 98, 43, CAST(N'2021-06-24' AS Date), N'Myoneural disorders, unspecified', N'Doned', 0, 78, 64)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (330, 99, 74, CAST(N'2022-07-14' AS Date), N'Mixed pediculosis infestation', N'Doned', 0, 83, 200)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (331, 99, 52, CAST(N'2023-01-24' AS Date), N'Other specified tick-borne viral encephalitis', N'Doned', 0, 76, 67)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (332, 96, 29, CAST(N'2022-08-02' AS Date), N'Accident to watercraft causing other injury to occupant of other watercraft -- crew', N'Doned', 0, 87, 311)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (333, 96, 66, CAST(N'2023-03-22' AS Date), N'Fetal hematologic conditions, antepartum condition or complication', N'Doned', 0, 81, 33)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (334, 94, 64, CAST(N'2022-03-01' AS Date), N'Unspecified severity of birth asphyxia in liveborn infant', N'Doned', 0, 81, 100)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (335, 91, 71, CAST(N'2022-09-11' AS Date), N'Burn of unspecified degree of palm', N'Doned', 0, 86, 57)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (336, 99, 57, CAST(N'2022-06-01' AS Date), N'Rheumatic heart failure (congestive)', N'Doned', 0, 76, 51)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (337, 91, 26, CAST(N'2022-03-13' AS Date), N'Zoophilia', N'Doned', 0, 82, 99)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (338, 88, 52, CAST(N'2023-06-01' AS Date), N'Open fracture of head of radius', N'Doned', 0, 83, 152)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (339, 88, 31, CAST(N'2023-06-23' AS Date), N'Unspecified inflammatory spondylopathy', N'Doned', 0, 79, 195)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (340, 96, 39, CAST(N'2021-01-25' AS Date), N'Gnathostomiasis', N'Doned', 0, 86, 315)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (341, 96, 55, CAST(N'2021-03-13' AS Date), N'Other specified cystic kidney disease', N'Doned', 0, 81, 119)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (342, 96, 45, CAST(N'2024-03-01' AS Date), N'Ocular hypertension', N'Doned', 0, 78, 211)
GO
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (343, 93, 50, CAST(N'2021-07-06' AS Date), N'Osteochondritis dissecans', N'Doned', 0, 83, 42)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (344, 88, 63, CAST(N'2022-03-26' AS Date), N'Internal hemorrhoids with other complication', N'Doned', 0, 87, 295)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (345, 93, 60, CAST(N'2021-02-17' AS Date), N'Local deformities of orbit due to bone disease', N'Doned', 0, 77, 180)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (347, 97, 66, CAST(N'2023-05-17' AS Date), N'Leukemic reticuloendotheliosis, intra-abdominal lymph nodes', N'Doned', 0, 77, 184)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (348, 93, 30, CAST(N'2021-07-24' AS Date), N'Degenerative changes of ciliary body', N'Doned', 0, 82, 53)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (349, 96, 61, CAST(N'2023-04-05' AS Date), N'Bladder replaced by other means', N'Doned', 0, 82, 26)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (350, 97, 74, CAST(N'2022-11-07' AS Date), N'Need for prophylactic vaccination and inoculation against tetanus toxoid alone', N'Doned', 0, 78, 257)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (351, 92, 38, CAST(N'2022-11-13' AS Date), N'Developmental dislocation of joint, forearm', N'Doned', 0, 76, 101)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (353, 93, 72, CAST(N'2023-10-06' AS Date), N'Atony of bladder', N'Doned', 0, 86, 109)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (354, 93, 73, CAST(N'2022-03-30' AS Date), N'Unilateral paralysis of vocal cords or larynx, partial', N'Doned', 0, 86, 210)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (355, 94, 34, CAST(N'2022-09-25' AS Date), N'Injury to multiple blood vessels of abdomen and pelvis', N'Doned', 0, 76, 180)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (356, 92, 45, CAST(N'2023-08-22' AS Date), N'Hypotrichosis of eyelid', N'Doned', 0, 80, 24)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (357, 88, 68, CAST(N'2023-02-19' AS Date), N'Other and unspecified cerebral irritability in newborn', N'Doned', 0, 84, 23)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (358, 90, 53, CAST(N'2022-04-29' AS Date), N'Stress incontinence, female', N'Doned', 0, 86, 204)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (359, 92, 54, CAST(N'2021-12-12' AS Date), N'Encopresis', N'Doned', 0, 87, 71)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (360, 88, 63, CAST(N'2021-11-20' AS Date), N'Other abnormal granulation tissue', N'Doned', 0, 77, 268)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (361, 95, 51, CAST(N'2021-05-21' AS Date), N'Unspecified disorder of stomach and duodenum', N'Doned', 0, 87, 306)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (362, 96, 55, CAST(N'2023-11-26' AS Date), N'Whipple''s disease', N'Doned', 0, 85, 290)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (363, 96, 37, CAST(N'2022-02-26' AS Date), N'Other and unspecified disc disorder, cervical region', N'Doned', 0, 79, 112)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (364, 96, 29, CAST(N'2021-07-22' AS Date), N'Other disorders of soft tissue', N'Doned', 0, 85, 189)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (365, 98, 36, CAST(N'2023-12-28' AS Date), N'Other abnormal granulation tissue', N'Doned', 0, 79, 40)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (366, 94, 34, CAST(N'2021-11-07' AS Date), N'Abrasion, limited to enamel', N'Doned', 0, 76, 84)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (367, 93, 59, CAST(N'2022-11-17' AS Date), N'Unspecified infection of bone, ankle and foot', N'Doned', 0, 79, 26)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (369, 94, 54, CAST(N'2022-03-16' AS Date), N'Pulmonary collapse', N'Doned', 0, 84, 265)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (370, 96, 74, CAST(N'2023-03-04' AS Date), N'Accidental poisoning by unspecified solid or liquid substance', N'Doned', 0, 82, 176)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (371, 99, 63, CAST(N'2021-09-15' AS Date), N'Other and unspecified fall in water transport injuring occupant of small boat, unpowered', N'Doned', 0, 85, 54)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (372, 94, 63, CAST(N'2022-03-23' AS Date), N'Personal history of malaria', N'Doned', 0, 76, 257)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (373, 96, 65, CAST(N'2023-08-06' AS Date), N'Female genital mutilation Type III status', N'Doned', 0, 80, 202)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (374, 99, 52, CAST(N'2021-05-06' AS Date), N'Malocclusion, unspecified', N'Doned', 0, 80, 32)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (375, 95, 32, CAST(N'2023-09-13' AS Date), N'Burkitt''s tumor or lymphoma, lymph nodes of axilla and upper limb', N'Doned', 0, 87, 201)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (376, 97, 58, CAST(N'2022-01-16' AS Date), N'Wiskott-aldrich syndrome', N'Doned', 0, 83, 99)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (377, 91, 45, CAST(N'2022-08-11' AS Date), N'Hallux rigidus', N'Doned', 0, 77, 180)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (378, 94, 68, CAST(N'2022-10-12' AS Date), N'Tongue tie', N'Doned', 0, 84, 160)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (379, 99, 71, CAST(N'2021-10-23' AS Date), N'Severe pre-eclampsia, postpartum condition or complication', N'Doned', 0, 82, 309)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (380, 94, 51, CAST(N'2023-05-20' AS Date), N'Asymptomatic bacteriuria in pregnancy, delivered, with mention of postpartum complication', N'Doned', 0, 86, 171)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (381, 96, 30, CAST(N'2021-10-02' AS Date), N'Burn [any degree] involving 80-89 percent of body surface with third degree burn, 50-59%', N'Doned', 0, 85, 135)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (382, 98, 31, CAST(N'2023-03-13' AS Date), N'Minimal keratinized residual ridge mucosa', N'Doned', 0, 82, 266)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (383, 90, 27, CAST(N'2023-06-23' AS Date), N'Other acute and subacute forms of ischemic heart disease, other', N'Doned', 0, 83, 113)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (384, 94, 32, CAST(N'2021-04-19' AS Date), N'Personal history of noncompliance with medical treatment, presenting hazards to health', N'Doned', 0, 76, 215)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (385, 91, 42, CAST(N'2023-08-09' AS Date), N'Intermediate lesions of pinta', N'Doned', 0, 81, 228)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (386, 94, 39, CAST(N'2022-02-07' AS Date), N'Other specified disorders of eye and adnexa', N'Doned', 0, 86, 120)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (388, 98, 34, CAST(N'2023-04-24' AS Date), N'Full-thickness skin loss [third degree NOS] of toe(s) (nail)', N'Doned', 0, 84, 85)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (389, 96, 31, CAST(N'2022-07-29' AS Date), N'Injury to thoracic aorta', N'Doned', 0, 77, 281)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (390, 93, 49, CAST(N'2022-11-13' AS Date), N'Malignant neoplasm of salivary gland, unspecified', N'Doned', 0, 81, 277)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (391, 94, 47, CAST(N'2022-09-17' AS Date), N'Railway accident involving collision with rolling stock and injuring pedal cyclist', N'Doned', 0, 76, 37)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (392, 91, 63, CAST(N'2023-11-06' AS Date), N'Arthropathy associated with other infectious and parasitic diseases, ankle and foot', N'Doned', 0, 83, 101)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (393, 92, 61, CAST(N'2021-11-09' AS Date), N'Terrorism involving nuclear weapons', N'Doned', 0, 80, 66)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (394, 98, 75, CAST(N'2023-12-23' AS Date), N'Blister of hip, thigh, leg, and ankle, infected', N'Doned', 0, 79, 169)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (395, 90, 66, CAST(N'2023-08-04' AS Date), N'Open dislocation of metatarsophalangeal (joint)', N'Doned', 0, 85, 144)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (396, 94, 27, CAST(N'2021-10-07' AS Date), N'Burn [any degree] involving 70-79 percent of body surface with third degree burn, 70-79%', N'Doned', 0, 84, 214)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (397, 88, 36, CAST(N'2021-03-21' AS Date), N'Other nonspecific abnormal results of function study of peripheral nervous system and special senses', N'Doned', 0, 83, 62)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (398, 93, 45, CAST(N'2021-03-21' AS Date), N'Ankle joint replacement', N'Doned', 0, 79, 86)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (399, 95, 40, CAST(N'2021-04-30' AS Date), N'Breech presentation without mention of version, antepartum condition or complication', N'Doned', 0, 81, 302)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (400, 92, 31, CAST(N'2023-03-22' AS Date), N'Other specified chlamydial infection', N'Doned', 0, 83, 61)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (401, 95, 35, CAST(N'2022-06-10' AS Date), N'Vascular dementia, with delusions', N'Doned', 0, 80, 105)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (402, 91, 65, CAST(N'2022-06-08' AS Date), N'Personal history of diseases of skin and subcutaneous tissue', N'Doned', 0, 77, 87)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (403, 94, 36, CAST(N'2022-07-07' AS Date), N'Modified smallpox', N'Doned', 0, 77, 177)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (404, 98, 54, CAST(N'2021-08-01' AS Date), N'Narcotics affecting fetus or newborn via placenta or breast milk', N'Doned', 0, 82, 260)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (405, 95, 74, CAST(N'2021-04-24' AS Date), N'Abnormality in fetal heart rate or rhythm, unspecified as to episode of care or not applicable', N'Doned', 0, 76, 256)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (406, 97, 32, CAST(N'2021-09-08' AS Date), N'Genetic susceptibility to multiple endocrine neoplasia [MEN]', N'Doned', 0, 86, 26)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (407, 89, 37, CAST(N'2022-04-15' AS Date), N'Burn [any degree] involving 90 percent or more of body surface with third degree burn, 70-79%', N'Doned', 0, 83, 231)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (408, 90, 69, CAST(N'2022-09-30' AS Date), N'Pain in joint, forearm', N'Doned', 0, 84, 73)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (409, 99, 32, CAST(N'2022-07-27' AS Date), N'Unspecified local infection of skin and subcutaneous tissue', N'Doned', 0, 80, 273)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (410, 89, 57, CAST(N'2021-07-17' AS Date), N'Central pterygium', N'Doned', 0, 87, 158)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (411, 94, 71, CAST(N'2021-12-23' AS Date), N'Accident caused by other specified firearm missile', N'Doned', 0, 82, 91)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (412, 90, 74, CAST(N'2023-09-14' AS Date), N'Achilles bursitis or tendinitis', N'Doned', 0, 83, 202)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (413, 89, 72, CAST(N'2021-06-01' AS Date), N'Primary thrombocytopenia,unspecified', N'Doned', 0, 79, 31)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (414, 98, 51, CAST(N'2022-06-28' AS Date), N'Alcohol deterrents causing adverse effects in therapeutic use', N'Doned', 0, 84, 52)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (415, 98, 33, CAST(N'2023-04-20' AS Date), N'Schizophreniform disorder, chronic', N'Doned', 0, 81, 222)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (416, 88, 60, CAST(N'2023-06-05' AS Date), N'Unspecified persistent mental disorders due to conditions classified elsewhere', N'Doned', 0, 87, 297)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (417, 88, 45, CAST(N'2022-02-07' AS Date), N'Chronic venous hypertension with ulcer', N'Doned', 0, 81, 147)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (418, 94, 69, CAST(N'2024-02-11' AS Date), N'Nephrotic syndrome with lesion of proliferative glomerulonephritis', N'Doned', 0, 87, 184)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (419, 88, 102, CAST(N'2024-03-17' AS Date), N'dau rang', N'Doned', 0, 77, NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (420, 89, 102, CAST(N'2024-03-17' AS Date), N'ok', N'Doned', 0, 77, NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (421, 89, 102, CAST(N'2024-03-17' AS Date), N'ok', N'Doned', 0, 79, NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (422, 89, 102, CAST(N'2024-03-17' AS Date), N'ok', N'Doned', 0, 79, NULL)
INSERT [dbo].[Appointment] ([appointment_id], [employee_id], [patient_id], [datetime], [note], [status], [delete_flag], [doctor_id], [medicalRecordDetail_id]) VALUES (423, 89, 102, CAST(N'2024-03-17' AS Date), N'ok bruh', N'Doned', 0, 79, 321)
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
INSERT [dbo].[comment] ([id], [patient_id], [commentDetail], [delete_flag], [created_at], [doctor_id], [rating_star]) VALUES (14, 23, N'ok', 0, CAST(N'2024-03-19T18:56:37.840' AS DateTime), NULL, 5)
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
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (15, 32, 99, CAST(N'2022-01-18T00:00:00.000' AS DateTime), 1, 2, N'Pelican, australian', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (16, 64, 88, CAST(N'2023-03-09T00:00:00.000' AS DateTime), 35, 2, N'Sidewinder', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (17, 65, 88, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 100, 2, N'Seven-banded armadillo', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (18, 70, 97, CAST(N'2022-02-27T00:00:00.000' AS DateTime), 65, 2, N'Skimmer, four-spotted', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (19, 27, 91, CAST(N'2024-02-05T00:00:00.000' AS DateTime), 40, 2, N'Bird, pied butcher', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (20, 52, 97, CAST(N'2023-11-04T00:00:00.000' AS DateTime), 87, 2, N'Snake, eastern indigo', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (21, 31, 92, CAST(N'2022-06-05T00:00:00.000' AS DateTime), 12, 2, N'Lemming, arctic', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (22, 27, 89, CAST(N'2021-09-26T00:00:00.000' AS DateTime), 32, 2, N'Bonnet macaque', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (23, 38, 91, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 99, 2, N'Cat, european wild', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (24, 66, 97, CAST(N'2023-10-28T00:00:00.000' AS DateTime), 55, 2, N'Coatimundi, ring-tailed', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (25, 59, 97, CAST(N'2023-03-19T00:00:00.000' AS DateTime), 57, 2, N'Nelson ground squirrel', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (26, 56, 98, CAST(N'2021-08-24T00:00:00.000' AS DateTime), 36, 2, N'Skua, long-tailed', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (27, 65, 92, CAST(N'2023-05-16T00:00:00.000' AS DateTime), 27, 2, N'Bird, bare-faced go away', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (28, 70, 89, CAST(N'2022-09-26T00:00:00.000' AS DateTime), 78, 2, N'European shelduck', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (29, 74, 95, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 28, 2, N'Lizard, desert spiny', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (30, 31, 91, CAST(N'2021-03-09T00:00:00.000' AS DateTime), 89, 2, N'Blue catfish', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (31, 36, 95, CAST(N'2024-03-12T00:00:00.000' AS DateTime), 54, 2, N'Javanese cormorant', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (32, 57, 97, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 61, 2, N'Bulbul, black-fronted', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (33, 50, 94, CAST(N'2022-08-05T00:00:00.000' AS DateTime), 76, 2, N'Western bearded dragon', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (34, 59, 96, CAST(N'2022-09-08T00:00:00.000' AS DateTime), 68, 2, N'Stanley bustard', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (35, 62, 97, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 10, 2, N'Tortoise, burmese black mountain', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (36, 38, 90, CAST(N'2021-03-09T00:00:00.000' AS DateTime), 89, 2, N'Silver gull', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (37, 35, 95, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 97, 2, N'Squirrel, smith''s bush', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (38, 72, 94, CAST(N'2022-01-23T00:00:00.000' AS DateTime), 31, 2, N'Hawk-eagle, crowned', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (39, 40, 93, CAST(N'2023-11-20T00:00:00.000' AS DateTime), 33, 2, N'Lesser mouse lemur', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (40, 53, 88, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 95, 2, N'Pigeon, feral rock', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (41, 48, 99, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 55, 2, N'Gecko (unidentified)', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (42, 55, 99, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 6, 2, N'White-winged tern', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (43, 70, 98, CAST(N'2022-12-13T00:00:00.000' AS DateTime), 16, 2, N'Gecko, bent-toed', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (44, 34, 88, CAST(N'2023-01-23T00:00:00.000' AS DateTime), 36, 2, N'Lemur, grey mouse', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (45, 66, 98, CAST(N'2021-10-13T00:00:00.000' AS DateTime), 42, 2, N'Arctic ground squirrel', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (46, 69, 98, CAST(N'2023-08-16T00:00:00.000' AS DateTime), 33, 2, N'Otter, cape clawless', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (47, 71, 95, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 68, 2, N'Red hartebeest', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (48, 57, 96, CAST(N'2022-10-22T00:00:00.000' AS DateTime), 10, 2, N'Toddy cat', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (49, 52, 89, CAST(N'2022-10-27T00:00:00.000' AS DateTime), 65, 2, N'Cat, ringtail', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (50, 73, 95, CAST(N'2021-08-16T00:00:00.000' AS DateTime), 10, 2, N'White-throated kingfisher', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (51, 33, 97, CAST(N'2021-11-26T00:00:00.000' AS DateTime), 33, 2, N'Brush-tailed rat kangaroo', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (52, 32, 91, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 45, 2, N'Eland, common', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (53, 72, 96, CAST(N'2021-08-18T00:00:00.000' AS DateTime), 42, 2, N'Crested screamer', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (54, 59, 91, CAST(N'2023-06-01T00:00:00.000' AS DateTime), 93, 2, N'Springbuck', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (55, 43, 97, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 12, 2, N'Water moccasin', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (56, 45, 97, CAST(N'2023-06-02T00:00:00.000' AS DateTime), 21, 2, N'Bandicoot, long-nosed', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (57, 34, 88, CAST(N'2022-02-05T00:00:00.000' AS DateTime), 26, 2, N'Dassie', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (58, 42, 95, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 43, 2, N'Urial', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (59, 52, 88, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 74, 2, N'Armadillo, common long-nosed', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (60, 69, 91, CAST(N'2021-07-26T00:00:00.000' AS DateTime), 80, 2, N'Black curlew', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (61, 68, 90, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 32, 2, N'Black-tailed deer', 1, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (62, 41, 93, CAST(N'2023-03-22T00:00:00.000' AS DateTime), 76, 2, N'Rhea, gray', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (63, 48, 99, CAST(N'2021-06-22T00:00:00.000' AS DateTime), 7, 2, N'White-fronted capuchin', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (64, 39, 96, CAST(N'2022-09-28T00:00:00.000' AS DateTime), 24, 2, N'Phalarope, northern', 2, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (65, 102, NULL, CAST(N'2024-03-17T13:56:45.947' AS DateTime), NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Invoice] ([InvoiceId], [CustomerId], [StaffId], [Date], [discount], [Status], [Comment], [PaymentId], [delete_flag]) VALUES (66, 102, NULL, CAST(N'2024-03-17T14:11:26.293' AS DateTime), NULL, 1, NULL, NULL, 0)
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
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (35, 23, 24, NULL, NULL, N'Jabiru stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (36, 45, 58, NULL, NULL, N'Civet, small-toothed palm', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (37, 15, 28, NULL, NULL, N'Ring-tailed lemur', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (38, 18, 41, NULL, NULL, N'Gnu, brindled', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (39, 29, 50, NULL, NULL, N'Columbian rainbow boa', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (40, 49, 42, NULL, NULL, N'Black-tailed tree creeper', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (41, 51, 7, NULL, NULL, N'Common goldeneye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (42, 36, 14, NULL, NULL, N'Greater blue-eared starling', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (43, 45, 62, NULL, NULL, N'Bandicoot, southern brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (44, 34, 27, NULL, NULL, N'Red-breasted cockatoo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (45, 39, 48, NULL, NULL, N'Vulture, bengal', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (46, 41, 12, NULL, NULL, N'Crown of thorns starfish', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (47, 56, 45, NULL, NULL, N'Armadillo, giant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (48, 34, 14, NULL, NULL, N'Dragon, komodo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (49, 51, 40, NULL, NULL, N'Pacific gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (50, 42, 53, NULL, NULL, N'Cormorant, pied', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (51, 54, 36, NULL, NULL, N'Native cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (52, 26, 51, NULL, NULL, N'Moorhen, purple', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (53, 52, 62, NULL, NULL, N'Tarantula, salmon pink bird eater', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (54, 31, 39, NULL, NULL, N'Toucan, white-throated', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (55, 47, 30, NULL, NULL, N'Pheasant, ring-necked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (56, 34, 47, NULL, NULL, N'Black kite', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (57, 58, 61, NULL, NULL, N'Mongoose, eastern dwarf', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (58, 26, 30, NULL, NULL, N'Verreaux''s sifaka', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (59, 45, 38, NULL, NULL, N'Weeper capuchin', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (60, 36, 42, NULL, NULL, N'Feathertail glider', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (61, 33, 7, NULL, NULL, N'Snake, western patch-nosed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (62, 16, 30, NULL, NULL, N'Common seal', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (63, 26, 41, NULL, NULL, N'Salmon, sockeye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (64, 20, 6, NULL, NULL, N'Duck, comb', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (65, 26, 49, NULL, NULL, N'Lorikeet, scaly-breasted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (66, 41, 50, NULL, NULL, N'Crab-eating fox', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (67, 17, 36, NULL, NULL, N'Red-billed tropic bird', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (68, 19, 58, NULL, NULL, N'White-rumped vulture', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (69, 49, 25, NULL, NULL, N'Albatross, galapagos', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (70, 43, 20, NULL, NULL, N'Common mynah', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (71, 29, 25, NULL, NULL, N'Tiger cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (72, 20, 34, NULL, NULL, N'Boa, malagasy ground', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (73, 41, 57, NULL, NULL, N'Fox, pampa gray', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (74, 27, 8, NULL, NULL, N'Amazon parrot (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (75, 25, 12, NULL, NULL, N'Dassie', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (76, 39, 10, NULL, NULL, N'Southern elephant seal', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (77, 19, 7, NULL, NULL, N'Baboon, yellow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (78, 23, 57, NULL, NULL, N'Yellow-billed hornbill', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (79, 51, 54, NULL, NULL, N'Crowned hawk-eagle', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (80, 31, 32, NULL, NULL, N'White-winged black tern', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (81, 36, 61, NULL, NULL, N'Antelope, roan', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (82, 32, 32, NULL, NULL, N'Sambar', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (83, 33, 59, NULL, NULL, N'Elephant, asian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (84, 36, 38, NULL, NULL, N'Monitor lizard (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (85, 48, 27, NULL, NULL, N'Marshbird, brown and yellow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (86, 21, 38, NULL, NULL, N'Spoonbill, european', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (87, 17, 50, NULL, NULL, N'American beaver', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (88, 20, 28, NULL, NULL, N'Monkey, bleeding heart', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (89, 39, 43, NULL, NULL, N'Sungazer, yellow-brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (90, 44, 32, NULL, NULL, N'Woodchuck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (91, 36, 25, NULL, NULL, N'Bent-toed gecko', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (92, 23, 6, NULL, NULL, N'Bare-faced go away bird', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (93, 58, 36, NULL, NULL, N'Saddle-billed stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (94, 57, 17, NULL, NULL, N'Egret, great', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (95, 38, 28, NULL, NULL, N'Red-knobbed coot', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (96, 47, 46, NULL, NULL, N'Indian mynah', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (97, 50, 43, NULL, NULL, N'Boa, mexican', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (98, 22, 8, NULL, NULL, N'Brown antechinus', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (99, 36, 63, NULL, NULL, N'Genoveva', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (100, 56, 35, NULL, NULL, N'Raven, white-necked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (101, 38, 8, NULL, NULL, N'Palm squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (102, 24, 22, NULL, NULL, N'Deer, red', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (103, 53, 12, NULL, NULL, N'Pademelon, red-legged', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (104, 34, 46, NULL, NULL, N'Giant anteater', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (105, 38, 56, NULL, NULL, N'White-eye, pale', 0)
GO
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (106, 36, 56, NULL, NULL, N'Galapagos albatross', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (107, 22, 16, NULL, NULL, N'Brown brocket', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (108, 40, 58, NULL, NULL, N'Peccary, white-lipped', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (109, 29, 6, NULL, NULL, N'White-rumped vulture', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (110, 58, 37, NULL, NULL, N'Zorro, azara''s', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (111, 38, 13, NULL, NULL, N'Large cormorant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (112, 30, 54, NULL, NULL, N'Deer, roe', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (113, 52, 21, NULL, NULL, N'Thomson''s gazelle', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (114, 54, 54, NULL, NULL, N'Kelp gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (115, 23, 38, NULL, NULL, N'Bare-faced go away bird', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (116, 23, 44, NULL, NULL, N'Sally lightfoot crab', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (117, 51, 44, NULL, NULL, N'Hyena, striped', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (118, 46, 61, NULL, NULL, N'Roan antelope', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (119, 37, 7, NULL, NULL, N'Insect, stick', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (120, 31, 57, NULL, NULL, N'Antelope, sable', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (121, 37, 14, NULL, NULL, N'Cormorant, flightless', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (122, 28, 23, NULL, NULL, N'Cardinal, black-throated', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (123, 46, 43, NULL, NULL, N'Dunnart, fat-tailed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (124, 42, 22, NULL, NULL, N'Wapiti, elk,', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (125, 35, 61, NULL, NULL, N'Starling, greater blue-eared', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (126, 53, 14, NULL, NULL, N'Waxbill, blue', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (127, 25, 27, NULL, NULL, N'Fox, blue', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (128, 57, 23, NULL, NULL, N'Leopard, indian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (129, 36, 31, NULL, NULL, N'Baboon, savanna', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (130, 45, 21, NULL, NULL, N'Deer, swamp', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (131, 48, 40, NULL, NULL, N'Brown capuchin', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (132, 16, 13, NULL, NULL, N'Eastern white pelican', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (133, 52, 22, NULL, NULL, N'Heron, grey', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (134, 35, 16, NULL, NULL, N'Common melba finch', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (135, 34, 6, NULL, NULL, N'Phalarope, red', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (136, 40, 48, NULL, NULL, N'Greater roadrunner', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (137, 42, 13, NULL, NULL, N'Zorilla', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (138, 18, 12, NULL, NULL, N'Striped dolphin', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (139, 31, 49, NULL, NULL, N'Otter, small-clawed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (140, 20, 44, NULL, NULL, N'Gecko, tokay', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (141, 58, 11, NULL, NULL, N'European stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (142, 35, 31, NULL, NULL, N'Klipspringer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (143, 44, 46, NULL, NULL, N'Common nighthawk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (144, 21, 45, NULL, NULL, N'Common goldeneye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (145, 20, 45, NULL, NULL, N'Kudu, greater', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (146, 34, 17, NULL, NULL, N'Cape white-eye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (147, 56, 47, NULL, NULL, N'Goldeneye, barrows', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (148, 25, 11, NULL, NULL, N'Buffalo, african', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (149, 26, 20, NULL, NULL, N'Galapagos dove', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (150, 56, 42, NULL, NULL, N'Squirrel, richardson''s ground', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (151, 18, 46, NULL, NULL, N'Steenbuck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (152, 34, 46, NULL, NULL, N'Vulture, griffon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (153, 36, 21, NULL, NULL, N'Southern elephant seal', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (154, 51, 49, NULL, NULL, N'Rabbit, eastern cottontail', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (155, 52, 56, NULL, NULL, N'Badger, eurasian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (156, 22, 60, NULL, NULL, N'Campo flicker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (157, 56, 13, NULL, NULL, N'Native cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (158, 17, 21, NULL, NULL, N'Lion, steller sea', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (159, 45, 20, NULL, NULL, N'Waxbill, violet-eared', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (160, 17, 46, NULL, NULL, N'Red-tailed hawk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (161, 33, 45, NULL, NULL, N'North American river otter', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (162, 52, 57, NULL, NULL, N'Green-winged trumpeter', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (163, 51, 17, NULL, NULL, N'Long-nosed bandicoot', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (164, 51, 9, NULL, NULL, N'Screamer, crested', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (165, 47, 55, NULL, NULL, N'Tortoise, asian foreset', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (166, 27, 57, NULL, NULL, N'Southern right whale', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (167, 38, 27, NULL, NULL, N'Swallow-tail gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (168, 17, 55, NULL, NULL, N'Horned lark', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (169, 32, 26, NULL, NULL, N'Gray rhea', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (170, 45, 39, NULL, NULL, N'Capuchin, black-capped', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (171, 24, 37, NULL, NULL, N'White-fronted bee-eater', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (172, 36, 32, NULL, NULL, N'Flamingo, roseat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (173, 33, 23, NULL, NULL, N'Tawny eagle', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (174, 26, 19, NULL, NULL, N'African pied wagtail', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (175, 19, 62, NULL, NULL, N'Armadillo, common long-nosed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (176, 52, 46, NULL, NULL, N'Wagtail, african pied', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (177, 17, 12, NULL, NULL, N'Richardson''s ground squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (178, 51, 52, NULL, NULL, N'Porcupine, indian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (179, 32, 63, NULL, NULL, N'Steenbuck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (180, 25, 34, NULL, NULL, N'Flamingo, lesser', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (181, 49, 63, NULL, NULL, N'Campo flicker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (182, 36, 52, NULL, NULL, N'Woolly-necked stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (183, 29, 14, NULL, NULL, N'Lappet-faced vulture', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (184, 22, 49, NULL, NULL, N'Common shelduck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (185, 48, 9, NULL, NULL, N'Common zorro', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (186, 25, 28, NULL, NULL, N'Pale white-eye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (187, 35, 47, NULL, NULL, N'Southern right whale', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (188, 52, 41, NULL, NULL, N'Herring gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (189, 40, 53, NULL, NULL, N'Ibex', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (190, 31, 48, NULL, NULL, N'Frilled dragon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (191, 30, 10, NULL, NULL, N'Lemming, arctic', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (192, 22, 52, NULL, NULL, N'Crow, american', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (193, 37, 12, NULL, NULL, N'Red sheep', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (194, 16, 40, NULL, NULL, N'Red brocket', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (195, 19, 23, NULL, NULL, N'Devil, tasmanian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (196, 56, 40, NULL, NULL, N'Civet, common palm', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (197, 52, 36, NULL, NULL, N'Purple grenadier', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (198, 44, 15, NULL, NULL, N'Fox, arctic', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (199, 44, 54, NULL, NULL, N'Striped skunk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (200, 29, 39, NULL, NULL, N'Turtle (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (201, 40, 27, NULL, NULL, N'Western patch-nosed snake', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (202, 16, 15, NULL, NULL, N'Springbok', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (203, 45, 34, NULL, NULL, N'Rattlesnake, horned', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (204, 38, 8, NULL, NULL, N'Least chipmunk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (205, 28, 46, NULL, NULL, N'Lorikeet, scaly-breasted', 0)
GO
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (206, 28, 63, NULL, NULL, N'Cobra (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (207, 17, 59, NULL, NULL, N'Southern hairy-nosed wombat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (208, 45, 36, NULL, NULL, N'Small-clawed otter', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (209, 22, 57, NULL, NULL, N'Penguin, fairy', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (210, 39, 49, NULL, NULL, N'Sloth, two-toed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (211, 23, 51, NULL, NULL, N'Ovenbird', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (212, 26, 58, NULL, NULL, N'Ringtail cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (213, 24, 26, NULL, NULL, N'Eagle, bald', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (214, 37, 31, NULL, NULL, N'Rhesus macaque', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (215, 32, 42, NULL, NULL, N'Bird, secretary', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (216, 58, 16, NULL, NULL, N'Pigeon, wood', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (217, 49, 15, NULL, NULL, N'Dolphin, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (218, 28, 50, NULL, NULL, N'Cuis', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (219, 37, 37, NULL, NULL, N'Possum, western pygmy', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (220, 26, 45, NULL, NULL, N'Spoonbill, white', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (221, 16, 12, NULL, NULL, N'Giant armadillo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (222, 33, 21, NULL, NULL, N'Crane, sarus', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (223, 40, 31, NULL, NULL, N'Burmese brown mountain tortoise', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (224, 22, 37, NULL, NULL, N'Curlew, black', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (225, 17, 10, NULL, NULL, N'Greater flamingo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (226, 40, 51, NULL, NULL, N'Indian leopard', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (227, 26, 16, NULL, NULL, N'Bulbul, black-eyed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (228, 46, 58, NULL, NULL, N'Deer, spotted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (229, 17, 34, NULL, NULL, N'Ring-tailed possum', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (230, 15, 35, NULL, NULL, N'Adouri (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (231, 57, 58, NULL, NULL, N'White-throated monitor', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (232, 16, 43, NULL, NULL, N'Shark, blue', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (233, 31, 27, NULL, NULL, N'Eagle, white-bellied sea', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (234, 39, 55, NULL, NULL, N'Komodo dragon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (235, 19, 51, NULL, NULL, N'Gecko, barking', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (236, 54, 62, NULL, NULL, N'Fox, crab-eating', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (237, 51, 45, NULL, NULL, N'European badger', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (238, 19, 15, NULL, NULL, N'Vulture, egyptian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (239, 41, 12, NULL, NULL, N'Raccoon, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (240, 29, 63, NULL, NULL, N'Fox, arctic', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (241, 55, 27, NULL, NULL, N'Sungazer, yellow-brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (242, 19, 42, NULL, NULL, N'Red-cheeked cordon bleu', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (243, 17, 53, NULL, NULL, N'Snake, western patch-nosed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (244, 48, 20, NULL, NULL, N'Buttermilk snake', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (245, 37, 10, NULL, NULL, N'Eastern quoll', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (246, 26, 32, NULL, NULL, N'House crow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (247, 30, 18, NULL, NULL, N'Bontebok', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (248, 29, 45, NULL, NULL, N'Eastern indigo snake', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (249, 56, 12, NULL, NULL, N'Tapir, brazilian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (250, 53, 9, NULL, NULL, N'Bushbaby, large-eared', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (251, 50, 29, NULL, NULL, N'Mongoose, small indian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (252, 43, 21, NULL, NULL, N'Wallaroo, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (253, 47, 21, NULL, NULL, N'Jungle kangaroo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (254, 23, 33, NULL, NULL, N'Pelican, australian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (255, 27, 22, NULL, NULL, N'Cobra, egyptian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (256, 46, 25, NULL, NULL, N'White-tailed deer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (257, 38, 39, NULL, NULL, N'Superb starling', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (258, 17, 6, NULL, NULL, N'Wolf, timber', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (259, 40, 53, NULL, NULL, N'Armadillo, giant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (260, 57, 39, NULL, NULL, N'Iguana, common green', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (261, 19, 18, NULL, NULL, N'Spider, wolf', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (262, 41, 18, NULL, NULL, N'Dark-winged trumpeter', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (263, 54, 31, NULL, NULL, N'Stork, saddle-billed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (264, 23, 42, NULL, NULL, N'Red-breasted cockatoo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (265, 49, 40, NULL, NULL, N'Wallaby, euro', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (266, 31, 48, NULL, NULL, N'Rhea, gray', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (267, 27, 59, NULL, NULL, N'Greater rhea', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (268, 40, 39, NULL, NULL, N'Siskin, pine', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (269, 53, 57, NULL, NULL, N'Pademelon, red-legged', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (270, 42, 30, NULL, NULL, N'Malay squirrel (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (271, 43, 43, NULL, NULL, N'Ring dove', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (272, 55, 6, NULL, NULL, N'Wallaby, euro', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (273, 17, 12, NULL, NULL, N'North American porcupine', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (274, 49, 39, NULL, NULL, N'Yellow-brown sungazer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (275, 37, 19, NULL, NULL, N'Bahama pintail', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (276, 19, 51, NULL, NULL, N'Comb duck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (277, 58, 18, NULL, NULL, N'Marmot, yellow-bellied', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (278, 58, 38, NULL, NULL, N'Cape white-eye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (279, 31, 7, NULL, NULL, N'Echidna, short-beaked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (280, 41, 6, NULL, NULL, N'Little brown dove', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (281, 20, 32, NULL, NULL, N'Crab-eating fox', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (282, 33, 10, NULL, NULL, N'Goose, egyptian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (283, 46, 8, NULL, NULL, N'Siskin, pine', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (284, 48, 55, NULL, NULL, N'Indian star tortoise', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (285, 38, 41, NULL, NULL, N'Pied avocet', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (286, 28, 29, NULL, NULL, N'Zebra, plains', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (287, 29, 7, NULL, NULL, N'Kori bustard', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (288, 24, 37, NULL, NULL, N'Woodpecker, downy', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (289, 35, 16, NULL, NULL, N'Kori bustard', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (290, 15, 37, NULL, NULL, N'Iguana, land', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (291, 26, 17, NULL, NULL, N'Bird, secretary', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (292, 34, 19, NULL, NULL, N'Swan, black', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (293, 26, 11, NULL, NULL, N'Tawny frogmouth', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (294, 55, 27, NULL, NULL, N'Cliffchat, mocking', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (295, 20, 24, NULL, NULL, N'Red-necked wallaby', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (296, 37, 29, NULL, NULL, N'Red-breasted cockatoo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (297, 33, 18, NULL, NULL, N'Dragon, frilled', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (298, 22, 15, NULL, NULL, N'Barbet, levaillant''s', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (299, 23, 8, NULL, NULL, N'Baboon, savanna', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (300, 40, 32, NULL, NULL, N'Common duiker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (301, 55, 34, NULL, NULL, N'Thirteen-lined squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (302, 25, 24, NULL, NULL, N'Kelp gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (303, 22, 33, NULL, NULL, N'Sheep, american bighorn', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (304, 23, 45, NULL, NULL, N'Red-headed woodpecker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (305, 20, 27, NULL, NULL, N'North American porcupine', 0)
GO
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (306, 23, 6, NULL, NULL, N'Boa, columbian rainbow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (307, 58, 17, NULL, NULL, N'Zorro, azara''s', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (308, 15, 50, NULL, NULL, N'White-throated kingfisher', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (309, 56, 21, NULL, NULL, N'Vulture, griffon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (310, 30, 38, NULL, NULL, N'Butterfly, tropical buckeye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (311, 28, 61, NULL, NULL, N'Rabbit, eastern cottontail', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (312, 50, 58, NULL, NULL, N'Sidewinder', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (313, 18, 19, NULL, NULL, N'Wallaby, bennett''s', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (314, 47, 47, NULL, NULL, N'Jackrabbit, white-tailed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (315, 58, 54, NULL, NULL, N'Puna ibis', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (316, 36, 30, NULL, NULL, N'Worm snake (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (317, 35, 60, NULL, NULL, N'Python (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (318, 44, 11, NULL, NULL, N'Gerbil (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (319, 52, 49, NULL, NULL, N'Stork, white', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (320, 27, 9, NULL, NULL, N'Western bearded dragon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (321, 41, 40, NULL, NULL, N'Miner''s cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (322, 51, 57, NULL, NULL, N'Southern tamandua', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (323, 39, 27, NULL, NULL, N'African lynx', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (324, 50, 52, NULL, NULL, N'Field flicker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (325, 16, 58, NULL, NULL, N'Columbian rainbow boa', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (326, 29, 43, NULL, NULL, N'Lemur, brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (327, 32, 59, NULL, NULL, N'South American sea lion', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (328, 38, 46, NULL, NULL, N'Australian masked owl', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (329, 45, 43, NULL, NULL, N'Screamer, southern', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (330, 42, 15, NULL, NULL, N'Red-knobbed coot', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (331, 15, 55, NULL, NULL, N'Cormorant, little', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (332, 58, 12, NULL, NULL, N'Skink, african', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (333, 32, 46, NULL, NULL, N'Trumpeter, green-winged', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (334, 36, 14, NULL, NULL, N'Phalarope, red', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (335, 50, 30, NULL, NULL, N'Trumpeter, dark-winged', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (336, 36, 58, NULL, NULL, N'Richardson''s ground squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (337, 52, 21, NULL, NULL, N'Black-capped capuchin', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (338, 29, 10, NULL, NULL, N'Shrike, common boubou', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (339, 39, 41, NULL, NULL, N'Anteater, giant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (340, 56, 59, NULL, NULL, N'Sacred ibis', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (341, 54, 45, NULL, NULL, N'Gull, lava', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (342, 17, 51, NULL, NULL, N'Native cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (343, 33, 44, NULL, NULL, N'Herring gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (344, 19, 27, NULL, NULL, N'Mockingbird, galapagos', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (345, 21, 56, NULL, NULL, N'Savannah deer (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (346, 41, 8, NULL, NULL, N'Southern lapwing', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (347, 31, 38, NULL, NULL, N'Bleu, red-cheeked cordon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (348, 33, 26, NULL, NULL, N'Stork, painted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (349, 44, 33, NULL, NULL, N'Common goldeneye', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (350, 16, 29, NULL, NULL, N'Lily trotter', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (351, 50, 43, NULL, NULL, N'Platypus', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (352, 47, 61, NULL, NULL, N'Common genet', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (353, 26, 8, NULL, NULL, N'Western pygmy possum', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (354, 55, 21, NULL, NULL, N'Common wolf', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (355, 22, 44, NULL, NULL, N'Toucan, red-billed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (356, 35, 58, NULL, NULL, N'House crow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (357, 35, 54, NULL, NULL, N'Red-headed woodpecker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (358, 50, 13, NULL, NULL, N'Owl, great horned', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (359, 29, 40, NULL, NULL, N'Long-tailed skua', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (360, 49, 58, NULL, NULL, N'Goose, cape barren', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (361, 31, 51, NULL, NULL, N'Hawk, galapagos', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (362, 39, 59, NULL, NULL, N'Pine squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (363, 19, 16, NULL, NULL, N'Black-tailed deer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (364, 32, 20, NULL, NULL, N'Grizzly bear', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (365, 45, 28, NULL, NULL, N'Bear, grizzly', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (366, 26, 50, NULL, NULL, N'European badger', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (367, 45, 52, NULL, NULL, N'Four-striped grass mouse', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (368, 52, 38, NULL, NULL, N'Gecko, tokay', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (369, 35, 9, NULL, NULL, N'White stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (370, 29, 52, NULL, NULL, N'Common duiker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (371, 51, 18, NULL, NULL, N'Cape wild cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (372, 48, 18, NULL, NULL, N'Feral rock pigeon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (373, 37, 48, NULL, NULL, N'North American porcupine', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (374, 42, 13, NULL, NULL, N'Common long-nosed armadillo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (375, 32, 33, NULL, NULL, N'Bear, polar', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (376, 31, 61, NULL, NULL, N'Wambenger, red-tailed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (377, 45, 32, NULL, NULL, N'Nighthawk, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (378, 41, 31, NULL, NULL, N'Savannah deer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (379, 33, 29, NULL, NULL, N'Heron, yellow-crowned night', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (380, 41, 23, NULL, NULL, N'Great egret', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (381, 44, 46, NULL, NULL, N'Common wallaroo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (382, 48, 17, NULL, NULL, N'Brazilian tapir', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (383, 25, 6, NULL, NULL, N'Baboon, savanna', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (384, 45, 32, NULL, NULL, N'African bush squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (385, 47, 49, NULL, NULL, N'Shrike, crimson-breasted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (386, 52, 12, NULL, NULL, N'Hornbill, yellow-billed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (387, 27, 57, NULL, NULL, N'White-browed owl', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (388, 52, 39, NULL, NULL, N'Civet cat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (389, 54, 43, NULL, NULL, N'Rhinoceros, square-lipped', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (390, 15, 30, NULL, NULL, N'Genet, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (391, 20, 63, NULL, NULL, N'Glossy ibis', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (392, 45, 51, NULL, NULL, N'Gulls (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (393, 50, 52, NULL, NULL, N'Fox, savanna', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (394, 38, 11, NULL, NULL, N'Wolf, timber', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (395, 48, 14, NULL, NULL, N'Roseat flamingo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (396, 24, 19, NULL, NULL, N'Peregrine falcon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (397, 28, 22, NULL, NULL, N'Yellow-throated sandgrouse', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (398, 44, 60, NULL, NULL, N'Pale-throated three-toed sloth', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (399, 15, 18, NULL, NULL, N'Squirrel glider', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (400, 57, 22, NULL, NULL, N'Antelope, four-horned', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (401, 20, 39, NULL, NULL, N'Gecko, barking', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (402, 21, 49, NULL, NULL, N'Monitor, water', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (403, 20, 37, NULL, NULL, N'European shelduck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (404, 36, 14, NULL, NULL, N'Squirrel, nelson ground', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (405, 47, 40, NULL, NULL, N'Bear, black', 0)
GO
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (406, 57, 30, NULL, NULL, N'Gnu, brindled', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (407, 17, 15, NULL, NULL, N'Osprey', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (408, 26, 43, NULL, NULL, N'Phalarope, northern', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (409, 22, 39, NULL, NULL, N'Mouflon', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (410, 17, 37, NULL, NULL, N'Southern brown bandicoot', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (411, 33, 41, NULL, NULL, N'Crab, sally lightfoot', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (412, 45, 14, NULL, NULL, N'Camel, dromedary', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (413, 45, 38, NULL, NULL, N'Stork, woolly-necked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (414, 34, 51, NULL, NULL, N'Duck, mountain', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (415, 49, 8, NULL, NULL, N'Capuchin, brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (416, 19, 59, NULL, NULL, N'Western pygmy possum', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (417, 42, 36, NULL, NULL, N'Cliffchat, mocking', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (418, 54, 32, NULL, NULL, N'Desert tortoise', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (419, 39, 34, NULL, NULL, N'Turkey, australian brush', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (420, 20, 49, NULL, NULL, N'Kangaroo, western grey', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (421, 47, 41, NULL, NULL, N'Madagascar hawk owl', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (422, 57, 32, NULL, NULL, N'Greater roadrunner', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (423, 31, 19, NULL, NULL, N'Brown pelican', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (424, 35, 11, NULL, NULL, N'Red-headed woodpecker', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (425, 41, 21, NULL, NULL, N'Lynx, african', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (426, 17, 25, NULL, NULL, N'Lorikeet, scaly-breasted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (427, 41, 32, NULL, NULL, N'Skimmer, four-spotted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (428, 25, 43, NULL, NULL, N'Slender loris', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (429, 54, 40, NULL, NULL, N'Paddy heron (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (430, 32, 58, NULL, NULL, N'Creeper, black-tailed tree', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (431, 36, 20, NULL, NULL, N'Parrot, hawk-headed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (432, 52, 46, NULL, NULL, N'Rat, desert kangaroo', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (433, 26, 25, NULL, NULL, N'Owl, australian masked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (434, 51, 8, NULL, NULL, N'Gull, pacific', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (435, 60, NULL, 14, 70, N'Grey mouse lemur', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (436, 62, NULL, 11, 13, N'Bobcat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (437, 60, NULL, 13, 30, N'Eleven-banded armadillo (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (438, 62, NULL, 12, 51, N'Goose, knob-nosed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (439, 59, NULL, 10, 18, N'Galapagos hawk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (440, 61, NULL, 7, 95, N'Civet, common palm', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (441, 64, NULL, 9, 23, N'Red-tailed phascogale', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (442, 62, NULL, 8, 67, N'Iguana, common green', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (443, 61, NULL, 12, 73, N'Bulbul, african red-eyed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (444, 61, NULL, 13, 50, N'Otter, canadian river', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (445, 60, NULL, 12, 47, N'Eastern white pelican', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (446, 59, NULL, 11, 86, N'Arctic ground squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (447, 63, NULL, 7, 23, N'Kangaroo, western grey', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (448, 63, NULL, 7, 100, N'Long-tailed jaeger', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (449, 64, NULL, 13, 32, N'Warthog', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (450, 63, NULL, 12, 78, N'Steller sea lion', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (451, 63, NULL, 9, 45, N'Mexican beaded lizard', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (452, 62, NULL, 13, 39, N'Springbuck', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (453, 62, NULL, 8, 41, N'White-necked raven', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (454, 59, NULL, 12, 50, N'Elephant, african', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (455, 61, NULL, 15, 74, N'Stork, black-necked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (456, 64, NULL, 11, 20, N'Brush-tailed bettong', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (457, 61, NULL, 15, 78, N'Cape starling', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (458, 62, NULL, 11, 61, N'European red squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (459, 60, NULL, 11, 98, N'White-mantled colobus', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (460, 59, NULL, 9, 73, N'Wallaby, bennett''s', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (461, 61, NULL, 14, 18, N'Brazilian tapir', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (462, 63, NULL, 13, 70, N'Elegant crested tinamou', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (463, 62, NULL, 8, 10, N'Vulture, egyptian', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (464, 60, NULL, 14, 77, N'Red-winged blackbird', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (465, 60, NULL, 9, 38, N'Raven, white-necked', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (466, 60, NULL, 13, 65, N'Yellow mongoose', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (467, 59, NULL, 13, 25, N'White-winged dove', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (468, 60, NULL, 7, 54, N'Seal, southern elephant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (469, 64, NULL, 11, 76, N'Eurasian badger', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (470, 63, NULL, 15, 90, N'Jackal, silver-backed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (471, 62, NULL, 10, 66, N'Antelope, roan', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (472, 61, NULL, 15, 56, N'Ferruginous hawk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (473, 64, NULL, 11, 87, N'Yellow-billed stork', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (474, 61, NULL, 12, 18, N'Australian pelican', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (475, 64, NULL, 8, 79, N'Ring-tailed possum', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (476, 60, NULL, 10, 30, N'Blue wildebeest', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (477, 60, NULL, 9, 59, N'Chimpanzee', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (478, 59, NULL, 14, 29, N'Large cormorant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (479, 64, NULL, 8, 35, N'African bush squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (480, 61, NULL, 12, 31, N'Colobus, white-mantled', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (481, 61, NULL, 13, 26, N'Arctic fox', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (482, 62, NULL, 9, 58, N'Eastern fox squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (483, 61, NULL, 10, 12, N'Praying mantis (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (484, 60, NULL, 12, 54, N'Indian mynah', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (485, 60, NULL, 9, 52, N'Crane, sarus', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (486, 64, NULL, 11, 90, N'Sandpiper, spotted wood', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (487, 61, NULL, 9, 65, N'Vine snake (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (488, 59, NULL, 7, 91, N'Agouti', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (489, 60, NULL, 10, 28, N'Alligator, mississippi', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (490, 62, NULL, 10, 53, N'Bulbul, black-fronted', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (491, 59, NULL, 9, 100, N'Crimson-breasted shrike', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (492, 62, NULL, 9, 25, N'Hornbill, yellow-billed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (493, 61, NULL, 8, 35, N'Red lava crab', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (494, 64, NULL, 7, 29, N'Lava gull', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (495, 62, NULL, 13, 86, N'Oriental white-backed vulture', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (496, 59, NULL, 13, 33, N'Bird, pied butcher', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (497, 63, NULL, 8, 70, N'Gerenuk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (498, 61, NULL, 15, 24, N'Flycatcher, tyrant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (499, 59, NULL, 9, 26, N'Brocket, brown', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (500, 60, NULL, 9, 95, N'Arboral spiny rat', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (501, 64, NULL, 8, 23, N'Eastern boa constrictor', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (502, 64, NULL, 9, 6, N'Huron', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (503, 59, NULL, 9, 74, N'Antelope ground squirrel', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (504, 62, NULL, 8, 31, N'Yellow-brown sungazer', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (505, 62, NULL, 11, 81, N'Mountain duck', 0)
GO
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (506, 59, NULL, 12, 68, N'Scottish highland cow', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (507, 60, NULL, 14, 37, N'Cat, european wild', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (508, 64, NULL, 8, 42, N'Blue shark', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (509, 62, NULL, 13, 15, N'Vulture, white-headed', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (510, 59, NULL, 13, 9, N'Striped skunk', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (511, 63, NULL, 13, 94, N'Woodrat (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (512, 62, NULL, 10, 64, N'Penguin, galapagos', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (513, 61, NULL, 11, 85, N'Squirrel, malabar', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (514, 60, NULL, 8, 42, N'Elk, Wapiti', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (515, 62, NULL, 9, 33, N'Frogmouth, tawny', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (516, 60, NULL, 12, 79, N'Brown lemur', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (517, 61, NULL, 9, 25, N'Laughing dove', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (518, 62, NULL, 13, 67, N'Monkey, bleeding heart', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (519, 62, NULL, 10, 93, N'Monitor lizard (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (520, 62, NULL, 15, 37, N'Snow goose', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (521, 60, NULL, 12, 90, N'Common pheasant', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (522, 59, NULL, 14, 47, N'Green-winged macaw', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (523, 59, NULL, 9, 91, N'Fat-tailed dunnart', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (524, 59, NULL, 9, 31, N'Monkey, bleeding heart', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (525, 64, NULL, 10, 37, N'Wolf spider', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (526, 62, NULL, 10, 61, N'Wombat, common', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (527, 64, NULL, 14, 85, N'Great kiskadee', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (528, 64, NULL, 15, 64, N'Red-capped cardinal', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (529, 63, NULL, 11, 59, N'Western palm tanager (unidentified)', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (530, 64, NULL, 12, 5, N'Gazer, sun', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (531, 63, NULL, 11, 66, N'Dolphin, striped', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (532, 60, NULL, 8, 26, N'Stork, white', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (533, 63, NULL, 8, 88, N'Gazer, sun', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (534, 60, NULL, 15, 17, N'Gull, pacific', 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (535, 65, 63, NULL, NULL, NULL, 0)
INSERT [dbo].[InvoiceLines] ([LineId], [InvoiceId], [ServiceId], [MaterialId], [Quantity], [Comment], [delete_flag]) VALUES (536, 66, 60, NULL, NULL, NULL, 0)
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
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (9, 26, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (10, 27, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (11, 28, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (12, 29, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (13, 30, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (14, 31, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (15, 32, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (16, 33, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (17, 34, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (18, 35, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (19, 36, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (20, 37, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (21, 38, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (22, 39, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (23, 40, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (24, 41, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (25, 42, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (26, 43, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (27, 44, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (28, 45, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (29, 46, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (30, 47, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (31, 48, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (32, 49, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (33, 50, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (34, 51, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (35, 52, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (36, 53, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (37, 54, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (38, 55, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (39, 56, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (40, 57, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (41, 58, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (42, 59, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (43, 60, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (44, 61, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (45, 62, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (46, 63, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (47, 64, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (48, 65, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (49, 66, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (50, 67, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (51, 68, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (52, 69, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (53, 70, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (54, 71, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (55, 72, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (56, 73, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (57, 74, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (58, 75, 0)
INSERT [dbo].[MedicalRecord] ([medicalRecordId], [patientId], [delete_flag]) VALUES (62, 102, 0)
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord Details] ON 

INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (2, 2, 2, 1, N'strin2g', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (3, 2, 2, 17, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (11, 2, 37, 16, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (13, 2, 38, NULL, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (15, 2, 33, 12, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (16, 2, 34, 13, N'string', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (17, 33, 12, 23, N'Unspecified viral hepatitis with hepatic coma', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (18, 28, 20, 37, N'Genitourinary tuberculosis, unspecified, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (19, 52, 26, 31, N'Chronic leukemia of unspecified cell type, in relapse', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (20, 43, 25, 70, N'Unspecified abortion, complicated by shock, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (21, 38, 7, 75, N'Respiratory failure of newborn', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (22, 7, 47, 70, N'Anaphylactic reaction due to peanuts', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (23, 46, 26, 49, N'Chronic systolic heart failure', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (24, 52, 37, 24, N'Retained (old) foreign body following penetrating wound of orbit', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (25, 45, 15, 33, N'Viral pneumonia, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (26, 21, 20, 68, N'Injury by other specified means, undetermined whether accidentally or purposely inflicted', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (27, 17, 43, 102, N'Megakaryocytic leukemia, in remission', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (28, 25, 14, 109, N'Blister of elbow, forearm, and wrist, without mention of infection', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (29, 34, 30, 103, N'Deep necrosis of underlying tissues [deep third degree] with loss of a body part, of lower leg', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (30, 35, 39, 79, N'Hypertensive heart and chronic kidney disease, benign, with heart failure and with chronic kidney disease stage I through stage IV, or unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (31, 12, 8, 50, N'Open fractures involving skull or face with other bones, with other and unspecified intracranial hemorrhage, with loss of consciousness of unspecified duration', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (32, 55, 43, 105, N'Mucocele of salivary gland', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (33, 26, 28, 73, N'Bacterial pneumonia, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (34, 36, 26, 41, N'Trigonitis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (35, 23, 54, 30, N'Pneumonia due to mycoplasma pneumoniae', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (36, 24, 52, 111, N'SARS-associated coronavirus', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (37, 39, 62, 46, N'Body Mass Index 50.0-59.9, adult', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (38, 23, 47, 103, N'Poisoning by adrenal cortical steroids', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (39, 58, 18, 94, N'Chagas'' disease without mention of organ involvement', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (40, 20, 36, 63, N'Cortex (cerebral) laceration without mention of open intracranial wound, with concussion, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (41, 34, 43, 117, N'Contact with and (suspected) exposure to other hazardous metals', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (42, 23, 35, 43, N'Erythema [first degree] of chin', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (43, 16, 55, 90, N'Conductive hearing loss of combined types', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (44, 26, 18, 27, N'Late effects of genitourinary tuberculosis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (45, 51, 32, 75, N'Hypervitaminosis D', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (46, 21, 50, 37, N'Focal retinitis and retinochoroiditis of other posterior pole', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (47, 28, 16, 53, N'Disproportion of other origin, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (48, 45, 54, 60, N'Air embolism as a complication of medical care, not elsewhere classified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (49, 57, 52, 52, N'Simple chronic conjunctivitis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (50, 11, 17, 107, N'Noncollision motor vehicle traffic accident while boarding or alighting injuring passenger on motorcycle', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (51, 26, 35, 39, N'Unspecified drug dependence, episodic', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (52, 22, 14, 20, N'Closed fracture of carpal bone, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (53, 15, 9, 86, N'Cerebral edema', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (54, 58, 18, 29, N'Abnormal glandular Papanicolaou smear of anus', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (55, 28, 36, 68, N'Malignant neoplasm of connective and other soft tissue of upper limb, including shoulder', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (56, 7, 23, 102, N'Influenza due to identified novel influenza A virus with other respiratory manifestations', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (57, 23, 19, 92, N'Other child abuse and neglect', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (58, 2, 35, 97, N'Other specified cardiovascular syphilis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (59, 6, 8, 40, N'Extradural hemorrhage following injury without mention of open intracranial wound, with loss of consciousness of unspecified duration', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (60, 1, 19, 35, N'Accidental poisoning by sympatholytics [antiadrenergics]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (61, 33, 57, 90, N'Screening for other and unspecified respiratory conditions', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (62, 23, 38, 29, N'Supervision of unspecified high-risk pregnancy', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (63, 36, 59, 83, N'Acute myocardial infarction of inferoposterior wall, initial episode of care', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (64, 54, 20, 79, N'Malignant neoplasm of lower lobe, bronchus or lung', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (65, 13, 52, 40, N'Sprain of sacrotuberous (ligament)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (66, 31, 43, 35, N'Abscess of eyelid', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (67, 42, 45, 23, N'Femoral hernia with gangrene, bilateral (not specified as recurrent)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (68, 2, 18, 104, N'Congenital chordee', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (69, 16, 22, 89, N'Gonococcal endocarditis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (70, 12, 30, 84, N'Traumatic amputation of arm and hand (complete) (partial), unilateral, below elbow, without mention of complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (71, 48, 49, 45, N'Problems with sexual function', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (72, 5, 61, 64, N'Open fracture of multiple ribs, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (73, 3, 56, 44, N'Tuberculous encephalitis or myelitis, bacteriological or histological examination not done', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (74, 22, 23, 49, N'Traumatic amputation of leg(s) (complete) (partial), unilateral, below knee, complicated', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (75, 21, 34, 71, N'Closed fractures involving skull or face with other bones, with other and unspecified intracranial hemorrhage, unspecified state of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (76, 24, 53, 81, N'Coronary atherosclerosis of native coronary artery', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (77, 48, 23, 81, N'Other joint derangement, not elsewhere classified, upper arm', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (78, 21, 60, 108, N'Other disorders of menstruation and other abnormal bleeding from female genital tract', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (79, 36, 43, 98, N'Closed fracture of shaft of ulna (alone)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (80, 36, 13, 46, N'Squamous cell carcinoma of other specified sites of skin', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (81, 43, 8, 19, N'Urethral false passage', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (82, 12, 37, 21, N'Longitudinal deficiency, tarsals or metatarsals, complete or partial (with or without incomplete phalangeal deficiency)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (83, 58, 63, 75, N'Nontraffic accident involving other off-road motor vehicle injuring pedal cyclist', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (84, 43, 61, 50, N'Need for prophylactic vaccination and inoculation against tetanus-diphtheria [Td] (DT)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (85, 33, 59, 113, N'Kaschin-Beck disease, hand', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (86, 58, 14, 116, N'Other specified vaccinations against hemophilus influenza, type B [Hib]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (87, 2, 63, 35, N'Full incontinence of feces', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (88, 5, 19, 100, N'Pneumonia in cytomegalic inclusion disease', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (89, 16, 35, 43, N'Family history of congenital anomalies', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (90, 32, 12, 81, N'Open wound of ossicles, complicated', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (91, 16, 36, 27, N'Breech or other malpresentation successfully converted to cephalic presentation, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (92, 20, 35, 45, N'Cor biloculare', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (93, 48, 52, 48, N'Burkitt''s tumor or lymphoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (94, 37, 41, 29, N'Maternal distress complicating labor and delivery, postpartum condition or complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (95, 10, 34, 68, N'Poisoning by anti-common cold drugs', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (96, 25, 7, 39, N'Visuospatial deficit', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (97, 53, 13, 60, N'Influenza with other manifestations', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (98, 1, 6, 66, N'Other symptoms referable to back', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (99, 57, 51, 100, N'Injury to carotid artery, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (100, 25, 16, 45, N'Fall in, on, or from aircraft injuring occupant of unpowered aircraft, except parachutist', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (101, 29, 32, 80, N'Anomalies of relationship of jaw to cranial base, other jaw asymmetry', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (102, 18, 50, 101, N'Accidental mechanical suffocation by falling earth or other substance', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (103, 28, 12, 66, N'Open fracture of first cervical vertebra', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (104, 7, 29, 112, N'Fetal conjoined twins, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (105, 45, 7, 42, N'Nonspecific (abnormal) findings on radiological and other examination of genitourinary organs', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (106, 9, 9, 86, N'Unspecified vertiginous syndromes and labyrinthine disorders', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (107, 30, 38, 55, N'Terrorism involving nuclear weapons', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (108, 16, 55, 28, N'Better eye: severe vision impairment; lesser eye: profound vision impairment', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (109, 23, 36, 114, N'Adult pulmonary Langerhans cell histiocytosis', 0)
GO
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (110, 44, 33, 85, N'Other otosclerosis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (111, 39, 45, 94, N'Genu valgum (acquired)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (112, 29, 46, 55, N'Malignant melanoma of skin of lower limb, including hip', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (113, 32, 39, 62, N'Injury to external carotid artery', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (114, 31, 33, 68, N'Twin birth, mate liveborn, born in hospital, delivered by cesarean section', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (115, 43, 41, 110, N'Anal sphincter tear complicating delivery, not associated with third-degree perineal laceration, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (116, 6, 24, 82, N'Erythema infectiosum (fifth disease)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (117, 16, 52, 59, N'Corticosteroid-induced glaucoma, residual stage', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (118, 31, 39, 111, N'Psychogenic paranoid psychosis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (119, 32, 11, 44, N'Full incontinence of feces', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (120, 12, 23, 50, N'Injury due to sea-based artillery shell', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (121, 49, 32, 18, N'Closed dislocation, first cervical vertebra', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (122, 9, 46, 71, N'Trigger finger (acquired)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (123, 8, 39, 73, N'Legally induced abortion, complicated by renal failure, complete', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (124, 21, 47, 22, N'Pressure ulcer, stage III', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (125, 48, 45, 83, N'Malignant neoplasm of vertebral column, excluding sacrum and coccyx', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (126, 35, 51, 53, N'Need for isolation', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (127, 57, 63, 86, N'Accidental poisoning by unspecified drug', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (128, 43, 15, 91, N'Cold injury syndrome of newborn', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (129, 45, 16, 83, N'Hernia of unspecified site, with gangrene', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (130, 52, 31, 53, N'Benign neoplasm of bones of skull and face', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (131, 24, 51, 51, N'Other specified tuberculosis of central nervous system, tubercle bacilli not found by bacteriological or histological examination, but tuberculosis confirmed by other methods [inoculation of animals]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (132, 22, 38, 38, N'Herpes zoster without mention of complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (133, 58, 40, 85, N'Cannabis abuse, in remission', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (134, 23, 46, 102, N'Other middle ear adhesions and combinations', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (135, 34, 51, 46, N'Papyraceous fetus, antepartum condition or complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (136, 45, 23, 99, N'Injury to other intra-abdominal organs without mention of open wound into cavity, adrenal gland', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (137, 30, 60, 44, N'Nontraffic accident involving other off-road motor vehicle injuring unspecified person', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (138, 5, 45, 80, N'Idiopathic urticaria', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (139, 38, 26, 76, N'Other phlebitis and thrombosis complicating pregnancy and the puerperium, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (140, 55, 21, 57, N'Malignant neoplasm of connective and other soft tissue of trunk, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (141, 49, 50, 55, N'Deviation in opening and closing of the mandible', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (142, 48, 6, 98, N'Other open skull fracture with subarachnoid, subdural, and extradural hemorrhage, with no loss of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (143, 54, 17, 20, N'"Light-for-dates" without mention of fetal malnutrition, less than 500 grams', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (144, 26, 6, 69, N'Ankylosing spondylitis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (145, 21, 52, 27, N'Tick-borne viral encephalitis, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (146, 36, 57, 68, N'Railway accident involving derailment without antecedent collision injuring pedal cyclist', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (147, 25, 34, 103, N'Contusion of shoulder region', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (148, 38, 16, 58, N'Ischiocapsular (ligament) sprain', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (149, 18, 49, 107, N'Closed fracture of mandible, alveolar border of body', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (150, 2, 54, 53, N'Benign neoplasm of fallopian tube and uterine ligaments', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (151, 58, 51, 29, N'Chronic venous embolism and thrombosis of internal jugular veins', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (152, 40, 34, 76, N'Other drug-induced pancytopenia', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (153, 33, 28, 41, N'Psychosexual dysfunction, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (154, 16, 9, 110, N'Other disorders of middle ear and mastoid', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (155, 8, 39, 35, N'Multiple involvement of mitral and aortic valves', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (156, 26, 49, 110, N'Other staphylococcal septicemia', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (157, 54, 48, 91, N'Contact with and (suspected) exposure to algae bloom', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (158, 57, 54, 18, N'Focal retinitis and retinochoroiditis, macular or paramacular', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (159, 25, 48, 91, N'Late effects of intracranial abscess or pyogenic infection', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (160, 10, 14, 48, N'Open wound of penis, without mention of complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (161, 30, 18, 61, N'Other closed skull fracture with intracranial injury of other and unspecified nature, with no loss of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (162, 18, 41, 52, N'Tension headache', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (163, 37, 30, 111, N'Other anaphylactic reaction', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (164, 31, 17, 79, N'Unspecified infective arthritis, pelvic region and thigh', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (165, 16, 44, 116, N'Carbuncle and furuncle of hand', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (166, 50, 34, 73, N'Hypotony of eye, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (167, 45, 14, 90, N'Unspecified disorder of muscle, ligament, and fascia', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (168, 34, 63, 50, N'Carcinoma in situ of skin of ear and external auditory canal', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (169, 42, 32, 98, N'Anomaly of middle ear, except ossicles', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (170, 1, 60, 94, N'Spontaneous abortion, with unspecified complication, incomplete', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (171, 28, 24, 79, N'Microstomia', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (172, 37, 27, 102, N'Injury to descending [left] colon, with open wound into cavity', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (173, 21, 33, 77, N'Tuberculosis of eye, tubercle bacilli not found (in sputum) by microscopy, but found by bacterial culture', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (174, 50, 6, 108, N'Other specified pervasive developmental disorders, current or active state', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (175, 25, 60, 67, N'Trachoma, active stage', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (176, 10, 44, 112, N'Phenothiazine-based tranquilizers causing adverse effects in therapeutic use', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (177, 52, 51, 18, N'Dentofacial functional abnormality, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (178, 30, 32, 101, N'Disruption of perineal wound, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (179, 38, 53, 33, N'Foreign body in bladder and urethra', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (180, 9, 38, 58, N'Open fracture of mandible, symphysis of body', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (181, 20, 12, 108, N'Malignant neoplasm of specified parts of peritoneum', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (182, 7, 20, 19, N'Contact with or exposure to smallpox', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (183, 7, 44, 18, N'Fall from snowboard', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (184, 41, 52, 60, N'Arthropathy associated with helminthiasis, hand', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (185, 47, 30, 74, N'Other and unspecified pityriasis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (186, 26, 43, 32, N'Unspecified hemorrhoids with other complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (187, 45, 34, 90, N'Calculus of gallbladder with acute cholecystitis, without mention of obstruction', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (188, 19, 32, 36, N'Cubitus valgus (acquired)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (189, 10, 29, 104, N'Other open skull fracture with cerebral laceration and contusion, with no loss of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (190, 13, 28, 57, N'Hodgkin''s sarcoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (191, 3, 56, 117, N'Bipolar I disorder, single manic episode, in partial or unspecified remission', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (192, 22, 59, 32, N'Adenovirus infection in conditions classified elsewhere and of unspecified site', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (193, 29, 49, 108, N'Chondrocalcinosis, due to pyrophosphate crystals, shoulder region', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (194, 47, 23, 72, N'Family history of sudden cardiac death (SCD)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (195, 30, 26, 77, N'Pathological resorption, external', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (196, 49, 17, 23, N'Fitting and adjustment of other cardiac device', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (197, 24, 7, 82, N'Other and unspecified abnormality of organs and soft tissues of pelvis, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (198, 38, 63, 92, N'Late effect of burns of other specified sites', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (199, 44, 52, 73, N'Chronic venous embolism and thrombosis of subclavian veins', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (200, 50, 21, 64, N'Poisoning by keratolytics, keratoplastics, other hair treatment drugs and preparations', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (201, 54, 8, 74, N'Developmental coordination disorder', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (202, 33, 34, 98, N'Other benign neoplasm of connective and other soft tissue of pelvis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (203, 32, 10, 79, N'Other motor vehicle nontraffic accident involving collision with moving object injuring rider of animal; occupant of animal-drawn vehicle', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (204, 9, 52, 28, N'Syphilitic retrobulbar neuritis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (205, 41, 53, 96, N'Aftercare for healing pathologic fracture of lower arm', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (206, 47, 22, 77, N'Transient arthropathy, hand', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (207, 41, 32, 103, N'Fibrinolysis-affecting drugs causing adverse effects in therapeutic use', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (208, 18, 24, 31, N'Malignant neoplasm of thorax', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (209, 3, 49, 41, N'Unspecified monoplegia', 0)
GO
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (210, 45, 38, 33, N'Other and unspecified infection due to central venous catheter', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (211, 15, 22, 96, N'Other and unspecified cerebral laceration and contusion, without mention of open intracranial wound, with concussion, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (212, 31, 6, 54, N'Screening examination for rubella', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (213, 21, 34, 83, N'Pulmonary alveolar microlithiasis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (214, 18, 18, 47, N'Family history of other lymphatic and hematopoietic neoplasms', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (215, 7, 37, 102, N'Cardiac arrest', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (216, 18, 63, 38, N'Disorders of hypoglossal [12th] nerve', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (217, 24, 61, 110, N'Nonspecific abnormal findings in saliva', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (218, 45, 55, 72, N'Tuberculosis of lung, nodular, tubercle bacilli not found by bacteriological or histological examination, but tuberculosis confirmed by other methods [inoculation of animals]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (219, 23, 7, 89, N'Deep phlebothrombosis, postpartum, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (220, 48, 19, 44, N'Injury to other specified blood vessels of head and neck', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (221, 36, 22, 69, N'Chronic leukemia of unspecified cell type, in relapse', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (222, 33, 13, 106, N'Acute osteomyelitis, pelvic region and thigh', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (223, 22, 23, 27, N'Secondary neuroendocrine tumor of distant lymph nodes', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (224, 41, 56, 28, N'Dental drugs topically applied causing adverse effects in therapeutic use', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (225, 50, 36, 74, N'Acute sinusitis, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (226, 32, 56, 22, N'Unspecified disorder of pancreatic internal secretion', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (227, 38, 56, 51, N'Ulcer of esophagus without bleeding', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (228, 23, 21, 39, N'Problems with smell and taste', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (229, 17, 20, 64, N'Personal history of (corrected) congenital malformations of digestive system', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (230, 42, 13, 66, N'Other motor vehicle nontraffic accident involving collision with stationary object injuring pedal cyclist', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (231, 49, 17, 104, N'Head injury, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (232, 31, 9, 78, N'Other symbolic dysfunction', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (233, 57, 33, 116, N'Accident to powered aircraft at takeoff or landing injuring occupant of military aircraft, any', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (234, 12, 45, 48, N'Open wound of cheek, without mention of complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (235, 54, 63, 109, N'Other sickle-cell disease without crisis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (236, 32, 46, 41, N'Effects of air pressure caused by explosion', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (237, 38, 24, 49, N'Breech presentation without mention of version, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (238, 49, 63, 106, N'Retained wood fragments', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (239, 55, 30, 64, N'Fall in, on, or from railway train injuring other specified person', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (240, 7, 62, 64, N'Other primary syphilis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (241, 9, 30, 19, N'Merkel cell carcinoma of the lower limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (242, 1, 16, 27, N'Poisoning by sympathomimetics [adrenergics]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (243, 3, 15, 40, N'Transient tic disorder', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (244, 44, 33, 32, N'Sprain of unspecified site of back', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (245, 32, 10, 67, N'Person awaiting admission to adequate facility elsewhere', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (246, 2, 14, 98, N'Suppressed lactation, antepartum condition or complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (247, 15, 21, 113, N'Struck accidentally by falling object', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (248, 23, 60, 101, N'Osteoarthrosis, unspecified whether generalized or localized, hand', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (249, 28, 22, 46, N'Closed fracture of three ribs', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (250, 8, 15, 56, N'Genitourinary tuberculosis, unspecified, tubercle bacilli not found by bacteriological or histological examination, but tuberculosis confirmed by other methods [inoculation of animals]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (251, 53, 35, 40, N'Open fractures involving skull or face with other bones, with other and unspecified intracranial hemorrhage, with concussion, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (252, 32, 30, 29, N'Chronic tension type headache', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (253, 15, 15, 102, N'Pediculus capitis [head louse]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (254, 26, 25, 81, N'Tuberculosis of epididymis, bacteriological or histological examination not done', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (255, 30, 44, 78, N'Secondary diabetes mellitus with other specified manifestations, not stated as uncontrolled, or unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (256, 4, 30, 89, N'Malignant neoplasm of other specified sites of cervix', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (257, 38, 54, 94, N'Anti-infectives affecting fetus or newborn via placenta or breast milk', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (258, 34, 45, 75, N'Tuberculous pneumonia [any form], tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (259, 26, 52, 24, N'Palindromic rheumatism, forearm', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (260, 40, 8, 34, N'Vascular hamartomas', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (261, 43, 25, 103, N'Ventricular flutter', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (262, 39, 33, 25, N'Reticulosarcoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (263, 10, 49, 98, N'Persistent hyperplasia of thymus', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (264, 35, 19, 29, N'Macular degeneration (senile), unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (265, 47, 25, 35, N'Coronary atherosclerosis of unspecified bypass graft', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (266, 35, 62, 86, N'Delirium due to conditions classified elsewhere', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (267, 9, 50, 39, N'Abnormal mammogram, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (268, 8, 30, 115, N'Closed fracture of vault of skull without mention of intracranial injury, unspecified state of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (269, 15, 16, 101, N'Specified congenital anomalies of breast', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (270, 29, 39, 83, N'Chronic glomerulonephritis with lesion of membranoproliferative glomerulonephritis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (271, 36, 7, 24, N'Q fever', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (272, 5, 22, 84, N'Newborn affected by amniocentesis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (273, 45, 21, 26, N'Unspecified congenital anomaly of brain, spinal cord, and nervous system', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (274, 20, 8, 21, N'Injury to posterior tibial artery', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (275, 5, 35, 70, N'Chronic persistent hepatitis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (276, 21, 12, 20, N'Other forms of migraine, with intractable migraine, so stated, with status migrainosus', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (277, 29, 14, 88, N'Accidental poisoning by barbiturates', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (278, 5, 7, 108, N'Nonspecific abnormal results of pulmonary function study', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (279, 27, 38, 44, N'Fetal distress first noted during labor and delivery, in liveborn infant', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (280, 50, 41, 29, N'Open wound of nasal sinus, complicated', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (281, 44, 21, 44, N'Screening examination for mycotic infections', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (282, 34, 46, 104, N'Sprain of lateral collateral ligament of knee', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (283, 10, 48, 52, N'Hodgkin''s disease, lymphocytic depletion, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (284, 53, 34, 47, N'Pelvic hematoma, postpartum condition or complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (285, 15, 12, 89, N'Other and unspecified cerebral laceration and contusion, without mention of open intracranial wound, with moderate [1-24 hours] loss of consciousness', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (286, 35, 26, 109, N'Injury to other specified nerve(s)', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (287, 52, 33, 96, N'Late effects of injuries due to legal intervention', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (288, 40, 12, 31, N'Other open anterior dislocation of hip', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (289, 28, 33, 44, N'Allergy to existing dental restorative material', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (290, 10, 9, 108, N'Postsurgical hypoinsulinemia', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (291, 52, 42, 76, N'Malignant neoplasm of cervical esophagus', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (292, 24, 43, 88, N'Obesity complicating pregnancy, childbirth, or the puerperium, postpartum condition or complication', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (293, 1, 33, 40, N'Malignant neoplasm of nasal cavities', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (294, 53, 17, 21, N'Sensory disorders of eyelid', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (295, 16, 55, 27, N'Partial edentulism, class IV', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (296, 10, 45, 80, N'Injury to other specified blood vessels of abdomen and pelvis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (297, 4, 62, 32, N'Accidental poisoning by other specified drugs', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (298, 51, 14, 102, N'Refereeing a sports activity', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (299, 16, 61, 91, N'Mantle cell lymphoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (300, 4, 49, 77, N'Sprain of interphalangeal (joint), toe', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (301, 17, 29, 25, N'Contact with or exposure to unspecified communicable disease', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (302, 4, 29, 93, N'Open fracture of upper end of fibula alone', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (303, 58, 13, 83, N'Syndactyly of toes with fusion of bone', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (304, 13, 33, 61, N'Crushing injury of other specified sites of trunk', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (305, 36, 36, 63, N'Bipolar I disorder, single manic episode, severe, specified as with psychotic behavior', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (306, 56, 35, 53, N'Isolated tracheal or bronchial tuberculosis, unspecified', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (307, 56, 60, 51, N'Elevated cancer antigen 125 [CA 125]', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (308, 47, 27, 84, N'Arthropathy in Behcet''s syndrome, pelvic region and thigh', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (309, 24, 36, 100, N'Marginal zone lymphoma, unspecified site, extranodal and solid organ sites', 0)
GO
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (310, 11, 6, 100, N'Meningitis due to trypanosomiasis', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (311, 29, 54, 60, N'Inhalation and ingestion of other object causing obstruction of respiratory tract or suffocation', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (312, 37, 9, 56, N'Flat foot', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (313, 45, 42, 25, N'Antimalarials and drugs acting on other blood protozoa causing adverse effects in therapeutic use', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (314, 29, 43, 61, N'Tuberculosis of other female genital organs, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (315, 41, 23, 110, N'Corticosteroid-induced glaucoma, residual stage', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (316, 20, 63, 57, N'Ptosis of breast', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (317, 62, 63, 57, N'ok', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (318, 62, NULL, NULL, NULL, 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (319, 62, 60, 100, N'ok', 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (320, 62, NULL, NULL, NULL, 0)
INSERT [dbo].[MedicalRecord Details] ([mr_detail_id], [medicalRecord_id], [service_id], [prescription_id], [diagnosis], [delete_flag]) VALUES (321, 62, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[MedicalRecord Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (1, N'Gan', N'abc', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 800, 30, N's 2 t 2', N'xyz', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (2, N'Than', N'xyz', CAST(N'2025-02-22' AS Date), CAST(N'2024-02-22' AS Date), 500, 10, N'toi 2', N'abc', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (4, N'string', N'string', CAST(N'2024-02-28' AS Date), CAST(N'2024-02-28' AS Date), 200, 200, N'string', N'string', 1)
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
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (55, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10, 200, N's 2 t 2', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (56, N'Test Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (57, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (58, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (59, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (60, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (61, N'Test Medicine', N'Updated Manufacturer', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (62, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (63, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (64, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (65, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 1, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (66, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 0, 100, N'string', N'string', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (67, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (68, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (69, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10.99, 100, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (70, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 1, 100, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (71, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 1, 100, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (72, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10.99, 100, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (73, N'string', N'string', CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 10.99, 100, N'string', N'string', 1)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (74, N'Updated Medicine', N'Updated Manufacturer', CAST(N'2030-03-30' AS Date), CAST(N'2024-02-20' AS Date), 10.99, 100, N'Updated Dosage', N'Updated Description', 0)
INSERT [dbo].[Medicine] ([id], [name], [manufacturer], [expiry_date], [input_day], [price], [quantityInStock], [dosage], [description], [delete_flag]) VALUES (75, N'string', N'string', CAST(N'2024-03-29' AS Date), CAST(N'2024-02-29' AS Date), 10.99, 100, N'string', N'string', 1)
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
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (18, 0, CAST(N'2024-02-08T00:00:00.000' AS DateTime), 82, N'2593')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (19, 0, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 86, N'36924')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (20, 0, CAST(N'2023-05-17T00:00:00.000' AS DateTime), 77, N'V131')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (21, 0, CAST(N'2024-01-23T00:00:00.000' AS DateTime), 79, N'29583')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (22, 0, CAST(N'2023-03-20T00:00:00.000' AS DateTime), 82, N'53461')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (23, 0, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 83, N'E8352')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (24, 0, CAST(N'2023-08-22T00:00:00.000' AS DateTime), 84, N'9638')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (25, 0, CAST(N'2024-03-11T00:00:00.000' AS DateTime), 85, N'7703')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (26, 0, CAST(N'2023-06-19T00:00:00.000' AS DateTime), 79, N'36751')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (27, 0, CAST(N'2023-07-19T00:00:00.000' AS DateTime), 84, N'71598')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (28, 0, CAST(N'2023-09-27T00:00:00.000' AS DateTime), 81, N'20102')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (29, 0, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 86, N'86800')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (30, 0, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 81, N'4258')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (31, 0, CAST(N'2023-06-13T00:00:00.000' AS DateTime), 79, N'67651')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (32, 0, CAST(N'2023-07-19T00:00:00.000' AS DateTime), 81, N'2811')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (33, 0, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 84, N'94137')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (34, 0, CAST(N'2023-05-18T00:00:00.000' AS DateTime), 86, N'37957')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (35, 0, CAST(N'2023-09-02T00:00:00.000' AS DateTime), 82, N'29515')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (36, 0, CAST(N'2023-07-13T00:00:00.000' AS DateTime), 87, N'2243')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (37, 0, CAST(N'2024-03-01T00:00:00.000' AS DateTime), 86, N'41031')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (38, 0, CAST(N'2023-11-06T00:00:00.000' AS DateTime), 85, N'9393')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (39, 0, CAST(N'2024-01-18T00:00:00.000' AS DateTime), 87, N'E9539')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (40, 0, CAST(N'2023-06-02T00:00:00.000' AS DateTime), 78, N'73819')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (41, 0, CAST(N'2023-09-18T00:00:00.000' AS DateTime), 83, N'4789')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (42, 0, CAST(N'2023-09-06T00:00:00.000' AS DateTime), 85, N'0639')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (43, 0, CAST(N'2023-05-07T00:00:00.000' AS DateTime), 85, N'37141')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (44, 0, CAST(N'2023-08-19T00:00:00.000' AS DateTime), 84, N'20036')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (45, 0, CAST(N'2023-04-24T00:00:00.000' AS DateTime), 83, N'V820')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (46, 0, CAST(N'2024-01-11T00:00:00.000' AS DateTime), 86, N'E9520')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (47, 0, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 87, N'9244')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (48, 0, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 80, N'7584')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (49, 0, CAST(N'2024-03-12T00:00:00.000' AS DateTime), 84, N'64400')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (50, 0, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 77, N'E9887')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (51, 0, CAST(N'2023-09-04T00:00:00.000' AS DateTime), 81, N'9942')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (52, 0, CAST(N'2024-03-13T00:00:00.000' AS DateTime), 87, N'6198')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (53, 0, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 86, N'E8548')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (54, 0, CAST(N'2023-04-10T00:00:00.000' AS DateTime), 80, N'69010')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (55, 0, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 76, N'E0101')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (56, 0, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 80, N'3959')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (57, 0, CAST(N'2023-10-02T00:00:00.000' AS DateTime), 86, N'3029')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (58, 0, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 80, N'81409')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (59, 0, CAST(N'2024-01-03T00:00:00.000' AS DateTime), 87, N'3872')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (60, 0, CAST(N'2023-06-10T00:00:00.000' AS DateTime), 84, N'81211')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (61, 0, CAST(N'2024-01-02T00:00:00.000' AS DateTime), 79, N'37803')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (62, 0, CAST(N'2023-05-16T00:00:00.000' AS DateTime), 76, N'E9939')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (63, 0, CAST(N'2023-06-18T00:00:00.000' AS DateTime), 79, N'01645')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (64, 0, CAST(N'2023-06-20T00:00:00.000' AS DateTime), 79, N'71636')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (65, 0, CAST(N'2023-10-23T00:00:00.000' AS DateTime), 82, N'79419')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (66, 0, CAST(N'2023-12-23T00:00:00.000' AS DateTime), 76, N'96903')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (67, 0, CAST(N'2023-07-01T00:00:00.000' AS DateTime), 80, N'1406')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (68, 0, CAST(N'2024-01-14T00:00:00.000' AS DateTime), 76, N'69589')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (69, 0, CAST(N'2024-01-10T00:00:00.000' AS DateTime), 81, N'82100')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (70, 0, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 83, N'3229')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (71, 0, CAST(N'2023-09-25T00:00:00.000' AS DateTime), 78, N'E8203')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (72, 0, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 83, N'01710')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (73, 0, CAST(N'2023-10-27T00:00:00.000' AS DateTime), 82, N'V172')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (74, 0, CAST(N'2023-12-08T00:00:00.000' AS DateTime), 83, N'E8116')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (75, 0, CAST(N'2023-12-25T00:00:00.000' AS DateTime), 77, N'36237')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (76, 0, CAST(N'2023-10-07T00:00:00.000' AS DateTime), 81, N'9464')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (77, 0, CAST(N'2023-11-12T00:00:00.000' AS DateTime), 80, N'E8538')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (78, 0, CAST(N'2024-01-23T00:00:00.000' AS DateTime), 85, N'E9336')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (79, 0, CAST(N'2023-06-14T00:00:00.000' AS DateTime), 81, N'64413')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (80, 0, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 78, N'83401')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (81, 0, CAST(N'2023-05-24T00:00:00.000' AS DateTime), 78, N'096')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (82, 0, CAST(N'2023-05-18T00:00:00.000' AS DateTime), 83, N'E8693')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (83, 0, CAST(N'2023-06-15T00:00:00.000' AS DateTime), 80, N'85195')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (84, 0, CAST(N'2023-03-22T00:00:00.000' AS DateTime), 78, N'38860')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (85, 0, CAST(N'2024-02-11T00:00:00.000' AS DateTime), 79, N'95219')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (86, 0, CAST(N'2023-07-05T00:00:00.000' AS DateTime), 83, N'80611')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (87, 0, CAST(N'2023-07-23T00:00:00.000' AS DateTime), 87, N'0910')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (88, 0, CAST(N'2023-07-26T00:00:00.000' AS DateTime), 76, N'9801')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (89, 0, CAST(N'2023-09-13T00:00:00.000' AS DateTime), 78, N'01501')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (90, 0, CAST(N'2023-08-09T00:00:00.000' AS DateTime), 86, N'64891')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (91, 0, CAST(N'2023-04-09T00:00:00.000' AS DateTime), 87, N'6113')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (92, 0, CAST(N'2023-04-07T00:00:00.000' AS DateTime), 78, N'80373')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (93, 0, CAST(N'2023-11-19T00:00:00.000' AS DateTime), 78, N'2899')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (94, 0, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 84, N'V782')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (95, 0, CAST(N'2023-08-28T00:00:00.000' AS DateTime), 85, N'66904')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (96, 0, CAST(N'2024-01-01T00:00:00.000' AS DateTime), 82, N'E9321')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (97, 0, CAST(N'2023-08-21T00:00:00.000' AS DateTime), 85, N'44282')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (98, 0, CAST(N'2023-03-16T00:00:00.000' AS DateTime), 85, N'1580')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (99, 0, CAST(N'2023-11-09T00:00:00.000' AS DateTime), 82, N'51900')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (100, 0, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 77, N'E8122')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (101, 0, CAST(N'2024-02-03T00:00:00.000' AS DateTime), 86, N'5781')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (102, 0, CAST(N'2024-02-21T00:00:00.000' AS DateTime), 87, N'V5871')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (103, 0, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 85, N'3131')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (104, 0, CAST(N'2023-06-30T00:00:00.000' AS DateTime), 83, N'64601')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (105, 0, CAST(N'2023-06-15T00:00:00.000' AS DateTime), 77, N'82010')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (106, 0, CAST(N'2023-07-16T00:00:00.000' AS DateTime), 76, N'0022')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (107, 0, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 87, N'81300')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (108, 0, CAST(N'2023-04-20T00:00:00.000' AS DateTime), 79, N'1501')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (109, 0, CAST(N'2024-02-08T00:00:00.000' AS DateTime), 86, N'17370')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (110, 0, CAST(N'2023-12-25T00:00:00.000' AS DateTime), 83, N'99809')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (111, 0, CAST(N'2023-09-10T00:00:00.000' AS DateTime), 85, N'65503')
GO
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (112, 0, CAST(N'2023-08-25T00:00:00.000' AS DateTime), 87, N'V4571')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (113, 0, CAST(N'2023-11-22T00:00:00.000' AS DateTime), 84, N'80090')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (114, 0, CAST(N'2023-04-16T00:00:00.000' AS DateTime), 82, N'7966')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (115, 0, CAST(N'2023-06-08T00:00:00.000' AS DateTime), 79, N'7578')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (116, 0, CAST(N'2023-10-18T00:00:00.000' AS DateTime), 84, N'66534')
INSERT [dbo].[Prescription] ([prescription_id], [delete_flag], [created_date], [doctor_id], [note]) VALUES (117, 0, CAST(N'2023-10-12T00:00:00.000' AS DateTime), 83, N'66614')
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
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (14, 58, 31, 72, N'Palpitations', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (15, 58, 22, 19, N'Accident due to changes in air pressure due to diving', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (16, 115, 17, 34, N'Open wound of upper arm, complicated', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (17, 68, 26, 87, N'Other and unspecified falls on same level from collision, pushing, or shoving, by or with other person', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (18, 34, 21, 76, N'Benign neoplasm of vagina', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (19, 81, 49, 56, N'Infection with microorganisms resistant to penicillins', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (20, 56, 58, 18, N'Influenza with other manifestations', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (21, 36, 51, 24, N'Monkeypox', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (22, 99, 23, 48, N'Fetal distress, affecting management of mother, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (23, 100, 56, 87, N'Motor vehicle traffic accident involving re-entrant collision with another motor vehicle injuring pedal cyclist', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (24, 113, 52, 87, N'Malignant neoplasm of lower lobe, bronchus or lung', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (25, 37, 23, 89, N'Varicose veins of legs complicating pregnancy and the puerperium, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (26, 76, 10, 56, N'Acute gastric ulcer with hemorrhage and perforation, with obstruction', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (27, 30, 52, 97, N'Other specified dermatoses', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (28, 74, 8, 5, N'Anemia in neoplastic disease', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (29, 57, 20, 40, N'Bilious vomiting in newborn', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (30, 41, 40, 84, N'Injury due to war operations by person-borne improvised explosive device [IED]', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (31, 47, 25, 4, N'Motor vehicle traffic accident involving re-entrant collision with another motor vehicle injuring rider of animal; occupant of animal-drawn vehicle', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (32, 115, 28, 87, N'Appendicitis, unqualified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (33, 112, 53, 44, N'Unspecified functional disorder of intestine', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (34, 97, 30, 10, N'Tuberculous encephalitis or myelitis, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (35, 75, 45, 9, N'Recurrent dislocation of joint, site unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (36, 33, 32, 88, N'Shock due to anesthesia, not elsewhere classified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (37, 24, 15, 69, N'Whooping cough, unspecified organism', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (38, 67, 18, 55, N'Secondary vitreoretinal degenerations', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (39, 89, 26, 7, N'Personal history of malignant neoplasm of large intestine', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (40, 90, 48, 65, N'Injury to iliac artery', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (41, 102, 18, 28, N'Benign neoplasm of aortic body and other paraganglia', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (42, 37, 16, 1, N'Obstruction by abnormal pelvic soft tissues during labor, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (43, 83, 35, 37, N'Monoplegia of upper limb affecting nondominant sde', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (44, 69, 19, 6, N'Postoperative shock, other', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (45, 55, 19, 78, N'Railway accident involving collision with rolling stock and injuring unspecified person', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (46, 77, 28, 22, N'Other specified conditions of the tongue', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (47, 65, 57, 12, N'Activities involving residential relocation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (48, 26, 37, 89, N'Disorder of pinna, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (49, 67, 8, 57, N'Obsessive-compulsive disorders', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (50, 96, 14, 79, N'Developmental dislocation of joint, shoulder region', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (51, 66, 18, 33, N'Abdominal or pelvic swelling, mass, or lump, generalized', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (52, 64, 47, 63, N'Rubella in the mother, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (53, 106, 49, 48, N'Inconclusive mammogram', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (54, 79, 54, 69, N'Cardiac complications of anesthesia or other sedation in labor and delivery, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (55, 28, 17, 46, N'Injury to other specified blood vessels of head and neck', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (56, 18, 7, 34, N'Nontraffic accident involving other off-road motor vehicle injuring rider of animal; occupant of animal-drawn vehicle', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (57, 54, 50, 86, N'Retroverted and incarcerated gravid uterus, postpartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (58, 77, 58, 80, N'Carbuncle and furuncle of foot', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (59, 81, 54, 59, N'Latent schizophrenia, in remission', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (60, 88, 13, 94, N'Other closed fracture of tarsal and metatarsal bones', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (61, 113, 56, 11, N'Duodenitis, with hemorrhage', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (62, 50, 55, 18, N'Fitting and adjustment, other device', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (63, 79, 34, 66, N'Pathological drug intoxication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (64, 57, 5, 59, N'Pulmonary collapse', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (65, 43, 14, 51, N'Outcome of delivery, unspecified outcome of delivery', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (66, 109, 48, 28, N'Disorders of soft tissue, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (67, 58, 30, 96, N'Injury to diaphragm, without mention of open wound into cavity', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (68, 37, 29, 17, N'Other posterior corneal dystrophies', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (69, 88, 48, 2, N'Tuberculous peritonitis, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (70, 65, 36, 12, N'Diabetes with hyperosmolarity, type I [juvenile type], uncontrolled', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (71, 50, 33, 80, N'Injury to hepatic artery', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (72, 110, 48, 51, N'Congenital hypertrophic pyloric stenosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (73, 63, 50, 79, N'Phthirus pubis [pubic louse]', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (74, 63, 30, 24, N'Other specified multiple gestation, unspecified number of placenta and unspecified number of amniotic sacs', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (75, 37, 27, 21, N'Alpha thalassemia', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (76, 93, 21, 19, N'Other closed skull fracture with subarachnoid, subdural, and extradural hemorrhage, with moderate [1-24 hours] loss of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (77, 86, 27, 95, N'Angioid streaks of choroid', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (78, 100, 15, 16, N'Blisters, epidermal loss [second degree] of multiple sites of lower limb(s)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (79, 91, 34, 53, N'"Light-for-dates" without mention of fetal malnutrition, 2,000- 2,499 grams', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (80, 66, 27, 27, N'Meningococcal endocarditis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (81, 90, 47, 27, N'Gastroptosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (82, 82, 34, 42, N'Contusion of abdominal wall', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (83, 36, 23, 86, N'Unspecified disorder of joint, forearm', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (84, 42, 18, 95, N'Late effects of other and unspecified infectious and parasitic diseases', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (85, 101, 22, 66, N'Other abnormal products of conception', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (86, 21, 7, 65, N'Deep necrosis of underlying tissues [deep third degree] without mention of loss of a body part, of knee', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (87, 33, 23, 54, N'Personal history of malignant neuroendocrine tumor', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (88, 75, 31, 54, N'Vaccination not carried out because of chronic illness or condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (89, 71, 29, 55, N'Burn of unspecified degree of trunk, unspecified site', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (90, 69, 42, 62, N'Injury due to war operations by unintentional destruction of aircraft due to own onboard explosives', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (91, 96, 7, 16, N'Fitting and adjustment of wheelchair', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (92, 109, 45, 6, N'Other inflammatory and immune myopathies, NEC', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (93, 82, 11, 31, N'Hypertrophy of kidney', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (94, 25, 31, 71, N'Adolescent postural kyphosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (95, 76, 55, 84, N'Poisoning by gas distributed by pipeline, undetermined whether accidentally or purposely inflicted', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (96, 77, 16, 48, N'Other, mixed, or unspecified drug abuse, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (97, 92, 55, 64, N'Calculus of gallbladder and bile duct with acute and chronic cholecystitis, without mention of obstruction', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (98, 50, 45, 73, N'Suspected damage to fetus from drugs, affecting management of mother, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (99, 41, 17, 52, N'Cerebral artery occlusion, unspecified with cerebral infarction', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (100, 55, 35, 7, N'Open fracture of radius with ulna, upper end (any part)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (101, 70, 56, 35, N'Polycystic kidney, autosomal recessive', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (102, 40, 26, 15, N'Unspecified venous complication of pregnancy and the puerperium, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (103, 114, 47, 9, N'Erythema [first degree] of back of hand', 0)
GO
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (104, 63, 29, 37, N'Asbestosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (105, 56, 6, 36, N'Intrinsic asthma with (acute) exacerbation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (106, 92, 12, 23, N'Unspecified infection of bone, lower leg', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (107, 53, 32, 70, N'Microcheilia', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (108, 77, 6, 41, N'Mycosis fungoides, intra-abdominal lymph nodes', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (109, 20, 35, 20, N'Photokeratitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (110, 95, 55, 82, N'Arthropathy associated with other viral diseases, multiple sites', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (111, 90, 55, 50, N'Failed attempted abortion complicated by renal failure', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (112, 29, 51, 24, N'Complete edentulism, class II', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (113, 65, 49, 98, N'Unspecified disproportion, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (114, 39, 35, 38, N'Other gastrostomy complications', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (115, 40, 19, 59, N'Open wound of nasal sinus, complicated', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (116, 103, 36, 75, N'Patellar tendinitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (117, 112, 6, 84, N'Serous conjunctivitis, except viral', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (118, 98, 25, 19, N'Perpetrator of child and adult abuse, by sibling', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (119, 99, 33, 16, N'Closed fracture of shaft of ulna (alone)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (120, 61, 32, 33, N'Tuberculosis of spleen, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (121, 57, 19, 32, N'Unspecified complication of amputation stump', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (122, 55, 13, 30, N'Cellulitis and abscess of upper arm and forearm', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (123, 74, 36, 68, N'Typhus, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (124, 60, 25, 35, N'Open fracture of neck of radius', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (125, 67, 33, 47, N'Anaerobic meningitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (126, 46, 56, 27, N'Subdural hemorrhage following injury without mention of open intracranial wound, with no loss of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (127, 49, 47, 31, N'Lack of housing', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (128, 116, 27, 15, N'Malignant neoplasm of lower third of esophagus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (129, 89, 18, 90, N'Antitussives causing adverse effects in therapeutic use', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (130, 52, 9, 100, N'Pyelonephritis, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (131, 99, 59, 12, N'Hypertensive chronic kidney disease, unspecified, with chronic kidney disease stage I through stage IV, or unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (132, 77, 39, 36, N'Postphlebetic syndrome without complications', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (133, 55, 44, 52, N'Allergy to seafood', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (134, 34, 11, 96, N'Sensorineural hearing loss, asymmetrical', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (135, 60, 22, 83, N'Abrasion or friction burn of hip, thigh, leg, and ankle, without mention of infection', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (136, 28, 18, 24, N'Nasal mucositis (ulcerative)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (137, 21, 42, 29, N'Madura foot', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (138, 30, 53, 93, N'Hip and thigh injury', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (139, 59, 22, 99, N'Onchocerciasis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (140, 76, 7, 42, N'Tuberculosis of other male genital organs, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (141, 46, 59, 91, N'Injury due to unspecified war operations but occurring after cessation of hostilities', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (142, 96, 40, 22, N'Suspected fetal anomaly not found', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (143, 113, 53, 25, N'Abnormal mammogram, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (144, 57, 51, 98, N'Other pain disorders related to psychological factors', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (145, 93, 16, 87, N'Recurrent isolated sleep paralysis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (146, 62, 20, 11, N'Spontaneous abortion, complicated by delayed or excessive hemorrhage, incomplete', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (147, 62, 33, 86, N'Vitreomacular adhesion', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (148, 47, 41, 29, N'Other suppurative peritonitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (149, 106, 54, 88, N'Other symptoms referable to joint, lower leg', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (150, 97, 55, 84, N'Crater-like holes of optic disc', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (151, 95, 44, 36, N'Combined immunity deficiency', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (152, 72, 52, 8, N'Railway accident involving collision with rolling stock and injuring other specified person', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (153, 102, 29, 84, N'Teething syndrome', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (154, 19, 8, 33, N'Hypersomnia due to mental disorder', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (155, 65, 9, 75, N'Lambert-Eaton syndrome in other diseases classified elsewhere', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (156, 50, 38, 10, N'Thoracic or lumbosacral neuritis or radiculitis, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (157, 31, 29, 94, N'Unspecified disease of larynx', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (158, 51, 13, 53, N'Misadventure to patient from other contamination', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (159, 43, 28, 85, N'Tuberculosis of unspecified bones and joints, bacteriological or histological examination unknown (at present)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (160, 116, 32, 36, N'Malignant pleural effusion', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (161, 53, 12, 49, N'Benign carcinoid tumor of foregut, not otherwise specified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (162, 74, 18, 80, N'Hodgkin''s disease, mixed cellularity, spleen', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (163, 95, 16, 1, N'Enuresis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (164, 53, 18, 51, N'Poisoning by liquefied petroleum gas distributed in mobile containers, undetermined whether accidentally or purposely inflicted', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (165, 74, 37, 8, N'Recurrent pregnancy loss without current pregnancy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (166, 87, 13, 39, N'Railway accident involving collision with rolling stock and injuring railway employee', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (167, 97, 36, 1, N'Burn [any degree] involving 50-59 percent of body surface with third degree burn, 40-49%', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (168, 105, 36, 65, N'Benzodiazepine-based tranquilizers causing adverse effects in therapeutic use', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (169, 117, 52, 95, N'Pain in joint, lower leg', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (170, 31, 40, 2, N'Cortex (cerebral) laceration without mention of open intracranial wound, with brief [less than one hour] loss of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (171, 108, 18, 17, N'Unspecified abortion, complicated by genital tract and pelvic infection, complete', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (172, 57, 54, 55, N'Gastroesophageal laceration-hemorrhage syndrome', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (173, 112, 50, 79, N'Special screening examination for other specified chlamydial diseases', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (174, 37, 29, 44, N'Unspecified prolonged labor, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (175, 54, 42, 10, N'Suicidal ideation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (176, 40, 53, 51, N'Arthropathy, unspecified, ankle and foot', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (177, 69, 54, 67, N'Pneumococcal peritonitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (178, 110, 37, 85, N'Cerebellar or brain stem laceration without mention of open intracranial wound, unspecified state of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (179, 46, 43, 33, N'Other conditions due to sex chromosome anomalies', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (180, 31, 19, 13, N'Suppressed lactation, postpartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (181, 108, 45, 94, N'Chondrodystrophy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (182, 77, 48, 7, N'Closed fracture of vault of skull with intracranial injury of other and unspecified nature, unspecified state of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (183, 24, 48, 80, N'Other closed skull fracture with other and unspecified intracranial hemorrhage, with concussion, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (184, 72, 46, 50, N'Bancroftian filariasis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (185, 19, 9, 47, N'Other specified alveolar anomaly', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (186, 61, 16, 85, N'Trichomonal prostatitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (187, 19, 16, 42, N'Screening for ischemic heart disease', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (188, 97, 32, 92, N'Cerebellar or brain stem laceration with open intracranial wound, with brief [less than one hour] loss of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (189, 97, 25, 13, N'Kuru', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (190, 109, 45, 91, N'Assault by unspecified poisoning', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (191, 67, 51, 24, N'Thumb amputation status', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (192, 40, 6, 14, N'Malignant neoplasm of lacrimal duct', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (193, 76, 22, 71, N'Burn of unspecified degree of wrist', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (194, 19, 22, 8, N'Anterior dislocation of tibia, proximal end, open', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (195, 45, 14, 92, N'Vivax malaria [benign tertian]', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (196, 59, 14, 87, N'"Light-for-dates" without mention of fetal malnutrition, 1,000- 1,249 grams', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (197, 57, 35, 46, N'Ulnar collateral ligament sprain', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (198, 83, 38, 64, N'Tuberculosis of other urinary organs, bacteriological or histological examination not done', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (199, 44, 35, 52, N'Sprains and strains of other specified sites of elbow and forearm', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (200, 114, 29, 24, N'Acute reaction to foreign substance accidentally left during a procedure', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (201, 25, 8, 90, N'Nervous system complication, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (202, 80, 27, 24, N'Genetic anomalies of leukocytes', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (203, 23, 20, 84, N'Necrosis of the pulp', 0)
GO
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (204, 77, 43, 13, N'Opioid type dependence, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (205, 26, 27, 72, N'Atheroembolism of kidney', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (206, 116, 30, 13, N'Exfoliation due to erythematous condition involving less than 10 percent of body surface', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (207, 39, 31, 11, N'Injury to spleen with open wound into cavity, laceration extending into parenchyma', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (208, 93, 58, 55, N'Tuberculosis of other specified organs, bacteriological or histological examination unknown (at present)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (209, 32, 26, 24, N'Transient disorder of initiating or maintaining sleep', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (210, 79, 41, 10, N'Benign neoplasm of cornea', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (211, 31, 36, 36, N'Motor vehicle traffic accident involving re-entrant collision with another motor vehicle injuring driver of motor vehicle other than motorcycle', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (212, 68, 15, 93, N'Chronic gastric ulcer without mention of hemorrhage or perforation, without mention of obstruction', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (213, 80, 31, 95, N'Open dislocation, sacrum', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (214, 102, 8, 56, N'Deep necrosis of underlying tissues [deep third degree] with loss of a body part, of palm of hand', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (215, 34, 17, 49, N'Syndactyly of toes without fusion of bone', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (216, 51, 10, 94, N'Burn [any degree] involving 70-79 percent of body surface with third degree burn, 60-69%', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (217, 76, 34, 21, N'Acute osteomyelitis, hand', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (218, 24, 28, 33, N'Contact with and (suspected) exposure to benzene', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (219, 45, 52, 54, N'Other and unspecified superficial injury of other, multiple, and unspecified sites, without mention of infection', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (220, 40, 51, 3, N'Contusion of foot', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (221, 100, 13, 13, N'Other specified menopausal and postmenopausal disorders', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (222, 103, 26, 73, N'Suicide and self-inflicted injury by other specified means', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (223, 111, 45, 38, N'Injury due to unspecified form of unconventional warfare', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (224, 23, 12, 50, N'Closed fracture of multiple sites of phalanx or phalanges of hand', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (225, 50, 53, 30, N'Need for prophylactic vaccination and inoculation against smallpox', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (226, 59, 7, 17, N'Other specific diseases of hard tissues of teeth', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (227, 27, 37, 59, N'Neutropenia, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (228, 22, 56, 76, N'Louping ill', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (229, 76, 36, 18, N'Late effects of cerebrovascular disease, alterations of sensations', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (230, 72, 23, 83, N'Nephritis and nephropathy, not specified as acute or chronic, with other specified pathological lesion in kidney', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (231, 52, 38, 76, N'Cervical incompetence, delivered, with mention of postpartum complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (232, 22, 10, 100, N'Other specified cerebral degenerations in childhood', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (233, 23, 9, 83, N'Carcinoma in situ of breast', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (234, 59, 35, 62, N'Death occurring in less than 24 hours from onset of symptoms, not otherwise explained', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (235, 66, 59, 11, N'Accidental fall from ladder', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (236, 109, 27, 52, N'Other specified malignant neoplasm of skin of upper limb, including shoulder', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (237, 22, 19, 92, N'Perforation of esophagus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (238, 73, 33, 10, N'Corticosteroid-induced glaucoma, residual stage', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (239, 110, 34, 68, N'Sprain of sacrotuberous (ligament)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (240, 58, 25, 45, N'Open fracture of other facial bones', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (241, 103, 32, 1, N'Closed fracture of astragalus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (242, 49, 53, 67, N'Tuberculosis of unspecified bones and joints, bacteriological or histological examination not done', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (243, 28, 14, 71, N'Migraine without aura, without mention of intractable migraine without mention of status migrainosus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (244, 92, 44, 21, N'Medial epicondylitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (245, 66, 26, 80, N'Sickle-cell thalassemia with crisis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (246, 108, 16, 24, N'Disseminated scars', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (247, 64, 29, 42, N'Postpartum care and examination immediately after delivery', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (248, 66, 16, 84, N'Unspecified non-arthropod-borne viral diseases of central nervous system', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (249, 110, 20, 10, N'Retained (old) foreign body following penetrating wound of orbit', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (250, 80, 10, 86, N'Gastrostomy complication, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (251, 22, 22, 46, N'Severe intellectual disabilities', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (252, 29, 34, 74, N'Dysplasia of anus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (253, 89, 13, 20, N'Antenatal screening for chromosomal anomalies by amniocentesis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (254, 108, 24, 71, N'Systemic lupus erythematosus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (255, 40, 10, 85, N'Retained portions of placenta or membranes, without hemorrhage, postpartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (256, 65, 17, 72, N'Deficiencies of limbs', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (257, 76, 39, 77, N'Detrusor sphincter dyssynergia', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (258, 40, 21, 24, N'Secondary malignant neoplasm of large intestine and rectum', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (259, 21, 22, 86, N'Suicide and self-inflicted injury by unspecified means', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (260, 50, 35, 80, N'Accidental poisoning by corrosive aromatics not elsewhere classified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (261, 86, 55, 29, N'Mechanical failure of instrument or apparatus during infusion and transfusion', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (262, 51, 11, 14, N'Vascular dementia, with delusions', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (263, 64, 47, 94, N'Hydrocele, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (264, 90, 33, 72, N'Other specified dermatomycoses', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (265, 85, 27, 85, N'Mixed hearing loss, unilateral', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (266, 86, 55, 24, N'Need for prophylactic vaccination and inoculation against yellow fever', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (267, 51, 14, 73, N'Personal history of malignant neoplasm of other and unspecified oral cavity and pharynx', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (268, 106, 18, 36, N'Gonococcal infection of anus and rectum', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (269, 99, 57, 27, N'Other specified causes of urethral stricture', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (270, 66, 9, 75, N'Other congenital anomalies of lung', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (271, 20, 9, 65, N'Osteoarthrosis, generalized, multiple sites', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (272, 48, 35, 39, N'Open fractures involving skull or face with other bones with subarachnoid, subdural, and extradural hemorrhage, unspecified state of consciousness', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (273, 86, 28, 55, N'Multiple sites of spinal cord injury without evidence of spinal bone injury', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (274, 89, 27, 93, N'Plantar fascial fibromatosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (275, 30, 26, 17, N'Excessive attrition, localized', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (276, 61, 33, 67, N'Coccidiosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (277, 90, 10, 57, N'African trypanosomiasis, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (278, 20, 44, 8, N'Mechanical complication of other vascular device, implant, and graft', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (279, 25, 45, 85, N'Fall on stairs or ladders in water transport injuring occupant of other watercraft -- crew', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (280, 36, 31, 97, N'Infection by Histoplasma duboisii, pericarditis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (281, 29, 32, 98, N'Extreme immaturity, unspecified [weight]', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (282, 44, 7, 73, N'Unspecified disease of pericardium', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (283, 75, 41, 15, N'Other specified respiratory tuberculosis, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (284, 57, 21, 97, N'Sciatica', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (285, 70, 58, 11, N'Conjunctival hemorrhage', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (286, 97, 32, 68, N'Carcinoma in situ of liver and biliary system', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (287, 93, 26, 50, N'Major depressive affective disorder, single episode, mild', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (288, 67, 24, 48, N'Low birth weight status, 500-999 grams', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (289, 117, 58, 31, N'Abdominal tenderness, left lower quadrant', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (290, 101, 41, 68, N'Abnormal glucose tolerance of mother, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (291, 27, 42, 67, N'Malignant neoplasm of sigmoid colon', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (292, 51, 26, 84, N'Activities involving ironing', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (293, 23, 23, 95, N'Disorganized type schizophrenia, chronic with acute exacerbation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (294, 28, 32, 4, N'Burn [any degree] involving 60-69 percent of body surface with third degree burn, 10-19%', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (295, 58, 55, 3, N'Unsatisfactory anal cytology smear', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (296, 44, 58, 82, N'Urinary complications, not elsewhere classified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (297, 35, 8, 38, N'Absence of external ear', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (298, 94, 24, 100, N'Open fracture of C1-C4 level with unspecified spinal cord injury', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (299, 74, 22, 25, N'Subarachnoid hemorrhage following injury without mention of open intracranial wound, with loss of consciousness of unspecified duration', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (300, 110, 55, 67, N'Bipolar disorder, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (301, 62, 38, 45, N'Vertebrobasilar artery syndrome', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (302, 113, 20, 43, N'Other specified perinatal disorders of digestive system', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (303, 36, 48, 28, N'Kaposi''s sarcoma, skin', 0)
GO
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (304, 91, 9, 11, N'Lipoma of other specified sites', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (305, 91, 53, 73, N'Childhood onset fluency disorder', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (306, 100, 14, 12, N'Carcinoma in situ of colon', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (307, 80, 21, 9, N'Other specified anomalies of bladder and urethra', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (308, 88, 22, 5, N'Aftercare following surgery of the teeth, oral cavity and digestive system, NEC', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (309, 89, 48, 79, N'Anomalies of interarch distance', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (310, 112, 22, 51, N'Malignant neoplasm of head of pancreas', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (311, 62, 49, 73, N'Derangement of anterior horn of medial meniscus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (312, 23, 7, 89, N'Accident to powered aircraft at takeoff or landing injuring ground crew, airline employee', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (313, 110, 38, 65, N'Disturbance of skin sensation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (314, 70, 56, 28, N'Closed fracture of medial condyle of humerus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (315, 94, 36, 23, N'Contusion of multiple sites of upper limb', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (316, 97, 18, 38, N'Railway accident of unspecified nature injuring other specified person', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (317, 39, 19, 51, N'Other and unspecified cord entanglement, without mention of compression, complicating labor and delivery, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (318, 82, 12, 21, N'Carcinoid syndrome', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (319, 95, 6, 95, N'Tuberculous bronchiectasis, tubercle bacilli not found (in sputum) by microscopy, but found by bacterial culture', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (320, 95, 27, 55, N'Scrotal varices', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (321, 19, 48, 35, N'Tuberculosis of other female genital organs, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (322, 49, 18, 62, N'Other disorders of glossopharyngeal [9th] nerve', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (323, 94, 14, 79, N'Hypercementosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (324, 66, 48, 24, N'Aftercare for healing pathologic fracture of vertebrae', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (325, 59, 52, 34, N'Diabetes with other coma, type II or unspecified type, not stated as uncontrolled', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (326, 56, 26, 16, N'Disseminated chorioretinitis, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (327, 72, 50, 26, N'Other and unspecified conditions of umbilical cord affecting fetus or newborn', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (328, 73, 44, 73, N'Acute venous embolism and thrombosis of deep vessels of distal lower extremity', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (329, 56, 5, 13, N'Legally induced abortion, with unspecified complication, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (330, 62, 6, 75, N'Closed fracture of eight or more ribs', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (331, 107, 19, 95, N'Tuberculosis of mastoid, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (332, 59, 17, 24, N'Tarsal tunnel syndrome', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (333, 68, 52, 84, N'Open dislocation of metacarpal (bone), proximal end', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (334, 81, 14, 29, N'Marginal zone lymphoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (335, 101, 9, 61, N'Hypertrophy of adenoids alone', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (336, 83, 18, 50, N'Accident to unpowered aircraft injuring ground crew, airline employee', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (337, 76, 39, 31, N'Resolving infantile idiopathic scoliosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (338, 112, 38, 6, N'Child physical abuse', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (339, 54, 55, 99, N'Other congenital anomalies of eyelids, lacrimal system, and orbit', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (340, 27, 26, 98, N'Injury to sigmoid colon, without mention of open wound into cavity', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (341, 36, 45, 10, N'Other noncollision motor vehicle traffic accident injuring rider of animal; occupant of animal-drawn vehicle', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (342, 52, 49, 5, N'Hypersomnia due to mental disorder', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (343, 112, 43, 99, N'Poisoning by smallpox vaccine', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (344, 50, 44, 55, N'Body Mass Index less than 19, adult', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (345, 36, 37, 8, N'Other symptoms referable to joint, lower leg', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (346, 21, 6, 88, N'Anaphylactic reaction due to food additives', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (347, 70, 53, 68, N'Spotting complicating pregnancy, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (348, 37, 21, 14, N'Unspecified obstetrical trauma, postpartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (349, 41, 24, 72, N'Congenital macular changes', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (350, 41, 9, 73, N'Aortic ectasia, unspecified site', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (351, 27, 48, 47, N'Unspecified monocytic leukemia, without mention of having achieved remission', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (352, 97, 38, 46, N'Other specified railway accident injuring passenger on railway', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (353, 113, 49, 92, N'Spontaneous abortion, with unspecified complication, complete', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (354, 102, 19, 76, N'Coxa vara (acquired)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (355, 90, 12, 17, N'Unspecified disorder of synovium, tendon, and bursa', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (356, 57, 49, 51, N'Other and unspecified bacterial vaccines causing adverse effects in therapeutic use', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (357, 63, 27, 17, N'Unspecified fistula involving female genital tract', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (358, 42, 7, 37, N'Internal thrombosed hemorrhoids', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (359, 37, 7, 28, N'Primary tuberculous infection, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (360, 64, 56, 80, N'Pyeloureteritis cystica', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (361, 77, 55, 67, N'Unspecified renal disease in pregnancy, without mention of hypertension, postpartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (362, 69, 30, 62, N'Hydrops fetalis not due to isoimmunization', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (363, 40, 55, 28, N'Tuberculosis of other specified joint, tubercle bacilli found (in sputum) by microscopy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (364, 92, 12, 71, N'Cough variant asthma', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (365, 111, 21, 48, N'Pyogenic granuloma of skin and subcutaneous tissue', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (366, 88, 33, 21, N'Full-thickness skin loss [third degree, not otherwise specified] of forearm', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (367, 105, 34, 19, N'Unspecified injury of lung with open wound into thorax', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (368, 97, 9, 74, N'Acute osteomyelitis, pelvic region and thigh', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (369, 107, 6, 55, N'Anemia of mother, unspecified as to episode of care or not applicable', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (370, 77, 34, 13, N'Other symptoms concerning nutrition, metabolism, and development', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (371, 66, 43, 31, N'Late effects of genitourinary tuberculosis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (372, 52, 22, 72, N'Burn [any degree] involving 20-29 percent of body surface with third degree burn, less than 10 percent or unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (373, 110, 8, 30, N'Syphilis of kidney', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (374, 44, 9, 59, N'Poisoning by paraldehyde', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (375, 67, 7, 49, N'Benign carcinoid tumor of the descending colon', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (376, 74, 35, 93, N'Lens replaced by other means', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (377, 93, 24, 62, N'Carcinoma in situ of larynx', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (378, 60, 54, 80, N'Dietetics causing adverse effects in therapeutic use', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (379, 85, 56, 9, N'Other inflammatory disease of cervix, vagina and vulva', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (380, 44, 26, 19, N'Other arthropod infestation', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (381, 25, 39, 73, N'Other atopic dermatitis and related conditions', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (382, 42, 5, 97, N'Erythema [first degree] of multiple sites of wrist(s) and hand(s)', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (383, 62, 9, 23, N'Injury to deep plantar blood vessels', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (384, 91, 35, 2, N'Burkitt''s tumor or lymphoma, lymph nodes of axilla and upper limb', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (385, 95, 9, 83, N'Old disruption of medial collateral ligament', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (386, 88, 43, 87, N'Tuberculoma of meninges, tubercle bacilli not found (in sputum) by microscopy, but found by bacterial culture', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (387, 53, 48, 13, N'Poisoning by antineoplastic antibiotics', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (388, 46, 12, 28, N'Secondary spontaneous pneumothorax', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (389, 39, 23, 14, N'Acute miliary tuberculosis, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (390, 71, 26, 52, N'Tuberculous abscess of brain, tubercle bacilli not found by bacteriological or histological examination, but tuberculosis confirmed by other methods [inoculation of animals]', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (391, 104, 58, 14, N'Aftercare for healing traumatic fracture of upper leg', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (392, 83, 13, 78, N'Carcinoma in situ of skin of ear and external auditory canal', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (393, 34, 36, 60, N'Injury to other specified pelvic organs, with open wound into cavity', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (394, 39, 41, 73, N'Tuberculosis of hip, bacteriological or histological examination not done', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (395, 57, 27, 11, N'Ulcer of heel and midfoot', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (396, 92, 26, 25, N'Lipoma of intrathoracic organs', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (397, 57, 14, 91, N'Open wound of foot except toe(s) alone, with tendon involvement', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (398, 88, 30, 82, N'Other manifestations of yaws', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (399, 116, 29, 32, N'Other constitutional aplastic anemia', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (400, 77, 31, 37, N'Lateral dislocation of tibia, proximal end, open', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (401, 70, 57, 80, N'Maternal hypotension syndrome, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (402, 59, 35, 26, N'Congenital or acquired abnormality of vulva, delivered, with or without mention of antepartum condition', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (403, 53, 9, 12, N'Hemicrania continua', 0)
GO
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (404, 19, 18, 47, N'Poisoning by skeletal muscle relaxants', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (405, 60, 56, 68, N'Closed fracture of medial condyle of humerus', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (406, 117, 14, 80, N'Other and unspecified alcohol dependence, unspecified', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (407, 97, 44, 82, N'Excessive fetal growth, affecting management of mother, antepartum condition or complication', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (408, 69, 50, 51, N'Mucositis (ulcerative) due to antineoplastic therapy', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (409, 72, 41, 17, N'Excessive blood level of alcohol', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (410, 44, 38, 92, N'Toxic encephalitis and encephalomyelitis', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (411, 104, 7, 12, N'Foreign body in mouth', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (412, 89, 30, 50, N'Vitamin B6 deficiency', 0)
INSERT [dbo].[Prescription Details] ([prescriptionDetail_id], [prescription_id], [medicineId], [quantity], [dosageInstruction], [delete_flag]) VALUES (413, 80, 50, 96, N'Cholecystitis, unspecified', 0)
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

INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (1, N'lam', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'string', N'string', N'string', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (2, N'koby', CAST(N'2024-02-22' AS Date), N'1234567890 ', N'abv', N'acs', N'as', 2, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (3, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (4, N'lamlam', CAST(N'2024-02-22' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (5, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (6, N'eee', CAST(N'2024-02-27' AS Date), N'string     ', N'string', N'string', N'string', 10, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (7, N'John Doe', CAST(N'2024-02-01' AS Date), N'12345678901', N'john.doe@example.com', N'john_doe.jpg', N'Description for John Doe', 3000, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (8, N'Jane Smith', CAST(N'2024-02-02' AS Date), N'23456789012', N'jane.smith@example.com', N'jane_smith.jpg', N'Description for Jane Smith', 3200, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (9, N'David Johnson', CAST(N'2024-02-03' AS Date), N'34567890123', N'david.johnson@example.com', N'david_johnson.jpg', N'Description for David Johnson', 3500, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (10, N'Emily Brown', CAST(N'2024-02-04' AS Date), N'45678901234', N'emily.brown@example.com', N'emily_brown.jpg', N'Description for Emily Brown', 3800, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (11, N'Michael Williams', CAST(N'2024-02-05' AS Date), N'56789012345', N'michael.williams@example.com', N'michael_williams.jpg', N'Description for Michael Williams', 3200, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (12, N'Emma Taylor', CAST(N'2024-02-06' AS Date), N'67890123456', N'emma.taylor@example.com', N'emma_taylor.jpg', N'Description for Emma Taylor', 3400, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (13, N'James Martinez', CAST(N'2024-02-07' AS Date), N'78901234567', N'james.martinez@example.com', N'james_martinez.jpg', N'Description for James Martinez', 3700, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (14, N'Olivia Anderson', CAST(N'2024-02-08' AS Date), N'89012345678', N'olivia.anderson@example.com', N'olivia_anderson.jpg', N'Description for Olivia Anderson', 3900, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (15, N'William Jackson', CAST(N'2024-02-09' AS Date), N'90123456789', N'william.jackson@example.com', N'william_jackson.jpg', N'Description for William Jackson', 3300, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (16, N'Sophia Garcia', CAST(N'2024-02-10' AS Date), N'01234567890', N'sophia.garcia@example.com', N'sophia_garcia.jpg', N'Description for Sophia Garcia', 3600, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (17, N'Benjamin Hernandez', CAST(N'2024-02-11' AS Date), N'12345678901', N'benjamin.hernandez@example.com', N'benjamin_hernandez.jpg', N'Description for Benjamin Hernandez', 3800, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (18, N'Isabella Lopez', CAST(N'2024-02-12' AS Date), N'23456789012', N'isabella.lopez@example.com', N'isabella_lopez.jpg', N'Description for Isabella Lopez', 4000, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (19, N'Ethan Gonzalez', CAST(N'2024-02-13' AS Date), N'34567890123', N'ethan.gonzalez@example.com', N'ethan_gonzalez.jpg', N'Description for Ethan Gonzalez', 3400, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (20, N'Mia Perez', CAST(N'2024-02-14' AS Date), N'45678901234', N'mia.perez@example.com', N'mia_perez.jpg', N'Description for Mia Perez', 3700, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (21, N'Alexander Wilson', CAST(N'2024-02-15' AS Date), N'56789012345', N'alexander.wilson@example.com', N'alexander_wilson.jpg', N'Description for Alexander Wilson', 3900, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (22, N'Charlotte Carter', CAST(N'2024-02-16' AS Date), N'67890123456', N'charlotte.carter@example.com', N'charlotte_carter.jpg', N'Description for Charlotte Carter', 4200, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (23, N'string', CAST(N'2024-02-29' AS Date), N'string     ', N'string', N'string', N'string', 0, 4, 1, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (24, N'string', CAST(N'2024-02-29' AS Date), N'67890123456', N'67890123456', N'charlotte_carter.jpg', N'string', 0, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (25, N'Tran Thanh Lam', CAST(N'2024-03-12' AS Date), N'0981442126 ', N'tlam@gmail.com', N'string', N'string', 2220, 2, 0, 0xF3647772E9DCA933F0A1F76C2519FE316E81B22BB1ABA95448B0AAFD4D48834C205036837E7BED4472CE0B328A60E29F6AFDFD7550C2B0DB9E705E8C9014C1D1, 0x9BF4B844C935EBAA674A3B773DBE9413B28334CF554542DB95EF217D876CAD374F2B537EC3B58E83C98D70A7F9909546DA78D982F48C595915D74C3C2B69D2AADED22BF99BA8C68452BD4DE0621FC5330D7362B459DC5D26524E2ADD8C8CF7C2651270F58605409124F9E89B01D18B54B2735770816534FDD650095484BD6DF3, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (26, N'Melisenda Ribey', CAST(N'2024-02-28' AS Date), N'7587100319 ', N'mribey0@nifty.com', N'http://dummyimage.com/205x100.png/cc0000/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (27, N'Mirella Bisset', CAST(N'2024-02-29' AS Date), N'9255989104 ', N'mbisset1@printfriendly.com', N'http://dummyimage.com/192x100.png/5fa2dd/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (28, N'Marget Lieb', CAST(N'2023-04-30' AS Date), N'7057049291 ', N'mlieb2@live.com', N'http://dummyimage.com/108x100.png/ff4444/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (29, N'Merna O''Calleran', CAST(N'2023-04-09' AS Date), N'3926149357 ', N'mocalleran3@devhub.com', N'http://dummyimage.com/235x100.png/5fa2dd/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (30, N'Barbra Castilla', CAST(N'2023-05-24' AS Date), N'8297141965 ', N'bcastilla4@ifeng.com', N'http://dummyimage.com/160x100.png/5fa2dd/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (31, N'Cathrin Carlisso', CAST(N'2023-12-05' AS Date), N'1799628626 ', N'ccarlisso5@cnn.com', N'http://dummyimage.com/177x100.png/5fa2dd/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (32, N'Isabelita Toynbee', CAST(N'2023-07-08' AS Date), N'4833914245 ', N'itoynbee6@wikispaces.com', N'http://dummyimage.com/211x100.png/cc0000/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (33, N'Christan Putton', CAST(N'2023-08-20' AS Date), N'3774909357 ', N'cputton7@samsung.com', N'http://dummyimage.com/179x100.png/cc0000/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (34, N'Arnie Edwicker', CAST(N'2023-06-14' AS Date), N'3806263750 ', N'aedwicker8@lycos.com', N'http://dummyimage.com/152x100.png/cc0000/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (35, N'Oby Kineton', CAST(N'2024-01-07' AS Date), N'9794506004 ', N'okineton9@technorati.com', N'http://dummyimage.com/127x100.png/5fa2dd/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (36, N'Bucky Thicking', CAST(N'2023-09-09' AS Date), N'2946842199 ', N'bthickinga@bluehost.com', N'http://dummyimage.com/241x100.png/cc0000/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (37, N'Dido Rugieri', CAST(N'2024-02-08' AS Date), N'2675272395 ', N'drugierib@admin.ch', N'http://dummyimage.com/148x100.png/5fa2dd/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (38, N'Vanna Heister', CAST(N'2023-06-05' AS Date), N'3314578602 ', N'vheisterc@canalblog.com', N'http://dummyimage.com/229x100.png/ff4444/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (39, N'Carlina Astie', CAST(N'2023-04-27' AS Date), N'6983864961 ', N'castied@csmonitor.com', N'http://dummyimage.com/133x100.png/ff4444/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (40, N'Way Mighele', CAST(N'2024-02-06' AS Date), N'8564866207 ', N'wmighelee@netlog.com', N'http://dummyimage.com/183x100.png/ff4444/ffffff', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (41, N'Mariya Bims', CAST(N'2023-07-13' AS Date), N'9228269609 ', N'mbimsf@bloomberg.com', N'http://dummyimage.com/250x100.png/dddddd/000000', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (42, N'Milicent Cheesley', CAST(N'2023-09-28' AS Date), N'6107061260 ', N'mcheesleyg@moonfruit.com', N'http://dummyimage.com/218x100.png/5fa2dd/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (43, N'Merrilee McLae', CAST(N'2023-10-07' AS Date), N'8287270591 ', N'mmclaeh@spotify.com', N'http://dummyimage.com/178x100.png/5fa2dd/ffffff', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (44, N'Doll Real', CAST(N'2023-03-26' AS Date), N'3399661526 ', N'dreali@about.me', N'http://dummyimage.com/192x100.png/5fa2dd/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (45, N'Daren Bernhardi', CAST(N'2023-11-20' AS Date), N'7318727556 ', N'dbernhardij@multiply.com', N'http://dummyimage.com/110x100.png/dddddd/000000', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (46, N'Melonie Dightham', CAST(N'2023-10-08' AS Date), N'9885474017 ', N'mdighthamk@phpbb.com', N'http://dummyimage.com/227x100.png/ff4444/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (47, N'Nola Leglise', CAST(N'2023-12-22' AS Date), N'9837490552 ', N'nleglisel@tumblr.com', N'http://dummyimage.com/213x100.png/dddddd/000000', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (48, N'Erhard Tomowicz', CAST(N'2023-11-25' AS Date), N'2857440815 ', N'etomowiczm@prlog.org', N'http://dummyimage.com/224x100.png/dddddd/000000', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (49, N'Gerladina Georgiades', CAST(N'2023-04-26' AS Date), N'8479366387 ', N'ggeorgiadesn@1688.com', N'http://dummyimage.com/137x100.png/cc0000/ffffff', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (50, N'Lauralee Flucker', CAST(N'2023-07-07' AS Date), N'9898885704 ', N'lfluckero@arstechnica.com', N'http://dummyimage.com/226x100.png/5fa2dd/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (51, N'Inness Margrett', CAST(N'2023-06-29' AS Date), N'4038028521 ', N'imargrettp@so-net.ne.jp', N'http://dummyimage.com/103x100.png/cc0000/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (52, N'Ronnica Burner', CAST(N'2023-05-04' AS Date), N'3778404381 ', N'rburnerq@github.com', N'http://dummyimage.com/201x100.png/cc0000/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (53, N'Anabella Brobyn', CAST(N'2023-08-08' AS Date), N'8248882409 ', N'abrobynr@cafepress.com', N'http://dummyimage.com/138x100.png/5fa2dd/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (54, N'Angelia Mordanti', CAST(N'2023-04-07' AS Date), N'1824742815 ', N'amordantis@cmu.edu', N'http://dummyimage.com/242x100.png/cc0000/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (55, N'Geri Leadbetter', CAST(N'2023-07-29' AS Date), N'1512893065 ', N'gleadbettert@amazonaws.com', N'http://dummyimage.com/155x100.png/cc0000/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (56, N'Jasper O''Mohun', CAST(N'2023-05-27' AS Date), N'3514195161 ', N'jomohunu@unicef.org', N'http://dummyimage.com/197x100.png/ff4444/ffffff', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (57, N'Ring Pauletto', CAST(N'2023-11-24' AS Date), N'5183646657 ', N'rpaulettov@dot.gov', N'http://dummyimage.com/247x100.png/dddddd/000000', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (58, N'Codi Heselwood', CAST(N'2023-10-16' AS Date), N'8398605901 ', N'cheselwoodw@wiley.com', N'http://dummyimage.com/123x100.png/5fa2dd/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (59, N'Raf Horwell', CAST(N'2023-04-11' AS Date), N'4238538788 ', N'rhorwellx@homestead.com', N'http://dummyimage.com/211x100.png/ff4444/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (60, N'Silas Carlan', CAST(N'2023-04-24' AS Date), N'4857127036 ', N'scarlany@zdnet.com', N'http://dummyimage.com/159x100.png/5fa2dd/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (61, N'Temple Peacocke', CAST(N'2023-08-19' AS Date), N'7224873564 ', N'tpeacockez@google.com', N'http://dummyimage.com/227x100.png/cc0000/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (62, N'Tadeo Ever', CAST(N'2024-02-10' AS Date), N'7878393963 ', N'tever10@si.edu', N'http://dummyimage.com/128x100.png/ff4444/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (63, N'Judie Stokey', CAST(N'2023-12-02' AS Date), N'7932169814 ', N'jstokey11@aol.com', N'http://dummyimage.com/154x100.png/ff4444/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (64, N'Georgette Pardey', CAST(N'2024-01-30' AS Date), N'1908708486 ', N'gpardey12@sourceforge.net', N'http://dummyimage.com/110x100.png/cc0000/ffffff', N'Mr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (65, N'Shane Riepl', CAST(N'2024-02-11' AS Date), N'8012626288 ', N'sriepl13@edublogs.org', N'http://dummyimage.com/141x100.png/cc0000/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (66, N'Wyatan Peevor', CAST(N'2023-12-01' AS Date), N'1952417163 ', N'wpeevor14@unesco.org', N'http://dummyimage.com/171x100.png/dddddd/000000', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (67, N'Denise Croson', CAST(N'2023-06-18' AS Date), N'4222746744 ', N'dcroson15@salon.com', N'http://dummyimage.com/124x100.png/dddddd/000000', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (68, N'Elwin Keers', CAST(N'2023-08-16' AS Date), N'6158334686 ', N'ekeers16@gravatar.com', N'http://dummyimage.com/118x100.png/cc0000/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (69, N'Mario MacNair', CAST(N'2023-08-28' AS Date), N'1211399404 ', N'mmacnair17@salon.com', N'http://dummyimage.com/115x100.png/cc0000/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (70, N'Angeline Allans', CAST(N'2023-08-06' AS Date), N'4235550921 ', N'aallans18@nifty.com', N'http://dummyimage.com/190x100.png/ff4444/ffffff', N'Rev', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (71, N'Faina Gowdie', CAST(N'2023-09-26' AS Date), N'9144470349 ', N'fgowdie19@redcross.org', N'http://dummyimage.com/162x100.png/ff4444/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (72, N'Reece Horbath', CAST(N'2023-12-14' AS Date), N'2561282004 ', N'rhorbath1a@hp.com', N'http://dummyimage.com/118x100.png/cc0000/ffffff', N'Honorable', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (73, N'Hayley Huard', CAST(N'2023-06-05' AS Date), N'6482861360 ', N'hhuard1b@globo.com', N'http://dummyimage.com/123x100.png/ff4444/ffffff', N'Ms', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (74, N'Florence Clemente', CAST(N'2023-06-14' AS Date), N'3978977423 ', N'fclemente1c@163.com', N'http://dummyimage.com/127x100.png/5fa2dd/ffffff', N'Dr', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (75, N'Tybie O''Drought', CAST(N'2023-08-12' AS Date), N'6942379032 ', N'todrought1d@mysql.com', N'http://dummyimage.com/196x100.png/ff4444/ffffff', N'Mrs', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (76, N'Lisabeth Braidford', CAST(N'2023-10-30' AS Date), N'5249265389 ', N'lbraidford0@163.com', N'http://dummyimage.com/212x100.png/ff4444/ffffff', N'Mrs', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (77, N'Ingra Trusler', CAST(N'2023-11-25' AS Date), N'9979451487 ', N'itrusler1@surveymonkey.com', N'http://dummyimage.com/213x100.png/dddddd/000000', N'Honorable', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (78, N'Riccardo Radley', CAST(N'2023-09-08' AS Date), N'1087952306 ', N'rradley2@census.gov', N'http://dummyimage.com/107x100.png/5fa2dd/ffffff', N'Rev', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (79, N'Magdaia Loudyan', CAST(N'2023-09-02' AS Date), N'7292881795 ', N'mloudyan3@amazon.co.uk', N'http://dummyimage.com/131x100.png/dddddd/000000', N'Mr', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (80, N'Aubry Bushell', CAST(N'2024-02-06' AS Date), N'7877454234 ', N'abushell4@123-reg.co.uk', N'http://dummyimage.com/190x100.png/ff4444/ffffff', N'Ms', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (81, N'Cassey Pallister', CAST(N'2023-03-28' AS Date), N'3251493681 ', N'cpallister5@ebay.com', N'http://dummyimage.com/193x100.png/dddddd/000000', N'Rev', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (82, N'Yvonne Granville', CAST(N'2023-03-21' AS Date), N'8842393483 ', N'ygranville6@yolasite.com', N'http://dummyimage.com/163x100.png/dddddd/000000', N'Rev', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (83, N'Bendick Bodycote', CAST(N'2023-10-19' AS Date), N'1964038304 ', N'bbodycote7@unicef.org', N'http://dummyimage.com/216x100.png/dddddd/000000', N'Honorable', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (84, N'Ruben Boater', CAST(N'2024-02-25' AS Date), N'5972951011 ', N'rboater8@histats.com', N'http://dummyimage.com/118x100.png/dddddd/000000', N'Rev', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (85, N'Federica Dennington', CAST(N'2023-08-12' AS Date), N'1094462429 ', N'fdennington9@sphinn.com', N'http://dummyimage.com/186x100.png/5fa2dd/ffffff', N'Honorable', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (86, N'Jarrad Skrzynski', CAST(N'2023-04-21' AS Date), N'3517038671 ', N'jskrzynskia@wsj.com', N'http://dummyimage.com/172x100.png/dddddd/000000', N'Honorable', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (87, N'Jelene Darcy', CAST(N'2023-07-08' AS Date), N'3348506558 ', N'jdarcyb@slideshare.net', N'http://dummyimage.com/106x100.png/ff4444/ffffff', N'Ms', NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (88, N'Liza Karpol', CAST(N'2023-12-25' AS Date), N'3803535662 ', N'lkarpol0@archive.org', N'http://dummyimage.com/153x100.png/5fa2dd/ffffff', N'Mr', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (89, N'Gisela Nibloe', CAST(N'2023-04-10' AS Date), N'8733540351 ', N'gnibloe1@liveinternet.ru', N'http://dummyimage.com/206x100.png/5fa2dd/ffffff', N'Mrs', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (90, N'Angelo Lucian', CAST(N'2024-01-26' AS Date), N'3831349818 ', N'alucian2@pinterest.com', N'http://dummyimage.com/132x100.png/ff4444/ffffff', N'Ms', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (91, N'Elden Blackford', CAST(N'2023-08-03' AS Date), N'1718377965 ', N'eblackford3@scribd.com', N'http://dummyimage.com/181x100.png/ff4444/ffffff', N'Dr', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (92, N'Nettle McAviy', CAST(N'2023-08-30' AS Date), N'5843998055 ', N'nmcaviy4@hc360.com', N'http://dummyimage.com/126x100.png/cc0000/ffffff', N'Mrs', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (93, N'David Johnsson', CAST(N'2023-11-01' AS Date), N'8484058933 ', N'djohnsson5@liveinternet.ru', N'http://dummyimage.com/223x100.png/dddddd/000000', N'Dr', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (94, N'Winfred Wash', CAST(N'2023-12-12' AS Date), N'8465565139 ', N'wwash6@ca.gov', N'http://dummyimage.com/142x100.png/5fa2dd/ffffff', N'Ms', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (95, N'Kendra Posthill', CAST(N'2023-10-07' AS Date), N'9544595629 ', N'kposthill7@toplist.cz', N'http://dummyimage.com/149x100.png/dddddd/000000', N'Mrs', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (96, N'Torey Canwell', CAST(N'2023-11-21' AS Date), N'6302620225 ', N'tcanwell8@live.com', N'http://dummyimage.com/167x100.png/ff4444/ffffff', N'Honorable', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (97, N'Vina Atwell', CAST(N'2023-05-23' AS Date), N'6951107909 ', N'vatwell9@cbslocal.com', N'http://dummyimage.com/163x100.png/5fa2dd/ffffff', N'Ms', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (98, N'Lynda Shillitoe', CAST(N'2024-02-04' AS Date), N'5704580277 ', N'lshillitoea@apple.com', N'http://dummyimage.com/142x100.png/cc0000/ffffff', N'Honorable', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (99, N'Hanan Colombier', CAST(N'2023-12-24' AS Date), N'5016951748 ', N'hcolombierb@tmall.com', N'http://dummyimage.com/250x100.png/5fa2dd/ffffff', N'Honorable', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
GO
INSERT [dbo].[User] ([user_id], [name], [date_created], [phone], [email], [img], [description], [salary], [role], [delete_flag], [password_hash], [password_salt], [refresh_token], [token_created], [token_expires], [gender], [address], [dob]) VALUES (102, N'Emile Smith Rowe', CAST(N'2024-03-17' AS Date), N'745509     ', N'esr.contact@arsenal.uk', N'huanrowe.png', N'Arsenal player', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, N'Hanoi, Vietnam', CAST(N'2005-03-23T21:43:52.207' AS DateTime))
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
