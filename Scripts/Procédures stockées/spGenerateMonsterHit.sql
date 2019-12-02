CREATE PROCEDURE spGenerateMonsterHit
@CharID INT,
@MonsterID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID)
	DECLARE @PlayerDefense INT EXEC @PlayerDefense = dbo.spGetPlayerDefense @CharID

	DECLARE @Hit INT SET @Hit = ABS((SELECT FLOOR(RAND()*((@MonsterAtk + 3) - (@MonsterAtk - 3) + 1)) + (@MonsterAtk - 3)))
	
	RETURN CONVERT (INT, @Hit / 2.5)
END