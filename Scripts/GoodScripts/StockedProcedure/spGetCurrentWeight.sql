CREATE PROCEDURE spGetCurrentWeight
@charID INT
AS
BEGIN
	RETURN SELECT SUM(CharLootQty) FROM CharLoot WHERE CharLootCharacterID = @charID
END
GO


