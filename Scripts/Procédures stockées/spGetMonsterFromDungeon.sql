CREATE PROCEDURE spGetMonsterFromDungeon 
@DunID INT
AS
BEGIN
	RETURN (SELECT TOP 1 EncounterMonsterID FROM Encounters WHERE EncounterDungeonID = @DunID ORDER BY NEWID())
END
GO