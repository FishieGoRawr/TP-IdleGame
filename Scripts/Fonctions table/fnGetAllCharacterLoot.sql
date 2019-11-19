CREATE FUNCTION fnGetAllCharacterLoot(@ID INTEGER)
RETURNS TABLE
AS
RETURN
SELECT CharLootLootID AS Name, LootValue AS Value, CharLootQty AS Qty FROM (CharLoot INNER JOIN Loots ON CharLootID = CharLootLootID)
WHERE CharLootCharacterID = @ID