CREATE FUNCTION fnGetAllCharacters()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT CharID AS ID, 
		CharName AS Name, 
		CharRaceID AS Race, 
		CharClassID AS Class, 
		CharLevel AS Level,
		CharGP AS Gold,
		CharHP AS HP,
		CharMaxHP AS MaxHP,
		CharHPRegen AS HPReg,
		CharMP AS MP,
		CharMaxMP AS MaxMP,
		CharMPRegen AS MPReg,
		CharStr AS Str,
		CharCon AS Cons,
		CharDex AS Dex,
		CharInt AS Intel,
		CharLck AS Luck,
		CharWis AS Wis	
		FROM Characters
	