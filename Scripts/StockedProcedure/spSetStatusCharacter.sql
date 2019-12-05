--Set the character status
CREATE PROCEDURE spSetStatusCharacter
@CharID int, @status nvarchar(25)
AS
UPDATE Characters
SET CharStatus = @status
WHERE CharID = @CharID
GO


