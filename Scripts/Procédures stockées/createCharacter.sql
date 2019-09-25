CREATE PROCEDURE spCreateCharacter
@name nvarchar(50), @class nvarchar(50), @race nvarchar(50), @level integer, @gold integer, @hp integer, @hpMax integer, @hpRegen integer, @mana integer, @maxMana integer, @manaRegen integer, @str integer, @cons integer, @dex integer, @int integer, @luck integer, @wisdom integer
AS
INSERT INTO Characters
VALUES(@race, @class, @name, @level, 0, @gold, 0, @hp, @hpMax, @hpRegen, @mana, @maxMana, @manaRegen, @str, @cons, @dex, @int, @wisdom, @luck, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)