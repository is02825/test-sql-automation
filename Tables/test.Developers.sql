CREATE TABLE [test].[Developers]
(
[developerID] [tinyint] NOT NULL IDENTITY(1, 1),
[developerFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[developerLastName] [varbinary] (50) NOT NULL
) ON [PRIMARY]
GO
