--Update the character HP to a set amount
CREATE PROCEDURE spUpdateGPCharacter
@id integer, @gold integer
AS
UPDATE Characters
SET CharGP = @gold
WHERE Characters.CharID = @id
GO


