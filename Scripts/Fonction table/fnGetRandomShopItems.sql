CREATE FUNCTION fnGetRandomShopItems (@level int)
RETURNS TABLE
AS
	RETURN SELECT TOP 3 * FROM Equipements WHERE EquipLevel = @level ORDER BY NEWID()