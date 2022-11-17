USE FirmaUebung
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

/*
CREATE OR ALTER PROCEDURE [dbo].[sp_AddProjektzuordnung]
	@ProjektID int,
	@PersonalID int,
	@RolleID int,
	@IstProjektleiter bit,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
*/

---- Test ProjektID existiert

-- Test ProjektID existiert nicht

-- Test Projekt abgeschlossen

-- Test Projekt nicht abgeschlossen


-- Test Test PersonalID existiert

-- Test Test PersonalID existiert nicht

-- Test Personal nicht aus Projektabteilung


-- Test INSERT 14.11.2022
-- ProjektID        370		Feuerkelch
-- PersonalID       39		Marie Skłorowska Gurie, Abteilung Test
-- RolleID          8		Tester
-- IstProjektleiter nein

EXEC [dbo].[sp_AddProjektzuordnung] 
	370, -- Feuerkelsch
	35, -- Marie Skłorowska Gurie, Abteilung Test
	8, -- Tester
	0,
	' Test ',
	----------
	@Erfolg OUTPUT,
	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';