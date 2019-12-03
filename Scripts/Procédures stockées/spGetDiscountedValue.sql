ALTER PROCEDURE spGetDiscountedValueEquip
@EquidID INT
AS
BEGIN
	DECLARE @EquipValue INT SET @EquipValue = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquidID)
	DECLARE @deductedValue INT SET @deductedValue = @EquipValue * 0.75

	RETURN @deductedValue
END

