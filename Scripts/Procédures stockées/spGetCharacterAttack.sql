CREATE PROCEDURE spGetCharacterAttack
@CharID INT
AS
BEGIN
	DECLARE @BaseStr INT SET @BaseStr = (SELECT CharStr FROM Characters WHERE CharID = @CharID)
	DECLARE @WepAtk INT SET @WepAtk = (SELECT EquipFlatAtk FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)

	RETURN (@BaseStr + @WepAtk)
END
GO
