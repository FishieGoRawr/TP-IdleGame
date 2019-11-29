ALTER PROCEDURE spGetPlayerDefense
@CharID INT
AS
BEGIN
	DECLARE @PlayerHeadDef INT, @PlayerTorsoDef INT, @PlayerLegsDef INT, @PlayerBootsDef INT, @PlayerGlovesDef INT, @PlayerTotalDef INT
	
	SET @PlayerHeadDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharHeadID != 0 AND CharID = @CharID)
	SET @PlayerTorsoDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharTorsoID != 0 AND CharID = @CharID)
	SET @PlayerLegsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharLegsID != 0 AND CharID = @CharID)
	SET @PlayerBootsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharBootsID != 0 AND CharID = @CharID)
	SET @PlayerGlovesDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharGlovesID != 0 AND CharID = @CharID)
	SET @PlayerTotalDef = 0

	IF NOT @PlayerHeadDef IS NULL
		SET @PlayerTotalDef += @PlayerHeadDef
	IF NOT @PlayerTorsoDef IS NULL
		SET @PlayerTotalDef += @PlayerTorsoDef
	IF NOT @PlayerLegsDef IS NULL
		SET @PlayerTotalDef += @PlayerLegsDef
	IF NOT @PlayerBootsDef IS NULL
		SET @PlayerTotalDef += @PlayerBootsDef
	IF NOT @PlayerGlovesDef IS NULL
		SET @PlayerTotalDef += @PlayerGlovesDef

	RETURN (@PlayerTotalDef)
END