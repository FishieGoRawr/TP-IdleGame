CREATE PROCEDURE spCreateLoot
@name nvarchar(50), @value INTEGER
AS
INSERT INTO Loots
VALUES (@name, @value)