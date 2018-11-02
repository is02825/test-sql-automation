CREATE TABLE [test].[Developers]
(
[developerID] [tinyint] NOT NULL IDENTITY(1, 1),
[developerFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[developerLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [test].[Developers] ADD CONSTRAINT [PK_Developers] PRIMARY KEY CLUSTERED  ([developerID]) ON [PRIMARY]
GO
