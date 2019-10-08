CREATE PROCEDURE spDeleteBundle
@id INTEGER
AS
DELETE FROM MonsterBundle
WHERE MonsterBundleID = @id