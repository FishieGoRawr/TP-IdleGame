CREATE PROCEDURE spCompleteDungeon
@CharID INT
AS
BEGIN
	DELETE FROM Fights WHERE FightCharacterID = @CharID
	UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID	
END