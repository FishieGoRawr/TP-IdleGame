--Return the final total damage deal by an attack of the player
CREATE PROCEDURE spGeneratePlayerHit
@CharID INT
AS
BEGIN
	DECLARE @PlayerMaxHit INT EXEC @PlayerMaxHit = dbo.spGetCharacterAttack @CharID --Get the max hit damage the player can deal
	
	--Get a random amount of damage deal by the attack of the player
	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @PlayerMaxHit as INT) + 0
	
	--Reduce the damage of the hit by the amount of armor of the monster
	RETURN CONVERT (INT, @Hit / 2.5)
END
GO


