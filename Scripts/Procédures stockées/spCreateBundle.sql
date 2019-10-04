CREATE PROCEDURE spCreateBundle 
@dunID integer, @monsID integer, @qty integer
AS
INSERT INTO MonsterBundle
VALUES(@dunID, @monsID, @qty)