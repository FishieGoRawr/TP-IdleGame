--Add the new equipement ont he character
CREATE PROCEDURE spEquipNew
@CharID INT, @EquipID INT AS
BEGIN
	DECLARE @EquipType INT SET @EquipType = (SELECT EquipEquipTypeID FROM Equipements WHERE EquipID = @EquipID) --Get the type of the equipement
	
	--When the equipement is an helmet
	IF @EquipType = 1
		BEGIN
			UPDATE Characters SET CharHeadID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is  a plate
	ELSE IF @EquipType = 2
		BEGIN
			UPDATE Characters SET CharTorsoID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is a legging
	ELSE IF @EquipType = 3
		BEGIN
			UPDATE Characters SET CharLegsID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is boots
	ELSE IF @EquipType = 4
		BEGIN
			UPDATE Characters SET CharBootsID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is an gloves
	ELSE IF @EquipType = 5
		BEGIN
			UPDATE Characters SET CharGlovesID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is a ring
	ELSE IF @EquipType = 6
		BEGIN
			UPDATE Characters SET CharRingID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is a necklace
	ELSE IF @EquipType = 7
		BEGIN
			UPDATE Characters SET CharNeckLaceID = @EquipID	WHERE CharID = @CharID
		END
	--When the equipement is a weapon
	ELSE
		BEGIN
			UPDATE Characters SET CharWeapID = @EquipID WHERE CharID = @CharID
		END
END
GO


