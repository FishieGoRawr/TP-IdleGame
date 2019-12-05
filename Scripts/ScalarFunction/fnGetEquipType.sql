--Return the ID of the type of the equipement
Create Function fnGetEquipType (@equipId int)
Returns Integer
As
Begin
	Declare @idEquipType int
	Set @idEquipType = (Select EquipEquipTypeID From Equipements Where EquipID = @equipId) --Get the ID of the type of equipement
	Return @idEquipType
End
GO


