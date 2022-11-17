USE FirmaUebung
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

/*
CREATE OR ALTER PROCEDURE [dbo].[sp_AddProjektzuordnung]
	@ProjektID int,
	@PersonalID int,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
*/

---- Test ProjektID existiert OK
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	70, -- Abendkleid designen
--	8,  -- Magerfeld
--	' Test ProjektID existiert',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test ProjektID existiert nicht
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	70000000, --
--	8,  -- Magerfeld
--	' Test ProjektID existiert nicht',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

-- Test Projekt abgeschlossen - getestet, OK
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	130, -- @ProjektID Windows installieren, abgeschlossen
--	8,  -- Magerfeld
--	' Test ProjektID existiert nicht',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Projekt nicht abgeschlossen - getestet, OK
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	300, -- @ProjektID Nimbus 2000, nicht abgeschlossen
--	8,  -- Magerfeld
--	' Test ProjektID existiert nicht',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Test PersonalID existiert
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	300, -- @ProjektID Nimbus 2000, nicht abgeschlossen
--	8,  -- Magerfeld
--	' Test ',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Test PersonalID existiert nicht
--EXEC [dbo].[sp_AddProjektzuordnung] 
--	300, -- @ProjektID Nimbus 2000, nicht abgeschlossen
--	8000000,  -- 
--	' Test ',
--	----------
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

-- Test Personal nicht aus Projektabteilung
EXEC [dbo].[sp_AddProjektzuordnung] 
	300, -- @ProjektID Nimbus 2000, nicht abgeschlossen
	1, -- @PersonalID Dumbledore nicht aus Projektabteilung 
	' Test ',
	----------
	@Erfolg OUTPUT,
	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';