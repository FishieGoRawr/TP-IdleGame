CREATE FUNCTION fnGetLevelCharacter (@CharID int)
RETURNS int
AS
BEGIN
	RETURN (SELECT CharLevel FROM Characters WHERE CharID = @CharID)
END