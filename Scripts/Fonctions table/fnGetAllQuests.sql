CREATE FUNCTION fnGetAllQuests() RETURNS TABLE
AS
RETURN SELECT QuestID, QuestName as questName, DungeonName AS dunName, LootName as lootName FROM ((Quests INNER JOIN Dungeons ON QuestDungeonID = DungeonID) 
INNER JOIN Loots ON QuestReward = LootID)