--Get a random item that's the same level as the character
CREATE PROCEDURE spRandomItemByLevel
@level INT
AS
BEGIN
	 RETURN (SELECT TOP 1 EquipID FROM Equipements WHERE EquipLevel = @level ORDER BY NEWID())
END
GO


