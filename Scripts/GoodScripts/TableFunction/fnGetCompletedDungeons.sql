CREATE FUNCTION fnGetCompletedDungeons (@CharID INT)
RETURNS TABLE
AS
RETURN (SELECT DungeonName, COUNT(DungeonName) AS nb
FROM (QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID)
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 1
GROUP BY DungeonName)
GO


