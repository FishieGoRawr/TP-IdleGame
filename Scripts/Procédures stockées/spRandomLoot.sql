CREATE PROCEDURE spRandomLoot
AS
BEGIN
	 RETURN (SELECT TOP 1 LootID FROM Loots ORDER BY NEWID())
END