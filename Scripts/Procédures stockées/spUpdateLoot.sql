CREATE PROCEDURE spUpdateLoot
@id integer, @name nvarchar(50), @value integer
AS
UPDATE Loots
SET LootName = @name, LootValue = @value
WHERE Loots.LootID = @id