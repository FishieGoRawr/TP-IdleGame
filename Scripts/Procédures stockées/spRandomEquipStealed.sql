USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spRandomEquipStealed]    Script Date: 2019-12-03 17:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spRandomEquipStealed]
AS
BEGIN
	RETURN DECLARE @eventID INT SET @eventID = RAND()*(1-7) + 7
END