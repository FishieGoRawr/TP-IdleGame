--Check if character is overweight (Loot count over Character max loot)
CREATE PROCEDURE spIsOverweight
@charID INT
AS
BEGIN
	DECLARE @MaxWeight INT SET @MaxWeight = (SELECT CharMaxLoot FROM Characters WHERE CharID = @charID)
	DECLARE @CurrWeight INT SET @CurrWeight = (SELECT SUM(CharLootQty) FROM CharLoot WHERE CharLootCharacterID = @charID)
	
	IF ((@CurrWeight + 1) >= @MaxWeight)
		RETURN 1
	ELSE RETURN 0
END
GO


