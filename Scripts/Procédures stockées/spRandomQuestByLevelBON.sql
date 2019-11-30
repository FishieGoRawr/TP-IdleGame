USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spRandomQuestByLevel]    Script Date: 2019-11-28 18:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spRandomQuestByLevel]
@CharID INT,
@level INT
AS
BEGIN
	DECLARE @DunID INT
	SET @DunID = (SELECT TOP 1 DungeonID FROM Dungeons WHERE DungeonLevel = @level ORDER BY NEWID())
	INSERT INTO QuestJournal VALUES (@CharID, @DunID, 0)
END