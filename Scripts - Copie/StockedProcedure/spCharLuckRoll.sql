--Return if the character can have a random event
CREATE PROCEDURE spCharLuckRoll
@CharID INT
AS
BEGIN
	DECLARE @CharLuck INT SET @CharLuck = (SELECT CharLck FROM Characters WHERE CharID = @CharID) --Get the luck of the character
	DECLARE @lowerBase INT SET @lowerBase = (@CharLuck * 1.55) --Lower value
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase --Generate a random value of luck
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END
GO


