CREATE FUNCTION fnGetEquipName (@equipID int)
RETURNS nvarchar(50)
AS
BEGIN
	RETURN (SELECT EquipName FROM Equipements WHERE EquipID = @equipID)
END
GO


