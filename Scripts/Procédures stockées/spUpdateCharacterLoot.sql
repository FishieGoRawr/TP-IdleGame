CREATE PROCEDURE spUpdateCharacterLoot
@charID INT,
@lootID INT,
@qty INT
AS
BEGIN
	IF EXISTS (SELECT CharLootID FROM CharLoot WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID)
		UPDATE CharLoot SET CharLootQty = CharLootQty + 1 WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID
	ELSE
		INSERT INTO CharLoot VALUES (@charID, @lootID, @qty)		
END