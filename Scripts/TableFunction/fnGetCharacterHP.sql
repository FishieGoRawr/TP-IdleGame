--Get the character current HP
CREATE FUNCTION fnGetCharacterHP (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT CharCurrHP as HP FROM Characters WHERE CharID = @CharID --Return Current HP
GO


