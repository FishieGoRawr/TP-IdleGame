CREATE PROCEDURE spGetDungeonCompletion
@CharID INT,
@DunID INT
AS
BEGIN
	DECLARE @QuestKCTotal INT SET @QuestKCTotal = (SELECT KillQty FROM Dungeons WHERE DungeonID = @DunID)
	DECLARE @QuestKCCurrent INT SET @QuestKCCurrent = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0)
	DECLARE @r INT --Result for quest completion. 0 = not completed, 1 = completed
	
	IF ((@QuestKCCurrent - 1) > 0) --If monster killed but no complete
		BEGIN
			SET @r = 0
		END
	ELSE IF ((@QuestKCCurrent - 1) <= 0) --If monster killed and complete
		BEGIN
			SET @r = 1
			UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
		END

	RETURN @r
END
GO


