USE [BD_IdleGame]
GO

/****** Object:  View [dbo].[viewFillCharacterCombo]    Script Date: 2019-10-03 10:07:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewFillCharacterCombo]
AS
SELECT Characters.CharID as ID, Characters.CharName as Name, Characters.CharLevel as Level, Classes.ClassName as Class, Races.RaceName as Race
FROM ((Characters
INNER JOIN Classes ON Characters.CharClassID = Classes.ClassID)
INNER JOIN Races ON Characters.CharRaceID = races.RaceID)
GO


