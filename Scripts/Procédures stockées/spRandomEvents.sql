USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spRandomEvents]    Script Date: 2019-12-03 17:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spRandomEvents]
AS
BEGIN
	RETURN DECLARE @eventID INT SET @eventID = RAND()*(1-4) + 4
END