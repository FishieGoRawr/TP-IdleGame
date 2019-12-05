--Return the level of the character
CREATE FUNCTION fnGetLevelCharacter (@CharID int)
RETURNS int
AS
BEGIN
	RETURN (SELECT CharLevel FROM Characters WHERE CharID = @CharID) --Get the level of the character
END
GO


