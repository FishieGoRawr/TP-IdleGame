CREATE PROCEDURE updateMonster
(@id INTEGER, @lvl INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50))
AS
UPDATE Monsters
SET MonsterDmg = @dmg, MonsterHP = @hp, MonsterLevel = @lvl, MonsterName = @name
WHERE MonsterID = @id