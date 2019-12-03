CREATE PROCEDURE spAddCharacterLoot
@CharID INT, 
@lootID INT,
@qty INT
AS
INSERT INTO CharLoot VALUES (@CharID, @lootID, @qty)