CREATE PROCEDURE spPlayerKilledMonster
@CharID INT
AS
BEGIN
	DECLARE @CurrentKC INT SET @CurrentKC = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0)

	UPDATE QuestJournal SET KillQty = (@CurrentKC - 1) WHERE QuestJournalCharacterID = @CharID
	DELETE FROM Fights WHERE FightCharacterID = @CharID
END