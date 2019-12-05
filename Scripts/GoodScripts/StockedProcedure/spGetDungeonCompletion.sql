--Decrease the kill count on a dungeon
CREATE PROCEDURE spGetDungeonCompletion
@CharID INT,
@DunID INT
AS
BEGIN
	DECLARE @QuestKCCurrent INT SET @QuestKCCurrent = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0) --Get the number of kill 
	DECLARE @r INT --Result for quest completion. 0 = not completed, 1 = completed
	
	IF ((@QuestKCCurrent - 1) > 0) --If monster killed but no complete
		BEGIN
			SET @r = 0
		END
	ELSE IF ((@QuestKCCurrent - 1) <= 0) --If monster killed and complete
		BEGIN
			SET @r = 1
			--Update in the QuestJournal Table
			UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
		END

	RETURN @r
END
GO


