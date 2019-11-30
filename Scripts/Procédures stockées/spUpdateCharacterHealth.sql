CREATE PROCEDURE spUpdateCharacterHealth
@CharID INT,
@HitDamage INT
AS
BEGIN
	UPDATE Characters SET CharCurrHP = CharCurrHP - @HitDamage WHERE CharID = @CharID
END