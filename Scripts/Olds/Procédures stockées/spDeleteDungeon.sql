CREATE PROCEDURE spDeleteDungeon
@id INTEGER
AS
DELETE FROM Dungeons
WHERE DungeonID = @id