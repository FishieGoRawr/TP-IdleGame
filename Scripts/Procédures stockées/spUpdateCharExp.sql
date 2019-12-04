CREATE PROCEDURE spUpdateCharExp
@CharID INT,
@monsterExp INT,
@currentExp INT
AS
BEGIN
	UPDATE Characters SET CharExp = @currentExp + @monsterExp WHERE CharID = @CharID
END