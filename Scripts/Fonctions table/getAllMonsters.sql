CREATE FUNCTION fnGetAllMonsters ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Monsters.MonsterID as ID, Monsters.MonsterLevel as Level, Monsters.MonsterName as Name, Monsters.MonsterHP as HP, Monsters.MonsterDmg as Dmg FROM Monsters
	