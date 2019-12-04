CREATE PROCEDURE spHasActiveQuest
@CharID INT
AS
BEGIN
	DECLARE @QuestCount INT SET @QuestCount = (SELECT COUNT(QuestJournalCompletion) FROM QuestJournal WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID)

	IF @QuestCount > 0
		RETURN 1
	ELSE RETURN 0	
END