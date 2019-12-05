--Return the level of the character
CREATE FUNCTION fnGetStatusCharacter (@CharID int)
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @status nvarchar(25)
	SELECT @status = CharStatus FROM Characters WHERE CharID = @CharID --Get the status of the character
	RETURN @status
END
GO


