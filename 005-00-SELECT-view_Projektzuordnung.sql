/****** Skript für SelectTopNRows-Befehl aus SSMS ******/
SELECT TOP (1000) [Projekt]
      ,[Abgeschlossen]
      ,[ProjektID]
      ,[Nachname]
      ,[Vorname]
      ,[PersonalID]
      ,[IstProjektleiter]
      ,[Rolle]
      ,[Abteilung]
      ,[Projektabteilung]
  FROM [FirmaUebung].[dbo].[view_Projektzuordnung]
  WHERE ProjektID = 370
  ORDER BY Projekt, Nachname, Vorname;