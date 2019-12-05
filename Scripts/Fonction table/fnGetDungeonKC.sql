CREATE FUNCTION fnGetDungeonKC (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT KillQty 
FROM QuestJournal
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0