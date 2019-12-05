CREATE PROCEDURE spGetMonsterName
@MonsterID INT,
@MonsterName NVARCHAR(50) OUTPUT
AS
BEGIN
	SET @MonsterName = (SELECT MonsterName FROM Monsters WHERE MonsterID = @MonsterID)
END
GO


