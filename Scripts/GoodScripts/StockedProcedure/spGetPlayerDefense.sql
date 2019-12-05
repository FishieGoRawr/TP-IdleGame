--Return the total of defense of a character
CREATE PROCEDURE spGetPlayerDefense
@CharID INT
AS
BEGIN
	DECLARE @PlayerHeadDef INT, @PlayerTorsoDef INT, @PlayerLegsDef INT, @PlayerBootsDef INT, @PlayerGlovesDef INT, @PlayerTotalDef INT
	
	SET @PlayerHeadDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharHeadID != 0 AND CharID = @CharID) --Get bonus defense of helmet
	SET @PlayerTorsoDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharTorsoID != 0 AND CharID = @CharID) --Get bonus defense of plate
	SET @PlayerLegsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharLegsID != 0 AND CharID = @CharID) --Get bonus defense of legging
	SET @PlayerBootsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharBootsID != 0 AND CharID = @CharID) --Get bonus defense of boots
	SET @PlayerGlovesDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharGlovesID != 0 AND CharID = @CharID) --Get bonus defense of gloves
	SET @PlayerTotalDef = 0

	--Add the bonus defense to the totalif the character have an helmet
	IF NOT @PlayerHeadDef IS NULL
		SET @PlayerTotalDef += @PlayerHeadDef
	--Add the bonus defense to the totalif the character have a plate
	IF NOT @PlayerTorsoDef IS NULL
		SET @PlayerTotalDef += @PlayerTorsoDef
	--Add the bonus defense to the totalif the character have a legging
	IF NOT @PlayerLegsDef IS NULL
		SET @PlayerTotalDef += @PlayerLegsDef
	--Add the bonus defense to the totalif the character have boots
	IF NOT @PlayerBootsDef IS NULL
		SET @PlayerTotalDef += @PlayerBootsDef
	--Add the bonus defense to the totalif the character have an gloves
	IF NOT @PlayerGlovesDef IS NULL
		SET @PlayerTotalDef += @PlayerGlovesDef

	RETURN (@PlayerTotalDef)
END
GO


