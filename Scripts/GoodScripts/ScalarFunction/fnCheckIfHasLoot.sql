--Return if the character own loots
CREATE FUNCTION fnCheckIfHasLoot (@CharID int)
RETURNS bit
AS
BEGIN
	DECLARE @count int
	DECLARE @hasLoot bit
	SET @count = (SELECT COUNT(CharLootID) FROM CharLoot WHERE CharLootCharacterID = @CharID) --Count the number of entry in the table Loots

	IF @count > 0
		Set @hasLoot = 1
	ELSE Set @hasLoot = 0

	RETURN @hasLoot
END
GO


