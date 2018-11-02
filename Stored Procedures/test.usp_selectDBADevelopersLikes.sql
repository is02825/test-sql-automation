SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROC [test].[usp_selectDBADevelopersLikes]
AS
BEGIN

	set xact_abort on;

	BEGIN TRY
	
		begin tran	                                  
        
		SELECT  dbaFirstName,
                dbaLastName,
                developerFirstName,
                developerLastName
		FROM test.DBAs
			JOIN test.DbaandDeveloperLikes ON DbaandDeveloperLikes.dbaID = DBAs.dbaID 
			JOIN test.Developers ON Developers.developerID = DbaandDeveloperLikes.developerID

		IF XACT_STATE() = 1 COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH

			DECLARE @ErrorNumber INT,
				@ErrorLine INT,
				@ErrorSeverity INT,
				@ErrorState INT,
				@ErrorProcedure NVARCHAR(128),
				@ErrorMessage NVARCHAR(4000);

			SELECT
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE(),
				@ErrorMessage = ERROR_MESSAGE(),
				@ErrorNumber = ERROR_NUMBER(),
				@ErrorLine = ERROR_LINE(),
				@ErrorProcedure = ERROR_PROCEDURE();

			IF XACT_STATE() = -1 ROLLBACK TRANSACTION;

			BEGIN TRAN

			SET NOCOUNT ON;

			INSERT INTO [log].[ETLProcedureError]
					   ([ErrorNumber]
					   ,[ErrorSeverity]
					   ,[ErrorState]
					   ,[ErrorLine]
					   ,[ErrorMessage]
					   ,[ErrorProcedure])
				 VALUES
					   (@ErrorNumber
					   ,@ErrorSeverity
					   ,@ErrorState
					   ,@ErrorLine
					   ,@ErrorMessage
					   ,@ErrorProcedure);

			IF XACT_STATE() = 1 COMMIT TRANSACTION;

			SET NOCOUNT OFF;

			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

	END CATCH
END



GO
