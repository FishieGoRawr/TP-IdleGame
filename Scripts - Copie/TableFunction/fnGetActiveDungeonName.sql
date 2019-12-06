--Get the name of the current active dungeon
CREATE FUNCTION fnGetActiveDungeonName (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT DungeonName 
FROM QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID --Select dungeon name in the character's journal where the dungeon isn't done
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
GO


