CREATE FUNCTION fnGetActiveDungeonName (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT DungeonName 
FROM QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID 
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
GO


