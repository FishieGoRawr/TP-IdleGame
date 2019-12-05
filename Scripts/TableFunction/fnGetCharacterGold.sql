--Get the character gold amount.
CREATE FUNCTION fnGetCharacterGold (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT CharGP as GP FROM Characters WHERE CharID = @CharID
GO


