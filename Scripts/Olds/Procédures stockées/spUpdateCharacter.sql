CREATE PROCEDURE spUpdateCharacter
@id integer ,@name nvarchar(50), @class nvarchar(50), @race nvarchar(50), @level integer, @gold integer, @hp integer, 
@hpMax integer, @hpRegen integer, @mana integer, @maxMana integer, @manaRegen integer, @str integer, @cons integer, 
@dex integer, @int integer, @luck integer, @wisdom integer
AS
UPDATE Characters
SET CharName = @name, CharClassID = @class, CharRaceID = @race, CharLevel = @level, CharGP = @gold, CharHP = @hp, CharMaxHP = @hpMax,
CharHPRegen = @hpRegen, CharMP = @mana, CharMaxMP = @maxMana, CharMPRegen = @manaRegen, CharStr = @str, CharCon = @cons,
CharDex = @dex, CharInt = @int, CharLck = @luck, Charwis = @wisdom
WHERE Characters.CharID = @id