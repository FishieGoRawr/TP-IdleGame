--Return the total value of all the loot possessed in gold
CREATE FUNCTION fnIncomeSellAllLoot (@playerId INT)
RETURNS INTEGER
AS
BEGIN
	DECLARE @income INT
	SET @income = (SELECT SUM(LootValue) FROM Loots INNER JOIN CharLoot ON LootID = CharLootLootId WHERE CharLootCharacterID = @playerId) --Calculate the value of all the loot
	RETURN @income
END
GO


