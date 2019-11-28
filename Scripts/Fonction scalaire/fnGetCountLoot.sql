Create Function fnGetCountLoot(@playerId int)
Returns Integer
As
Begin
	Declare @count int
	Set @count = (Select Count(CharLootID) From CharLoot Where CharLootCharacterID = @playerId)
	Return @count
End