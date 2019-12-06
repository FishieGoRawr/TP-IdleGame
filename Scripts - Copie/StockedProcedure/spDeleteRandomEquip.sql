--Remove the equipement stolen by the goblin on the character
CREATE PROCEDURE spDeleteRandomEquip
@CharID INT,
@DeletedEquipName NVARCHAR(50) OUTPUT
AS
BEGIN
	DECLARE @HasStolen BIT SET @HasStolen = 0
	DECLARE @HasEquip BIT EXEC @HasEquip = dbo.spCharacterHasEquip @CharID --Return if character have this equipement type
	DECLARE @StolenEquipID INT
	
	IF (@HasEquip = 1)
		BEGIN
			WHILE @HasStolen = 0
			BEGIN
				SET @StolenEquipID = RAND()*(1-9) + 9 --Random of the ID of the equipement it will be stole

				--If character own an helmet and is the equipement who will be steal
				IF (@StolenEquipID = 1 AND (SELECT CharHeadID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharHeadID = NULL WHERE CharID = @CharID
					END

				--If character own a plate and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 2 AND (SELECT CharTorsoID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharTorsoID = NULL WHERE CharID = @CharID
					END

				--If character own a legging and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 3 AND (SELECT CharLegsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharLegsID = NULL WHERE CharID = @CharID
					END

				--If character own boots and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 4 AND (SELECT CharBootsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharBootsID = NULL WHERE CharID = @CharID
					END

				--If character own gloves and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 5 AND (SELECT CharGlovesID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharGlovesID = NULL WHERE CharID = @CharID
						END

				--If character own a ring and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 6 AND (SELECT CharRingID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharRingID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharRingID = NULL WHERE CharID = @CharID
					END

				--If character own a necklace and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 7 AND (SELECT CharNeckLaceID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharNeckLaceID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharNeckLaceID = NULL WHERE CharID = @CharID
					END

				--If character own a weapon and is the equipement who will be steal
				ELSE IF (@StolenEquipID = 8 AND (SELECT CharWeapID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						--Get the name of the stolen equipement
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)
						--Remove the equipement on the character
						UPDATE Characters SET CharWeapID = NULL WHERE CharID = @CharID
					END
			END
	END
	ELSE
		BEGIN
			SET @DeletedEquipName = 'none'
		END
END
GO


