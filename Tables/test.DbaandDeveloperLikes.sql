CREATE TABLE [test].[DbaandDeveloperLikes]
(
[dbaID] [tinyint] NOT NULL,
[developerID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [test].[DbaandDeveloperLikes] ADD CONSTRAINT [FK_DbaandDeveloperLikes_DBAs] FOREIGN KEY ([dbaID]) REFERENCES [test].[DBAs] ([dbaID])
GO
ALTER TABLE [test].[DbaandDeveloperLikes] ADD CONSTRAINT [FK_DbaandDeveloperLikes_Developers] FOREIGN KEY ([developerID]) REFERENCES [test].[Developers] ([developerID])
GO
