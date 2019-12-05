--Return the gold owned by the character
CREATE FUNCTION fnGetGPCharacter (@CharID int)
RETURNS int
AS
BEGIN
	DECLARE @gold int
	SELECT @gold = Characters.CharGP FROM Characters WHERE CharID = @CharID --Get the gold of the character
	RETURN @gold
END
GO


