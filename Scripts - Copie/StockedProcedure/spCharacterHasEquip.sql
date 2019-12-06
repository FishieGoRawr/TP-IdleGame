--Return if the character as an equipement
CREATE PROCEDURE spCharacterHasEquip
@CharID INT
AS
BEGIN
	DECLARE @HasEquip BIT SET @HasEquip = 0

	--Verify if the character as an helmet
	IF (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as an helmet
	ELSE IF (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as a plate
	ELSE IF (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as gloves
	ELSE IF (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as boots
	ELSE IF (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as a ring
	ELSE IF (SELECT CharRingID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as a necklace
	ELSE IF (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	--Verify if the character as a weapon
	ELSE IF (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	RETURN @HasEquip
END
GO


