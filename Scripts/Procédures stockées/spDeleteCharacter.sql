CREATE PROCEDURE spDeleteCharacter
@id INTEGER
AS
DELETE FROM Characters WHERE Characters.CharID = @id