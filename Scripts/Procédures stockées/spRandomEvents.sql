CREATE PROCEDURE spRandomEvents
AS
BEGIN
	DECLARE @eventID INT SET @eventID = RAND()*(1-5) + 5
	RETURN @eventID
END