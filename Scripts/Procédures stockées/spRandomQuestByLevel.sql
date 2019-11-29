Create PROCEDURE spRandomQuestByLevel
@level INT
AS
BEGIN
	 RETURN (SELECT TOP 1 DungeonID FROM Dungeons WHERE DungeonLevel = @level ORDER BY NEWID())
END