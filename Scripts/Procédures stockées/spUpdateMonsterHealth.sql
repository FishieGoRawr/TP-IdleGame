CREATE PROCEDURE spUpdateMonsterHealth
@MonsterID INT,
@HitDamage INT
AS
BEGIN
	UPDATE Fights SET MonsterCurrentHP = MonsterCurrentHP - @HitDamage WHERE FightMonsterID = @MonsterID
END