USE FirmaUebung
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	die Prozedur soll Eingangsparameter prüfen 
-- und Daten in Tabelle 'Projektzuordnung' hinzufügen
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[sp_AddProjektzuordnung]
	@ProjektID int,
	@PersonalID int,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @msg AS varchar(MAX);
	DECLARE @CheckResult AS int;		
	-------------------------------------------------------------------	
	BEGIN TRY 
		SET @Erfolg = 1;
		SET @Feedback = 'Alles OK!';
		-- TODO --
		-- @ProjektID existiert und ist nicht abgeschlossen
		SET @CheckResult = [dbo].[sf_ProjektAbgeschlossen](@ProjektID); 
		IF @CheckResult IS NULL -- @ProjektID nicht gefunden, Fehler
			THROW 50001, 'ProjektID ist falsch, bitte korrigieren!', 1;
			-- geht auch mit RAISEERROR			
			-- Help für THROW:
			-- https://docs.microsoft.com/de-de/sql/t-sql/language-elements/throw-transact-sql?view=sql-server-ver15
		IF @CheckResult = 1 -- Projekt abgeschlossen
			THROW 50002, 'Projekt abgeschlossen, bitte korrigieren!', 1;

		-- @PersonalID existiert und ist aus Projektabteilung
		SET @CheckResult = [dbo].[sf_IstMaAusPrAbt](@PersonalID);
		IF @CheckResult IS NULL -- @PersonalID nicht gefunden, Fehler
			THROW 50003, 'PersonalID ist falsch, bitte korrigieren!', 1;
		IF @CheckResult = 0 -- -- nicht Projektabt.
		BEGIN			
			DECLARE @Nachname nvarchar(50);
			SELECT @Nachname = Nachname
			FROM Personal
			WHERE PersonalID = @PersonalID;	
			-- Message - Variante 1 ----------------
			SET @msg = 'Mitarbeiter Nr. ' + CONVERT(varchar(10), @PersonalID) +
				' ' +  @Nachname + 					
				' arbeitet in einer nicht-Projektabteilung, bitte korrigieren!';  
				 -- TODO: Vorname, Abt.-Bezeichnung, etc.			
			THROW 50003, @msg, 1;
		END

		-- INSERT INTO [dbo].[Projektzuordnung] 
		Print 'Ende' --Debug 	
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
