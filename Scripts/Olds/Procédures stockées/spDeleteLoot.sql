CREATE PROCEDURE spDeleteLoot
@id INTEGER
AS
DELETE FROM CharLoot
WHERE CharLootCharacterID= @id