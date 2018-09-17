CREATE TABLE [test].[DbaandDeveloperLikes]
(
[dbaID] [tinyint] NOT NULL,
[developerID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [test].[DbaandDeveloperLikes] ADD CONSTRAINT [PK__DbaandDe__8399E141DE6E4886] PRIMARY KEY CLUSTERED  ([dbaID]) ON [PRIMARY]
GO
