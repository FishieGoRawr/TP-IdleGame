CREATE PROCEDURE spGeneratePlayerHit
@CharID INT
AS
BEGIN
	DECLARE @PlayerMaxHit INT EXEC @PlayerMaxHit = dbo.spGetCharacterAttack @CharID

	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @PlayerMaxHit as INT) + 0
	
	RETURN CONVERT (INT, @Hit / 2.5)
END
GO


