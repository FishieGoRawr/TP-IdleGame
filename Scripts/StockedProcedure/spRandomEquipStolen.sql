CREATE PROCEDURE spRandomEquipStolen
@CharID INT
AS
BEGIN
	DECLARE @HasStolen BIT SET @HasStolen = 0
	DECLARE @StolenEquipID INT 
	DECLARE @EquipID INT

	WHILE @HasStolen = 0
		BEGIN
			SET @StolenEquipID = RAND()*(1-9) + 9

			IF (@StolenEquipID = 1 AND (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 2 AND (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 3 AND (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 4 AND (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 5 AND (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 6 AND (SELECT CharRingID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 7 AND (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 8 AND (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1
		END
	
	RETURN @StolenEquipID
END
GO


