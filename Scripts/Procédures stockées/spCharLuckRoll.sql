CREATE PROCEDURE spCharLuckRoll
@CharID INT
AS
BEGIN
	DECLARE @CharLuck INT SET @CharLuck = (SELECT CharLck FROM Characters WHERE CharID = @CharID)
	DECLARE @lowerBase INT SET @lowerBase = (@CharLuck * 1.85)
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END