USE FirmaUebung;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	die Prozedur soll Eingangsparameter prüfen 
-- und Daten in Tabelle 'Projektzuordnung' hinzufügen
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[sp_AddProjektzuordnung] 
	-- TODO: Add the parameters for the stored procedure here
	----------------------------------------------------
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @msg AS nvarchar(MAX); -- Fehlermeldung
	DECLARE @CheckResult AS int;		
	-------------------------------------------------------------------	
	BEGIN TRY
		-- TODO --
		-- @ProjektID existiert und ist nicht abgeschlossen
		-- @PersonalID existiert und Mitarbeiter ist aus Projektabteilung
		-- TODO (Zukunft) -- nur 1 Projektleiter pro Projekt - stored function ~ sf_ProjektMitProjektleiter(@ProjektID); 
		-- INSERT INTO [dbo].[Projektzuordnung]
		----------------------
		SET @Erfolg = 1;
		SET @Feedback = 'Alles OK!';	
	END TRY 
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
						+ ' Prozedur: '  + ERROR_PROCEDURE()
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH;    
END
GO
