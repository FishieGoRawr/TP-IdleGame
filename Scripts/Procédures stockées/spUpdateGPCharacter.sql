CREATE PROCEDURE spUpdateGPCharacter
@id int, @gold int
AS
UPDATE Characters
SET CharGP = @gold
WHERE Characters.CharID = @id