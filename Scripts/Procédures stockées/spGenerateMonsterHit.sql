CREATE PROCEDURE spGenerateMonsterHit
@CharID INT,
@MonsterID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID)
	DECLARE @PlayerDefense INT EXEC @PlayerDefense = dbo.spGetPlayerDefense @CharID

	RETURN DECLARE @Hit INT SET @Hit = (SELECT FLOOR(RAND()*((@MonsterAtk + 3) - (@MonsterAtk - 3) + 1)) + (@MonsterAtk - 3))
END
GO
