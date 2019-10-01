CREATE PROCEDURE spCreateMonster
@level INTEGER, @dmg INTEGER, @hp INTEGER, @name NVARCHAR(50)
AS
INSERT INTO Monsters
VALUES (@level, @dmg, @hp, @name)