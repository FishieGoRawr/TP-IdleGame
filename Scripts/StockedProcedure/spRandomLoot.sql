--Select a random loot (Yes, chicken can drop dragon scales. It's a mean ass dragonslayer chicken, whatchu going to do about it)
CREATE PROCEDURE spRandomLoot
AS
BEGIN
	 RETURN (SELECT TOP 1 LootID FROM Loots ORDER BY NEWID())
END
GO


