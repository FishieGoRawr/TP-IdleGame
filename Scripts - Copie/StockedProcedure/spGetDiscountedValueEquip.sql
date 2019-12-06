--Return the reduction price of an item
CREATE PROCEDURE spGetDiscountedValueEquip
@EquidID INT
AS
BEGIN
	DECLARE @EquipValue INT SET @EquipValue = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquidID) --Full price of the equipement
	DECLARE @deductedValue INT SET @deductedValue = @EquipValue * 0.75 --Calcul the redution with the price of the equipement

	RETURN @deductedValue
END

GO


