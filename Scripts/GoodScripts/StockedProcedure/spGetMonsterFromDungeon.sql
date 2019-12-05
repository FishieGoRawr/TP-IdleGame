--Return a random ID of a monster a character can encounter in a specific dungeon
CREATE PROCEDURE spGetMonsterFromDungeon
@DunID INT
AS
BEGIN
	RETURN (SELECT TOP 1 EncounterMonsterID FROM Encounters WHERE EncounterDungeonID = @DunID ORDER BY NEWID())
END
GO


