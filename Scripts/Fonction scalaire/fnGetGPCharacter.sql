CREATE FUNCTION fnGetGPCharacter (@CharID int)
RETURNS int
AS
BEGIN
	DECLARE @gold int
	SELECT @gold = Characters.CharGP FROM Characters WHERE CharID = @CharID
	RETURN @gold
END