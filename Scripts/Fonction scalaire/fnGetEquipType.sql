Create Function fnGetEquipType(@equipId int)
Returns Integer
As
Begin
	Declare @idEquipType int
	Set @idEquipType = (Select EquipEquipTypeID From Equipements Where EquipID = @equipId)
	Return @idEquipType
End