CREATE PROCEDURE spGenerateMonsterHit
@CharID INT,
@MonsterID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID)
	DECLARE @PlayerDefense INT EXEC @PlayerDefense = dbo.spGetPlayerDefense @CharID
	
	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @MonsterAtk as INT) + 0
	--DECLARE @Hit INT SET @Hit = RAND()*(0-@MonsterAtk) + @MonsterAtk
	
	RETURN CONVERT (INT, @Hit - (@PlayerDefense / 2.5))
END
GO


