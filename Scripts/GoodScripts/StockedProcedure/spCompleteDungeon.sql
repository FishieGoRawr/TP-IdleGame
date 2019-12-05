--Update the completion of the dungeon on the QuestJounal Table and delete the fight
CREATE PROCEDURE spCompleteDungeon
@CharID INT
AS
BEGIN
	DELETE FROM Fights WHERE FightCharacterID = @CharID --Delete from the Table Fights the current fight
	UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID	--Update the completion of the quest to finished
END
GO


