--Return if the character can have a reduction at shop
CREATE PROCEDURE spCharWisdomRoll
@CharID INT
AS
BEGIN
	DECLARE @CharWisdom INT SET @CharWisdom = (SELECT CharWis FROM Characters WHERE CharID = @CharID) --Get the wisdom of the character
	DECLARE @lowerBase INT SET @lowerBase = (@CharWisdom * 1.15) --Lower value
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase --Generate a random value of wisdom
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END
GO


