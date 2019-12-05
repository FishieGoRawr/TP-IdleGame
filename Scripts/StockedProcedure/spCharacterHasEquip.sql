CREATE PROCEDURE spCharacterHasEquip
@CharID INT
AS
BEGIN
	DECLARE @HasEquip BIT SET @HasEquip = 0

	IF (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharRingID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	RETURN @HasEquip
END
GO


