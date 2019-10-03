CREATE PROCEDURE spCreateBundle 
@monsID integer, @qty integer
AS
INSERT INTO MonsterBundle
VALUES(0, @monsID, @qty)