CREATE PROCEDURE spDeleteRandomEquip
@CharID INT,
@DeletedEquipName NVARCHAR(50) OUTPUT
AS
BEGIN
	DECLARE @HasStolen BIT SET @HasStolen = 0
	DECLARE @HasEquip BIT EXEC @HasEquip = dbo.spCharacterHasEquip 1
	DECLARE @StolenEquipID INT
	
	IF (@HasEquip = 1)
		BEGIN
			WHILE @HasStolen = 0
			BEGIN
				SET @StolenEquipID = RAND()*(1-9) + 9

				IF (@StolenEquipID = 1 AND (SELECT CharHeadID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharID = @CharID)
						UPDATE Characters SET CharHeadID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 2 AND (SELECT CharTorsoID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharID = @CharID)
						UPDATE Characters SET CharTorsoID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 3 AND (SELECT CharLegsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharID = @CharID)
						UPDATE Characters SET CharLegsID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 4 AND (SELECT CharBootsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharID = @CharID)
						UPDATE Characters SET CharBootsID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 5 AND (SELECT CharGlovesID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharID = @CharID)
						UPDATE Characters SET CharGlovesID = NULL WHERE CharID = @CharID
						END

				ELSE IF (@StolenEquipID = 6 AND (SELECT CharRingID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharRingID WHERE CharID = @CharID)
						UPDATE Characters SET CharRingID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 7 AND (SELECT CharNeckLaceID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharNeckLaceID WHERE CharID = @CharID)
						UPDATE Characters SET CharNeckLaceID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 8 AND (SELECT CharWeapID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)
						UPDATE Characters SET CharWeapID = NULL WHERE CharID = @CharID
					END
			END
	END
	ELSE
		BEGIN
			SET @DeletedEquipName = 'none'
		END
END