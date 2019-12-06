--Return 1 if character have enough money to buy an equipement
CREATE FUNCTION fnCanBuyEquip
(@CharID INT, @EquipID INT)
RETURNS BIT AS
BEGIN
	DECLARE @CharGold INT SELECT @CharGold = dbo.fnGetGPCharacter(@CharID) --Gold owned by character
	DECLARE @EquipCost INT SET @EquipCost = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquipID) --Price of the equipement
	DECLARE @canBuy INT --Bit if can buy

	IF @CharGold >= @EquipCost
		SET @canBuy = 1
	ELSE 
		SET @canBuy = 0	

	RETURN @canBuy
END
GO


