CREATE FUNCTION fnGetAllCharacterInfo(@ID INTEGER)
RETURNS TABLE
AS
RETURN
SELECT CharName, RaceName, CharLevel, CharGP, CharExp, CharStr, CharCon, CharDex, CharInt, CharWis, CharLck FROM (Characters INNER JOIN Races ON CharRaceID = RaceID)
WHERE CharID = @ID