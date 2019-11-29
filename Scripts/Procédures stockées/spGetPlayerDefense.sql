ALTER PROCEDURE spGetPlayerDefense
@CharID INT
AS
BEGIN
	DECLARE @PlayerHeadDef INT, @PlayerTorsoDef INT, @PlayerLegsDef INT, @PlayerBootsDef INT, @PlayerGlovesDef INT, @PlayerTotalDef INT

	SET @PlayerHeadDef = (SELECT EquipFlatDef FROM Characters INNER JOIN Equipements ON CharHeadID = EquipID WHERE CharHeadID != NULL AND CharID = @CharID)
	SET @PlayerTorsoDef = (SELECT EquipFlatDef FROM Characters INNER JOIN Equipements ON CharTorsoID = EquipID WHERE CharHeadID != NULL AND CharID = @CharID)
	SET @PlayerLegsDef = (SELECT EquipFlatDef FROM Characters INNER JOIN Equipements ON CharLegsID = EquipID WHERE CharHeadID != NULL AND CharID = @CharID)
	SET @PlayerBootsDef = (SELECT EquipFlatDef FROM Characters INNER JOIN Equipements ON CharBootsID = EquipID WHERE CharHeadID != NULL AND CharID = @CharID)
	SET @PlayerGlovesDef = (SELECT EquipFlatDef FROM Characters INNER JOIN Equipements ON CharGlovesID = EquipID WHERE CharHeadID != NULL AND CharID = @CharID)

	IF NOT @PlayerHeadDef IS NULL
		SET @PlayerTotalDef += @PlayerHeadDef

	ELSE IF NOT @PlayerTorsoDef IS NULL
		SET @PlayerTotalDef += @PlayerTorsoDef

	ELSE IF NOT @PlayerLegsDef IS NULL
		SET @PlayerTotalDef += @PlayerLegsDef

	ELSE IF NOT @PlayerBootsDef IS NULL
		SET @PlayerTotalDef += @PlayerBootsDef

	ELSE IF NOT @PlayerGlovesDef IS NULL
		SET @PlayerTotalDef += @PlayerGlovesDef

	SELECT @PlayerTotalDef
END