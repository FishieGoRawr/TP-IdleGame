CREATE FUNCTION fnGetBundleFromDunID
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM MonsterBundle WHERE MonsterBundle.MonsterBundleDungeonID = @id