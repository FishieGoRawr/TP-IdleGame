--Return the final total damage deal by an attack of a monster
CREATE PROCEDURE spGenerateMonsterHit
@CharID INT,
@MonsterID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT TOP 1 MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID) --Get the max hit damage the monster can deal
	DECLARE @PlayerDefense INT EXEC @PlayerDefense = dbo.spGetPlayerDefense @CharID --Get the total of armor the character own
	
	--Get a random amount of damage deal by the attack of the monster
	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @MonsterAtk as INT) + 0
	
	--Reduce the damage of the hit by the amount of armor of the character
	RETURN CONVERT (INT, @Hit - (@PlayerDefense / 2.5))
END
GO


