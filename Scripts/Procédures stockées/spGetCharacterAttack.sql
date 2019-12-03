USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spGetCharacterAttack]    Script Date: 2019-12-02 17:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetCharacterAttack]
@CharID INT
AS
BEGIN
	DECLARE @BaseStr INT SET @BaseStr = (SELECT CharStr FROM Characters WHERE CharID = @CharID)
	DECLARE @WepAtk INT SET @WepAtk = (SELECT EquipFlatAtk FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)

	IF (@WepAtk IS NULL)
		SET @WepAtk = 0

	RETURN (@BaseStr + @WepAtk)
END
