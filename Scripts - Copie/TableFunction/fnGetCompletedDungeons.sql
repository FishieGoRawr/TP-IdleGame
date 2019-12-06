--Get the completed dungeon and the number of time they were completed.
CREATE FUNCTION fnGetCompletedDungeons (@CharID INT)
RETURNS TABLE
AS
RETURN (SELECT DungeonName, COUNT(DungeonName) AS nb --DungeonName, Count of how many time it was completed.
FROM (QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID)
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 1
GROUP BY DungeonName)
GO


