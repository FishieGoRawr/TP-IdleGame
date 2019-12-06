--Add a loot to the character loot table
CREATE PROCEDURE spUpdateCharacterLoot
@charID INT,
@lootID INT,
@qty INT
AS
BEGIN
	--Update the quantity if loot already exists
	IF EXISTS (SELECT CharLootID FROM CharLoot WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID)
		UPDATE CharLoot SET CharLootQty = CharLootQty + 1 WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID
	ELSE --Insert loot if doesn't exist
		INSERT INTO CharLoot VALUES (@charID, @lootID, @qty)		
END
GO


