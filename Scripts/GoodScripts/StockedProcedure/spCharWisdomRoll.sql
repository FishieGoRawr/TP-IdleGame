CREATE PROCEDURE spCharWisdomRoll
@CharID INT
AS
BEGIN
	DECLARE @CharWisdom INT SET @CharWisdom = (SELECT CharWis FROM Characters WHERE CharID = @CharID)
	DECLARE @lowerBase INT SET @lowerBase = (@CharWisdom * 1.15)
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END
GO


