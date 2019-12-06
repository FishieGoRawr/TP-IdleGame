--Create a new fight with the character and the encounter monster
CREATE PROCEDURE spGenerateFight
@CharID INT,
@MonsterID INT,
@MonsterCurrentHP INT
AS
BEGIN
	INSERT INTO Fights VALUES (@CharID, @MonsterID, @MonsterCurrentHP)
END
GO


