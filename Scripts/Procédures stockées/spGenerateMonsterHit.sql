CREATE PROCEDURE spGenerateMonsterHit
@MonsterID INT,
@CharID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID)
	DECLARE @PlayerDefense INT, @PlayerDex INT, @PlayerIntel INT
	SET @PlayerDefense = (SELECT char FROM Characters)
END
GO
