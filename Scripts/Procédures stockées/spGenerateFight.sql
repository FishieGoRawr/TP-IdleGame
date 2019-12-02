CREATE PROCEDURE spGenerateFight
@CharID INT,
@MonsterID INT,
@MonsterCurrentHP INT
AS
BEGIN
	INSERT INTO Fights VALUES (@CharID, @MonsterID, @MonsterCurrentHP)
END