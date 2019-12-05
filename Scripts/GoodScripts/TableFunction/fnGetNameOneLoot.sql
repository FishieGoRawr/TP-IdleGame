Create Function fnGetNameOneLoot (@playerId int, @lootId int)
Returns Table
As
Return Select LootName 
From Loots Inner Join CharLoot ON LootID = CharLootLootId 
Where CharLootLootID = @lootId AND CharLootCharacterID = @playerId
GO


