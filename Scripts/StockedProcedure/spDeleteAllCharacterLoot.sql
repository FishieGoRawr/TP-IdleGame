--Delete all the loot in the inventory of the character
CREATE PROCEDURE spDeleteAllCharacterLoot
@id INTEGER
AS
DELETE FROM CharLoot WHERE CharLootCharacterID= @id
GO


