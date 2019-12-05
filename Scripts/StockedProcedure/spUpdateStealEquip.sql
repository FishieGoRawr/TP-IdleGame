CREATE PROCEDURE spUpdateStealEquip
@CharID INT, @eventID INT 
AS
BEGIN
	IF @eventID = 1
		BEGIN
			UPDATE Characters SET CharHeadID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 2
		BEGIN
			UPDATE Characters SET CharTorsoID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 3
		BEGIN
			UPDATE Characters SET CharLegsID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 4
		BEGIN
			UPDATE Characters SET CharBootsID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 5
		BEGIN
			UPDATE Characters SET CharGlovesID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 6
		BEGIN
			UPDATE Characters SET CharRingID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 7
		BEGIN
			UPDATE Characters SET CharNeckLaceID = NULL	WHERE CharID = @CharID
		END
	ELSE
		BEGIN
			UPDATE Characters SET CharWeapID = NULL WHERE CharID = @CharID
		END
END
GO


