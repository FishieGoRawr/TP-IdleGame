--Return the name of a monster
CREATE PROCEDURE spGetMonsterName
@MonsterID INT,
@MonsterName NVARCHAR(50) OUTPUT
AS
BEGIN
	SET @MonsterName = (SELECT TOP 1 MonsterName FROM Monsters WHERE MonsterID = @MonsterID)
END
GO


