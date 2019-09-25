CREATE PROCEDURE spGetCharacter
@charID integer
AS
SELECT * 
FROM Characters 
WHERE Characters.CharID = @charID