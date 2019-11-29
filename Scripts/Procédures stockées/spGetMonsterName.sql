CREATE PROCEDURE spGetMonsterName
@MonsterID INT
AS
BEGIN
	RETURN (SELECT MonsterName FROM Monsters WHERE MonsterID = @MonsterID)
END