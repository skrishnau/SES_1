USE [master]
GO
/****** Object:  Database [Academy_3]    Script Date: 11/24/2016 4:05:16 PM ******/
CREATE DATABASE [Academy_3] ON  PRIMARY 
( NAME = N'Academy_3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Academy_3.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Academy_3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Academy_3_log.LDF' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Academy_3] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy_3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy_3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy_3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy_3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy_3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy_3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy_3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Academy_3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy_3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy_3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy_3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy_3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy_3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy_3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy_3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy_3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Academy_3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy_3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy_3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy_3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy_3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy_3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy_3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy_3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy_3] SET  MULTI_USER 
GO
ALTER DATABASE [Academy_3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy_3] SET DB_CHAINING OFF 
GO
USE [Academy_3]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicYear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[RemindWhenEndDate] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[Completed] [bit] NULL,
	[SchoolId] [int] NOT NULL,
	[Void] [bit] NULL,
	[ActiveMarkedDate] [datetime] NULL,
	[ActiveMarkedById] [int] NULL,
	[CompleteMarkedDate] [datetime] NULL,
	[CompleteMarkedById] [int] NULL,
 CONSTRAINT [PK_dbo.AcademicYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityClass]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityResourceId] [int] NOT NULL,
	[SubjectClassId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ActivityClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityCompletion]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCompletion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ActivityResourceId] [int] NOT NULL,
	[CompletionMarkedDate] [datetime] NOT NULL,
	[CompletionMarkedById] [int] NULL,
 CONSTRAINT [PK_dbo.ActivityCompletion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityCompletionRestriction]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCompletionRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[Constraint] [nvarchar](max) NULL,
	[RestrictionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ActivityCompletionRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityGrading]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityGrading](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ActivityResourceId] [int] NOT NULL,
	[GradedDate] [datetime] NOT NULL,
	[GradedById] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[ObtainedGradeId] [int] NULL,
	[ObtainedGradeMarks] [real] NULL,
 CONSTRAINT [PK_dbo.ActivityGrading] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityResource]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityOrResource] [bit] NOT NULL,
	[ActivityResourceType] [tinyint] NOT NULL,
	[ActivityResourceId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[SubjectSectionId] [int] NOT NULL,
	[Void] [bit] NULL,
	[RestrictionId] [int] NULL,
 CONSTRAINT [PK_dbo.ActivityResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DispalyDescriptionOnPage] [bit] NULL,
	[SubmissionFrom] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[CutOffDate] [datetime] NULL,
	[FileSubmission] [bit] NOT NULL,
	[MaximumNoOfUploadedFiles] [int] NULL,
	[MaximumSubmissionSize] [int] NULL,
	[OnlineText] [bit] NOT NULL,
	[WordLimit] [int] NULL,
	[GradeTypeId] [int] NOT NULL,
	[MaximumGrade] [nvarchar](max) NULL,
	[GradeToPass] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Assignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignmentSubmissionFiles]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentSubmissionFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentSubmissionsId] [int] NOT NULL,
	[UserFileId] [int] NOT NULL,
	[FileSubmittedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AssignmentSubmissionFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignmentSubmissions]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentSubmissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubmissionText] [nvarchar](max) NULL,
	[SubmittedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserClassId] [int] NOT NULL,
	[AssignmentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AssignmentSubmissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ClassCommenceDate] [datetime] NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Batch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[AssociatedUniversity] [nvarchar](max) NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BookAuthor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookChapter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[ParentChapterId] [int] NULL,
 CONSTRAINT [PK_dbo.BookChapter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookResource]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayDescriptionOnCourePage] [bit] NOT NULL,
	[ChapterFormatting] [tinyint] NOT NULL,
	[StyleOfNavigation] [tinyint] NOT NULL,
	[CustomTitles] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.BookResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChoiceActivity]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChoiceActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayDescriptionOnCoursePage] [bit] NOT NULL,
	[DisplayModeForOptions] [bit] NOT NULL,
	[AllowChoiceTobeUpdated] [bit] NOT NULL,
	[AllowMoreThanOneChoiceToBeSelected] [bit] NOT NULL,
	[LimitTheNumberOfResponsesAllowed] [bit] NOT NULL,
	[RestrictTimePeriod] [bit] NOT NULL,
	[OpenDate] [datetime] NULL,
	[UntilDate] [datetime] NULL,
	[ShowPreview] [bit] NOT NULL,
	[PublishResults] [tinyint] NOT NULL,
	[PrivacyOfResults] [bit] NOT NULL,
	[ShowColumnForUnAnswered] [bit] NOT NULL,
	[IncludeResponsesFromInactiveUsers] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ChoiceActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChoiceOptions]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChoiceOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Option] [nvarchar](max) NULL,
	[Limit] [bigint] NULL,
	[Position] [int] NOT NULL,
	[ChoiceActivityId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ChoiceOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChoiceUser]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChoiceUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChoiceActivityId] [int] NOT NULL,
	[ChoiceOptionsId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ChoiceUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateRestriction]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RestrictionId] [int] NOT NULL,
	[Constraint] [bit] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Time] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DateRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Time] [nvarchar](max) NULL,
	[Latitude] [real] NULL,
	[Longitude] [real] NULL,
	[Description] [nvarchar](max) NULL,
	[SchoolId] [int] NOT NULL,
	[PostedById] [int] NOT NULL,
	[PostToPublic] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamTypeId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[NoticeContent] [nvarchar](max) NULL,
	[IsPercent] [bit] NULL,
	[Weight] [real] NULL,
	[StartDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[ResultDate] [datetime] NULL,
	[Void] [bit] NULL,
	[SchoolId] [int] NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[SessionId] [int] NULL,
	[ExamCoordinatorId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[PublishNoticeToNoticeBoard] [bit] NULL,
	[NoticeId] [int] NULL,
 CONSTRAINT [PK_dbo.Exam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamOfClass]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOfClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[RunningClassId] [int] NOT NULL,
	[Void] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.ExamOfClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamStudent]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamSubjectId] [int] NOT NULL,
	[UserClassId] [int] NOT NULL,
	[IsGrade] [bit] NULL,
	[ObtainedGradeId] [int] NULL,
	[IsPercent] [bit] NULL,
	[ObtainedMarks] [real] NULL,
	[PostedDate] [datetime] NULL,
	[Void] [bit] NULL,
	[ExamSubjectExaminerId] [int] NULL,
 CONSTRAINT [PK_dbo.ExamStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamSubject]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectClassId] [int] NOT NULL,
	[ExamOfClassId] [int] NOT NULL,
	[SettingsUsedFromExam] [bit] NOT NULL,
	[IsPercent] [bit] NULL,
	[Weight] [real] NULL,
	[FullMarks] [int] NULL,
	[PassMarks] [int] NULL,
	[SubjectExamDate] [datetime] NULL,
	[Time] [nvarchar](max) NULL,
	[Void] [bit] NULL,
 CONSTRAINT [PK_dbo.ExamSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamSubjectExaminer]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSubjectExaminer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamSubjectId] [int] NOT NULL,
	[ExaminerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ExamSubjectExaminer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamType]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsPercent] [bit] NOT NULL,
	[Weight] [real] NULL,
	[FullMarks] [int] NULL,
	[PassMarks] [int] NULL,
	[Void] [bit] NULL,
	[SchoolId] [int] NOT NULL,
	[Notice] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ExamType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileCategory]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.FileCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileResource]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ShowDescriptionOnCoursePage] [bit] NOT NULL,
	[Display] [tinyint] NOT NULL,
	[ShowSize] [bit] NOT NULL,
	[ShowType] [bit] NOT NULL,
	[ShowUploadModifiedDate] [bit] NOT NULL,
	[MainFileId] [int] NULL,
 CONSTRAINT [PK_dbo.FileResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileResourceFiles]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileResourceFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileResourceId] [int] NOT NULL,
	[SubFileId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FileResourceFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ForumActivity]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayDescriptionOnCoursePage] [bit] NOT NULL,
	[ForumType] [tinyint] NOT NULL,
	[MaximumAttachmentSize] [int] NOT NULL,
	[MaximumNoOfAttachments] [int] NOT NULL,
	[DisplayWordCount] [bit] NOT NULL,
	[SubscriptionMode] [tinyint] NOT NULL,
	[ReadTracking] [bit] NOT NULL,
	[TimePeriodForBlocking] [tinyint] NOT NULL,
	[PostThresholdForBlocking] [int] NOT NULL,
	[PostThresholdForWarning] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ForumActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ForumDiscussion]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumDiscussion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[ParentDiscussionId] [int] NULL,
	[ForumActivityId] [int] NOT NULL,
	[LastPostById] [int] NOT NULL,
	[PostedById] [int] NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[Closed] [bit] NULL,
	[LastUpdateDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[LastPostDate] [datetime] NOT NULL,
	[Pinned] [bit] NOT NULL,
	[SubscribeToDiscussion] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ForumDiscussion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[GradeValueIsInPercentOrPostition] [bit] NULL,
	[TotalMaxValue] [real] NULL,
	[TotalMinValue] [real] NULL,
	[MinimumPassValue] [real] NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_dbo.Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeRestriction]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RestrictionId] [int] NOT NULL,
	[ActivityResourceId] [int] NOT NULL,
	[MustBeGreaterThanOrEqualTo] [bit] NOT NULL,
	[GreaterThanOrEqualToValue] [real] NULL,
	[MustBeLessThan] [bit] NOT NULL,
	[LessThanValue] [real] NULL,
 CONSTRAINT [PK_dbo.GradeRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeValue]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[IsFailGrade] [bit] NULL,
	[EquivalentPercentOrPostition] [real] NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GradeValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupRestriction]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassOrGroup] [bit] NOT NULL,
	[SubjectClassId] [int] NULL,
	[GroupId] [int] NULL,
	[RestrictionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GroupRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabelResource]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabelResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.LabelResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Module]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](max) NULL,
	[ModuleDirectory] [nvarchar](max) NULL,
	[ParentModuleId] [int] NULL,
 CONSTRAINT [PK_dbo.Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleAccess]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAccess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[PermissionType] [tinyint] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ModuleAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nation]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Nationality] [nvarchar](max) NULL,
	[NationShortName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Nation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notice]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[NoticePublishTo] [bit] NULL,
	[Void] [bit] NULL,
	[PublishNoticeToNoticeBoard] [bit] NOT NULL,
	[PublishedDate] [datetime] NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoticeNotification]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeNotification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoticeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Viewed] [bit] NULL,
 CONSTRAINT [PK_dbo.NoticeNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageResource]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PageContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayDescriptionOnPage] [bit] NOT NULL,
	[DisplayPageName] [bit] NOT NULL,
	[DisplayPageDescription] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PageResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Program]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Void] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Program] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramBatch]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
	[Void] [bit] NULL,
	[StartedStudying] [bit] NULL,
	[StudyCompleted] [bit] NULL,
	[PassOut] [bit] NULL,
 CONSTRAINT [PK_dbo.ProgramBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restriction]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[MatchMust] [bit] NOT NULL,
	[MatchAllAny] [bit] NOT NULL,
	[Visibility] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Restriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[SchoolId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Void] [bit] NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RunningClass]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunningClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[SessionId] [int] NULL,
	[YearId] [int] NOT NULL,
	[SubYearId] [int] NULL,
	[ProgramBatchId] [int] NULL,
	[Void] [bit] NULL,
	[IsActive] [bit] NULL,
	[Completed] [bit] NULL,
 CONSTRAINT [PK_dbo.RunningClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[School]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[Code] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[RegNo] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [int] NULL,
	[ImageId] [int] NOT NULL,
	[SchoolTypeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.School] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolType]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SchoolType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[ParentId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Completed] [bit] NULL,
	[Void] [bit] NULL,
	[RemindWhenEndDate] [bit] NULL,
	[AcademicYearId] [int] NOT NULL,
	[CompleteMarkedDate] [datetime] NULL,
	[CompleteMarkedById] [int] NULL,
 CONSTRAINT [PK_dbo.Session] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CRN] [nvarchar](max) NULL,
	[ExamRollNoGlobal] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[GuardianName] [nvarchar](max) NULL,
	[GuardianEmail] [nvarchar](max) NULL,
	[GuardianContactNo] [nvarchar](max) NULL,
	[Void] [bit] NULL,
	[AssignedDate] [datetime] NULL,
	[Name] [nvarchar](max) NULL,
	[BatchAssigned] [bit] NULL,
 CONSTRAINT [PK_dbo.Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentBatch]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramBatchId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[InActive] [bit] NULL,
	[Void] [bit] NULL,
	[AddedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StudentBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 11/24/2016 4:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[SchoolId] [int] NULL,
	[ParentId] [int] NULL,
	[IsActive] [bit] NULL,
	[Void] [bit] NULL,
	[StartedStudying] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsFromBatch] [bit] NULL,
	[ProgramBatchId] [int] NULL,
 CONSTRAINT [PK_dbo.StudentGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentGroupStudent]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroupStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentGroupId] [int] NOT NULL,
	[Void] [bit] NULL,
	[AssignedBy] [int] NULL,
 CONSTRAINT [PK_dbo.StudentGroupStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[SubjectCategoryId] [int] NOT NULL,
	[Void] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[CreatedById] [int] NOT NULL,
	[Credit] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectCategory]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[SchoolId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[IsVoid] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.SubjectCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectClass]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRegular] [bit] NOT NULL,
	[RunningClassId] [int] NULL,
	[SubjectStructureId] [int] NULL,
	[SubjectId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[HasGrouping] [bit] NOT NULL,
	[UseDefaultGrouping] [bit] NULL,
	[Void] [bit] NULL,
	[VoidBy] [int] NULL,
	[VoidDate] [datetime] NULL,
	[SessionComplete] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedTime] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CompletionMarkedDate] [datetime] NULL,
	[CompleteMarkedByUserId] [int] NULL,
 CONSTRAINT [PK_dbo.SubjectClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectSection]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectSection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[ShowSummary] [bit] NULL,
	[Position] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Void] [bit] NULL,
 CONSTRAINT [PK_dbo.SubjectSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectStructure]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectStructure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YearId] [int] NOT NULL,
	[SubYearId] [int] NULL,
	[SubjectId] [int] NOT NULL,
	[Obsolete] [bit] NULL,
	[Void] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[VoidBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VoidDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.SubjectStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectUserGroup]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectUserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SubjectUserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubYear]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubYear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[ParentId] [int] NULL,
	[YearId] [int] NULL,
	[Void] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.SubYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AppointedDate] [datetime] NULL,
	[ResearchInterest] [nvarchar](max) NULL,
	[Hobbies] [nvarchar](max) NULL,
	[TeacherJobTitleId] [int] NULL,
	[JobTitle] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherQualification]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherQualification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Degree] [nvarchar](max) NULL,
	[FieldOfStudy] [nvarchar](max) NULL,
	[UniversityName] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[CompletionYear] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TeacherQualification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextBook]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Publication] [nvarchar](max) NULL,
	[ISBN] [nvarchar](max) NULL,
	[BookCode] [nvarchar](max) NULL,
	[Edition] [nvarchar](max) NULL,
	[Price] [real] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Void] [bit] NULL,
 CONSTRAINT [PK_dbo.TextBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UrlResource]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrlResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayDescriptionOnPage] [bit] NOT NULL,
	[Display] [tinyint] NOT NULL,
	[PopupWidthInPixel] [int] NOT NULL,
	[PopupHeightInPixel] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UrlResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClass]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectClassId] [int] NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[Void] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[EnrollmentDuration] [int] NOT NULL,
	[Suspended] [bit] NULL,
	[SubjectUserGroupId] [int] NULL,
 CONSTRAINT [PK_dbo.UserClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFile]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileDirectory] [nvarchar](max) NULL,
	[FileSizeInBytes] [bigint] NOT NULL,
	[FileType] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[Void] [bit] NULL,
	[IconPath] [nvarchar](max) NULL,
	[SubjectId] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLastLogin]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLastLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AccessedFrom] [nvarchar](max) NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastLogoutTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.UserLastLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfileRestriction]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfileRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[RestrictionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserProfileRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[EmailDisplay] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[GenderId] [int] NULL,
	[SchoolId] [int] NULL,
	[UserImageId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastOnline] [datetime] NULL,
	[SecurityQuestion] [nvarchar](max) NULL,
	[SecurityAnswer] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Year]    Script Date: 11/24/2016 4:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Year](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProgramId] [int] NOT NULL,
	[Void] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Year] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ActivityResourceId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityResourceId] ON [dbo].[ActivityClass]
