CREATE PROCEDURE spDefaultTesting @CharID INT
AS
BEGIN
	UPDATE Characters
	SET CharStatus = 'sellLoot',
		CharHeadID = NULL,
		CharTorsoID = NULL,
		CharLegsID = NULL,
		CharBootsID = NULL,
		CharGlovesID = NULL,
		CharWeapID = NULL,
		CharRingID = NULL
	WHERE CharID = @CharID

	DELETE FROM QuestJournal WHERE QuestJournalCharacterID = @CharID

	DELETE FROM Fights WHERE FightCharacterID = @CharID
END