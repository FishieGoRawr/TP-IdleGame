CREATE PROCEDURE spDeleteMonster
@id integer
AS
DELETE FROM Monsters
WHERE monsters.MonsterID = @id