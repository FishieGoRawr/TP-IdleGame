CREATE PROCEDURE spUpdateCharLevel
@CharID INT,
@level INT
AS
BEGIN
	UPDATE Characters SET CharLevel = (@level + 1) WHERE CharID = @CharID
END
GO


