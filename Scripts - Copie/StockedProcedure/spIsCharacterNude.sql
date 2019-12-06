--Check every slot of a given character's equipement to see if character has equip
--Used for the goblin random event
CREATE PROCEDURE spIsCharacterNude
@CharID INT
AS
BEGIN
	DECLARE @isNude BIT SET @isNude = 0

	IF (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharRingID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	RETURN @isNude --Return 1 if nude, 0 if not.
END
GO


