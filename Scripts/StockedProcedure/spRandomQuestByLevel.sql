CREATE PROCEDURE spRandomQuestByLevel
@CharID INT,
@level INT
AS
BEGIN
	DECLARE @DunID INT
	DECLARE @KillQty INT
	SET @DunID = (SELECT TOP 1 DungeonID FROM Dungeons WHERE DungeonLevel = @level ORDER BY NEWID())
	SET @KillQty = (SELECT KillQty FROM Dungeons WHERE DungeonID = @DunID)
	
	INSERT INTO QuestJournal VALUES (@CharID, @DunID, 0, @KillQty)
END
GO


