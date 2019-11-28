CREATE PROCEDURE spDeleteAllCharacterLoot
@id INTEGER
AS
DELETE FROM CharLoot
WHERE CharLootCharacterID= @id