(
	[ActivityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectClassId] ON [dbo].[ActivityClass]
(
	[SubjectClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityResourceId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityResourceId] ON [dbo].[ActivityCompletion]
(
	[ActivityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompletionMarkedById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompletionMarkedById] ON [dbo].[ActivityCompletion]
(
	[CompletionMarkedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ActivityCompletion]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [dbo].[ActivityCompletionRestriction]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[ActivityCompletionRestriction]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityResourceId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityResourceId] ON [dbo].[ActivityGrading]
(
	[ActivityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GradedById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_GradedById] ON [dbo].[ActivityGrading]
(
	[GradedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModifiedById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ModifiedById] ON [dbo].[ActivityGrading]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ObtainedGradeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ObtainedGradeId] ON [dbo].[ActivityGrading]
(
	[ObtainedGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ActivityGrading]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[ActivityResource]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectSectionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectSectionId] ON [dbo].[ActivityResource]
(
	[SubjectSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GradeTypeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_GradeTypeId] ON [dbo].[Assignment]
(
	[GradeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignmentSubmissionsId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AssignmentSubmissionsId] ON [dbo].[AssignmentSubmissionFiles]
(
	[AssignmentSubmissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserFileId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserFileId] ON [dbo].[AssignmentSubmissionFiles]
(
	[UserFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignmentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AssignmentId] ON [dbo].[AssignmentSubmissions]
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClassId] ON [dbo].[AssignmentSubmissions]
(
	[UserClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Batch]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookId] ON [dbo].[BookAuthor]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookId] ON [dbo].[BookChapter]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentChapterId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentChapterId] ON [dbo].[BookChapter]
(
	[ParentChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChoiceActivityId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChoiceActivityId] ON [dbo].[ChoiceOptions]
(
	[ChoiceActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChoiceActivityId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChoiceActivityId] ON [dbo].[ChoiceUser]
(
	[ChoiceActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChoiceOptionsId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChoiceOptionsId] ON [dbo].[ChoiceUser]
(
	[ChoiceOptionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ChoiceUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[DateRestriction]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostedById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostedById] ON [dbo].[Event]
(
	[PostedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicYearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicYearId] ON [dbo].[Exam]
(
	[AcademicYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamCoordinatorId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamCoordinatorId] ON [dbo].[Exam]
(
	[ExamCoordinatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamTypeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamTypeId] ON [dbo].[Exam]
(
	[ExamTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NoticeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_NoticeId] ON [dbo].[Exam]
(
	[NoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Exam]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SessionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SessionId] ON [dbo].[Exam]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamId] ON [dbo].[ExamOfClass]
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RunningClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RunningClassId] ON [dbo].[ExamOfClass]
(
	[RunningClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamSubjectExaminerId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamSubjectExaminerId] ON [dbo].[ExamStudent]
(
	[ExamSubjectExaminerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamSubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamSubjectId] ON [dbo].[ExamStudent]
(
	[ExamSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ObtainedGradeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ObtainedGradeId] ON [dbo].[ExamStudent]
(
	[ObtainedGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClassId] ON [dbo].[ExamStudent]
(
	[UserClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamOfClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamOfClassId] ON [dbo].[ExamSubject]
(
	[ExamOfClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectClassId] ON [dbo].[ExamSubject]
(
	[SubjectClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExaminerId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExaminerId] ON [dbo].[ExamSubjectExaminer]
(
	[ExaminerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamSubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamSubjectId] ON [dbo].[ExamSubjectExaminer]
(
	[ExamSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[ExamType]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FileResourceId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_FileResourceId] ON [dbo].[FileResourceFiles]
(
	[FileResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubFileId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubFileId] ON [dbo].[FileResourceFiles]
(
	[SubFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ForumActivityId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ForumActivityId] ON [dbo].[ForumDiscussion]
(
	[ForumActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LastPostById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_LastPostById] ON [dbo].[ForumDiscussion]
(
	[LastPostById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentDiscussionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentDiscussionId] ON [dbo].[ForumDiscussion]
(
	[ParentDiscussionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostedById]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostedById] ON [dbo].[ForumDiscussion]
(
	[PostedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Grade]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityResourceId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityResourceId] ON [dbo].[GradeRestriction]
(
	[ActivityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[GradeRestriction]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GradeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_GradeId] ON [dbo].[GradeValue]
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[GroupRestriction]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectClassId] ON [dbo].[GroupRestriction]
(
	[SubjectClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentModuleId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentModuleId] ON [dbo].[Module]
(
	[ParentModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleId] ON [dbo].[ModuleAccess]
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[ModuleAccess]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NoticeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_NoticeId] ON [dbo].[NoticeNotification]
(
	[NoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[NoticeNotification]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Program]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchId] ON [dbo].[ProgramBatch]
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProgramId] ON [dbo].[ProgramBatch]
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[Restriction]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Role]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicYearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicYearId] ON [dbo].[RunningClass]
(
	[AcademicYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramBatchId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProgramBatchId] ON [dbo].[RunningClass]
(
	[ProgramBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SessionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SessionId] ON [dbo].[RunningClass]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubYearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubYearId] ON [dbo].[RunningClass]
(
	[SubYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_YearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_YearId] ON [dbo].[RunningClass]
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolTypeId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolTypeId] ON [dbo].[School]
(
	[SchoolTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicYearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicYearId] ON [dbo].[Session]
(
	[AcademicYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[Session]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Student]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramBatchId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProgramBatchId] ON [dbo].[StudentBatch]
(
	[ProgramBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentId] ON [dbo].[StudentBatch]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[StudentGroup]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramBatchId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProgramBatchId] ON [dbo].[StudentGroup]
(
	[ProgramBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[StudentGroup]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentGroupId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentGroupId] ON [dbo].[StudentGroupStudent]
(
	[StudentGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentId] ON [dbo].[StudentGroupStudent]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectCategoryId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectCategoryId] ON [dbo].[Subject]
(
	[SubjectCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[SubjectCategory]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RunningClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RunningClassId] ON [dbo].[SubjectClass]
(
	[RunningClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[SubjectClass]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectStructureId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectStructureId] ON [dbo].[SubjectClass]
(
	[SubjectStructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[SubjectSection]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[SubjectStructure]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubYearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubYearId] ON [dbo].[SubjectStructure]
(
	[SubYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_YearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_YearId] ON [dbo].[SubjectStructure]
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[SubjectUserGroup]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[SubYear]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_YearId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_YearId] ON [dbo].[SubYear]
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Teacher]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherId] ON [dbo].[TeacherQualification]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[TextBook]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserClass]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectClassId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectClassId] ON [dbo].[UserClass]
(
	[SubjectClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectUserGroupId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectUserGroupId] ON [dbo].[UserClass]
(
	[SubjectUserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserClass]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectId] ON [dbo].[UserFile]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserLastLogin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictionId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictionId] ON [dbo].[UserProfileRestriction]
(
	[RestrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GenderId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_GenderId] ON [dbo].[Users]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolId] ON [dbo].[Users]
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserImageId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserImageId] ON [dbo].[Users]
(
	[UserImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramId]    Script Date: 11/24/2016 4:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProgramId] ON [dbo].[Year]
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [PostedById]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [PostToPublic]
GO
ALTER TABLE [dbo].[GradeValue] ADD  DEFAULT ((0)) FOR [GradeId]
GO
ALTER TABLE [dbo].[Program] ADD  DEFAULT ((0)) FOR [SchoolId]
GO
ALTER TABLE [dbo].[Subject] ADD  DEFAULT ((0)) FOR [CreatedById]
GO
ALTER TABLE [dbo].[Subject] ADD  DEFAULT ((0)) FOR [Credit]
GO
ALTER TABLE [dbo].[ActivityClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityClass_dbo.ActivityResource_ActivityResourceId] FOREIGN KEY([ActivityResourceId])
REFERENCES [dbo].[ActivityResource] ([Id])
GO
ALTER TABLE [dbo].[ActivityClass] CHECK CONSTRAINT [FK_dbo.ActivityClass_dbo.ActivityResource_ActivityResourceId]
GO
ALTER TABLE [dbo].[ActivityClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityClass_dbo.SubjectClass_SubjectClassId] FOREIGN KEY([SubjectClassId])
REFERENCES [dbo].[SubjectClass] ([Id])
GO
ALTER TABLE [dbo].[ActivityClass] CHECK CONSTRAINT [FK_dbo.ActivityClass_dbo.SubjectClass_SubjectClassId]
GO
ALTER TABLE [dbo].[ActivityCompletion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityCompletion_dbo.ActivityResource_ActivityResourceId] FOREIGN KEY([ActivityResourceId])
REFERENCES [dbo].[ActivityResource] ([Id])
GO
ALTER TABLE [dbo].[ActivityCompletion] CHECK CONSTRAINT [FK_dbo.ActivityCompletion_dbo.ActivityResource_ActivityResourceId]
GO
ALTER TABLE [dbo].[ActivityCompletion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityCompletion_dbo.Users_CompletionMarkedById] FOREIGN KEY([CompletionMarkedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ActivityCompletion] CHECK CONSTRAINT [FK_dbo.ActivityCompletion_dbo.Users_CompletionMarkedById]
GO
ALTER TABLE [dbo].[ActivityCompletion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityCompletion_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ActivityCompletion] CHECK CONSTRAINT [FK_dbo.ActivityCompletion_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[ActivityCompletionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityCompletionRestriction_dbo.ActivityResource_ActivityId] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[ActivityResource] ([Id])
GO
ALTER TABLE [dbo].[ActivityCompletionRestriction] CHECK CONSTRAINT [FK_dbo.ActivityCompletionRestriction_dbo.ActivityResource_ActivityId]
GO
ALTER TABLE [dbo].[ActivityCompletionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityCompletionRestriction_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[ActivityCompletionRestriction] CHECK CONSTRAINT [FK_dbo.ActivityCompletionRestriction_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[ActivityGrading]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityGrading_dbo.ActivityResource_ActivityResourceId] FOREIGN KEY([ActivityResourceId])
REFERENCES [dbo].[ActivityResource] ([Id])
GO
ALTER TABLE [dbo].[ActivityGrading] CHECK CONSTRAINT [FK_dbo.ActivityGrading_dbo.ActivityResource_ActivityResourceId]
GO
ALTER TABLE [dbo].[ActivityGrading]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityGrading_dbo.GradeValue_ObtainedGradeId] FOREIGN KEY([ObtainedGradeId])
REFERENCES [dbo].[GradeValue] ([Id])
GO
ALTER TABLE [dbo].[ActivityGrading] CHECK CONSTRAINT [FK_dbo.ActivityGrading_dbo.GradeValue_ObtainedGradeId]
GO
ALTER TABLE [dbo].[ActivityGrading]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_GradedById] FOREIGN KEY([GradedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ActivityGrading] CHECK CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_GradedById]
GO
ALTER TABLE [dbo].[ActivityGrading]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ActivityGrading] CHECK CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_ModifiedById]
GO
ALTER TABLE [dbo].[ActivityGrading]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ActivityGrading] CHECK CONSTRAINT [FK_dbo.ActivityGrading_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[ActivityResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityResource_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[ActivityResource] CHECK CONSTRAINT [FK_dbo.ActivityResource_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[ActivityResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityResource_dbo.SubjectSection_SubjectSectionId] FOREIGN KEY([SubjectSectionId])
REFERENCES [dbo].[SubjectSection] ([Id])
GO
ALTER TABLE [dbo].[ActivityResource] CHECK CONSTRAINT [FK_dbo.ActivityResource_dbo.SubjectSection_SubjectSectionId]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Assignment_dbo.Grade_GradeTypeId] FOREIGN KEY([GradeTypeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_dbo.Assignment_dbo.Grade_GradeTypeId]
GO
ALTER TABLE [dbo].[AssignmentSubmissionFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AssignmentSubmissionFiles_dbo.AssignmentSubmissions_AssignmentSubmissionsId] FOREIGN KEY([AssignmentSubmissionsId])
REFERENCES [dbo].[AssignmentSubmissions] ([Id])
GO
ALTER TABLE [dbo].[AssignmentSubmissionFiles] CHECK CONSTRAINT [FK_dbo.AssignmentSubmissionFiles_dbo.AssignmentSubmissions_AssignmentSubmissionsId]
GO
ALTER TABLE [dbo].[AssignmentSubmissionFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AssignmentSubmissionFiles_dbo.UserFile_UserFileId] FOREIGN KEY([UserFileId])
REFERENCES [dbo].[UserFile] ([Id])
GO
ALTER TABLE [dbo].[AssignmentSubmissionFiles] CHECK CONSTRAINT [FK_dbo.AssignmentSubmissionFiles_dbo.UserFile_UserFileId]
GO
ALTER TABLE [dbo].[AssignmentSubmissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AssignmentSubmissions_dbo.Assignment_AssignmentId] FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignment] ([Id])
GO
ALTER TABLE [dbo].[AssignmentSubmissions] CHECK CONSTRAINT [FK_dbo.AssignmentSubmissions_dbo.Assignment_AssignmentId]
GO
ALTER TABLE [dbo].[AssignmentSubmissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AssignmentSubmissions_dbo.UserClass_UserClassId] FOREIGN KEY([UserClassId])
REFERENCES [dbo].[UserClass] ([Id])
GO
ALTER TABLE [dbo].[AssignmentSubmissions] CHECK CONSTRAINT [FK_dbo.AssignmentSubmissions_dbo.UserClass_UserClassId]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Batch_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_dbo.Batch_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BookAuthor_dbo.TextBook_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[TextBook] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_dbo.BookAuthor_dbo.TextBook_BookId]
GO
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BookChapter_dbo.BookChapter_ParentChapterId] FOREIGN KEY([ParentChapterId])
REFERENCES [dbo].[BookChapter] ([Id])
GO
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_dbo.BookChapter_dbo.BookChapter_ParentChapterId]
GO
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BookChapter_dbo.BookResource_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[BookResource] ([Id])
GO
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_dbo.BookChapter_dbo.BookResource_BookId]
GO
ALTER TABLE [dbo].[ChoiceOptions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChoiceOptions_dbo.ChoiceActivity_ChoiceActivityId] FOREIGN KEY([ChoiceActivityId])
REFERENCES [dbo].[ChoiceActivity] ([Id])
GO
ALTER TABLE [dbo].[ChoiceOptions] CHECK CONSTRAINT [FK_dbo.ChoiceOptions_dbo.ChoiceActivity_ChoiceActivityId]
GO
ALTER TABLE [dbo].[ChoiceUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChoiceUser_dbo.ChoiceActivity_ChoiceActivityId] FOREIGN KEY([ChoiceActivityId])
REFERENCES [dbo].[ChoiceActivity] ([Id])
GO
ALTER TABLE [dbo].[ChoiceUser] CHECK CONSTRAINT [FK_dbo.ChoiceUser_dbo.ChoiceActivity_ChoiceActivityId]
GO
ALTER TABLE [dbo].[ChoiceUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChoiceUser_dbo.ChoiceOptions_ChoiceOptionsId] FOREIGN KEY([ChoiceOptionsId])
REFERENCES [dbo].[ChoiceOptions] ([Id])
GO
ALTER TABLE [dbo].[ChoiceUser] CHECK CONSTRAINT [FK_dbo.ChoiceUser_dbo.ChoiceOptions_ChoiceOptionsId]
GO
ALTER TABLE [dbo].[ChoiceUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChoiceUser_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ChoiceUser] CHECK CONSTRAINT [FK_dbo.ChoiceUser_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[DateRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DateRestriction_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[DateRestriction] CHECK CONSTRAINT [FK_dbo.DateRestriction_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Event_dbo.Users_PostedById] FOREIGN KEY([PostedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_dbo.Event_dbo.Users_PostedById]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.AcademicYear_AcademicYearId] FOREIGN KEY([AcademicYearId])
REFERENCES [dbo].[AcademicYear] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.AcademicYear_AcademicYearId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.ExamType_ExamTypeId] FOREIGN KEY([ExamTypeId])
REFERENCES [dbo].[ExamType] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.ExamType_ExamTypeId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.Notice_NoticeId] FOREIGN KEY([NoticeId])
REFERENCES [dbo].[Notice] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.Notice_NoticeId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.Session_SessionId] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.Session_SessionId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Exam_dbo.Users_ExamCoordinatorId] FOREIGN KEY([ExamCoordinatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_dbo.Exam_dbo.Users_ExamCoordinatorId]
GO
ALTER TABLE [dbo].[ExamOfClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamOfClass_dbo.Exam_ExamId] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[ExamOfClass] CHECK CONSTRAINT [FK_dbo.ExamOfClass_dbo.Exam_ExamId]
GO
ALTER TABLE [dbo].[ExamOfClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamOfClass_dbo.RunningClass_RunningClassId] FOREIGN KEY([RunningClassId])
REFERENCES [dbo].[RunningClass] ([Id])
GO
ALTER TABLE [dbo].[ExamOfClass] CHECK CONSTRAINT [FK_dbo.ExamOfClass_dbo.RunningClass_RunningClassId]
GO
ALTER TABLE [dbo].[ExamStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamStudent_dbo.ExamSubject_ExamSubjectId] FOREIGN KEY([ExamSubjectId])
REFERENCES [dbo].[ExamSubject] ([Id])
GO
ALTER TABLE [dbo].[ExamStudent] CHECK CONSTRAINT [FK_dbo.ExamStudent_dbo.ExamSubject_ExamSubjectId]
GO
ALTER TABLE [dbo].[ExamStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamStudent_dbo.ExamSubjectExaminer_ExamSubjectExaminerId] FOREIGN KEY([ExamSubjectExaminerId])
REFERENCES [dbo].[ExamSubjectExaminer] ([Id])
GO
ALTER TABLE [dbo].[ExamStudent] CHECK CONSTRAINT [FK_dbo.ExamStudent_dbo.ExamSubjectExaminer_ExamSubjectExaminerId]
GO
ALTER TABLE [dbo].[ExamStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamStudent_dbo.GradeValue_ObtainedGradeId] FOREIGN KEY([ObtainedGradeId])
REFERENCES [dbo].[GradeValue] ([Id])
GO
ALTER TABLE [dbo].[ExamStudent] CHECK CONSTRAINT [FK_dbo.ExamStudent_dbo.GradeValue_ObtainedGradeId]
GO
ALTER TABLE [dbo].[ExamStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamStudent_dbo.UserClass_UserClassId] FOREIGN KEY([UserClassId])
REFERENCES [dbo].[UserClass] ([Id])
GO
ALTER TABLE [dbo].[ExamStudent] CHECK CONSTRAINT [FK_dbo.ExamStudent_dbo.UserClass_UserClassId]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamSubject_dbo.ExamOfClass_ExamOfClassId] FOREIGN KEY([ExamOfClassId])
REFERENCES [dbo].[ExamOfClass] ([Id])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_dbo.ExamSubject_dbo.ExamOfClass_ExamOfClassId]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamSubject_dbo.SubjectClass_SubjectClassId] FOREIGN KEY([SubjectClassId])
REFERENCES [dbo].[SubjectClass] ([Id])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_dbo.ExamSubject_dbo.SubjectClass_SubjectClassId]
GO
ALTER TABLE [dbo].[ExamSubjectExaminer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamSubjectExaminer_dbo.ExamSubject_ExamSubjectId] FOREIGN KEY([ExamSubjectId])
REFERENCES [dbo].[ExamSubject] ([Id])
GO
ALTER TABLE [dbo].[ExamSubjectExaminer] CHECK CONSTRAINT [FK_dbo.ExamSubjectExaminer_dbo.ExamSubject_ExamSubjectId]
GO
ALTER TABLE [dbo].[ExamSubjectExaminer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamSubjectExaminer_dbo.Users_ExaminerId] FOREIGN KEY([ExaminerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ExamSubjectExaminer] CHECK CONSTRAINT [FK_dbo.ExamSubjectExaminer_dbo.Users_ExaminerId]
GO
ALTER TABLE [dbo].[ExamType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExamType_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[ExamType] CHECK CONSTRAINT [FK_dbo.ExamType_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[FileResourceFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FileResourceFiles_dbo.FileResource_FileResourceId] FOREIGN KEY([FileResourceId])
REFERENCES [dbo].[FileResource] ([Id])
GO
ALTER TABLE [dbo].[FileResourceFiles] CHECK CONSTRAINT [FK_dbo.FileResourceFiles_dbo.FileResource_FileResourceId]
GO
ALTER TABLE [dbo].[FileResourceFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FileResourceFiles_dbo.UserFile_SubFileId] FOREIGN KEY([SubFileId])
REFERENCES [dbo].[UserFile] ([Id])
GO
ALTER TABLE [dbo].[FileResourceFiles] CHECK CONSTRAINT [FK_dbo.FileResourceFiles_dbo.UserFile_SubFileId]
GO
ALTER TABLE [dbo].[ForumDiscussion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ForumDiscussion_dbo.ForumActivity_ForumActivityId] FOREIGN KEY([ForumActivityId])
REFERENCES [dbo].[ForumActivity] ([Id])
GO
ALTER TABLE [dbo].[ForumDiscussion] CHECK CONSTRAINT [FK_dbo.ForumDiscussion_dbo.ForumActivity_ForumActivityId]
GO
ALTER TABLE [dbo].[ForumDiscussion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ForumDiscussion_dbo.ForumDiscussion_ParentDiscussionId] FOREIGN KEY([ParentDiscussionId])
REFERENCES [dbo].[ForumDiscussion] ([Id])
GO
ALTER TABLE [dbo].[ForumDiscussion] CHECK CONSTRAINT [FK_dbo.ForumDiscussion_dbo.ForumDiscussion_ParentDiscussionId]
GO
ALTER TABLE [dbo].[ForumDiscussion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ForumDiscussion_dbo.Users_LastPostById] FOREIGN KEY([LastPostById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ForumDiscussion] CHECK CONSTRAINT [FK_dbo.ForumDiscussion_dbo.Users_LastPostById]
GO
ALTER TABLE [dbo].[ForumDiscussion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ForumDiscussion_dbo.Users_PostedById] FOREIGN KEY([PostedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ForumDiscussion] CHECK CONSTRAINT [FK_dbo.ForumDiscussion_dbo.Users_PostedById]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Grade_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_dbo.Grade_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[GradeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GradeRestriction_dbo.ActivityResource_ActivityResourceId] FOREIGN KEY([ActivityResourceId])
REFERENCES [dbo].[ActivityResource] ([Id])
GO
ALTER TABLE [dbo].[GradeRestriction] CHECK CONSTRAINT [FK_dbo.GradeRestriction_dbo.ActivityResource_ActivityResourceId]
GO
ALTER TABLE [dbo].[GradeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GradeRestriction_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[GradeRestriction] CHECK CONSTRAINT [FK_dbo.GradeRestriction_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[GradeValue]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GradeValue_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[GradeValue] CHECK CONSTRAINT [FK_dbo.GradeValue_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[GroupRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GroupRestriction_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[GroupRestriction] CHECK CONSTRAINT [FK_dbo.GroupRestriction_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[GroupRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GroupRestriction_dbo.SubjectClass_SubjectClassId] FOREIGN KEY([SubjectClassId])
REFERENCES [dbo].[SubjectClass] ([Id])
GO
ALTER TABLE [dbo].[GroupRestriction] CHECK CONSTRAINT [FK_dbo.GroupRestriction_dbo.SubjectClass_SubjectClassId]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Module_dbo.Module_ParentModuleId] FOREIGN KEY([ParentModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_dbo.Module_dbo.Module_ParentModuleId]
GO
ALTER TABLE [dbo].[ModuleAccess]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModuleAccess_dbo.Module_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[ModuleAccess] CHECK CONSTRAINT [FK_dbo.ModuleAccess_dbo.Module_ModuleId]
GO
ALTER TABLE [dbo].[ModuleAccess]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModuleAccess_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ModuleAccess] CHECK CONSTRAINT [FK_dbo.ModuleAccess_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[NoticeNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NoticeNotification_dbo.Notice_NoticeId] FOREIGN KEY([NoticeId])
REFERENCES [dbo].[Notice] ([Id])
GO
ALTER TABLE [dbo].[NoticeNotification] CHECK CONSTRAINT [FK_dbo.NoticeNotification_dbo.Notice_NoticeId]
GO
ALTER TABLE [dbo].[NoticeNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NoticeNotification_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NoticeNotification] CHECK CONSTRAINT [FK_dbo.NoticeNotification_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Program_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_dbo.Program_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[ProgramBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProgramBatch_dbo.Batch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([Id])
GO
ALTER TABLE [dbo].[ProgramBatch] CHECK CONSTRAINT [FK_dbo.ProgramBatch_dbo.Batch_BatchId]
GO
ALTER TABLE [dbo].[ProgramBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProgramBatch_dbo.Program_ProgramId] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([Id])
GO
ALTER TABLE [dbo].[ProgramBatch] CHECK CONSTRAINT [FK_dbo.ProgramBatch_dbo.Program_ProgramId]
GO
ALTER TABLE [dbo].[Restriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Restriction_dbo.Restriction_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[Restriction] CHECK CONSTRAINT [FK_dbo.Restriction_dbo.Restriction_ParentId]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Role_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_dbo.Role_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[RunningClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RunningClass_dbo.AcademicYear_AcademicYearId] FOREIGN KEY([AcademicYearId])
REFERENCES [dbo].[AcademicYear] ([Id])
GO
ALTER TABLE [dbo].[RunningClass] CHECK CONSTRAINT [FK_dbo.RunningClass_dbo.AcademicYear_AcademicYearId]
GO
ALTER TABLE [dbo].[RunningClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RunningClass_dbo.ProgramBatch_ProgramBatchId] FOREIGN KEY([ProgramBatchId])
REFERENCES [dbo].[ProgramBatch] ([Id])
GO
ALTER TABLE [dbo].[RunningClass] CHECK CONSTRAINT [FK_dbo.RunningClass_dbo.ProgramBatch_ProgramBatchId]
GO
ALTER TABLE [dbo].[RunningClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RunningClass_dbo.Session_SessionId] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[RunningClass] CHECK CONSTRAINT [FK_dbo.RunningClass_dbo.Session_SessionId]
GO
ALTER TABLE [dbo].[RunningClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RunningClass_dbo.SubYear_SubYearId] FOREIGN KEY([SubYearId])
REFERENCES [dbo].[SubYear] ([Id])
GO
ALTER TABLE [dbo].[RunningClass] CHECK CONSTRAINT [FK_dbo.RunningClass_dbo.SubYear_SubYearId]
GO
ALTER TABLE [dbo].[RunningClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RunningClass_dbo.Year_YearId] FOREIGN KEY([YearId])
REFERENCES [dbo].[Year] ([Id])
GO
ALTER TABLE [dbo].[RunningClass] CHECK CONSTRAINT [FK_dbo.RunningClass_dbo.Year_YearId]
GO
ALTER TABLE [dbo].[School]  WITH CHECK ADD  CONSTRAINT [FK_dbo.School_dbo.SchoolType_SchoolTypeId] FOREIGN KEY([SchoolTypeId])
REFERENCES [dbo].[SchoolType] ([Id])
GO
ALTER TABLE [dbo].[School] CHECK CONSTRAINT [FK_dbo.School_dbo.SchoolType_SchoolTypeId]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Session_dbo.AcademicYear_AcademicYearId] FOREIGN KEY([AcademicYearId])
REFERENCES [dbo].[AcademicYear] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_dbo.Session_dbo.AcademicYear_AcademicYearId]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Session_dbo.Session_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_dbo.Session_dbo.Session_ParentId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Student_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_dbo.Student_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[StudentBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentBatch_dbo.ProgramBatch_ProgramBatchId] FOREIGN KEY([ProgramBatchId])
REFERENCES [dbo].[ProgramBatch] ([Id])
GO
ALTER TABLE [dbo].[StudentBatch] CHECK CONSTRAINT [FK_dbo.StudentBatch_dbo.ProgramBatch_ProgramBatchId]
GO
ALTER TABLE [dbo].[StudentBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentBatch_dbo.Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentBatch] CHECK CONSTRAINT [FK_dbo.StudentBatch_dbo.Student_StudentId]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentGroup_dbo.ProgramBatch_ProgramBatchId] FOREIGN KEY([ProgramBatchId])
REFERENCES [dbo].[ProgramBatch] ([Id])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_dbo.StudentGroup_dbo.ProgramBatch_ProgramBatchId]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentGroup_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_dbo.StudentGroup_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentGroup_dbo.StudentGroup_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[StudentGroup] ([Id])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_dbo.StudentGroup_dbo.StudentGroup_ParentId]
GO
ALTER TABLE [dbo].[StudentGroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentGroupStudent_dbo.Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentGroupStudent] CHECK CONSTRAINT [FK_dbo.StudentGroupStudent_dbo.Student_StudentId]
GO
ALTER TABLE [dbo].[StudentGroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentGroupStudent_dbo.StudentGroup_StudentGroupId] FOREIGN KEY([StudentGroupId])
REFERENCES [dbo].[StudentGroup] ([Id])
GO
ALTER TABLE [dbo].[StudentGroupStudent] CHECK CONSTRAINT [FK_dbo.StudentGroupStudent_dbo.StudentGroup_StudentGroupId]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Subject_dbo.SubjectCategory_SubjectCategoryId] FOREIGN KEY([SubjectCategoryId])
REFERENCES [dbo].[SubjectCategory] ([Id])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_dbo.Subject_dbo.SubjectCategory_SubjectCategoryId]
GO
ALTER TABLE [dbo].[SubjectCategory]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectCategory_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[SubjectCategory] CHECK CONSTRAINT [FK_dbo.SubjectCategory_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[SubjectClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectClass_dbo.RunningClass_RunningClassId] FOREIGN KEY([RunningClassId])
REFERENCES [dbo].[RunningClass] ([Id])
GO
ALTER TABLE [dbo].[SubjectClass] CHECK CONSTRAINT [FK_dbo.SubjectClass_dbo.RunningClass_RunningClassId]
GO
ALTER TABLE [dbo].[SubjectClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectClass_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectClass] CHECK CONSTRAINT [FK_dbo.SubjectClass_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[SubjectClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectClass_dbo.SubjectStructure_SubjectStructureId] FOREIGN KEY([SubjectStructureId])
REFERENCES [dbo].[SubjectStructure] ([Id])
GO
ALTER TABLE [dbo].[SubjectClass] CHECK CONSTRAINT [FK_dbo.SubjectClass_dbo.SubjectStructure_SubjectStructureId]
GO
ALTER TABLE [dbo].[SubjectSection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectSection_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectSection] CHECK CONSTRAINT [FK_dbo.SubjectSection_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[SubjectStructure]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectStructure_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectStructure] CHECK CONSTRAINT [FK_dbo.SubjectStructure_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[SubjectStructure]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectStructure_dbo.SubYear_SubYearId] FOREIGN KEY([SubYearId])
REFERENCES [dbo].[SubYear] ([Id])
GO
ALTER TABLE [dbo].[SubjectStructure] CHECK CONSTRAINT [FK_dbo.SubjectStructure_dbo.SubYear_SubYearId]
GO
ALTER TABLE [dbo].[SubjectStructure]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectStructure_dbo.Year_YearId] FOREIGN KEY([YearId])
REFERENCES [dbo].[Year] ([Id])
GO
ALTER TABLE [dbo].[SubjectStructure] CHECK CONSTRAINT [FK_dbo.SubjectStructure_dbo.Year_YearId]
GO
ALTER TABLE [dbo].[SubjectUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectUserGroup_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectUserGroup] CHECK CONSTRAINT [FK_dbo.SubjectUserGroup_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[SubYear]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubYear_dbo.SubYear_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[SubYear] ([Id])
GO
ALTER TABLE [dbo].[SubYear] CHECK CONSTRAINT [FK_dbo.SubYear_dbo.SubYear_ParentId]
GO
ALTER TABLE [dbo].[SubYear]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubYear_dbo.Year_YearId] FOREIGN KEY([YearId])
REFERENCES [dbo].[Year] ([Id])
GO
ALTER TABLE [dbo].[SubYear] CHECK CONSTRAINT [FK_dbo.SubYear_dbo.Year_YearId]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teacher_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_dbo.Teacher_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[TeacherQualification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TeacherQualification_dbo.Teacher_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeacherQualification] CHECK CONSTRAINT [FK_dbo.TeacherQualification_dbo.Teacher_TeacherId]
GO
ALTER TABLE [dbo].[TextBook]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TextBook_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[TextBook] CHECK CONSTRAINT [FK_dbo.TextBook_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[UserClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClass_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserClass] CHECK CONSTRAINT [FK_dbo.UserClass_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClass_dbo.SubjectClass_SubjectClassId] FOREIGN KEY([SubjectClassId])
REFERENCES [dbo].[SubjectClass] ([Id])
GO
ALTER TABLE [dbo].[UserClass] CHECK CONSTRAINT [FK_dbo.UserClass_dbo.SubjectClass_SubjectClassId]
GO
ALTER TABLE [dbo].[UserClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClass_dbo.SubjectUserGroup_SubjectUserGroupId] FOREIGN KEY([SubjectUserGroupId])
REFERENCES [dbo].[SubjectUserGroup] ([Id])
GO
ALTER TABLE [dbo].[UserClass] CHECK CONSTRAINT [FK_dbo.UserClass_dbo.SubjectUserGroup_SubjectUserGroupId]
GO
ALTER TABLE [dbo].[UserClass]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClass_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserClass] CHECK CONSTRAINT [FK_dbo.UserClass_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserFile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserFile_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[UserFile] CHECK CONSTRAINT [FK_dbo.UserFile_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[UserLastLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLastLogin_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLastLogin] CHECK CONSTRAINT [FK_dbo.UserLastLogin_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserProfileRestriction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProfileRestriction_dbo.Restriction_RestrictionId] FOREIGN KEY([RestrictionId])
REFERENCES [dbo].[Restriction] ([Id])
GO
ALTER TABLE [dbo].[UserProfileRestriction] CHECK CONSTRAINT [FK_dbo.UserProfileRestriction_dbo.Restriction_RestrictionId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Gender_GenderId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.School_SchoolId] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.School_SchoolId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.UserFile_UserImageId] FOREIGN KEY([UserImageId])
REFERENCES [dbo].[UserFile] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.UserFile_UserImageId]
GO
ALTER TABLE [dbo].[Year]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Year_dbo.Program_ProgramId] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([Id])
GO
ALTER TABLE [dbo].[Year] CHECK CONSTRAINT [FK_dbo.Year_dbo.Program_ProgramId]
GO
USE [master]
GO
ALTER DATABASE [Academy_3] SET  READ_WRITE 
GO
