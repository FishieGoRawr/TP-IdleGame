Create Function fnGetFirstLoot(@playerId int)
Returns Integer
As
Begin
	Declare @idFirst int
	Set @idFirst = (Select Top 1 CharLootID From CharLoot Where CharLootCharacterID = @playerId)
	Return @idFirst
End