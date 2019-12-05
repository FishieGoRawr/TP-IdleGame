--Update questjournal when player kills a monster
CREATE PROCEDURE spPlayerKilledMonster
@CharID INT
AS
BEGIN
	--Get the dungeon current killcount
	DECLARE @CurrentKC INT SET @CurrentKC = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0)

	--Removes a kill from the active dungeon's killcount
	UPDATE QuestJournal SET KillQty = (@CurrentKC - 1) WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
	--Delete the fight to be ready for another one
	DELETE FROM Fights WHERE FightCharacterID = @CharID
END
GO


