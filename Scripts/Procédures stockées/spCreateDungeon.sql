CREATE PROCEDURE spCreateDungeon
@name NVARCHAR(50), @lvl integer
AS
INSERT INTO Dungeons
VALUES(@name, @lvl)