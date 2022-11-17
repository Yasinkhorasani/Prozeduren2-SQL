USE [FirmaUebung]
GO

/****** Object:  View [dbo].[view_Projektzuordnung]    Script Date: 27.11.2020 12:22:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[view_Projektzuordnung]
AS
SELECT TOP (100) PERCENT 
	dbo.Projekt.Projekt, dbo.Projekt.Abgeschlossen, dbo.Projekt.ProjektID,
	dbo.Personal.Nachname, dbo.Personal.Vorname, dbo.Personal.PersonalID,
	dbo.Projektzuordnung.IstProjektleiter,
	dbo.RolleImProjekt.Rolle,
	dbo.Abteilung.Abteilung, dbo.Abteilung.Projektabteilung
FROM dbo.Projekt INNER JOIN
    dbo.Projektzuordnung ON dbo.Projekt.ProjektID = dbo.Projektzuordnung.ProjektID INNER JOIN
    dbo.Personal ON dbo.Projektzuordnung.PersonalID = dbo.Personal.PersonalID INNER JOIN
    dbo.Abteilung ON dbo.Personal.AbteilungsID = dbo.Abteilung.AbteilungsID INNER JOIN
	dbo.RolleImProjekt ON dbo.Projektzuordnung.RolleID = dbo.RolleImProjekt.RolleID

ORDER BY Projekt, dbo.Personal.Nachname;
GO


