--Return the name of an equipement
CREATE PROCEDURE spGetEquipName
@EquipID INT,
@name NVARCHAR(25) OUT
AS
BEGIN
	SET @name = (SELECT EquipName FROM Equipements WHERE EquipID = @EquipID)
END
GO


