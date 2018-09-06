CREATE TABLE [test].[DBAs]
(
[dbaID] [tinyint] NOT NULL IDENTITY(1, 1),
[dbaFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dbaLastName] [varbinary] (50) NOT NULL
) ON [PRIMARY]
GO
