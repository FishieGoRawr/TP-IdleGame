--Return the total attack number of the character
CREATE PROCEDURE spGetCharacterAttack
@CharID INT
AS
BEGIN
	DECLARE @BaseStr INT SET @BaseStr = (SELECT CharStr FROM Characters WHERE CharID = @CharID) --Get the strenght of the character
	DECLARE @WepAtk INT SET @WepAtk = (SELECT EquipFlatAtk FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID) --Get the bonus of attack by the equipement

	IF (@WepAtk IS NULL)
		SET @WepAtk = 0

	RETURN (@BaseStr + @WepAtk)
END
GO


