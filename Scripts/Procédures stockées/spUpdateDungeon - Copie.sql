CREATE PROCEDURE spUpdateQuest
(@id INTEGER, @name NVARCHAR(50), @dunID INTEGER, @lootID INTEGER)
AS
UPDATE Quests
SET QuestName = @name, QuestDungeonID = @dunID, QuestLootID = @lootID
WHERE QuestID = @id