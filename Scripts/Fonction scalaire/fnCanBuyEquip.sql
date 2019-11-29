CREATE FUNCTION fnCanBuyEquip
(@CharID INT, @EquipID INT)
RETURNS BIT AS
BEGIN
	DECLARE @CharGold INT SELECT @CharGold = dbo.fnGetGPCharacter(@CharID)
	DECLARE @EquipCost INT SET @EquipCost = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquipID)
	DECLARE @canBuy INT

	IF @CharGold >= @EquipCost
		SET @canBuy = 1
	ELSE SET @canBuy = 0	

	RETURN @canBuy
END