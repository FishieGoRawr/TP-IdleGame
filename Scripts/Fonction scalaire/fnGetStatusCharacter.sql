CREATE FUNCTION fnGetStatusCharacter (@CharID int)
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @status nvarchar(25)
	SELECT @status = CharStatus FROM Characters WHERE CharID = @CharID
	RETURN @status
END