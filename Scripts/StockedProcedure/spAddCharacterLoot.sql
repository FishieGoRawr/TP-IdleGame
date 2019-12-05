--Add a loot in the inventory of the character
CREATE PROCEDURE spAddCharacterLoot
@CharID INT, 
@lootID INT, --Id of the loot
@qty INT --Quantity of the loot
AS
INSERT INTO CharLoot VALUES (@CharID, @lootID, @qty) --Insert the loot in the table CharLoot
GO


