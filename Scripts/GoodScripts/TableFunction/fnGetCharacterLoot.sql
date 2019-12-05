CREATE FUNCTION fnGetCharacterLoot (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT LootName AS Name, LootValue AS Value, CharLootQty AS Qty FROM CharLoot INNER JOIN Loots ON CharLootLootID = LootID
	WHERE CharLoot.CharLootCharacterID = @CharID
GO


