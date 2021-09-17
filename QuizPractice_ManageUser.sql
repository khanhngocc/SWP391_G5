USE [QuizPractice]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[history_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[answer] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image_Url] [nvarchar](100) NOT NULL,
	[created_Date] [date] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[test_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[taken_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[option1] [nvarchar](max) NOT NULL,
	[option2] [nvarchar](max) NOT NULL,
	[option3] [nvarchar](max) NOT NULL,
	[option4] [nvarchar](max) NOT NULL,
	[correct_Option] [nvarchar](max) NOT NULL,
	[test_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roll]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roll](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roll_Feature]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roll_Feature](
	[id] [int] NOT NULL,
	[url] [nvarchar](50) NOT NULL,
	[isRequired] [bit] NOT NULL,
	[roll_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](20) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[creat_Date] [date] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 9/17/2021 10:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[gender] [bit] NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](12) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[createDate] [date] NOT NULL,
	[roll_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Roll] ([id], [name]) VALUES (1, N'Student')
INSERT [dbo].[Roll] ([id], [name]) VALUES (2, N'Teacher')
INSERT [dbo].[Roll] ([id], [name]) VALUES (3, N'Admin')
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (1, N'/Home', 1, 1)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (2, N'/Personal', 1, 1)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (3, N'/ChangePassword', 1, 1)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (4, N'/admin/list', 1, 3)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (5, N'/admin/filter', 1, 3)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (6, N'/admin/editUser', 1, 3)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (7, N'/admin/searchUser', 1, 3)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (8, N'/admin/addUser', 1, 3)
INSERT [dbo].[Roll_Feature] ([id], [url], [isRequired], [roll_id]) VALUES (9, N'/admin/deleteUser', 1, 3)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (16, N'ducanhka1', 0, N'abc1@gmail.com', N'444', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (17, N'ducanhka2', 1, N'abc2@gmail.com', N'1133', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (18, N'ducanhka3', 1, N'abc3@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (19, N'ducanhka4', 0, N'abc4@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (20, N'ducanhka5', 1, N'abc5@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (21, N'ducanhka6', 0, N'abc6@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (22, N'ducanhka7', 1, N'abc7@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (23, N'ducanhka8', 0, N'abc8@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (24, N'ducanhka9', 1, N'abc9@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (25, N'ducanhka10', 0, N'abc10@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (26, N'ducanhka11', 0, N'abc11@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (27, N'ducanhka12', 0, N'abc12@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (28, N'ducanhka13', 1, N'abc13@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (30, N'ducanhka14', 0, N'abc15@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (31, N'ducanhka15', 1, N'abc16@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (32, N'ducanhka16', 0, N'abc17@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (33, N'ducanhka17', 0, N'abc18@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (34, N'ducanhka18', 1, N'abc19@gmail.com', N'113', N'rI$8CLsWrB', N'1', CAST(N'2021-09-11' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (35, N'sa', 1, N'sa1@gmail.com', N'113', N'abc123456', N'1', CAST(N'2021-09-11' AS Date), 3)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (36, N'HUNG', 1, N'hunad@gmai.com', N'12321', N'abc123456', N'1', CAST(N'2021-09-16' AS Date), 2)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (37, N'Hung', 1, N'test@gmail.com', N'1133', N'abc123456', N'1', CAST(N'2021-09-16' AS Date), 1)
INSERT [dbo].[User] ([id], [fullname], [gender], [email], [phone], [password], [avatar], [createDate], [roll_id]) VALUES (38, N'Chuong', 0, N'test@gmail.com', N'1133', N'abc123456', N'1', CAST(N'2021-09-17' AS Date), 2)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([history_id])
REFERENCES [dbo].[History] ([id])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([id])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([test_id])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([test_id])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Roll_Feature]  WITH CHECK ADD FOREIGN KEY([roll_id])
REFERENCES [dbo].[Roll] ([id])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roll_id])
REFERENCES [dbo].[Roll] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  ((len([password])>=(8)))
GO
