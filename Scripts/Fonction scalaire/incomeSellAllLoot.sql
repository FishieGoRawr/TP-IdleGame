Create Function fnIncomeSellAllLoot(@playerId int)
Returns Integer
As
Begin
	Declare @income int
	Set @income = (Select Sum(LootValue) From Loots Inner Join CharLoot ON LootID = CharLootLootId Where CharLootCharacterID = @playerId)
	Return @income
End