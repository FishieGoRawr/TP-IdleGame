CREATE PROCEDURE spUpdateDungeon
(@id integer, @name NVARCHAR(50), @lvl INTEGER )
AS
UPDATE Dungeons
SET DungeonName = @name, DungeonLevel = @lvl
WHERE DungeonID = @id