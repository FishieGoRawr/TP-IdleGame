CREATE PROCEDURE spDeleteMonster
@id INTEGER
AS
DELETE FROM Monsters
WHERE Monsters.MonsterID = @id