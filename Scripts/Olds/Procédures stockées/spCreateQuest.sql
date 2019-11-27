CREATE PROCEDURE spCreateQuest
@name nvarchar(50), @dunID int, @lootID int, @lootQte int
AS
INSERT INTO Quests
VALUES (@dunID, @name, @lootID)