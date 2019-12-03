ALTER PROCEDURE spCharWisdomRoll
@CharID INT
AS
BEGIN
	DECLARE @CharWisdom INT SET @CharWisdom = (SELECT CharWis FROM Characters WHERE CharID = 1)
	DECLARE @lowerBase INT SET @lowerBase = (10 * 1.15)
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END