--Get all equiped items from character
CREATE FUNCTION fnGetCharacterEquiped
(	
@CharID INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharHeadID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharTorsoID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharLegsID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharBootsID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharGlovesID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharWeapID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharRingID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharNeckLaceID = EquipID WHERE CharID = @CharID
)
