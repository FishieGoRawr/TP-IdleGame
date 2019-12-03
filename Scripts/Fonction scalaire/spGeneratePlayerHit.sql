USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spGeneratePlayerHit]    Script Date: 2019-12-02 15:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGeneratePlayerHit]
@CharID INT
AS
BEGIN
	DECLARE @PlayerMaxHit INT EXEC @PlayerMaxHit = dbo.spGetCharacterAttack @CharID

	DECLARE @Hit INT SET @Hit = RAND()*(0-@PlayerMaxHit) + @PlayerMaxHit
	
	RETURN CONVERT (INT, @Hit / 3.5)
END