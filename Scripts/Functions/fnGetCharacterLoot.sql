CREATE FUNCTION fnGetCharacterInfos (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT CharStr AS Str, CharCon AS Con, CharDex AS Dex, CharInt AS Intel, CharWis AS Wis, CharLck AS Luck, CharName AS Name, ClassName AS Class, RaceName AS Race, CharGP AS GP, CharLevel AS Level
	FROM (Characters INNER JOIN Races ON CharRaceID = RaceID) INNER JOIN Classes ON CharClassID = ClassID
	WHERE CharID = @CharID