Create Function fnIncomeSellLoot(@playerId int, @lootId int)
Returns Integer
As
Begin
	Declare @income int
	Set @income = (Select LootValue From Loots)
	Return @income
End