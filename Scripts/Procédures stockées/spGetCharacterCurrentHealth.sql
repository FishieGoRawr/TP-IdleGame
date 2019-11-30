CREATE PROCEDURE spGetCharacterCurrentHealth
@CharID INT
AS
BEGIN
	RETURN (SELECT CharCurrHP FROM Characters WHERE CharID = @CharID)
END